require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
    context "attributes" do
        it "should respond to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
        it "should initialize entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_a(Array)
        end
        
        it "should initialize entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq 0
        end
    end
    
    context "add entries" do
        it "adds only one entry to the addrss book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq 1
        end
        
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '010.012.1815'
            expect(new_entry.email).to eq 'augusta.king@lovelace.com'
        end
    end
    
    context "remove entries" do
        it "removes a single entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Rachel Smith', '111.222.3333', 'rachel@smith.com')
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq 1
        end
        
        it "removes the specified entry and only that entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            test_entry = book.entries[0]
            book.add_entry('Rachel Smith', '111.222.3333', 'rachel@smith.com')
            book.remove_entry('Rachel Smith', '111.222.3333', 'rachel@smith.com')
            
            expect(book.entries[1]).to eq nil
            expect(test_entry.name).to eq 'Ada Lovelace'
        end
    end
end