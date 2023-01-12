Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DE667D5F
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 19:04:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 115CFC65E45;
	Thu, 12 Jan 2023 18:04:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4954C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 18:04:33 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8963780843;
 Thu, 12 Jan 2023 19:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673546673;
 bh=LY8zeDGIcc0ctkllZLygcIDVXASvLv/Jzl3fwjZ8kX0=;
 h=From:To:Cc:Subject:Date:From;
 b=beUidXohGO+sBv5i+2JRRvnVVQ6vTRuLRyhX2rPGF2oG7y48dhXeMNedOTu+rck/y
 TgHgOKO2C8bsW7JHp3elIy6YXeh3C4EhaoKsSSFp+V7sDde0iA5YTiDiTBAG2uxKk/
 E8vE9I1AADQM/GebLG1XNocM9rPW61pptSBHiy8yJMKM7QNtyQaUSjr352plCP/V88
 nsTyuQOSNcTfPkN2wMgF+CdmlM/UC2282ZHYSRisqVAn4nH/iCh7fXPBZ7Yl19WlUj
 5MD3Uw6V7BRdK7ndt84An5SXWz4WDgFDOQN1VT+R1nZbH7lLtw2SruSt4NnT84MR5T
 FmYBWP2mKyrAw==
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Thu, 12 Jan 2023 19:04:17 +0100
Message-Id: <20230112180417.25595-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5] serial: stm32: Merge hard IRQ and threaded
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

Requesting an interrupt with IRQF_ONESHOT will run the primary handler
in the hard-IRQ context even in the force-threaded mode. The
force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
sleeping locks (spinlock_t) in hard-IRQ context. This combination
makes it impossible and leads to "sleeping while atomic" warnings.

Use one interrupt handler for both handlers (primary and secondary)
and drop the IRQF_ONESHOT flag which is not needed.

Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Tested-by: Valentin Caron <valentin.caron@foss.st.com> # V3
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: stable@vger.kernel.org
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
V3: - Update the commit message per suggestion from Sebastian
    - Add RB from Sebastian
    - Add Fixes tag
V4: - Remove uart_console() deadlock check from
      stm32_usart_of_dma_rx_probe()
    - Use plain spin_lock()/spin_unlock() instead of the
      _irqsave/_irqrestore variants in IRQ handler
    - Add TB from Valentin
V5: - Add CC stable@
    - Do not move the sr variable, removes one useless hunk from the patch
---
 drivers/tty/serial/stm32-usart.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index a1490033aa164..1e24bee2b0ef7 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -797,23 +797,9 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 		spin_unlock(&port->lock);
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
-		spin_lock_irqsave(&port->lock, flags);
+	if (stm32_usart_rx_dma_enabled(port) && !stm32_port->throttled) {
+		spin_lock(&port->lock);
 		size = stm32_usart_receive_chars(port, false);
 		uart_unlock_and_check_sysrq_irqrestore(port, flags);
 		if (size)
@@ -1015,10 +1001,8 @@ static int stm32_usart_startup(struct uart_port *port)
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
 
@@ -1601,13 +1585,6 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 	struct dma_slave_config config;
 	int ret;
 
-	/*
-	 * Using DMA and threaded handler for the console could lead to
-	 * deadlocks.
-	 */
-	if (uart_console(port))
-		return -ENODEV;
-
 	stm32port->rx_buf = dma_alloc_coherent(dev, RX_BUF_L,
 					       &stm32port->rx_dma_buf,
 					       GFP_KERNEL);
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
