{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "transaction-management-service .name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "transaction-management-service .fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* registry host location. To reuse existing platform services, specify the platform.existing in values.yaml */}}
{{- define "registry.host" -}}
    {{- printf "%s-%s" .Values.platform.existing "platform" | trunc 63 | trimSuffix "-" -}}-registry
{{- end -}}

{{/* Eureka registry client */}}
{{- define "registry.client.serviceUrl" -}}
    defaultZone=http://{{- include "registry.host" . -}}:8080/registry/eureka
{{- end -}}

{{/* Command for init container to wait until registry is live.  */}}
{{- define "registry.wait.until.live" -}}
    ['sh', '-c', 'apk add --no-cache curl;until curl -v --connect-timeout 3 http://{{- include "registry.host" . -}}:8080/registry/eureka  ;do echo "Waiting for the Registry";done']
{{- end -}}

