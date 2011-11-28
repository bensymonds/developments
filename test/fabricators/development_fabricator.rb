Fabricator(:development) do
  name "development1"
  borough "borough1"
  ward "ward1"
  address {Fabricate.build(:address)}
  status "pre-planning"
end
