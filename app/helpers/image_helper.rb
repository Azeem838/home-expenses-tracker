module ImageHelper
  def group_image(group_id, options = {})
    group = Group.find(group_id)
    if group.main_image.attached?
      image_tag(group.main_image, options)
    else
      image_tag('default_group_image.png')
    end
  end

  def expense_image(expense_id, options = {})
    expense = Expense.find(expense_id)
    group = expense.groups.first
    return group_image(group.id, options) unless group.nil?

    image_tag('default_group_image.png')
  end

  def gravatar_for(user, options = {})
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=200"
    image_tag(gravatar_url, options)
  end
end
