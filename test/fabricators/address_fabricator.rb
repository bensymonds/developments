Fabricator(:address) do
  postcode_out "pc_out"
  postcode_in "pc_in"
  rest "number, street, city"
end
