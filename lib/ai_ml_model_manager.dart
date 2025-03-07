class AIMLModelManager {
  final List<AIMLModel> models = [
    AIMLModel(
      id: "mistralai/Mistral-7B-Instruct-v0.2",
      displayName: "Mistral 7B Instruct v0.2",
      contextWindow: 32000,
      provider: "Mistral AI",
    ),
    AIMLModel(
  id: "gpt-4o",
  displayName: "Chat GPT-4o",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4o-2024-08-06",
  displayName: "GPT-4o-2024-08-06",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4o-2024-05-13",
  displayName: "GPT-4o-2024-05-13",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4o-mini",
  displayName: "Chat GPT 4o mini",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4o-mini-2024-07-18",
  displayName: "GPT-4o-mini-2024-07-18",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "chatgpt-4o-latest",
  displayName: "ChatGPT-4o-latest",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4-turbo",
  displayName: "Chat GPT 4 Turbo",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4-turbo-2024-04-09",
  displayName: "GPT-4-turbo-2024-04-09",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4",
  displayName: "Chat GPT 4",
  contextWindow: 8000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4-0125-preview",
  displayName: "GPT-4-0125-preview",
  contextWindow: 8000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4-1106-preview",
  displayName: "GPT-4-1106-preview",
  contextWindow: 8000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-3.5-turbo",
  displayName: "GPT-3.5-turbo",
  contextWindow: 16000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-3.5-turbo-0125",
  displayName: "GPT-3.5-turbo-0125",
  contextWindow: 16000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-3.5-turbo-1106",
  displayName: "Chat GPT-3.5 Turbo 1106",
  contextWindow: 16000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o1-preview",
  displayName: "OpenAI o1-preview",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o1-preview-2024-09-12",
  displayName: "O1-preview-2024-09-12",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o1-mini",
  displayName: "OpenAI o1-mini",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o1-mini-2024-09-12",
  displayName: "O1-mini-2024-09-12",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o3-mini",
  displayName: "OpenAI o3 mini",
  contextWindow: 200000,
  provider: "OpenAI",
),
AIMLModel(
  id: "gpt-4.5-preview",
  displayName: "Chat GPT 4.5 preview",
  contextWindow: 128000,
  provider: "OpenAI",
),
AIMLModel(
  id: "o1",
  displayName: "OpenAI o1",
  contextWindow: 200000,
  provider: "OpenAI",
),
AIMLModel(
  id: "microsoft/WizardLM-2-8x22B",
  displayName: "WizardLM 2-8 (22B)",
  contextWindow: 64000,
  provider: "Microsoft",
),
AIMLModel(
  id: "meta-llama/Llama-3.2-90B-Vision-Instruct-Turbo",
  displayName: "Llama 3.2 90B Vision Instruct Turbo",
  contextWindow: 131000,
  provider: "Meta",
),
AIMLModel(
  id: "google/gemma-2-27b-it",
  displayName: "Gemma 2 (27b)",
  contextWindow: 8000,
  provider: "Google",
),
AIMLModel(
  id: "meta-llama/Llama-Vision-Free",
  displayName: "Llama-Vision-Free",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "Gryphe/MythoMax-L2-13b",
  displayName: "MythoMax-L2 (13B)",
  contextWindow: 4000,
  provider: "Gryphe",
),
AIMLModel(
  id: "mistralai/Mixtral-8x22B-Instruct-v0.1",
  displayName: "Mixtral 8x22B Instruct",
  contextWindow: 64000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "Qwen/Qwen2-72B-Instruct",
  displayName: "Qwen 2 Instruct (72B)",
  contextWindow: 32000,
  provider: "Qwen",
),
AIMLModel(
  id: "mistralai/Mixtral-8x7B-Instruct-v0.1",
  displayName: "Mixtral-8x7B Instruct v0.1",
  contextWindow: 64000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "nvidia/Llama-3.1-Nemotron-70B-Instruct-HF",
  displayName: "Llama 3.1 Nemotron 70B Instruct",
  contextWindow: 128000,
  provider: "Nvidia",
),
AIMLModel(
  id: "NousResearch/Nous-Hermes-2-Mixtral-8x7B-DPO",
  displayName: "Nous-Hermes-2-Mixtral-8x7B-DPO",
  contextWindow: 32000,
  provider: "NousResearch",
),
AIMLModel(
  id: "meta-llama/Llama-3.3-70B-Instruct-Turbo",
  displayName: "Meta Llama 3.3 70B Instruct Turbo",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "upstage/SOLAR-10.7B-Instruct-v1.0",
  displayName: "Upstage SOLAR Instruct v1 (11B)",
  contextWindow: 4000,
  provider: "Upstage",
),
AIMLModel(
  id: "meta-llama/Llama-3.2-3B-Instruct-Turbo",
  displayName: "Llama 3.2 3B Instruct Turbo",
  contextWindow: 131000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo",
  displayName: "Llama 3.2 11B Vision Instruct Turbo",
  contextWindow: 131000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Llama-2-13b-chat-hf",
  displayName: "LLaMA-2 Chat (13B)",
  contextWindow: 4100,
  provider: "Meta",
),
AIMLModel(
  id: "Qwen/Qwen2.5-7B-Instruct-Turbo",
  displayName: "Qwen 2.5 7B Instruct Turbo",
  contextWindow: 32000,
  provider: "Qwen",
),
AIMLModel(
  id: "Qwen/Qwen2.5-Coder-32B-Instruct",
  displayName: "Qwen2.5-Coder-32B-Instruct",
  contextWindow: 131000,
  provider: "Qwen",
),
AIMLModel(
  id: "databricks/dbrx-instruct",
  displayName: "DBRX Instruct",
  contextWindow: 32000,
  provider: "Databricks",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3-8B-Instruct-Lite",
  displayName: "Llama 3 8B Instruct Lite",
  contextWindow: 9000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Llama-3-8b-chat-hf",
  displayName: "Llama 3 8B Instruct Reference",
  contextWindow: 8000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo-128K",
  displayName: "Meta-Llama-3.1-8B-Instruct-Turbo-128K",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Llama-3-70b-chat-hf",
  displayName: "Llama 3 70B Instruct Reference",
  contextWindow: 8000,
  provider: "Meta",
),
AIMLModel(
  id: "Qwen/Qwen2.5-72B-Instruct-Turbo",
  displayName: "Qwen 2.5 72B Instruct Turbo",
  contextWindow: 32000,
  provider: "Qwen",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3.1-405B-Instruct-Turbo",
  displayName: "Llama 3.1 (405B) Instruct Turbo",
  contextWindow: 4000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo",
  displayName: "Llama 3.1 8B Instruct Turbo",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo",
  displayName: "Llama 3.1 70B Instruct Turbo",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "google/gemma-2b-it",
  displayName: "Gemma Instruct (2B)",
  contextWindow: 8000,
  provider: "Google",
),
AIMLModel(
  id: "mistralai/Mistral-7B-Instruct-v0.2",
  displayName: "Mistral (7B) Instruct v0.2",
  contextWindow: 32000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "mistralai/Mistral-7B-Instruct-v0.1",
  displayName: "Mistral (7B) Instruct v0.1",
  contextWindow: 8000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "mistralai/Mistral-7B-Instruct-v0.3",
  displayName: "Mistral (7B) Instruct v0.3",
  contextWindow: 32000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3-70B-Instruct-Turbo",
  displayName: "Meta-Llama-3-70B-Instruct-Turbo",
  contextWindow: 128000,
  provider: "Meta",
),
AIMLModel(
  id: "meta-llama/Meta-Llama-3-70B-Instruct-Lite",
  displayName: "Llama 3 70B Instruct Lite",
  contextWindow: 8000,
  provider: "Meta",
),
AIMLModel(
  id: "google/gemma-2-9b-it",
  displayName: "Gemma 2 (9B)",
  contextWindow: 8000,
  provider: "Google",
),
AIMLModel(
  id: "Gryphe/MythoMax-L2-13b-Lite",
  displayName: "MythoMax-L2-13b-Lite",
  contextWindow: 4000,
  provider: "Gryphe",
),
AIMLModel(
  id: "meta-llama/Llama-2-7b-chat-hf",
  displayName: "LLaMA-2 Chat (7B)",
  contextWindow: 4000,
  provider: "Meta",
),
AIMLModel(
  id: "claude-3-opus-20240229",
  displayName: "Claude 3 Opus",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-sonnet-20240229",
  displayName: "Claude 3 Sonnet",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-haiku-20240307",
  displayName: "Claude-3-haiku-20240307",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-5-sonnet-20240620",
  displayName: "Claude-3-5-sonnet-20240620",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-5-sonnet-20241022",
  displayName: "Claude 3.5 Sonnet 20241022",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-5-haiku-20241022",
  displayName: "Claude-3-5-haiku-20241022",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "claude-3-7-sonnet-20250219",
  displayName: "Claude 3.7 Sonnet",
  contextWindow: 200000,
  provider: "Anthropic",
),
AIMLModel(
  id: "gemini-1.5-flash",
  displayName: "Gemini 1.5 Flash",
  contextWindow: 1000000,
  provider: "Google",
),
AIMLModel(
  id: "gemini-1.5-pro",
  displayName: "Gemini 1.5 Pro",
  contextWindow: 1000000,
  provider: "Google",
),
AIMLModel(
  id: "gemini-pro",
  displayName: "Gemini 1.0 Pro",
  contextWindow: 32000,
  provider: "Google",
),
AIMLModel(
  id: "gemini-2.0-flash-exp",
  displayName: "Gemini 2.0 Flash Experimental",
  contextWindow: 1000000,
  provider: "Google",
),
AIMLModel(
  id: "qwen-max",
  displayName: "Qwen Max",
  contextWindow: 32000,
  provider: "Alibaba Cloud",
),
AIMLModel(
  id: "qwen-plus",
  displayName: "Qwen Plus",
  contextWindow: 131000,
  provider: "Alibaba Cloud",
),
AIMLModel(
  id: "qwen-turbo",
  displayName: "Qwen Turbo",
  contextWindow: 1000000,
  provider: "Alibaba Cloud",
),
AIMLModel(
  id: "qwen-max-2025-01-25",
  displayName: "Qwen Max 2025-01-25",
  contextWindow: 32000,
  provider: "Alibaba Cloud",
),
AIMLModel(
  id: "mistralai/mistral-tiny",
  displayName: "Mistral Tiny",
  contextWindow: 32000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "x-ai/grok-beta",
  displayName: "Grok-2 Beta",
  contextWindow: 131000,
  provider: "X AI",
),
AIMLModel(
  id: "mistralai/mistral-nemo",
  displayName: "Mistral Nemo",
  contextWindow: 128000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "neversleep/llama-3.1-lumimaid-70b",
  displayName: "Llama 3.1 Lumimaid 70b",
  contextWindow: 8000,
  provider: "Open Source",
),
AIMLModel(
  id: "anthracite-org/magnum-v4-72b",
  displayName: "Magnum v4 72B",
  contextWindow: 32000,
  provider: "Anthracite",
),
AIMLModel(
  id: "nvidia/llama-3.1-nemotron-70b-instruct",
  displayName: "Llama 3.1 Nemotron 70B Instruct",
  contextWindow: 128000,
  provider: "Nvidia",
),
AIMLModel(
  id: "cohere/command-r-plus",
  displayName: "Command R+",
  contextWindow: 128000,
  provider: "Cohere",
),
AIMLModel(
  id: "ai21/jamba-1-5-mini",
  displayName: "Jamba 1.5 Mini",
  contextWindow: 256000,
  provider: "AI21 Labs",
),
AIMLModel(
  id: "qwen/qvq-72b-preview",
  displayName: "QVQ-72B-Preview",
  contextWindow: 32000,
  provider: "Qwen",
),
AIMLModel(
  id: "mistralai/codestral-2501",
  displayName: "Mistral Codestral-2501",
  contextWindow: 256000,
  provider: "Mistral AI",
),
AIMLModel(
  id: "MiniMax-Text-01",
  displayName: "MiniMax-Text-01",
  contextWindow: 1000000,
  provider: "Minimax AI",
),
AIMLModel(
  id: "abab6.5s-chat",
  displayName: "Abab6.5s-chat",
  contextWindow: 245000,
  provider: "Minimax AI",
),
    // Add more models from your list here
  ];

  AIMLModel? currentModel;

  void selectModel(AIMLModel model) {
    currentModel = model;
  }
}


class AIMLModel {
  final String id;
  final String displayName;
  final int contextWindow;
  final String provider;

  AIMLModel({
    required this.id,
    required this.displayName,
    required this.contextWindow,
    required this.provider,
  });
}