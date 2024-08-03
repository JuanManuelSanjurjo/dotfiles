-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
elseif vim.fn.executable("powershell") == 1 then
  vim.o.shell = "powershell"
end
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""
