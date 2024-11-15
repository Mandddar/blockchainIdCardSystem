module blockchainIdCardSystem::IDCard {
   use aptos_framework::signer;

   /// Struct representing a person's ID card
   struct IDCardData has key, store {
       name: vector<u8>,
       age: u8,
       address: vector<u8>,
       id: u64,
   }

   /// Function to create a new ID card
   public fun create_id_card(owner: &signer, name: vector<u8>, age: u8, address: vector<u8>, id: u64) {
       let id_card = IDCardData {
           name,
           age,
           address,
           id,
       };
       move_to(owner, id_card);
   }

   /// Function to update an existing ID card
   public fun update_id_card(owner: &signer, age: u8, address: vector<u8>) acquires IDCardData {
       let id_card = borrow_global_mut<IDCardData>(signer::address_of(owner));
       id_card.age = age;
       id_card.address = address;
   }
}