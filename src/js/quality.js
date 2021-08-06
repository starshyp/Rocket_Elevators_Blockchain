App = {
  web3Provider: null,
  contracts: {},

  // init: async function() {
  //   // Load pets.
  //   $.getJSON('../pets.json', function(data) {
  //     var petsRow = $('#petsRow');
  //     var petTemplate = $('#petTemplate');
  //
  //     for (i = 0; i < data.length; i ++) {
  //       petTemplate.find('.panel-title').text(data[i].name);
  //       petTemplate.find('img').attr('src', data[i].picture);
  //       petTemplate.find('.pet-breed').text(data[i].breed);
  //       petTemplate.find('.pet-age').text(data[i].age);
  //       petTemplate.find('.pet-location').text(data[i].location);
  //       petTemplate.find('.btn-adopt').attr('data-id', data[i].id);
  //
  //       petsRow.append(petTemplate.html());
  //     }
  //   });
  //
  //   return await App.initWeb3();
  // },

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
    $.getJSON('Quality.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with @truffle/contract
      var QualityArtifact = data;
      App.contracts.Quality = TruffleContract(QualityArtifact);

      // Set the provider for our contract
      App.contracts.Quality.setProvider(App.web3Provider);

      // Use our contract to retrieve and mark the adopted pets
      // return App.tokenize();
    });

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-primary', App.verify);
  },

////////////////////////////////////////////////////////////////////////////
  // function verify() {
  verify: function(event) {
    event.preventDefault();

    // var petId = parseInt($(event.target).data('id'));

    var qualityInstance;

    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];

      App.contracts.Quality.deployed().then(function(instance) {
        qualityInstance = instance;

        console.log(qualityInstance)
        address = qualityInstance.address.toString();
        var data = {
          address: address,
          contract: "Quality"
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
        // Execute adopt as a transaction by sending account
        // return qualityInstance.adopt(petId, {from: account});
        return
        qualityInstance.door($("#door").val(), {from: account});
        qualityInstance.cable($("#cable").val(), {from: account});
        qualityInstance.brake($("#brake").val(), {from: account});
        qualityInstance.batteryPermit($("#battery").val(), {from: account});
        qualityInstance.certificate(
          $("#cert1").val(),
          $("#cert2").val(),
          $("#cert3").val(),
          $("#cert4").val(),
          {from: account}
        );

      }).then(function(result) {
        // return App.charge();
      }).catch(function(err) {
      });
    });
  }
////////////////////////////////////////////////////////////////////////////
};

$(function() {
  $(window).load(function() {
    App.initWeb3();
  });
});


//auto populate on cert of conform.
$("#door").on('change', function(){
  $("#cert1").val($(this).val());
});
$("#cable").on('change', function(){
  $("#cert2").val($(this).val());
});
$("#brake").on('change', function(){
  $("#cert3").val($(this).val());
});
$("#battery").on('change', function(){
  $("#cert4").val($(this).val());
});
