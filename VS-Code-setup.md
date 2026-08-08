## My VS Code Setup

Themes, extensions, and settings I use in VS Code.
Tracked copies also live in this repo as [`vscode-settings.json`](./vscode-settings.json) and [`vscode-extensions.txt`](./vscode-extensions.txt); Brewfile `vscode "..."` lines install extensions on bootstrap.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Theme and Font](#theme-and-font)
- [Extensions](#extensions)
  - [Extension package names for easy install](#extension-package-names-for-easy-install)
- [Settings](#settings)
- [Keybindings](#keybindings)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Theme and Font

* Theme: **Catppuccin Macchiato** (`catppuccin.catppuccin-vsc`)
* Icon theme: **vscode-icons**
* Font: **JetBrainsMono Nerd Font** (ligatures on), size 13
* Sidebar on the **right**, tabs **hidden**, status bar **hidden** — keep the canvas clean

Also have Catppuccin packs / Just Black available when I want something darker.

## Extensions

* UX / Editor
  * [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
  * [FontSize Shortcuts](https://marketplace.visualstudio.com/items?itemName=fosshaas.fontsize-shortcuts)
  * [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
  * [Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors)
  * [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap) — screenshot code with theme/font
  * [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* Formatting / lint
  * [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
  * [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  * [Biome](https://marketplace.visualstudio.com/items?itemName=biomejs.biome)
* Tools
  * [Thunder Client](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client)
  * [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.liveserver)
  * [quicktype](https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)
  * [Docker / Containers](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers)
* Languages / libraries
  * [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
  * [PostCSS Language Support](https://marketplace.visualstudio.com/items?itemName=vunguyentuan.vscode-postcss)
  * [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml)
  * React
    * [ES7+ React/Redux/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
    * [CSS to JSS](https://marketplace.visualstudio.com/items?itemName=infarkt.css-to-jss)
    * [CSS in JS](https://marketplace.visualstudio.com/items?itemName=paulmolluzzo.convert-css-in-js)
    * [styled-components](https://marketplace.visualstudio.com/items?itemName=styled-components.vscode-styled-components)
  * [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) — Vue 3
  * [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode)
  * [Astro](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
  * [Prisma](https://marketplace.visualstudio.com/items?itemName=Prisma.prisma)
  * [htmx-tags](https://marketplace.visualstudio.com/items?itemName=otovo-oss.htmx-tags)
  * [Markdown Mermaid Preview](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
* Themes
  * [Catppuccin](https://marketplace.visualstudio.com/items?itemName=Catppuccin.catppuccin-vsc)
  * [Just Black](https://marketplace.visualstudio.com/items?itemName=nur.just-black)

### Extension package names for easy install

```
adpyke.codesnap
astro-build.astro-vscode
bierner.markdown-mermaid
biomejs.biome
bradlc.vscode-tailwindcss
catppuccin.catppuccin-vsc
catppuccin.catppuccin-vsc-icons
catppuccin.catppuccin-vsc-pack
dbaeumer.vscode-eslint
dotjoshjohnson.xml
dsznajder.es7-react-js-snippets
eamodio.gitlens
esbenp.prettier-vscode
fosshaas.fontsize-shortcuts
infarkt.css-to-jss
ms-azuretools.vscode-containers
nur.just-black
otovo-oss.htmx-tags
paulmolluzzo.convert-css-in-js
prisma.prisma
quicktype.quicktype
rangav.vscode-thunder-client
ritwickdey.liveserver
streetsidesoftware.code-spell-checker
styled-components.vscode-styled-components
svelte.svelte-vscode
techopolis.omlx-copilot-chat
vscode-icons-team.vscode-icons
vue.volar
vunguyentuan.vscode-postcss
yoavbls.pretty-ts-errors
```

Install from a file:

```sh
xargs -n1 code --install-extension < vscode-extensions.txt
# or via Homebrew Brewfile:
brew bundle --file=~/dotfiles/Brewfile
```

## Settings

Paste into VS Code user `settings.json` (or copy from [`vscode-settings.json`](./vscode-settings.json)):

```json
{
  "codesnap.backgroundColor": "#000000",
  "codesnap.containerPadding": "0px",
  "codesnap.showWindowControls": false,
  "codesnap.transparentBackground": true,
  "cSpell.enabled": true,
  "cSpell.enabledFileTypes": {
    "mdx": true
  },
  "cSpell.userWords": [
    "Ankur"
  ],
  "diffEditor.ignoreTrimWhitespace": false,
  "editor.detectIndentation": true,
  "editor.fontFamily": "JetBrainsMono Nerd Font, Menlo, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 13,
  "editor.formatOnPaste": false,
  "editor.formatOnSave": false,
  "editor.inlineSuggest.enabled": true,
  "editor.linkedEditing": true,
  "editor.minimap.enabled": false,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.renderWhitespace": "selection",
  "editor.semanticHighlighting.enabled": true,
  "editor.smoothScrolling": true,
  "editor.snippetSuggestions": "top",
  "editor.suggestSelection": "first",
  "editor.tabSize": 2,
  "editor.unicodeHighlight.invisibleCharacters": false,
  "emmet.showAbbreviationSuggestions": false,
  "eslint.enable": true,
  "eslint.validate": [
    "vue",
    "react",
    "typescript",
    "html",
    "javascript"
  ],
  "explorer.confirmDelete": true,
  "explorer.openEditors.visible": 1,
  "extensions.ignoreRecommendations": true,
  "files.autoSave": "onWindowChange",
  "files.trimTrailingWhitespace": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.openRepositoryInParentFolders": "never",
  "json.schemaDownload.trustedDomains": {
    "https://schemastore.azurewebsites.net/": true,
    "https://raw.githubusercontent.com/microsoft/vscode/": true,
    "https://raw.githubusercontent.com/devcontainers/spec/": true,
    "https://www.schemastore.org/": true,
    "https://json.schemastore.org/": true,
    "https://json-schema.org/": true,
    "https://developer.microsoft.com/json-schemas/": true,
    "https://biomejs.dev": true
  },
  "markdown.preview.fontSize": 14,
  "omlx.maxInputTokensOverride": 65536,
  "screencastMode.keyboardOptions": {
    "showCommandGroups": false,
    "showCommands": false,
    "showKeybindings": true,
    "showKeys": false,
    "showSingleEditorCursorMoves": true
  },
  "search.exclude": {
    "**/*.code-search": true,
    "**/bower_components": true,
    "**/node_modules": true
  },
  "search.useIgnoreFiles": true,
  "svelte.enable-ts-plugin": true,
  "terminal.integrated.fontSize": 14,
  "vsicons.dontShowNewVersionMessage": true,
  "window.zoomLevel": 1,
  "workbench.colorTheme": "Catppuccin Macchiato",
  "workbench.editor.labelFormat": "medium",
  "workbench.editor.showTabs": "none",
  "workbench.iconTheme": "vscode-icons",
  "workbench.sideBar.location": "right",
  "workbench.startupEditor": "newUntitledFile",
  "workbench.statusBar.visible": false,
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[handlebars]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[scss]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[svelte]": {
    "editor.defaultFormatter": "svelte.svelte-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

## Keybindings

Currently using VS Code defaults (empty custom `keybindings.json`). Add overrides here when you settle on a layout — for example Cmd+N for editor tabs vs Ctrl+N for editor groups, as in the older vscode-settings repo.
