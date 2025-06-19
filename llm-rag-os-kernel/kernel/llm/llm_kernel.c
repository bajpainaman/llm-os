#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

#include "llm_kernel.h"

static int __init llm_kernel_init(void)
{
pr_info("LLM kernel module loaded\n");
return 0;
}

static void __exit llm_kernel_exit(void)
{
pr_info("LLM kernel module unloaded\n");
}

module_init(llm_kernel_init);
module_exit(llm_kernel_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("LLM-RAG-OS");
MODULE_DESCRIPTION("Skeleton LLM kernel module");
