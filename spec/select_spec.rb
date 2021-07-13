describe 'querying the bears table' do
  let(:db) do
    SQLite3::Database.new(':memory:')
  end

  before do
    create_sql = File.read("lib/create.sql")
    db.execute_batch(create_sql)
    insert_sql = File.read("lib/seed.sql")
    db.execute_batch(insert_sql)
  end
  
  it 'selects all of the female bears and returns their name and age' do
    expect(db.execute(selects_all_female_bears_return_name_and_age)).to eq([["Tabitha", 6],["Melissa", 13], ["Wendy", 6]])
  end

  it 'selects all of the bears names and orders them in alphabetical order' do
    expect(db.execute(selects_all_bears_names_and_orders_in_alphabetical_order)).to eq([[nil],["Grinch"],["Melissa"],["Mr. Chocolate"],["Rowdy"],["Sargeant Brown"],["Tabitha"],["Wendy"]])
  end

  it 'selects all of the bears names and ages that are alive and order them from youngest to oldest' do
    expect(db.execute(selects_all_bears_names_and_ages_that_are_alive_and_order_youngest_to_oldest)).to eq([["Grinch", 2], ["Tabitha", 6], ["Wendy", 6], ["Rowdy", 10], ["Melissa", 13]])
  end

  it 'selects the oldest bear and returns their name and age' do
    expect(db.execute(selects_oldest_bear_and_returns_name_and_age)).to eq([["Mr. Chocolate", 20]])
  end

  it 'selects the youngest bear and returns their name and age' do
    expect(db.execute(select_youngest_bear_and_returns_name_and_age)).to eq([["Grinch", 2]])
  end
end
