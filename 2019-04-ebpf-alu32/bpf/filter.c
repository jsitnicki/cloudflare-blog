#include <linux/bpf.h>

#define SEC(NAME) __attribute__((section(NAME), used))
#define UNUSED    __attribute__((unused))

/* stdint.h pulls in architecture specific headers on some distros */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;
typedef unsigned long  u64;

/* This definition is specific to your BPF ELF loader */
struct bpf_map_def {
	unsigned int type;
	unsigned int key_size;
	unsigned int value_size;
	unsigned int max_entries;
	unsigned int map_flags;
};

static void *(*bpf_map_lookup_elem)(void *map, const void *key) =
	(void *) BPF_FUNC_map_lookup_elem;
static void *(*bpf_map_update_elem)(void *map, const void *key,
				    const void *value, u64 flags) =
	(void *) BPF_FUNC_map_update_elem;


/* Trace function is available only for privileged users. */
#ifdef TRACE
static int (*bpf_trace_printk)(const char *fmt, int fmt_size, ...) =
	(void *) BPF_FUNC_trace_printk;

#define bpf_printk(fmt, ...) 					\
	({							\
		char ____fmt[] = fmt;				\
		bpf_trace_printk(____fmt, sizeof(____fmt),	\
				 ##__VA_ARGS__);		\
	})
#endif

enum args_keys {
	ARG_0,
	ARG_1,
	RES_0,
	RES_1,
	MAX_KEY
};

SEC("maps")
struct bpf_map_def args = {
	.type		= BPF_MAP_TYPE_ARRAY,
	.key_size	= sizeof(u32),
	.value_size	= sizeof(u64),
	.max_entries	= MAX_KEY,
};

static u64 args_get(u32 key)
{
	u64 *v = bpf_map_lookup_elem(&args, &key);
	return v ? *v : 0;
}

static void args_put(u32 key, u64 v)
{
	bpf_map_update_elem(&args, &key, &v, BPF_ANY);
}

SEC("socket")
int filter(struct __sk_buff *skb UNUSED)
{
	u64 a, b, r;

	a = args_get(ARG_0);
	b = args_get(ARG_1);

	r = a + b;
	args_put(RES_0, r);

	r = a - b;
	args_put(RES_1, r);

	return SK_PASS;
}

char __license[] SEC("license") = "Dual BSD/GPL";
