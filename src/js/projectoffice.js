App = {
    web3Provider: null,
    contracts: {},
  
    // init: async function() {
    //   // Load pets.
    //   $.getJSON('../pets.json', function(data) {
    //     var petsRow = $('#petsRow');
    //     var petTemplate = $('#petTemplate');
  
    //     for (i = 0; i < data.length; i ++) {
    //       petTemplate.find('.panel-title').text(data[i].name);
    //       petTemplate.find('img').attr('src', data[i].picture);
    //       petTemplate.find('.pet-breed').text(data[i].breed);
    //       petTemplate.find('.pet-age').text(data[i].age);
    //       petTemplate.find('.pet-location').text(data[i].location);
    //       petTemplate.find('.btn-adopt').attr('data-id', data[i].id);
  
    //       petsRow.append(petTemplate.html());
    //     }
    //   });
  
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
      $.getJSON('ProjectOffice.json', function(data) {
        // Get the necessary contract artifact file and instantiate it with @truffle/contract
        var ProjectOfficeArtifact = data;
        App.contracts.ProjectOffice = TruffleContract(ProjectOfficeArtifact);
  
        // Set the provider for our contract
        App.contracts.ProjectOffice.setProvider(App.web3Provider);
  
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
  
      var projectOfficeInstance;
  
      web3.eth.getAccounts(function(error, accounts) {
        if (error) {
          console.log(error);
        }
  
        var account = accounts[0];
        
        App.contracts.ProjectOffice.deployed().then(function(instance) {
            projectOfficeInstance = instance;
            var battery = $("#battery").val()
            var column = $("#column").val()
            var elevator = $("#elevator").val()
            var floor = $("#floor").val()
          // Execute adopt as a transaction by sending account
            console.log(projectOfficeInstance)
            address = projectOfficeInstance.address.toString();
            var data = {
                address: address,
                contract: "ProjectOffice"
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
          return projectOfficeInstance.placeNewOrder(battery, column, elevator, floor, {from: account});
        }).then(function(result) {
        //   return App.markAdopted();
            console.log("Success");
        }).catch(function(err) {
          console.log(err.message);
        });
      });
  
    }
  
  };
  
//   $(function() {
//     $(window).load(function() {
//       App.init();
//     });
//   });