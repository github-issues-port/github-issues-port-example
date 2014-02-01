class GithubIssuesController < ApplicationController

  # GET /github_issues
  # GET /github_issues.json
  def index
#    @github_issues = GithubIssue.all
  end

  def import
   puts "==================#{github_issue_params}"
   connection = Github.new(basic_auth: "#{github_issue_params[:username]}:#{github_issue_params[:password]}")
   puts "++++++++++++++#{connection.inspect}"
   puts "++++++++++++++#{github_issue_params[:owner].inspect}"
   puts "++++++++++++++#{github_issue_params[:repo_name].inspect}"
   Githubissues::Port::Export.new(connection, github_issue_params[:owner], github_issue_params[:repo_name], "#{Rails.root}/tmp/export.xlsx", fields: ['number', 'title', 'body', 'labels'])
   send_file "#{Rails.root}/tmp/export.xlsx"
   #redirect_to root_url
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_issue_params
      params.require(:github_issue).permit(:username,:password,:owner,:repo_name)
    end
end
