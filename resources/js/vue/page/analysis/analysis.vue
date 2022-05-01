<template>
  <div class="container">
    <h1 class="text-center">วิเคราะห์และสรุปผล</h1>
    <div class="card shadow p-3">
      <div class="row card-body">
        <div class="col-12 graph">
          <div class="filter text-end">
            <div class="btn btn-primary mx-2" @click="filterOrder()">
              จำนวนรายการสั่งซื้อ
            </div>
            <div class="btn btn-primary mx-2" @click="filterCost()">
              จำนวนยอดขาย
            </div>
          </div>
          <canvas
            ref="canvas"
            id="chart"
            :chart-data="datachart"
          ></canvas>
        </div>
        <hr />
        <div
          class="
            col-lg-6 col-md-6 col-sm-12 col-12
            m-0
            mb-2
            filter-analysis-bar
            my-0
          "
        >
          <div class="row">
            <h5>ประเภทการแบ่ง :</h5>
          </div>

          <button class="btn btn-primary" @click="typeDay()">
            <b>D</b> แบ่งตามวัน
          </button>
          <button class="btn btn-primary" @click="typeMonth()">
            <b>M</b> แบ่งตามเดือน
          </button>
          <button class="btn btn-primary" @click="typeYear()">
            <b>Y</b> แบ่งตามปี
          </button>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6 filter-analysis-bar">
          <v-date-picker
            mode="date"
            :masks="masks"
            v-model="start_date"
            :timezone="timezone"
          >
            <template #default="{ inputValue, inputEvents }">
              <label><h5 class="mr-2">เริ่มต้น</h5></label>
              <input
                class="col-12 px-2 py-1 border rounded"
                :value="inputValue"
                v-on="inputEvents"
              />
            </template>
          </v-date-picker>
          <!-- <datepicker
            placeholder="เริ่มต้น"
            v-model="start_date"
            :minimum-view="type_date"
            :maximum-view="type_date"
            @selected="start_date_selected = true"
          ></datepicker> -->
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6 filter-analysis-bar">
          <v-date-picker
            mode="date"
            :masks="masks"
            v-model="end_date"
            :timezone="timezone"
          >
            <template #default="{ inputValue, inputEvents }">
              <label><h5 class="mr-2">สิ้นสุด</h5></label>
              <input
                class="col-12 px-2 py-1 border rounded"
                :value="inputValue"
                v-on="inputEvents"
              />
            </template>
          </v-date-picker>
          <!-- <datepicker
            placeholder="สิ้นสุด"
            v-model="end_date"
            :minimum-view="type_date"
            :maximum-view="type_date"
            @selected="end_date_selected = true"
          ></datepicker> -->
        </div>
        <div class="col-12 mt-3 filter-analysis-bar text-end">
          <div class="btn btn-primary" @click="submitDateToAnalysis()">
            <i class="fas fa-chart-bar fs-3"></i> ประมวลผล
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Datepicker from "vuejs3-datepicker";
import Chart from "chart.js/auto";
export default {
  components: {
    Datepicker,
    Chart,
  },
  data: function () {
    return {
      side_bar: true,
      dataAnalysis: {},
      type_date: "day",
      start_date_selected: false,
      start_date: new Date(),
      end_date_selected: false,
      end_date: new Date(),
      first_chart: true,
      body: {
        filter: "order",
        type: "day",
        start_date: "2022-03-20",
        end_date: "",
      },
      chart: undefined,
      datachart: {
        type: "bar",
        data: {
          labels: [],
          datasets: [
            {
              label: "จำนวนรายการสั่งซื้อ",
              data: [],
              backgroundColor: ["rgba(255, 99, 132, 0.2)"],
              borderColor: ["rgba(255,99,132,1)"],
              borderWidth: 3,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      },
      masks: {
        input: "D-MM-YYYY",
      },
      timezone: "",
    };
  },
  methods: {
    getDataAnalysis(body) {
      axios.post("api/analysis/get-data-analysis", body).then((response) => {
        if (response) {
          this.dataAnalysis = response.data;
          this.renderChart();
        }
      });
    },
    renderChart() {
      console.log("Chart-Component mounted.");
      var context = this.$refs.canvas.getContext("2d");
      if (!this.first_chart) {
        this.datachart.data.labels = this.dataAnalysis.labels;
        this.datachart.data.datasets[0].data = this.dataAnalysis.data;
        this.chart.destroy();
        this.chart = new Chart(context, this.datachart);
      } else {
        this.chart = new Chart(context, this.datachart);
        // console.log(this.chart);
      }
    },
    submitDateToAnalysis() {
      this.first_chart = false;
      var start = "",
        end = "";
      var date = ("0" + this.start_date.getDate()).slice(-2);
      var month = ("0" + (this.start_date.getMonth() + 1)).slice(-2);
      var year = this.start_date.getFullYear();
      if (!this.end_date) {
        if (this.type_date == "day") {
          start = String(year + "-" + month + "-" + date);
        }
        if (this.type_date == "month") {
          start = String(month);
        }
        if (this.type_date == "year") {
          start = String(year);
        }
      } else {
        var end_date = ("0" + this.end_date.getDate()).slice(-2);
        var end_month = ("0" + (this.end_date.getMonth() + 1)).slice(-2);
        var end_year = this.end_date.getFullYear();
        if (this.type_date == "day") {
          start = String(year + "-" + month + "-" + date);
          end = String(end_year + "-" + end_month + "-" + end_date);
        }
        if (this.type_date == "month") {
          start = String(month);
          end = String(end_month);
        }
        if (this.type_date == "year") {
          start = String(year);
          end = String(end_year);
        }
      }
      this.body.start_date = start;
      this.body.end_date = end;
      console.log(this.body);
      this.getDataAnalysis(this.body);
    },
    filterOrder() {
      this.body.filter = "order";
      this.start_date = new Date();
      this.end_date = new Date();
    },
    filterCost() {
      this.body.filter = "cost";
      this.start_date = new Date();
      this.end_date = new Date();
    },
    typeDay() {
      this.body.type = "day";
      this.type_date = "YYYY-MM-DD";
      this.start_date = new Date();
      this.end_date = new Date();
    },
    typeMonth() {
      this.body.type = "month";
      this.type_date = "month";
      this.start_date = new Date();
      this.end_date = new Date();
    },
    typeYear() {
      this.body.type = "year";
      this.type_date = "year";
      this.start_date = new Date();
      this.end_date = new Date();
    },
  },
  mounted() {
    this.getDataAnalysis(this.body);
  },
};
</script>
