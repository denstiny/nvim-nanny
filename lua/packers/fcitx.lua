local has, consts = pcall(require, 'fcitx5-ui.consts')
if not has then
  return
end
local cfg = {
  keys = {
    trigger = { '<C-Space>', consts.FcitxKey.space, consts.FcitxKeyState.ctrl },
    up = { '<Up>', consts.FcitxKey.up, consts.FcitxKeyState.no },
    down = { '<Down>', consts.FcitxKey.down, consts.FcitxKeyState.no },
    left = { '<Left>', consts.FcitxKey.left, consts.FcitxKeyState.no },
    right = { '<Right>', consts.FcitxKey.right, consts.FcitxKeyState.no },
    enter = { '<CR>', consts.FcitxKey.enter, consts.FcitxKeyState.no },
    backspace = { '<BS>', consts.FcitxKey.backspace, consts.FcitxKeyState.no },
    tab = { '<Tab>', consts.FcitxKey.tab, consts.FcitxKeyState.no },
    stab = { '<S-Tab>', consts.FcitxKey.tab, consts.FcitxKeyState.shift },
  },
  ignore_module_missing_warning = false,
  prev = "<|",
  next = "|>",
  update = 50,
}
