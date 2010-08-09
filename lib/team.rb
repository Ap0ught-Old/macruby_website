module MacRubyTeamHelper
  
  Member = Struct.new(:handle, :name, :affiliation, :href, :email)
  
  def render_member(member)
    html = "<p class='project_member'>"
    html += (member.href ? "<a href='#{member.href}'>#{member.name}</a>" : member.name)
    #html += "<span class='affiliation'>, #{member.affiliation}</span>" if member.affiliation
    html += "</p>"
    html
  end
  
  def team_members
    [
      Member.new("lrz", "Laurent Sansonetti", "Apple, Inc.", "http://chopine.be", "lsansonetti@apple.com"),
      Member.new("rich", "Rich Kilmer", "InfoEther, Inc.", "http://www.infoether.com", "rich@infoether.com"),
      Member.new("ben", "Ben Stiglitz", "Apple, Inc.", nil, "stig@apple.com"),
      Member.new("patrick", "Patrick Thomson", "Apple, Inc.", nil, "pthomson@apple.com"),
      Member.new("eloy", "Eloy Duran", nil, "http://superalloy.nl/", "eloy.de.enige@gmail.com"),
      Member.new("vincent", "Vincent Isambart"),
      Member.new("matt", "Matt Aimonetti", "m|a agile consulting", "http://merbist.com", "mattaimonetti@gmail.com"),
      Member.new("ernie", "Ernest N. Prabhakar", "Apple, Inc", nil, "prabhaka@apple.com"),
      Member.new("thibault", "Thibault Martin-Lagardette", "Apple, Inc", nil, "martinlagardette@apple.com"),
      Member.new("claudio", "Claudio Poli", nil, "http://www.icoretech.org/", "claudio@icoretech.org")
    ]
  end
  
  def member_name(member_handle)
    member = team_members.detect { |member| member.handle == member_handle }
    member ? member.name : member_handle
  end
  
  Kudo = Struct.new(:name, :href, :reason)
  
  def render_kudo(kudo)
    html = "<p class='project_kudo'>"
    html += (kudo.href ? "<a href='#{kudo.href}'>#{kudo.name}</a>" : kudo.name)
    html += "<br><span class='summary'>#{kudo.reason}</span>"
    html += "</p>"
    html
  end
  
  def kudos
    [
      Kudo.new("John Athayde", "http://www.boboroshi.com", "Website design, layout, graphics, cool icon!"),
      Kudo.new("Mac OS Forge", "http://macosforge.org", "Hosting the MacRuby project")
    ]
  end
end

Webby::Helpers.register(MacRubyTeamHelper)
