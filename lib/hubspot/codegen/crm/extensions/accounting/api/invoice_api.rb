=begin
#Accounting Extension

#These APIs allow you to interact with HubSpot's Accounting Extension. It allows you to: * Specify the URLs that HubSpot will use when making webhook requests to your external accounting system. * Respond to webhook calls made to your external accounting system by HubSpot 

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module Crm
    module Extensions
      module Accounting
        class InvoiceApi
          attr_accessor :api_client

          def initialize(api_client = ApiClient.default)
            @api_client = api_client
          end
          # Records an invoice payment
          # Records an payment against an invoice.
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param invoice_create_payment_request [InvoiceCreatePaymentRequest] The payment information
          # @param [Hash] opts the optional parameters
          # @option opts [String] :account_id The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @return [InvoiceUpdateResponse]
          def create_payment(invoice_id, invoice_create_payment_request, opts = {})
            data, _status_code, _headers = create_payment_with_http_info(invoice_id, invoice_create_payment_request, opts)
            data
          end

          # Records an invoice payment
          # Records an payment against an invoice.
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param invoice_create_payment_request [InvoiceCreatePaymentRequest] The payment information
          # @param [Hash] opts the optional parameters
          # @option opts [String] :account_id The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @return [Array<(InvoiceUpdateResponse, Integer, Hash)>] InvoiceUpdateResponse data, response status code and response headers
          def create_payment_with_http_info(invoice_id, invoice_create_payment_request, opts = {})
            if @api_client.config.debugging
              @api_client.config.logger.debug 'Calling API: InvoiceApi.create_payment ...'
            end
            # verify the required parameter 'invoice_id' is set
            if @api_client.config.client_side_validation && invoice_id.nil?
              fail ArgumentError, "Missing the required parameter 'invoice_id' when calling InvoiceApi.create_payment"
            end
            # verify the required parameter 'invoice_create_payment_request' is set
            if @api_client.config.client_side_validation && invoice_create_payment_request.nil?
              fail ArgumentError, "Missing the required parameter 'invoice_create_payment_request' when calling InvoiceApi.create_payment"
            end
            # resource path
            local_var_path = '/crm/v3/extensions/accounting/invoice/{invoiceId}/payment'.sub('{' + 'invoiceId' + '}', CGI.escape(invoice_id.to_s))

            # query parameters
            query_params = opts[:query_params] || {}
            query_params[:'accountId'] = opts[:'account_id'] if !opts[:'account_id'].nil?

            # header parameters
            header_params = opts[:header_params] || {}
            # HTTP header 'Accept' (if needed)
            header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
            # HTTP header 'Content-Type'
            content_type = @api_client.select_header_content_type(['application/json'])
            if !content_type.nil?
                header_params['Content-Type'] = content_type
            end

            # form parameters
            form_params = opts[:form_params] || {}

            # http body (model)
            post_body = opts[:debug_body] || @api_client.object_to_http_body(invoice_create_payment_request)

            # return_type
            return_type = opts[:debug_return_type] || 'InvoiceUpdateResponse'

            # auth_names
            auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

            new_options = opts.merge(
              :operation => :"InvoiceApi.create_payment",
              :header_params => header_params,
              :query_params => query_params,
              :form_params => form_params,
              :body => post_body,
              :auth_names => auth_names,
              :return_type => return_type
            )

            data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
            if @api_client.config.debugging
              @api_client.config.logger.debug "API called: InvoiceApi#create_payment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
            end
            return data, status_code, headers
          end

          # Get invoice data
          # Returns invoice data for an Accounting account from the specified ID
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param account_id [String] The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @param [Hash] opts the optional parameters
          # @return [InvoiceReadResponse]
          def get_by_id(invoice_id, account_id, opts = {})
            data, _status_code, _headers = get_by_id_with_http_info(invoice_id, account_id, opts)
            data
          end

          # Get invoice data
          # Returns invoice data for an Accounting account from the specified ID
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param account_id [String] The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @param [Hash] opts the optional parameters
          # @return [Array<(InvoiceReadResponse, Integer, Hash)>] InvoiceReadResponse data, response status code and response headers
          def get_by_id_with_http_info(invoice_id, account_id, opts = {})
            if @api_client.config.debugging
              @api_client.config.logger.debug 'Calling API: InvoiceApi.get_by_id ...'
            end
            # verify the required parameter 'invoice_id' is set
            if @api_client.config.client_side_validation && invoice_id.nil?
              fail ArgumentError, "Missing the required parameter 'invoice_id' when calling InvoiceApi.get_by_id"
            end
            # verify the required parameter 'account_id' is set
            if @api_client.config.client_side_validation && account_id.nil?
              fail ArgumentError, "Missing the required parameter 'account_id' when calling InvoiceApi.get_by_id"
            end
            # resource path
            local_var_path = '/crm/v3/extensions/accounting/invoice/{invoiceId}'.sub('{' + 'invoiceId' + '}', CGI.escape(invoice_id.to_s))

            # query parameters
            query_params = opts[:query_params] || {}
            query_params[:'accountId'] = account_id

            # header parameters
            header_params = opts[:header_params] || {}
            # HTTP header 'Accept' (if needed)
            header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])

            # form parameters
            form_params = opts[:form_params] || {}

            # http body (model)
            post_body = opts[:debug_body]

            # return_type
            return_type = opts[:debug_return_type] || 'InvoiceReadResponse'

            # auth_names
            auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

            new_options = opts.merge(
              :operation => :"InvoiceApi.get_by_id",
              :header_params => header_params,
              :query_params => query_params,
              :form_params => form_params,
              :body => post_body,
              :auth_names => auth_names,
              :return_type => return_type
            )

            data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
            if @api_client.config.debugging
              @api_client.config.logger.debug "API called: InvoiceApi#get_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
            end
            return data, status_code, headers
          end

          # Update an invoice
          # Updates an Invoice by the given ID.
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param account_id [String] The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @param invoice_update_request [InvoiceUpdateRequest] The invoice data to update
          # @param [Hash] opts the optional parameters
          # @return [InvoiceUpdateResponse]
          def update(invoice_id, account_id, invoice_update_request, opts = {})
            data, _status_code, _headers = update_with_http_info(invoice_id, account_id, invoice_update_request, opts)
            data
          end

          # Update an invoice
          # Updates an Invoice by the given ID.
          # @param invoice_id [String] The ID of the invoice. This is the invoice ID from the external accounting system.
          # @param account_id [String] The ID of the account that the invoice belongs to. This is the account ID from the external accounting system.
          # @param invoice_update_request [InvoiceUpdateRequest] The invoice data to update
          # @param [Hash] opts the optional parameters
          # @return [Array<(InvoiceUpdateResponse, Integer, Hash)>] InvoiceUpdateResponse data, response status code and response headers
          def update_with_http_info(invoice_id, account_id, invoice_update_request, opts = {})
            if @api_client.config.debugging
              @api_client.config.logger.debug 'Calling API: InvoiceApi.update ...'
            end
            # verify the required parameter 'invoice_id' is set
            if @api_client.config.client_side_validation && invoice_id.nil?
              fail ArgumentError, "Missing the required parameter 'invoice_id' when calling InvoiceApi.update"
            end
            # verify the required parameter 'account_id' is set
            if @api_client.config.client_side_validation && account_id.nil?
              fail ArgumentError, "Missing the required parameter 'account_id' when calling InvoiceApi.update"
            end
            # verify the required parameter 'invoice_update_request' is set
            if @api_client.config.client_side_validation && invoice_update_request.nil?
              fail ArgumentError, "Missing the required parameter 'invoice_update_request' when calling InvoiceApi.update"
            end
            # resource path
            local_var_path = '/crm/v3/extensions/accounting/invoice/{invoiceId}'.sub('{' + 'invoiceId' + '}', CGI.escape(invoice_id.to_s))

            # query parameters
            query_params = opts[:query_params] || {}
            query_params[:'accountId'] = account_id

            # header parameters
            header_params = opts[:header_params] || {}
            # HTTP header 'Accept' (if needed)
            header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
            # HTTP header 'Content-Type'
            content_type = @api_client.select_header_content_type(['application/json'])
            if !content_type.nil?
                header_params['Content-Type'] = content_type
            end

            # form parameters
            form_params = opts[:form_params] || {}

            # http body (model)
            post_body = opts[:debug_body] || @api_client.object_to_http_body(invoice_update_request)

            # return_type
            return_type = opts[:debug_return_type] || 'InvoiceUpdateResponse'

            # auth_names
            auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

            new_options = opts.merge(
              :operation => :"InvoiceApi.update",
              :header_params => header_params,
              :query_params => query_params,
              :form_params => form_params,
              :body => post_body,
              :auth_names => auth_names,
              :return_type => return_type
            )

            data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
            if @api_client.config.debugging
              @api_client.config.logger.debug "API called: InvoiceApi#update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
            end
            return data, status_code, headers
          end
        end
      end
    end
  end
end
