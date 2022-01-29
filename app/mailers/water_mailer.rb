class WaterMailer < ApplicationMailer

  def send_mail(grow_plant)
    @grow_plant = grow_plant
    @url = "karasazu.com"
    attachments.inline['logo_top.png'] = File.read('app/assets/images/logo_top.png')
    mail(
      to: grow_plant.user.email,
      subject: '今日は植物の水やり日です'
    ) do |format|
      format.html
    end

  end

end
