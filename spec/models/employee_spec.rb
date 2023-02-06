require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "nameとemailとpasswordが有効"
  it "nameが存在せず無効"
  it "emailが存在せず無効"
  it "emailが重複し無効"
end
