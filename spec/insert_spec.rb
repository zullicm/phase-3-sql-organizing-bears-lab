describe 'populating the bears table' do
  let(:db) do
    SQLite3::Database.new(':memory:')
  end

  before do
    create_sql = File.read("lib/create.sql")
    db.execute_batch(create_sql)
    insert_sql = File.read("lib/insert.sql")
    db.execute_batch(insert_sql)
  end

  it 'has 8 bears' do
    expect(db.execute("SELECT COUNT(*) FROM bears;").flatten[0]).to eq(8)
  end
  
  it 'has an unnamed bear' do
    expect(db.execute("SELECT COUNT(*) FROM bears WHERE name IS NULL;").flatten[0]).to eq(1)
  end
end
