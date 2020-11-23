App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    // Load pets.
    $.getJSON('../pets.json', function(data) {
      var petsRow = $('#petsRow');
      var petTemplate = $('#petTemplate');

      for (i = 0; i < data.length; i ++) {
        petTemplate.find('.panel-title').text(data[i].name);
        petTemplate.find('img').attr('src', data[i].picture);
        petTemplate.find('.pet-breed').text(data[i].breed);
        petTemplate.find('.pet-age').text(data[i].age);
        petTemplate.find('.pet-location').text(data[i].location);
        petTemplate.find('.btn-adopt').attr('data-id', data[i].id);

        petsRow.append(petTemplate.html());
      }
    });

    return await App.initWeb3();
  },

  initWeb3: async function() {
    if(typeof web3 !== "undefined") {
      App.web3Provider = web3.currentProvider
    }
    else {
      App.web3Provider = new Web3.Providers.HttpProvider('http://localhost:8545')
    }
    web3 = new web3(App.web3Provider)
    return App.initContract();
  },

  initContract: function() {
      $.getJSON('Cancer.json', function(data) {
        var CancerArtifact = data
        App.contracts.Cancer = truffleContact(CancerArtifact)
        App.Contracts.Cancer.setProvider(App.web3Provider)
        return App.markAdopted()
      })

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },

  markAdopted: function(adopters, account) {
    var CancerInstance 
    App.contracts.Cancer.deployed().then(function(instance) {
      CancerInstance = instance
      return CancerInstance.getAdopters.call()
  }).then(function(adopters){
    for(var i = 0; i < adopters.length; I++) {
      if(adopters[i] !== '0x0000000000000000000000000000000000000000') {
        $('.panet.pet').eq(i).find('button').text('success').attr('disabled', true)
      }
    }
  }).catch(function(err) {
    console.log(err.message)
  })
  },

  handleAdopt: function(event) {
    event.preventDefault();

    var petId = parseInt($(event.target).data('id'));
    var CancerInstance
    web3.eth.getAccounts(function(err, accounts){
      if(err) console.log(err)
      var account = accounts[0]

      App.contracts.Cancer.deployed().then(function(instance) {
        CancerInstance = instance
        return CancerInstance.adopt(petId, {from: account})

      }).then(function(result) {
        return App.markAdopted()
      }).catch(function(err) {
        console.log(err.message)
      })
    })
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
