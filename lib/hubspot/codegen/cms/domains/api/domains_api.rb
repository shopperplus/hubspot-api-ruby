=begin
#Domains

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module Cms
    module Domains
      class DomainsApi
        attr_accessor :api_client

        def initialize(api_client = ApiClient.default)
          @api_client = api_client
        end
        # Get a single domain
        # Returns a single domains with the id specified.
        # @param domain_id [String] The unique ID of the domain.
        # @param [Hash] opts the optional parameters
        # @return [Domain]
        def get_by_id(domain_id, opts = {})
          data, _status_code, _headers = get_by_id_with_http_info(domain_id, opts)
          data
        end

        # Get a single domain
        # Returns a single domains with the id specified.
        # @param domain_id [String] The unique ID of the domain.
        # @param [Hash] opts the optional parameters
        # @return [Array<(Domain, Integer, Hash)>] Domain data, response status code and response headers
        def get_by_id_with_http_info(domain_id, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: DomainsApi.get_by_id ...'
          end
          # verify the required parameter 'domain_id' is set
          if @api_client.config.client_side_validation && domain_id.nil?
            fail ArgumentError, "Missing the required parameter 'domain_id' when calling DomainsApi.get_by_id"
          end
          # resource path
          local_var_path = '/cms/v3/domains/{domainId}'.sub('{' + 'domainId' + '}', CGI.escape(domain_id.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'Domain'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

          new_options = opts.merge(
            :operation => :"DomainsApi.get_by_id",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: DomainsApi#get_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end

        # Get current domains
        # Returns all existing domains that have been created. Results can be limited and filtered by creation or updated date.
        # @param [Hash] opts the optional parameters
        # @option opts [Time] :created_at Only return domains created at this date.
        # @option opts [Time] :created_after Only return domains created after this date.
        # @option opts [Time] :created_before Only return domains created before this date.
        # @option opts [Time] :updated_at Only return domains updated at this date.
        # @option opts [Time] :updated_after Only return domains updated after this date.
        # @option opts [Time] :updated_before Only return domains updated before this date.
        # @option opts [Array<String>] :sort 
        # @option opts [String] :after The paging cursor token of the last successfully read resource will be returned as the &#x60;paging.next.after&#x60; JSON property of a paged response containing more results.
        # @option opts [Integer] :limit Maximum number of results per page.
        # @option opts [Boolean] :archived Whether to return only results that have been archived.
        # @return [CollectionResponseWithTotalDomainForwardPaging]
        def get_page(opts = {})
          data, _status_code, _headers = get_page_with_http_info(opts)
          data
        end

        # Get current domains
        # Returns all existing domains that have been created. Results can be limited and filtered by creation or updated date.
        # @param [Hash] opts the optional parameters
        # @option opts [Time] :created_at Only return domains created at this date.
        # @option opts [Time] :created_after Only return domains created after this date.
        # @option opts [Time] :created_before Only return domains created before this date.
        # @option opts [Time] :updated_at Only return domains updated at this date.
        # @option opts [Time] :updated_after Only return domains updated after this date.
        # @option opts [Time] :updated_before Only return domains updated before this date.
        # @option opts [Array<String>] :sort 
        # @option opts [String] :after The paging cursor token of the last successfully read resource will be returned as the &#x60;paging.next.after&#x60; JSON property of a paged response containing more results.
        # @option opts [Integer] :limit Maximum number of results per page.
        # @option opts [Boolean] :archived Whether to return only results that have been archived.
        # @return [Array<(CollectionResponseWithTotalDomainForwardPaging, Integer, Hash)>] CollectionResponseWithTotalDomainForwardPaging data, response status code and response headers
        def get_page_with_http_info(opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: DomainsApi.get_page ...'
          end
          # resource path
          local_var_path = '/cms/v3/domains/'

          # query parameters
          query_params = opts[:query_params] || {}
          query_params[:'createdAt'] = opts[:'created_at'] if !opts[:'created_at'].nil?
          query_params[:'createdAfter'] = opts[:'created_after'] if !opts[:'created_after'].nil?
          query_params[:'createdBefore'] = opts[:'created_before'] if !opts[:'created_before'].nil?
          query_params[:'updatedAt'] = opts[:'updated_at'] if !opts[:'updated_at'].nil?
          query_params[:'updatedAfter'] = opts[:'updated_after'] if !opts[:'updated_after'].nil?
          query_params[:'updatedBefore'] = opts[:'updated_before'] if !opts[:'updated_before'].nil?
          query_params[:'sort'] = @api_client.build_collection_param(opts[:'sort'], :multi) if !opts[:'sort'].nil?
          query_params[:'after'] = opts[:'after'] if !opts[:'after'].nil?
          query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
          query_params[:'archived'] = opts[:'archived'] if !opts[:'archived'].nil?

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

          # form parameters
          form_params = opts[:form_params] || {}

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'CollectionResponseWithTotalDomainForwardPaging'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

          new_options = opts.merge(
            :operation => :"DomainsApi.get_page",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: DomainsApi#get_page\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end
      end
    end
  end
end
