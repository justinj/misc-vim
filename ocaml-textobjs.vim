call textobj#user#plugin('ocamlidentifier', {
\   'identifier': {
\     'pattern': '\(\w\|\.\)\+',
\     'select': ['ac', 'ic'],
\   },
\ })

call textobj#user#plugin('ocamllet', {
\   'code': {
\     'pattern': ['\<let \w\+ =\s\?', '\s\?\<in\>'],
\     'select-a': 'al',
\     'select-i': 'il',
\   },
\ })
