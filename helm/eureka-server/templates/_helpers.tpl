{{- define "configServerBootstrap" }}
        configMap:
{{ if .Values.config.existingConfigMapName }}        
          name: {{ .Values.config.existingConfigMapName }}
{{ else }}
          name: {{ .Release.Name }}
{{ end }}
{{ end -}}
