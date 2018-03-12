local config = require 'config'
local u = require 'utilities'
local api = require 'methods'
local plugin = {}

function plugin.onTextMessage(msg, blocks)
	if blocks[1] == 'mudo' then
		if not msg.reply then
			api.sendReply(msg, _("_Responda alguem_"), true)
			return
		end
	end
	if msg.reply_to_message then
		msg = msg.reply_to_message
	end
	nomes = msg.from.first_name
    api.sendReply(msg,'Agora *' .. nomes ..'* esta mudo', true, nil, true)
	api.mudouser(msg.chat.id, msg.from.id)
    api.deleteMessage(msg.chat.id, msg.message_id)
end
plugin.triggers = {
	onTextMessage = {
	    config.cmd..'(mudo)',
	}
}
return plugin
