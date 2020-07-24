=begin
#CRM Objects

#CRM objects such as companies, contacts, deals, line items, products, tickets, and quotes are native objects in HubSpot’s CRM. These core building blocks support custom properties, store critical information, and play a central role in the HubSpot application.  ## Supported Object Types  This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).  |Object Type |Properties returned by default | |--|--| | `companies` | `name`, `domain` | | `contacts` | `firstname`, `lastname`, `email` | | `deals` | `dealname`, `amount`, `closedate`, `pipeline`, `dealstage` | | `products` | `name`, `description`, `price` | | `tickets` | `content`, `hs_pipeline`, `hs_pipeline_stage`, `hs_ticket_category`, `hs_ticket_priority`, `subject` |  Find a list of all properties for an object type using the [CRM Object Properties](https://developers.hubspot.com/docs/methods/crm-properties/get-properties) API. e.g. `GET https://api.hubapi.com/properties/v2/companies/properties`. Change the properties returned in the response using the `properties` array in the request body.

OpenAPI spec version: v3

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.8

=end

require 'uri'
require 'logger'

require 'hubspot/configuration'
require 'hubspot/exceptions'
require 'hubspot/oauth_helper'
require 'hubspot/version'

require 'hubspot/helpers/get_all_helper'
require 'hubspot/helpers/webhooks_helper'

require 'hubspot/codegen/cms/audit-logs/api_client'
require 'hubspot/codegen/cms/audit-logs/api_error'
require 'hubspot/codegen/cms/audit-logs/configuration'
require 'hubspot/codegen/cms/audit-logs/api/default_api'
require 'hubspot/codegen/cms/audit-logs/models/collection_response_public_audit_log'
require 'hubspot/codegen/cms/audit-logs/models/error'
require 'hubspot/codegen/cms/audit-logs/models/error_detail'
require 'hubspot/codegen/cms/audit-logs/models/next_page'
require 'hubspot/codegen/cms/audit-logs/models/paging'
require 'hubspot/codegen/cms/audit-logs/models/public_audit_log'

require 'hubspot/codegen/cms/domains/api_client'
require 'hubspot/codegen/cms/domains/api_error'
require 'hubspot/codegen/cms/domains/configuration'
require 'hubspot/codegen/cms/domains/api/domains_api'
require 'hubspot/codegen/cms/domains/models/collection_response_with_total_domain'
require 'hubspot/codegen/cms/domains/models/domain'
require 'hubspot/codegen/cms/domains/models/domain_cdn_config'
require 'hubspot/codegen/cms/domains/models/domain_setup_info'
require 'hubspot/codegen/cms/domains/models/error'
require 'hubspot/codegen/cms/domains/models/error_detail'
require 'hubspot/codegen/cms/domains/models/next_page'
require 'hubspot/codegen/cms/domains/models/paging'

require 'hubspot/codegen/cms/performance/api_client'
require 'hubspot/codegen/cms/performance/api_error'
require 'hubspot/codegen/cms/performance/configuration'
require 'hubspot/codegen/cms/performance/api/default_api'
require 'hubspot/codegen/cms/performance/models/error'
require 'hubspot/codegen/cms/performance/models/error_detail'
require 'hubspot/codegen/cms/performance/models/performance_view'
require 'hubspot/codegen/cms/performance/models/public_performance_response'

require 'hubspot/codegen/cms/site-search/api_client'
require 'hubspot/codegen/cms/site-search/api_error'
require 'hubspot/codegen/cms/site-search/configuration'
require 'hubspot/codegen/cms/site-search/api/default_api'
require 'hubspot/codegen/cms/site-search/models/content_search_result'
require 'hubspot/codegen/cms/site-search/models/error'
require 'hubspot/codegen/cms/site-search/models/error_detail'
require 'hubspot/codegen/cms/site-search/models/indexed_data'
require 'hubspot/codegen/cms/site-search/models/public_search_results'
require 'hubspot/codegen/cms/site-search/models/search_hit_field'

require 'hubspot/codegen/cms/url-redirects/api_client'
require 'hubspot/codegen/cms/url-redirects/api_error'
require 'hubspot/codegen/cms/url-redirects/configuration'
require 'hubspot/codegen/cms/url-redirects/api/redirects_api'
require 'hubspot/codegen/cms/url-redirects/models/collection_response_with_total_url_mapping'
require 'hubspot/codegen/cms/url-redirects/models/error'
require 'hubspot/codegen/cms/url-redirects/models/error_detail'
require 'hubspot/codegen/cms/url-redirects/models/next_page'
require 'hubspot/codegen/cms/url-redirects/models/paging'
require 'hubspot/codegen/cms/url-redirects/models/url_mapping'
require 'hubspot/codegen/cms/url-redirects/models/url_mapping_create_request_body'

