require 'restclient'

namespace :idobata do
  task :setup do
    @deploy_infomation = Capistrano::Idobata::DeployInfomation.new(
      idobata_hook_url: fetch(:idobata_hook_url, nil),
      application:      fetch(:application),
      stage:            fetch(:stage, 'production'),
      branch:           fetch(:branch, nil)
    )

    @idobata_client = Capistrano::Idobata::Client.new(@deploy_infomation.idobata_hook_url)
  end

  task :starting do
    if @idobata_client.valid?
      message = if @deploy_infomation.branch
        "deploy #{@deploy_infomation.application}'s #{@deploy_infomation.branch} to #{@deploy_infomation.stage} start !! :rocket:"
      else
        "deploy #{@deploy_infomation.application}' to #{@deploy_infomation.stage} start !! :rocket:"
      end

      @idobata_client.send(message)
    end
  end

  task :finished do
    if @idobata_client.valid?
      message = if @deploy_infomation.branch
        ":white_check_mark: deploy #{@deploy_infomation.application}'s #{@deploy_infomation.branch} to #{@deploy_infomation.stage} success !!"
      else
        ":white_check_mark: deploy #{@deploy_infomation.application}' to #{@deploy_infomation.stage} success !!"
      end

      @idobata_client.send(message)
    end
  end

  task :failed do
    if @idobata_client.valid?

      message = if @deploy_infomation.branch
        ":broken_heart: deploy #{@deploy_infomation.application}'s #{@deploy_infomation.branch} to #{@deploy_infomation.stage} failed !!"
      else
        ":broken_heart: deploy #{@deploy_infomation.application}' to #{@deploy_infomation.stage} failed !!"
      end

      @idobata_client.send(message)
    end
  end
end

before 'idobata:starting', 'idobata:setup'

after 'deploy:starting', 'idobata:starting'
after 'deploy:finished', 'idobata:finished'
after 'deploy:failed',   'idobata:failed'
