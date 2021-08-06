App = {
    web3Provider: null,
    contracts: {},


initWeb3: async function() {
   
    // Modern dapp browsers...
    if (window.ethereum) {
      App.web3Provider = window.ethereum;
      try {
        // Request account access
        await window.ethereum.enable();
      } catch (error) {
        // User denied account access...
        console.error("User denied account access")
      }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
      App.web3Provider = window.web3.currentProvider;
    }
    // If no injected web3 instance is detected, fall back to Ganache
    else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('MaterialProvider.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with @truffle/contract
      var MaterialProviderArtifact = data;
      App.contracts.MaterialProvider = TruffleContract(MaterialProviderArtifact);

      // Set the provider for our contract
      App.contracts.MaterialProvider.setProvider(App.web3Provider);

      // Use our contract to retrieve and mark the adopted pets
      // return App.markAdopted();
    });

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-primary', App.submit);
  },

  submit: function(event) {
    event.preventDefault();

  //   var petId = parseInt($(event.target).data('id'));

    var materialproviderInstance;

    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];
      
      App.contracts.MaterialProvider.deployed().then(function(instance) {
        materialproviderInstance = instance;
          var aluminiumBars = $("#aluminiumBars").val()
          var stainlessSteelSheets = $("#stainlessSteelSheets").val()
          var bumperRubberBands = $("#bumperRubberBands").val()
          var interiorLightBulbs = $("#interiorLightBulbs").val()
          var displayLeds = $("#displayLeds").val()
          var speakers = $("#speakers").val()
        // Execute adopt as a transaction by sending account
          console.log(materialproviderInstance)
          address = materialproviderInstance.address.toString();
          var data = {
              address: address,
              contract: "MaterialProvider"
          };
          console.log(data)
          $.ajax({
              url: 'https://rocketapis.azurewebsites.net/api/contract',
              type: 'POST',
              data: JSON.stringify(data),
              headers: {
                  "Access-Control-Allow-Origin": "*",
                  "Access-Control-Allow-Methods": "HEAD, GET, POST, PUT, PATCH, DELETE",
                  "Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
              },
              success: function (data, textStatus, xhr) {
                  alert('Contract created successfully.');
              },
              error: function (xhr, textStatus, errorThrown) {
                  console.log('Error in Operation');
                  console.log(data);
                  alert('Failed to create contract.');
              }
          });
        return materialproviderInstance.createMaterials(aluminiumBars, stainlessSteelSheets, bumperRubberBands, interiorLightBulbs, displayLeds, speakers, {from: account});
      }).then(function(result) {
      //   return App.markAdopted();
          console.log("Success");
      }).catch(function(err) {
        console.log(err.message);
      });
    });

  }

};
$(function() {
    $(window).load(function() {
      App.initWeb3();
    });
  });
  