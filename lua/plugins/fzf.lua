-- fzf-lua is already the picker (LazyVim default for install_version 7).
-- These tweaks only target grep throughput on large repos.
return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      preview = {
        -- don't spawn a previewer for every line you scroll past
        delay = 100,
      },
    },
    grep = {
      -- per-line icon lookup is the main lua-side cost once rg returns
      -- thousands of matches
      file_icons = false,
      color_icons = false,
      git_icons = false,
      rg_opts = table.concat({
        "--column --line-number --no-heading --color=always --smart-case",
        -- long minified/generated lines are expensive to render
        "--max-columns=512 --max-columns-preview",
        "--no-messages",
        "-g '!{.git,node_modules,tmp,log,coverage,storage,.yarn,dist,build}'",
        "-g '!{public/assets,public/packs,public/packs-test,vendor/bundle}'",
        "-e",
      }, " "),
    },
  },
}