require 'hubspot/codegen/crm/associations/api_client'
require 'hubspot/codegen/crm/associations/api_error'
require 'hubspot/codegen/crm/associations/configuration'
require 'hubspot/codegen/crm/associations/api/batch_api'
require 'hubspot/codegen/crm/associations/api/types_api'
require 'hubspot/codegen/crm/associations/models/associated_id'
require 'hubspot/codegen/crm/associations/models/batch_input_public_association'
require 'hubspot/codegen/crm/associations/models/batch_input_public_object_id'
require 'hubspot/codegen/crm/associations/models/batch_response_public_association'
require 'hubspot/codegen/crm/associations/models/batch_response_public_association_multi'
require 'hubspot/codegen/crm/associations/models/collection_response_public_association_definiton'
require 'hubspot/codegen/crm/associations/models/error'
require 'hubspot/codegen/crm/associations/models/error_detail'
require 'hubspot/codegen/crm/associations/models/next_page'
require 'hubspot/codegen/crm/associations/models/paging'
require 'hubspot/codegen/crm/associations/models/public_association'
require 'hubspot/codegen/crm/associations/models/public_association_definiton'
require 'hubspot/codegen/crm/associations/models/public_association_multi'
require 'hubspot/codegen/crm/associations/models/public_object_id'

require 'hubspot/codegen/crm/companies/api_client'
require 'hubspot/codegen/crm/companies/api_error'
require 'hubspot/codegen/crm/companies/configuration'
require 'hubspot/codegen/crm/companies/api/associations_api'
require 'hubspot/codegen/crm/companies/api/basic_api'
require 'hubspot/codegen/crm/companies/api/batch_api'
require 'hubspot/codegen/crm/companies/api/search_api'
require 'hubspot/codegen/crm/companies/models/associated_id'
require 'hubspot/codegen/crm/companies/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/companies/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/companies/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/companies/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/companies/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/companies/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/companies/models/collection_response_associated_id'
require 'hubspot/codegen/crm/companies/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/companies/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/companies/models/error'
require 'hubspot/codegen/crm/companies/models/error_detail'
require 'hubspot/codegen/crm/companies/models/filter'
require 'hubspot/codegen/crm/companies/models/filter_group'
require 'hubspot/codegen/crm/companies/models/next_page'
require 'hubspot/codegen/crm/companies/models/paging'
require 'hubspot/codegen/crm/companies/models/public_object_search_request'
require 'hubspot/codegen/crm/companies/models/simple_public_object'
require 'hubspot/codegen/crm/companies/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/companies/models/simple_public_object_id'
require 'hubspot/codegen/crm/companies/models/simple_public_object_input'

require 'hubspot/codegen/crm/contacts/api_client'
require 'hubspot/codegen/crm/contacts/api_error'
require 'hubspot/codegen/crm/contacts/configuration'
require 'hubspot/codegen/crm/contacts/api/associations_api'
require 'hubspot/codegen/crm/contacts/api/basic_api'
require 'hubspot/codegen/crm/contacts/api/batch_api'
require 'hubspot/codegen/crm/contacts/api/search_api'
require 'hubspot/codegen/crm/contacts/models/associated_id'
require 'hubspot/codegen/crm/contacts/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/contacts/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/contacts/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/contacts/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/contacts/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/contacts/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/contacts/models/collection_response_associated_id'
require 'hubspot/codegen/crm/contacts/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/contacts/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/contacts/models/error'
require 'hubspot/codegen/crm/contacts/models/error_detail'
require 'hubspot/codegen/crm/contacts/models/filter'
require 'hubspot/codegen/crm/contacts/models/filter_group'
require 'hubspot/codegen/crm/contacts/models/next_page'
require 'hubspot/codegen/crm/contacts/models/paging'
require 'hubspot/codegen/crm/contacts/models/public_object_search_request'
require 'hubspot/codegen/crm/contacts/models/simple_public_object'
require 'hubspot/codegen/crm/contacts/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/contacts/models/simple_public_object_id'
require 'hubspot/codegen/crm/contacts/models/simple_public_object_input'

