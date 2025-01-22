fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'fivem-lua-web-boilerplate'
version '1.0'
author 'qamarq'

dependencies {
  '/server:6116',
  '/onesync',
  'oxmysql',
  'ox_lib',
}

ui_page 'web/build/index.html'

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  'config.lua'
}

ox_libs {
  'locale',
  'table',
  'math',
}

client_scripts {
  'client/utils.lua',
  'client/functions.lua',
  'client/main.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/functions.lua',
  'server/main.lua',
}

files {
  'locales/*.json',
  'web/build/index.html',
  'web/build/assets/*.js',
  'web/build/assets/*.css',
  'web/images/*.png',
}