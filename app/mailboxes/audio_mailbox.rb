class AudioMailbox < ApplicationMailbox
  before_processing :ensure_user

  def process
    import_attachment = ImportAttachment.new(
      user_id: User.first.id,
      subject: mail.subject
    )

    import_attachment.audio.attach(
      io: StringIO.new(mail.attachments.first.body.decoded),
      filename: mail.attachments.first.filename
    )
  import_attachment.save!
  end

  private

  def ensure_user
    user = User.find_by(email: mail.from.first)
    unless user
        # bounce_with
    end
  end
end