require 'hubspot/codegen/crm/deals/api_client'
require 'hubspot/codegen/crm/deals/api_error'
require 'hubspot/codegen/crm/deals/configuration'
require 'hubspot/codegen/crm/deals/api/associations_api'
require 'hubspot/codegen/crm/deals/api/basic_api'
require 'hubspot/codegen/crm/deals/api/batch_api'
require 'hubspot/codegen/crm/deals/api/search_api'
require 'hubspot/codegen/crm/deals/models/associated_id'
require 'hubspot/codegen/crm/deals/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/deals/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/deals/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/deals/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/deals/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/deals/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/deals/models/collection_response_associated_id'
require 'hubspot/codegen/crm/deals/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/deals/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/deals/models/error'
require 'hubspot/codegen/crm/deals/models/error_detail'
require 'hubspot/codegen/crm/deals/models/filter'
require 'hubspot/codegen/crm/deals/models/filter_group'
require 'hubspot/codegen/crm/deals/models/next_page'
require 'hubspot/codegen/crm/deals/models/paging'
require 'hubspot/codegen/crm/deals/models/public_object_search_request'
require 'hubspot/codegen/crm/deals/models/simple_public_object'
require 'hubspot/codegen/crm/deals/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/deals/models/simple_public_object_id'
require 'hubspot/codegen/crm/deals/models/simple_public_object_input'

require 'hubspot/codegen/crm/extensions/cards/api_client'
require 'hubspot/codegen/crm/extensions/cards/api_error'
require 'hubspot/codegen/crm/extensions/cards/configuration'
require 'hubspot/codegen/crm/extensions/cards/api/cards_api'
require 'hubspot/codegen/crm/extensions/cards/api/sample_response_api'
require 'hubspot/codegen/crm/extensions/cards/models/action_confirmation_body'
require 'hubspot/codegen/crm/extensions/cards/models/action_hook_action_body'
require 'hubspot/codegen/crm/extensions/cards/models/card_actions'
require 'hubspot/codegen/crm/extensions/cards/models/card_create_request'
require 'hubspot/codegen/crm/extensions/cards/models/card_display_body'
require 'hubspot/codegen/crm/extensions/cards/models/card_display_property'
require 'hubspot/codegen/crm/extensions/cards/models/card_fetch_body'
require 'hubspot/codegen/crm/extensions/cards/models/card_fetch_body_patch'
require 'hubspot/codegen/crm/extensions/cards/models/card_list_response'
require 'hubspot/codegen/crm/extensions/cards/models/card_object_type_body'
require 'hubspot/codegen/crm/extensions/cards/models/card_patch_request'
require 'hubspot/codegen/crm/extensions/cards/models/card_response'
require 'hubspot/codegen/crm/extensions/cards/models/display_option'
require 'hubspot/codegen/crm/extensions/cards/models/error'
require 'hubspot/codegen/crm/extensions/cards/models/error_detail'
require 'hubspot/codegen/crm/extensions/cards/models/i_frame_action_body'
require 'hubspot/codegen/crm/extensions/cards/models/integrator_card_payload_response'
require 'hubspot/codegen/crm/extensions/cards/models/integrator_object_result'
require 'hubspot/codegen/crm/extensions/cards/models/object_token'
require 'hubspot/codegen/crm/extensions/cards/models/top_level_actions'

require 'hubspot/codegen/crm/imports/api_client'
require 'hubspot/codegen/crm/imports/api_error'
require 'hubspot/codegen/crm/imports/configuration'
require 'hubspot/codegen/crm/imports/api/core_api'
require 'hubspot/codegen/crm/imports/models/action_response'
require 'hubspot/codegen/crm/imports/models/collection_response_public_import_response'
require 'hubspot/codegen/crm/imports/models/error'
require 'hubspot/codegen/crm/imports/models/error_detail'
require 'hubspot/codegen/crm/imports/models/next_page'
require 'hubspot/codegen/crm/imports/models/paging'
require 'hubspot/codegen/crm/imports/models/public_import_metadata'
require 'hubspot/codegen/crm/imports/models/public_import_response'
require 'hubspot/codegen/crm/imports/models/public_object_list_record'

