function getUsersAgeGroupHorizantalBar(ageGroupUsers) {
      let usersBar = document.getElementById('registered-users-horizantal-bar').getContext('2d');
  		console.log(ageGroupUsers);
		let horizontalBar = new Chart(usersBar, {
        type:'horizontalBar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
        data:{
          labels:['18-22', '23-27', '28-32', '33-37', '38-42', 'Over 42','Below 18'],
          datasets:[{
            label:'Age Group',
            data:ageGroupUsers,
            backgroundColor:'orange',
            borderWidth:1
          }]
        },
        options:{
          title:{
            display:false
          },
          legend:{
            display:false,
          },
          layout:{
            padding:0
          },
          tooltips:{
            enabled:true
          }
        }
      });
}


function getUserRegistrationGraph(registedUsersLabel,numberOfUsersRegisteredValues) {
    const registeredMonths = registedUsersLabel;
    const registeredUserDataLabel = registeredMonths.substring(1,registeredMonths.length-1).split(',');
    let allRegistrationsData = document.getElementById("registrations-graph").getContext('2d');
    let registrationsGraph = new Chart(allRegistrationsData, {
        type: 'line',
        data: {
            labels: registeredUserDataLabel,
            datasets: [{
                label: ' Users ',
                data: numberOfUsersRegisteredValues,
                fill: false,
                borderWidth: 2,
                pointRadius: 3,
                pointHoverRadius: 5,
                borderColor: '#45aeef',
                backgroundColor: '#fff',
            }]
        },
        options: {
            responsive: true,
            legend: {
                display: false,
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: false,
                        labelString: ''
                    },
                    gridLines: {
                        display: false
                    }
                }],
                yAxes: [{
                    type: "linear",
                    display: true,
                    stacked: true,
                    scaleLabel: {
                        display: false,
                        labelString: ''
                    },
                    gridLines: {
                        color: '#eff3f6',
                        drawBorder: false
                    },
                    label: {
                        show: true
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}