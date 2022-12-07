Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C719B6461F3
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 20:59:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67C8FC65067;
	Wed,  7 Dec 2022 19:59:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C45BC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 19:59:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9757880077;
 Wed,  7 Dec 2022 20:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670443184;
 bh=diOPNo3NDanw1+A2lM8NqOPrWQC5XsQ3uf6wn4oIlyk=;
 h=From:To:Cc:Subject:Date:From;
 b=ATH6UsVLgl/aL5uGQ0bPdDwRifCve0saE9ZSW6Rbaw1Sidxw9bwNcUkt4DdUEJzIc
 FsiWzjSdzwILC7WCQOvJ2Q/qMCS/TF/eSnVfGtwYnUdFFqVIox7xrV4D2NAQVZ4d1u
 hYa3dcTx0NGN1AhWkBCse2mS/BHZjeglR9XEL2Sd5cjC2Pm2WIuIpjY6EmrB/FeX/o
 p+qF8O6W0qZfNppquVbHiquT/mtW2m5RbClFi0sXYmMf9YdLdg0DkJL9J/dDc+csCk
 u4dQN5RY4s1mtlhke/BL7DwjogTLjItTUaHUr2PUoXkeOVjuMVnspZMnbNOyZsq6a0
 m1H7ogs/53TuA==
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Wed,  7 Dec 2022 20:59:29 +0100
Message-Id: <20221207195929.160267-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: Move hard IRQ handling to
	threaded interrupt context
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
context code into the threaded IRQ handler. This fixes the following
splat with preempt-rt enabled:

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
Cc: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-serial@vger.kernel.org
---
 drivers/tty/serial/stm32-usart.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index a1490033aa164..f5bce0be02676 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -745,14 +745,15 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
 	}
 }
 
-static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
+static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct tty_port *tport = &port->state->port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
-	u32 sr;
+	unsigned long flags;
 	unsigned int size;
+	u32 sr;
 
 	sr = readl_relaxed(port->membase + ofs->isr);
 
@@ -792,27 +793,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
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
@@ -1015,7 +1002,7 @@ static int stm32_usart_startup(struct uart_port *port)
 	u32 val;
 	int ret;
 
-	ret = request_threaded_irq(port->irq, stm32_usart_interrupt,
+	ret = request_threaded_irq(port->irq, NULL,
 				   stm32_usart_threaded_interrupt,
 				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
 				   name, port);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
