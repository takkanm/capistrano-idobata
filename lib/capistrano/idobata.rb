require 'capistrano/idobata/version'
require 'net/http'
require 'pathname'

module Capistrano
  module Idobata
    class Client
      def initialize(hook_url)
        @hook_url = hook_url
      end

      def valid?
        !! @hook_url
      end

      def send(message)
        Net::HTTP.post_form URI.parse(@hook_url), source: message
      end
    end

    class DeployInformation
      attr_reader :idobata_hook_url, :application, :stage, :branch

      def initialize(idobata_hook_url: nil, application: nil, stage: nil, branch: nil)
        @idobata_hook_url = idobata_hook_url
        @application = application
        @stage       = stage
        @branch      = branch
      end
    end
  end
end

load Pathname.new(__dir__).join('idobata', 'tasks', 'capistrano-idobata.rake')