require 'hubspot/codegen/crm/line_items/api_client'
require 'hubspot/codegen/crm/line_items/api_error'
require 'hubspot/codegen/crm/line_items/configuration'
require 'hubspot/codegen/crm/line_items/api/associations_api'
require 'hubspot/codegen/crm/line_items/api/basic_api'
require 'hubspot/codegen/crm/line_items/api/batch_api'
require 'hubspot/codegen/crm/line_items/api/search_api'
require 'hubspot/codegen/crm/line_items/models/associated_id'
require 'hubspot/codegen/crm/line_items/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/line_items/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/line_items/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/line_items/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/line_items/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/line_items/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/line_items/models/collection_response_associated_id'
require 'hubspot/codegen/crm/line_items/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/line_items/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/line_items/models/error'
require 'hubspot/codegen/crm/line_items/models/error_detail'
require 'hubspot/codegen/crm/line_items/models/filter'
require 'hubspot/codegen/crm/line_items/models/filter_group'
require 'hubspot/codegen/crm/line_items/models/next_page'
require 'hubspot/codegen/crm/line_items/models/paging'
require 'hubspot/codegen/crm/line_items/models/public_object_search_request'
require 'hubspot/codegen/crm/line_items/models/simple_public_object'
require 'hubspot/codegen/crm/line_items/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/line_items/models/simple_public_object_id'
require 'hubspot/codegen/crm/line_items/models/simple_public_object_input'

require 'hubspot/codegen/crm/owners/api_client'
require 'hubspot/codegen/crm/owners/api_error'
require 'hubspot/codegen/crm/owners/configuration'
require 'hubspot/codegen/crm/owners/api/default_api'
require 'hubspot/codegen/crm/owners/models/collection_response_public_owner'
require 'hubspot/codegen/crm/owners/models/error'
require 'hubspot/codegen/crm/owners/models/error_detail'
require 'hubspot/codegen/crm/owners/models/next_page'
require 'hubspot/codegen/crm/owners/models/paging'
require 'hubspot/codegen/crm/owners/models/public_owner'
require 'hubspot/codegen/crm/owners/models/public_team'

require 'hubspot/codegen/crm/pipelines/api_client'
require 'hubspot/codegen/crm/pipelines/api_error'
require 'hubspot/codegen/crm/pipelines/configuration'
require 'hubspot/codegen/crm/pipelines/api/pipeline_stages_api'
require 'hubspot/codegen/crm/pipelines/api/pipelines_api'
require 'hubspot/codegen/crm/pipelines/models/collection_response_pipeline'
require 'hubspot/codegen/crm/pipelines/models/collection_response_pipeline_stage'
require 'hubspot/codegen/crm/pipelines/models/error'
require 'hubspot/codegen/crm/pipelines/models/error_detail'
require 'hubspot/codegen/crm/pipelines/models/next_page'
require 'hubspot/codegen/crm/pipelines/models/paging'
require 'hubspot/codegen/crm/pipelines/models/pipeline'
require 'hubspot/codegen/crm/pipelines/models/pipeline_input'
require 'hubspot/codegen/crm/pipelines/models/pipeline_patch_input'
require 'hubspot/codegen/crm/pipelines/models/pipeline_stage'
require 'hubspot/codegen/crm/pipelines/models/pipeline_stage_input'
require 'hubspot/codegen/crm/pipelines/models/pipeline_stage_patch_input'

require 'hubspot/codegen/crm/products/api_client'
require 'hubspot/codegen/crm/products/api_error'
require 'hubspot/codegen/crm/products/configuration'
require 'hubspot/codegen/crm/products/api/associations_api'
require 'hubspot/codegen/crm/products/api/basic_api'
require 'hubspot/codegen/crm/products/api/batch_api'
require 'hubspot/codegen/crm/products/api/search_api'
require 'hubspot/codegen/crm/products/models/associated_id'
require 'hubspot/codegen/crm/products/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/products/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/products/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/products/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/products/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/products/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/products/models/collection_response_associated_id'
require 'hubspot/codegen/crm/products/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/products/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/products/models/error'
require 'hubspot/codegen/crm/products/models/error_detail'
require 'hubspot/codegen/crm/products/models/filter'
require 'hubspot/codegen/crm/products/models/filter_group'
require 'hubspot/codegen/crm/products/models/next_page'
require 'hubspot/codegen/crm/products/models/paging'
require 'hubspot/codegen/crm/products/models/public_object_search_request'
require 'hubspot/codegen/crm/products/models/simple_public_object'
require 'hubspot/codegen/crm/products/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/products/models/simple_public_object_id'
require 'hubspot/codegen/crm/products/models/simple_public_object_input'

