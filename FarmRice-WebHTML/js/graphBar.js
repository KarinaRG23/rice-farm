var xValues = [1998, 1999, 2000, 2001, 2003];
var yValues = [55, 49, 44, 24, 15];
var barColors = ["red", "green", "blue", "orange", "brown"];

var myChart = new Chart("myChartBar", {
    type: "bar",
    data: {
        labels: xValues,
        datasets: [{
            backgroundColor: barColors,
            data: yValues,
            barThickness: 25,
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: "Profit"
        }
    }
});