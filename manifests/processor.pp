# @summary Add a processor to the OpenTelemetry Collector configuration
#
# @param name
#   The name of the processor
# @param config
#   The configuration of the processor
# @param order
#   The order of the processor
# @param pipelines
#   The pipelines to attach the processor to
#
# @example Basic usage
#   otelcol::processor { 'namevar': }
# @example Define a processor and attach it to a pipeline
#   otelcol::processor { 'batch':
#     pipelines => ['metrics'],
#   }
define otelcol::processor (
  Hash $config = {},
  Integer[0,999] $order = 10,
  Array[String[1]] $pipelines = [],
) {
  $real_order = 2000+$order
  otelcol::component { "${name}-processors":
    order          => $real_order,
    config         => $config,
    pipelines      => $pipelines,
    component_name => $name,
    type           => 'processors',
  }
}