require 'hubspot/codegen/crm/properties/api_client'
require 'hubspot/codegen/crm/properties/api_error'
require 'hubspot/codegen/crm/properties/configuration'
require 'hubspot/codegen/crm/properties/api/batch_api'
require 'hubspot/codegen/crm/properties/api/core_api'
require 'hubspot/codegen/crm/properties/api/groups_api'
require 'hubspot/codegen/crm/properties/models/batch_input_property_create'
require 'hubspot/codegen/crm/properties/models/batch_input_property_name'
require 'hubspot/codegen/crm/properties/models/batch_read_input_property_name'
require 'hubspot/codegen/crm/properties/models/batch_response_property'
require 'hubspot/codegen/crm/properties/models/collection_response_property'
require 'hubspot/codegen/crm/properties/models/collection_response_property_group'
require 'hubspot/codegen/crm/properties/models/error'
require 'hubspot/codegen/crm/properties/models/error_detail'
require 'hubspot/codegen/crm/properties/models/next_page'
require 'hubspot/codegen/crm/properties/models/option'
require 'hubspot/codegen/crm/properties/models/option_input'
require 'hubspot/codegen/crm/properties/models/paging'
require 'hubspot/codegen/crm/properties/models/property'
require 'hubspot/codegen/crm/properties/models/property_create'
require 'hubspot/codegen/crm/properties/models/property_group'
require 'hubspot/codegen/crm/properties/models/property_group_create'
require 'hubspot/codegen/crm/properties/models/property_group_update'
require 'hubspot/codegen/crm/properties/models/property_modification_metadata'
require 'hubspot/codegen/crm/properties/models/property_name'
require 'hubspot/codegen/crm/properties/models/property_update'

require 'hubspot/codegen/crm/quotes/api_client'
require 'hubspot/codegen/crm/quotes/api_error'
require 'hubspot/codegen/crm/quotes/configuration'
require 'hubspot/codegen/crm/quotes/api/associations_api'
require 'hubspot/codegen/crm/quotes/api/basic_api'
require 'hubspot/codegen/crm/quotes/api/batch_api'
require 'hubspot/codegen/crm/quotes/api/default_api'
require 'hubspot/codegen/crm/quotes/api/search_api'
require 'hubspot/codegen/crm/quotes/models/associated_id'
require 'hubspot/codegen/crm/quotes/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/quotes/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/quotes/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/quotes/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/quotes/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/quotes/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/quotes/models/collection_response_associated_id'
require 'hubspot/codegen/crm/quotes/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/quotes/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/quotes/models/error'
require 'hubspot/codegen/crm/quotes/models/error_detail'
require 'hubspot/codegen/crm/quotes/models/filter'
require 'hubspot/codegen/crm/quotes/models/filter_group'
require 'hubspot/codegen/crm/quotes/models/next_page'
require 'hubspot/codegen/crm/quotes/models/paging'
require 'hubspot/codegen/crm/quotes/models/public_object_search_request'
require 'hubspot/codegen/crm/quotes/models/simple_public_object'
require 'hubspot/codegen/crm/quotes/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/quotes/models/simple_public_object_id'
require 'hubspot/codegen/crm/quotes/models/simple_public_object_input'

require 'hubspot/codegen/crm/tickets/api_client'
require 'hubspot/codegen/crm/tickets/api_error'
require 'hubspot/codegen/crm/tickets/configuration'
require 'hubspot/codegen/crm/tickets/api/associations_api'
require 'hubspot/codegen/crm/tickets/api/basic_api'
require 'hubspot/codegen/crm/tickets/api/batch_api'
require 'hubspot/codegen/crm/tickets/api/search_api'
require 'hubspot/codegen/crm/tickets/models/associated_id'
require 'hubspot/codegen/crm/tickets/models/batch_input_simple_public_object_batch_input'
require 'hubspot/codegen/crm/tickets/models/batch_input_simple_public_object_id'
require 'hubspot/codegen/crm/tickets/models/batch_input_simple_public_object_input'
require 'hubspot/codegen/crm/tickets/models/batch_read_input_simple_public_object_id'
require 'hubspot/codegen/crm/tickets/models/batch_response_simple_public_object'
require 'hubspot/codegen/crm/tickets/models/batch_response_simple_public_object_with_errors'
require 'hubspot/codegen/crm/tickets/models/collection_response_associated_id'
require 'hubspot/codegen/crm/tickets/models/collection_response_simple_public_object'
require 'hubspot/codegen/crm/tickets/models/collection_response_with_total_simple_public_object'
require 'hubspot/codegen/crm/tickets/models/error'
require 'hubspot/codegen/crm/tickets/models/error_detail'
require 'hubspot/codegen/crm/tickets/models/filter'
require 'hubspot/codegen/crm/tickets/models/filter_group'
require 'hubspot/codegen/crm/tickets/models/next_page'
require 'hubspot/codegen/crm/tickets/models/paging'
require 'hubspot/codegen/crm/tickets/models/public_object_search_request'
require 'hubspot/codegen/crm/tickets/models/simple_public_object'
require 'hubspot/codegen/crm/tickets/models/simple_public_object_batch_input'
require 'hubspot/codegen/crm/tickets/models/simple_public_object_id'
require 'hubspot/codegen/crm/tickets/models/simple_public_object_input'

