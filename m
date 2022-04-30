Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A11515F37
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Apr 2022 18:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11C8DC60494;
	Sat, 30 Apr 2022 16:28:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A309BC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Apr 2022 16:28:52 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E8B28818A3;
 Sat, 30 Apr 2022 18:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651336132;
 bh=rvfDjyFjOBd+WPPBrIAUo142QMIenhiSTqBD2/hl6rk=;
 h=From:To:Cc:Subject:Date:From;
 b=oULBikiEicXc/K386OqLwD17VzSeF/oqmuolYuLpZFfyHVzdzj7UF0eoGV0Rq504Z
 bz3kzJ2lCRQ35lh7sf/l/4xAUKCzsCpVZxjPFc1ITMxOo0K5P0rkXDDNxqJgky0r6Q
 b/xcjCUDcvyFUqOafb013/6Ww1RU+CqWHTts69xjR0zlWH5Un5xT42UxAw5AbZy55Y
 PJkUZiUUX7MESFEpA5/FtZfjgh68i9O28viMi4l+SEPofQCLoAc3XbC6mGAGKhD/Ta
 MA79M57+8ck1OJ+EAEH8S9xpt7G1bNmJZeKfzDRvg8XMUdJdXJX0eQ/HI2UNDYSJZO
 3wG1UH9c394ag==
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Sat, 30 Apr 2022 18:28:44 +0200
Message-Id: <20220430162845.244655-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] serial: stm32: Factor out GPIO RTS
	toggling into separate function
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

Pull out the GPIO RTS enable and disable handling into separate function.
Limit the scope of GPIO RTS toggling only to GPIO emulated RS485 too.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Erwan Le Ray <erwan.leray@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-serial@vger.kernel.org
---
 drivers/tty/serial/stm32-usart.c | 59 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index f75691e727295..224f359c6051e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -442,6 +442,42 @@ static void stm32_usart_tx_interrupt_disable(struct uart_port *port)
 		stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TXEIE);
 }
 
+static void stm32_usart_rs485_rts_enable(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	struct serial_rs485 *rs485conf = &port->rs485;
+
+	if (stm32_port->hw_flow_control ||
+	    !(rs485conf->flags & SER_RS485_ENABLED))
+		return;
+
+	if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
+		mctrl_gpio_set(stm32_port->gpios,
+			       stm32_port->port.mctrl | TIOCM_RTS);
+	} else {
+		mctrl_gpio_set(stm32_port->gpios,
+			       stm32_port->port.mctrl & ~TIOCM_RTS);
+	}
+}
+
+static void stm32_usart_rs485_rts_disable(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	struct serial_rs485 *rs485conf = &port->rs485;
+
+	if (stm32_port->hw_flow_control ||
+	    !(rs485conf->flags & SER_RS485_ENABLED))
+		return;
+
+	if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
+		mctrl_gpio_set(stm32_port->gpios,
+			       stm32_port->port.mctrl & ~TIOCM_RTS);
+	} else {
+		mctrl_gpio_set(stm32_port->gpios,
+			       stm32_port->port.mctrl | TIOCM_RTS);
+	}
+}
+
 static void stm32_usart_transmit_chars_pio(struct uart_port *port)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
@@ -713,43 +749,24 @@ static void stm32_usart_disable_ms(struct uart_port *port)
 static void stm32_usart_stop_tx(struct uart_port *port)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
-	struct serial_rs485 *rs485conf = &port->rs485;
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 
 	stm32_usart_tx_interrupt_disable(port);
 	if (stm32_usart_tx_dma_started(stm32_port) && stm32_usart_tx_dma_enabled(stm32_port))
 		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
 
-	if (rs485conf->flags & SER_RS485_ENABLED) {
-		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
-			mctrl_gpio_set(stm32_port->gpios,
-					stm32_port->port.mctrl & ~TIOCM_RTS);
-		} else {
-			mctrl_gpio_set(stm32_port->gpios,
-					stm32_port->port.mctrl | TIOCM_RTS);
-		}
-	}
+	stm32_usart_rs485_rts_disable(port);
 }
 
 /* There are probably characters waiting to be transmitted. */
 static void stm32_usart_start_tx(struct uart_port *port)
 {
-	struct stm32_port *stm32_port = to_stm32_port(port);
-	struct serial_rs485 *rs485conf = &port->rs485;
 	struct circ_buf *xmit = &port->state->xmit;
 
 	if (uart_circ_empty(xmit) && !port->x_char)
 		return;
 
-	if (rs485conf->flags & SER_RS485_ENABLED) {
-		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
-			mctrl_gpio_set(stm32_port->gpios,
-					stm32_port->port.mctrl | TIOCM_RTS);
-		} else {
-			mctrl_gpio_set(stm32_port->gpios,
-					stm32_port->port.mctrl & ~TIOCM_RTS);
-		}
-	}
+	stm32_usart_rs485_rts_enable(port);
 
 	stm32_usart_transmit_chars(port);
 }
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
