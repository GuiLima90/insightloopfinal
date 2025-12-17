import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "messages", "input"]

  connect() {
    this.open = false
  }

  toggle() {
    this.open = !this.open
    this.panelTarget.classList.toggle("is-open", this.open)
    this.panelTarget.setAttribute("aria-hidden", (!this.open).toString())

    if (this.open) setTimeout(() => this.inputTarget.focus(), 50)
  }

  send(e) {
    e.preventDefault()
    const text = (this.inputTarget.value || "").trim()
    if (!text) return

    this.appendBubble("user", text)
    this.inputTarget.value = ""

    const loadingId = this.appendBubble("assistant", "Thinking…", true)

    setTimeout(() => {
      this.removeBubble(loadingId)
      this.appendBubble("assistant", this.mockReply(text))
    }, 700)
  }

  appendBubble(role, text, isLoading = false) {
    const id = `m_${Date.now()}_${Math.floor(Math.random() * 9999)}`
    const div = document.createElement("div")
    div.className = `ai-bubble ai-bubble--${role}` + (isLoading ? " is-loading" : "")
    div.dataset.messageId = id
    div.textContent = text
    this.messagesTarget.appendChild(div)
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
    return id
  }

  removeBubble(id) {
    const el = this.messagesTarget.querySelector(`[data-message-id="${id}"]`)
    if (el) el.remove()
  }

  mockReply(text) {
    const t = text.toLowerCase()
    if (t.includes("pareto") || t.includes("80")) return "Posso te explicar o Pareto e como identificar as tags que mais puxam volume."
    if (t.includes("tend") || t.includes("trend")) return "Para tendência, eu compararia últimos 7/14/30 dias e olharia variação por bucket."
    return "Entendi. Quando o backend chegar, vou responder usando suas conversas e classificações — por enquanto estou mockando pra validar UX."
  }
}