require 'hubspot/codegen/crm/timeline/api_client'
require 'hubspot/codegen/crm/timeline/api_error'
require 'hubspot/codegen/crm/timeline/configuration'
require 'hubspot/codegen/crm/timeline/api/events_api'
require 'hubspot/codegen/crm/timeline/api/templates_api'
require 'hubspot/codegen/crm/timeline/api/tokens_api'
require 'hubspot/codegen/crm/timeline/models/batch_input_timeline_event'
require 'hubspot/codegen/crm/timeline/models/batch_response_timeline_event_response'
require 'hubspot/codegen/crm/timeline/models/collection_response_timeline_event_template'
require 'hubspot/codegen/crm/timeline/models/error'
require 'hubspot/codegen/crm/timeline/models/error_detail'
require 'hubspot/codegen/crm/timeline/models/event_detail'
require 'hubspot/codegen/crm/timeline/models/next_page'
require 'hubspot/codegen/crm/timeline/models/paging'
require 'hubspot/codegen/crm/timeline/models/timeline_event'
require 'hubspot/codegen/crm/timeline/models/timeline_event_i_frame'
require 'hubspot/codegen/crm/timeline/models/timeline_event_response'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template_create_request'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template_token'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template_token_option'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template_token_update_request'
require 'hubspot/codegen/crm/timeline/models/timeline_event_template_update_request'

require 'hubspot/codegen/oauth/api_client'
require 'hubspot/codegen/oauth/api_error'
require 'hubspot/codegen/oauth/configuration'
require 'hubspot/codegen/oauth/api/default_api'
require 'hubspot/codegen/oauth/models/access_token_info_response'
require 'hubspot/codegen/oauth/models/error'
require 'hubspot/codegen/oauth/models/error_detail'
require 'hubspot/codegen/oauth/models/refresh_token_info_response'
require 'hubspot/codegen/oauth/models/token_response_if'

require 'hubspot/codegen/webhooks/api_client'
require 'hubspot/codegen/webhooks/api_error'
require 'hubspot/codegen/webhooks/configuration'
require 'hubspot/codegen/webhooks/api/settings_api'
require 'hubspot/codegen/webhooks/api/subscriptions_api'
require 'hubspot/codegen/webhooks/models/batch_input_subscription_batch_update_request'
require 'hubspot/codegen/webhooks/models/batch_response_subscription_response'
require 'hubspot/codegen/webhooks/models/error'
require 'hubspot/codegen/webhooks/models/error_detail'
require 'hubspot/codegen/webhooks/models/settings_change_request'
require 'hubspot/codegen/webhooks/models/settings_response'
require 'hubspot/codegen/webhooks/models/subscription_batch_update_request'
require 'hubspot/codegen/webhooks/models/subscription_create_request'
require 'hubspot/codegen/webhooks/models/subscription_list_response'
require 'hubspot/codegen/webhooks/models/subscription_patch_request'
require 'hubspot/codegen/webhooks/models/subscription_response'
require 'hubspot/codegen/webhooks/models/throttling_settings'


module Hubspot
  class << self
    CLIENTS = [
      'OAuth',
      'Webhooks',
      'Cms::AuditLogs',
      'Cms::Domains',
      'Cms::Performance',
      'Cms::SiteSearch',
      'Cms::UrlRedirects',
      'Crm::Associations',
      'Crm::Companies',
      'Crm::Contacts',
      'Crm::Deals',
      'Crm::Extensions::Cards',
      'Crm::Imports',
      'Crm::LineItems',
      'Crm::Owners',
      'Crm::Pipelines',
      'Crm::Products',
      'Crm::Properties',
      'Crm::Quotes',
      'Crm::Tickets',
      'Crm::Timeline'
    ].freeze

    def configure
      return Configuration.default unless block_given?
      yield(Configuration.default)
      CLIENTS.each do |client_class_name|
        config_class = Hubspot.const_get("#{client_class_name}::Configuration")
        yield(config_class.default)
      end
      Configuration.default
    end
  end
end