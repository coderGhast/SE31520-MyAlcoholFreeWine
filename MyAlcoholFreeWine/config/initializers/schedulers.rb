# Scheduler help from https://richonrails.com/articles/background-tasks-with-rufus-scheduler
require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '30s' do
 WebServiceCallJob.new.async.perform
end