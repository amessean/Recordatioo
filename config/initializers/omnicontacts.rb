require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "870623758964-d76t37gfaiq1dpa595fejo76rthik7kv.apps.googleusercontent.com", "x-3_qKIj9GW67egb6OJIcBU9", {:redirect_path => "/contacts/gmail/contact_callback"}
end
