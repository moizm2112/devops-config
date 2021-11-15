Expand the name of the chart.
*/}}
{{- define "new-payroll-provider-service .name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "new-payroll-provider-service .fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-new-payroll-provider-service" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
