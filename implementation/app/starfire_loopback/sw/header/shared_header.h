#pragma once

// Yes, it's weird. But it's convenient.
#define NINE_ENTRIES_OF(...) \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__, \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__, \
	__VA_ARGS__

#define NINE_VARIANTS_OF(x) \
	(x), (x + 32), (x + 64), (x + 128), \
	(x + 256), (x + 512), (x + 1024), (x + 2048), \
	(x + 4096)

#define CHANNEL_COUNT 9
#define ALL_CHANS            0x1FF
#define NO_BROADCAST_CHANS   0x0FF
#define ONLY_BROADCAST_CHANS 0x100

#define BASIC_CONFIG(enablemask, init, ...) \
	{ \
		.gen_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {NINE_VARIANTS_OF(init)}, \
		.ana_init = {NINE_VARIANTS_OF(init)}, \
		.enable_mask = enablemask, \
		.expect_errors = false \
	}

#define INVALID_CONFIG(enablemask, init, ...) \
	{ \
		.gen_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {NINE_VARIANTS_OF(init)}, \
		.ana_init = {NINE_VARIANTS_OF((init+13))}, \
		.enable_mask = enablemask, \
		.expect_errors = true \
	}

#define FORCE_ERROR_CONFIG(enablemask, init, ...) \
	{ \
		.gen_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {NINE_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {NINE_VARIANTS_OF(init)}, \
		.ana_init = {NINE_VARIANTS_OF((init+13))}, \
		.enable_mask = enablemask, \
		.expect_errors = false\
	}

struct test_config
{
	struct dl_generator_configuration gen_conf[CHANNEL_COUNT];
	struct dl_analyzer_configuration ana_conf[CHANNEL_COUNT];
	uint32_t gen_init[CHANNEL_COUNT];
	uint32_t ana_init[CHANNEL_COUNT];
	uint8_t enable_mask;
	bool expect_errors;
};

enum action_result initialization_sequence (void);
enum action_result initialization_sequence_near_end_lpb (void);
enum action_result initialization_sequence_parallel_lpb(void);


void initiate_test (const struct test_config test [const static 1]);
enum action_result finalize_test
(
	const struct test_config test [const static 1]
);

enum action_result run_test (const struct test_config test [const static 1]);

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
);

enum action_result init_and_run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count],
	int type_lpb
);

enum action_result wait_active (void);

enum action_result run_test_gen_only (const struct test_config test [const static 1]);
void initiate_test_gen_only (const struct test_config test [const static 1]);