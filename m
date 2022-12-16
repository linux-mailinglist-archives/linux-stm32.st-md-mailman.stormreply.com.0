Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129E64E5E2
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 03:15:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B518DC65E46;
	Fri, 16 Dec 2022 02:15:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD44C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 02:15:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0F24E85355;
 Fri, 16 Dec 2022 03:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671156919;
 bh=M8vPbjQ3YMPwUgFkpSq6OCRPBEm1j3hvplwfk3163Po=;
 h=From:To:Cc:Subject:Date:From;
 b=cMvN9mCb+q+PpHJD+a/7zMTVMeWM+wbYl70rgttEWQ89mSYpdMbzMIPPhY1F9Z/mY
 IpAAUpTe6X4t+3tnOYeLXnJpO8JAJvtPGxnT/VF2fVlu3C9fK67qIYF9MOTpVnpEVW
 nwuCS29ABChCs154bU4YAxLE8DJrrUJASxXE7HijKucKwwA2QAPoWS3bl1t9yO+S8H
 1ymZ5G2M0mKPrwmCOfNQfqScnvBFxLIJV0qc0q6iP9WQvdicO1bX1W+caAhMTy48oo
 vpNwPYrDXNwBatfEbdm5mxyXp1KDGECYrFZdQcjJleJtM7qZuIouAwgVjgCHFV01ec
 lnckZQGtTph8Q==
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Fri, 16 Dec 2022 03:15:04 +0100
Message-Id: <20221216021504.457699-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] serial: stm32: Merge hard IRQ and threaded
	IRQ handling into single IRQ handler
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Avoid locking in hard interrupt context, move the entirety of hard IRQ
context code into single IRQ handler, preempt-rt would move the handler
into thread. This fixes the following splat with preempt-rt enabled:

 BUG: scheduling while atomic: (mount)/1289/0x00010001
 Modules linked in:
 Preemption disabled at:
 [<c0119127>] irq_enter_rcu+0xb/0x42
 CPU: 0 PID: 1289 Comm: (mount) Not tainted 6.1.0-rc7-rt5-stable-standard-00006-gd70aeccb9f0f #17
 Hardware name: STM32 (Device Tree Support)
  unwind_backtrace from show_stack+0xb/0xc
  show_stack from dump_stack_lvl+0x2b/0x34
  dump_stack_lvl from __schedule_bug+0x53/0x80
  __schedule_bug from __schedule+0x47/0x404
  __schedule from schedule_rtlock+0x15/0x34
  schedule_rtlock from rtlock_slowlock_locked+0x1d7/0x57e
  rtlock_slowlock_locked from rt_spin_lock+0x29/0x3c
  rt_spin_lock from stm32_usart_interrupt+0xa9/0x110
  stm32_usart_interrupt from __handle_irq_event_percpu+0x73/0x14e
  __handle_irq_event_percpu from handle_irq_event_percpu+0x9/0x22
  handle_irq_event_percpu from handle_irq_event+0x53/0x76
  handle_irq_event from handle_fasteoi_irq+0x65/0xa8
  handle_fasteoi_irq from handle_irq_desc+0xf/0x18
  handle_irq_desc from gic_handle_irq+0x45/0x54
  gic_handle_irq from generic_handle_arch_irq+0x19/0x2c
  generic_handle_arch_irq from call_with_stack+0xd/0x10

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Erwan Le Ray <erwan.leray@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-serial@vger.kernel.org
---
V2: - Update patch subject, was:
      serial: stm32: Move hard IRQ handling to threaded interrupt context
    - Use request_irq() instead, rename the IRQ handler function
---
 drivers/tty/serial/stm32-usart.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index dfdbcf092facc..bbbab8dc2bfa9 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -752,8 +752,9 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	struct tty_port *tport = &port->state->port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
-	u32 sr;
+	unsigned long flags;
 	unsigned int size;
+	u32 sr;
 
 	sr = readl_relaxed(port->membase + ofs->isr);
 
@@ -793,27 +794,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	}
 
 	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
-		spin_lock(&port->lock);
+		spin_lock_irqsave(&port->lock, flags);
 		stm32_usart_transmit_chars(port);
-		spin_unlock(&port->lock);
+		spin_unlock_irqrestore(&port->lock, flags);
 	}
 
-	if (stm32_usart_rx_dma_enabled(port))
-		return IRQ_WAKE_THREAD;
-	else
-		return IRQ_HANDLED;
-}
-
-static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
-{
-	struct uart_port *port = ptr;
-	struct tty_port *tport = &port->state->port;
-	struct stm32_port *stm32_port = to_stm32_port(port);
-	unsigned int size;
-	unsigned long flags;
-
 	/* Receiver timeout irq for DMA RX */
-	if (!stm32_port->throttled) {
+	if (stm32_usart_rx_dma_enabled(port) && !stm32_port->throttled) {
 		spin_lock_irqsave(&port->lock, flags);
 		size = stm32_usart_receive_chars(port, false);
 		uart_unlock_and_check_sysrq_irqrestore(port, flags);
@@ -1016,10 +1003,8 @@ static int stm32_usart_startup(struct uart_port *port)
 	u32 val;
 	int ret;
 
-	ret = request_threaded_irq(port->irq, stm32_usart_interrupt,
-				   stm32_usart_threaded_interrupt,
-				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
-				   name, port);
+	ret = request_irq(port->irq, stm32_usart_interrupt,
+			  IRQF_NO_SUSPEND, name, port);
 	if (ret)
 		return ret;
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
