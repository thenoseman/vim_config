vim9script
#
# Command "KubernetesAddSchemaCommentLine" to add a a JSO nschema modline to a yaml file that is a kubernetes definition file
#

import "./k8s/k8s-json-schema-index.vim" as mapping

def KubernetesAddSchemaCommentLine()
  if getbufvar('%', '&filetype') != "yaml"
    echoerr "KubernetesAddSchemaCommentLine: Cannot be used for non yaml filetype"
    return
  endif

  var apiVersionMatches = matchbufline(bufnr('%'), '\v^apiVersion: (.*)$', 1, '$', {'submatches': v:true})
  var kindMatches = matchbufline(bufnr('%'), '\v^kind: (.*)$', 1, '$', {'submatches': v:true})

  # Nothing to do?
  if empty(apiVersionMatches) || empty(kindMatches)
    return
  endif

  # It is a kubernetes yaml file
  var apiVersion = apiVersionMatches[0].submatches[0]
  var kind = kindMatches[0].submatches[0]

  var key = apiVersion .. ":" .. kind

  if has_key(mapping.k8s_schema_mapping, key)
    var schema_url = mapping.k8s_schema_mapping._baseurl .. mapping.k8s_schema_mapping[key]

    # Search for the modline
    if empty(matchbufline(bufnr('%'), '# yaml-language-server: $schema=', 1, 10))
      append(0, '# yaml-language-server: $schema=' .. schema_url)
    endif
  else
    echoerr "KubernetesAddSchemaCommentLine: Cannot find '" .. apiVersion .. ":" .. kind .. "' in mapping file"
  endif
enddef

com! KubernetesAddSchemaCommentLine KubernetesAddSchemaCommentLine()
