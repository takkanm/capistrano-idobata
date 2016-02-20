namespace :idobata do
  task :setup do
    @deploy_information = Capistrano::Idobata::DeployInformation.new(
      idobata_hook_url: fetch(:idobata_hook_url, nil),
      application:      fetch(:application),
      stage:            fetch(:stage, 'production'),
      branch:           fetch(:branch, nil)
    )

    @idobata_client = Capistrano::Idobata::Client.new(@deploy_information.idobata_hook_url)
  end

  task :starting do
    if @idobata_client.valid?
      message = if @deploy_information.branch
        "deploy #{@deploy_information.application}'s #{@deploy_information.branch} to #{@deploy_information.stage} start !! :rocket:"
      else
        "deploy #{@deploy_information.application}' to #{@deploy_information.stage} start !! :rocket:"
      end

      @idobata_client.send(message)
    end
  end

  task :finished do
    if @idobata_client.valid?
      message = if @deploy_information.branch
        ":white_check_mark: deploy #{@deploy_information.application}'s #{@deploy_information.branch} to #{@deploy_information.stage} success !!"
      else
        ":white_check_mark: deploy #{@deploy_information.application}' to #{@deploy_information.stage} success !!"
      end

      @idobata_client.send(message)
    end
  end

  task :failed do
    if @idobata_client.valid?
      message = if @deploy_information.branch
        ":broken_heart: deploy #{@deploy_information.application}'s #{@deploy_information.branch} to #{@deploy_information.stage} failed !!"
      else
        ":broken_heart: deploy #{@deploy_information.application}' to #{@deploy_information.stage} failed !!"
      end

      @idobata_client.send(message)
    end
  end
end

before 'idobata:starting', 'idobata:setup'

after 'deploy:starting', 'idobata:starting'
after 'deploy:finished', 'idobata:finished'
after 'deploy:failed',   'idobata:failed'
