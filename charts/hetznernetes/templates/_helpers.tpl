{{/*
Expand the name of the chart.
*/}}
{{- define "hetznernetes.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hetznernetes.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hetznernetes.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hetznernetes" -}}
helm.sh/chart: {{ include "hetznernetes.chart" . }}
{{ include "hetznernetes.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hetznernetes.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hetznernetes.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Define the common name for all components
*/}}
{{- define "hetznernetes.cluster.name" -}}
{{- if .Values.cluster.name }}
{{- printf "%s" .Values.cluster.name | trunc 56 | trimSuffix "-" }}
{{- else }}
{{- include "hetznernetes.fullname" . | trunc 56 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Define the name for all control-plane components
*/}}
{{- define "hetznernetes.control-plane.name" -}}
{{- printf "%s-%s" (include "hetznernetes.cluster.name" .) "control-plane" | trunc 56 | trimSuffix "-" }}
{{- end }}

{{/*
Define the name for all worker-plane components
*/}}
{{- define "hetznernetes.worker-plane.name" -}}
{{- printf "%s-%s" (include "hetznernetes.cluster.name" .) "worker-plane" | trunc 56 | trimSuffix "-" }}
{{- end }}
