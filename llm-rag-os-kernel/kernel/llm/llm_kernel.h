#ifndef _LLM_KERNEL_H
#define _LLM_KERNEL_H

struct llm_task {
const char *prompt;
void *context;
};

struct llm_scheduler {
struct llm_task *tasks;
unsigned int task_count;
};

#endif /* _LLM_KERNEL_H */
