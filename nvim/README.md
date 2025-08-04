Ik heb heel mijn setup opnieuw gedaan, gebaseerd op de volgende guide, op 12 mei 2025.
https://monsterlessons-academy.com/posts/neovim-complete-setup-setting-up-neovim-from-scratch

De file structure is als volgt:
.config/nvim/
-> init.lua == deze file
-> lua/ == alle .lua files in deze directory worden automatisch uitgevoerd
 	 --> bclaeys/ == hierin zit mijn setup, dit moet een simlink zijn naar een directory zijn op een github
		---> core
			----> init.lua == verwijst naar keymaps en settings, enkel require core en lazy
			----> keymaps.lua == alle keymaps
			----> settings.lau == alle overige settings die ik aangepast heb
		---> plugins
			----> *.lua == alle plugins
			----> lazy.lua = init file voor lazy, verwijst naar .lua files in mijn plugins directory
	 --> *.json == worden aangemaakt door plugins of lazy

Ook heb ik een aantal dingen moeten toevoegen aan PATH in zshrc, wellicht omdat ik geen sudo rights heb.
Zo bvb: 
    voor fzf: export PATH="$HOME/.local/fzf/bin:$PATH"
    voor clangd: ik heb mason weggedaan omdat ik errors kreeg en moest clangd dus handmatig installeren.
                    Staat gwn in mijn home folder. Vervolgens heb ik een aantal lijnen toegevoegd aan lsp-zero.lua en cmp-nvim-lsp.
                    Ik heb de binary van clangd aan mijn PATH toegevoegd in mijn .zshrc.
                    zie in lsp-zero.lua: cmd = { "clangd", "--background-index", "--clang-tidy" }
