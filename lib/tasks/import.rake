namespace :db do

  desc 'Import defaults'

  task import: :environment do

    #Clear tags
    [Wod].each(&:delete_all)

    Wod.create({name:'17.1', score_type:'time'})

  end

end