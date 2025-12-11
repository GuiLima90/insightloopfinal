// app/javascript/controllers/volume_chart_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["canvas"]
  static values = {
    labels: Array,
    values: Array
  }

  connect() {
    if (!window.Chart) return

    const ctx = this.canvasTarget.getContext("2d")
    const labels = this.labelsValue
    const dataValues = this.valuesValue

    if (this.chart) this.chart.destroy()

    this.chart = new Chart(ctx, {
      type: "line",
      data: {
        labels: labels,
        datasets: [{
          data: dataValues,
          fill: true,
          tension: 0.4,
          borderColor: "#f04438",
          backgroundColor: "rgba(240, 68, 56, 0.10)",
          pointRadius: 0,
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          tooltip: {
            enabled: true,
            callbacks: {
              label: (context) => {
                const label = context.label || ""
                const value = context.formattedValue || "0"
                return `${label} — ${value} conversas`
              }
            }
          }
        },
        scales: {
          x: {
            grid: { display: false }
          },
          y: {
            beginAtZero: true,
            grid: { color: "rgba(0, 0, 0, 0.04)" },
            ticks: { precision: 0 }
          }
        },
        animation: {
          duration: 800,
          easing: "easeInOutQuad"
        }
      }
    })
  }

  disconnect() {
    if (this.chart) this.chart.destroy()
  }
}
