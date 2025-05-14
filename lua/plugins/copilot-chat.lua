return {
  {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	lazy = true,
	cmd = {
		"CopilotChat",
		"CopilotChatOpen",
		"CopilotChatClose",
		"CopilotChatToggle",
		"CopilotChatStop",
		"CopilotChatReset",
		"CopilotChatSave",
		"CopilotChatLoad",
		"CopilotChatDebugInfo",
		"CopilotChatModels",
		"CopilotChatAgents",
		"CopilotChatPrompts",
	},
	keys = {
		{
		"<leader>cq",
		function()
			local input = vim.fn.input("Quick Chat: ")
			if input ~= "" then
			local select = require("CopilotChat.select")
			require("CopilotChat").ask(input, {
				selection = function(source)
					return select.visual(source) or select.buffer(source)
				end
			})
			end
		end,
		desc = "CopilotChat - Quick chat with smart selection",
		},
	},
	opts = {
		version = 3,
		model = "claude-3.5-sonnet",
		selection = function(source)
			local select = require("CopilotChat.select")
			return select.visual(source) or select.buffer(source)
		end,
		markdown = {
			question_header = "### 🤔 Question",
			answer_header = "### 🤖 Answer",
			code_block = { lang = "auto" }
		},
		window = {
			layout = "vertical",
			width = 0.4,
			height = 0.75,
			border = "rounded",
			row = 1,
			col = vim.o.columns - 40,
		},
		hooks = {
			pre_send = function(prompt)
				return "Question:\n" .. prompt
			end
		},
		prompts = {
			Explain = {
				prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
				-- mapping = '<leader>ce',
				description = "コードの説明をお願いする",
			},
			Review = {
				prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
				-- mapping = '<leader>cr',
				description = "コードのレビューをお願いする",
			},
			Fix = {
				prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
				-- mapping = '<leader>cf',
				description = "コードの修正をお願いする",
			},
			Optimize = {
				prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
				-- mapping = '<leader>co',
				description = "コードの最適化をお願いする",
			},
			Docs = {
				prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
				-- mapping = '<leader>cd',
				description = "コードのドキュメント作成をお願いする",
			},
			Tests = {
				prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
				-- mapping = '<leader>ct',
				description = "テストコード作成をお願いする",
			},
			FixDiagnostic = {
				prompt = 'コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
				-- mapping = '<leader>cD',
				description = "診断結果に基づくコード修正",
				selection = function(source)
					local select = require("CopilotChat.select")
					return select.visual(source) or select.buffer(source)
				end,
			},
			Commit = {
				prompt = '実装差分に対するコミットメッセージを日本語で記述してください。',
				-- mapping = '<leader>cm',
				description = "コミットメッセージの作成",
				selection = function(source)
					local select = require("CopilotChat.select")
					return select.visual(source) or select.buffer(source)
				end,
			},
			CommitStaged = {
				prompt = 'ステージ済みの変更に対するコミットメッセージを日本語で記述してください。',
				-- mapping = '<leader>cs',
				description = "ステージ済みのコミットメッセージ作成",
				selection = function(source)
					local select = require("CopilotChat.select")
					return select.visual(source) or select.buffer(source)
				end,
			},
			-- 追加のカスタムプロンプト例
			-- Translate = {
			-- 	prompt = 'このコードをPythonに変換してください。変換後のコードと説明を日本語でお願いします。',
			-- 	mapping = '<leader>cp',
			-- 	description = "Pythonへのコード変換",
			-- },
			-- Ask = {
			-- 	prompt = '以下のコードについて、技術的な質問があります: ',
			-- 	mapping = '<leader>ca',
			-- 	description = "技術的な質問をする",
			-- }
			},
		},
	},
}
