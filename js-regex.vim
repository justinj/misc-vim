" A text object for a javascript regex


call textobj#user#plugin('jsregex', {
\   'around': {
\     'pattern': '\/[^\n]*\/[gimy]*',
\     'select': ['ae']
\   },
\   'in': {
\     'pattern': '\/\zs[^\n]*\ze\/[gimy]*',
\     'select': ['ie']
\   }
\ })

