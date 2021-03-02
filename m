Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B63330905
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:55:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94BBC58D43;
	Mon,  8 Mar 2021 07:55:57 +0000 (UTC)
Received: from ms9.eaxlabs.cz (ms9.eaxlabs.cz [147.135.177.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE438C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=DV5p333v2jKUPIpG+adysRuHr9qmQs+BdQUH7O5bVcU=; 
 b=1/GVlipD6xAf2VV4JGK4d5RrHTbw/uYOs2CAue7JLK+s6zMwQ/8O/+5XxEj5+CD6AyC2HZlO4hLOe+unnJ4pMVqKfy7DleP1RsjgRU8Ud2NNmpkue0l2ke/r5rIpLAQqoMKMYutmVqRC0XDZPtALXougjadCABKFX5wTPNhOQOc=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lH4sn-0000g6-K5; Tue, 02 Mar 2021 14:16:15 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Tue,  2 Mar 2021 14:15:58 +0100
Message-Id: <20210302131558.19375-2-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210302131558.19375-1-devik@eaxlabs.cz>
References: <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
 <20210302131558.19375-1-devik@eaxlabs.cz>
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:55:55 +0000
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v3 2/2] tty/serial: Add rx-tx-swap OF option
	to stm32-usart
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

STM32 F7/H7 usarts supports RX & TX pin swapping.
Add option to turn it on.
Tested on STM32MP157.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 drivers/tty/serial/stm32-usart.c | 11 ++++++++++-
 drivers/tty/serial/stm32-usart.h |  5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index b3675cf25a69..d390f7da1441 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -644,6 +644,12 @@ static int stm32_usart_startup(struct uart_port *port)
 	if (ret)
 		return ret;
 
+	if (stm32_port->swap) {
+		val = readl_relaxed(port->membase + ofs->cr2);
+		val |= USART_CR2_SWAP;
+		writel_relaxed(val, port->membase + ofs->cr2);
+	}
+
 	/* RX FIFO Flush */
 	if (ofs->rqr != UNDEF_REG)
 		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_RXFRQ);
@@ -758,7 +764,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	cr1 = USART_CR1_TE | USART_CR1_RE;
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
-	cr2 = 0;
+	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
 	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
 		| USART_CR3_TXFTCFG_MASK;
@@ -1006,6 +1012,9 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 			return stm32port->wakeirq ? : -ENODEV;
 	}
 
+	stm32port->swap = stm32port->info->cfg.has_swap &&
+		of_property_read_bool(pdev->dev.of_node, "rx-tx-swap");
+
 	stm32port->fifoen = stm32port->info->cfg.has_fifo;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index cb4f327c46db..bd18dd1c1bcd 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -25,6 +25,7 @@ struct stm32_usart_offsets {
 struct stm32_usart_config {
 	u8 uart_enable_bit; /* USART_CR1_UE */
 	bool has_7bits_data;
+	bool has_swap;
 	bool has_wakeup;
 	bool has_fifo;
 	int fifosize;
@@ -55,6 +56,7 @@ struct stm32_usart_info stm32f4_info = {
 	.cfg = {
 		.uart_enable_bit = 13,
 		.has_7bits_data = false,
+		.has_swap = false,
 		.fifosize = 1,
 	}
 };
@@ -76,6 +78,7 @@ struct stm32_usart_info stm32f7_info = {
 	.cfg = {
 		.uart_enable_bit = 0,
 		.has_7bits_data = true,
+		.has_swap = true,
 		.fifosize = 1,
 	}
 };
@@ -97,6 +100,7 @@ struct stm32_usart_info stm32h7_info = {
 	.cfg = {
 		.uart_enable_bit = 0,
 		.has_7bits_data = true,
+		.has_swap = true,
 		.has_wakeup = true,
 		.has_fifo = true,
 		.fifosize = 16,
@@ -271,6 +275,7 @@ struct stm32_port {
 	int last_res;
 	bool tx_dma_busy;	 /* dma tx busy               */
 	bool hw_flow_control;
+	bool swap;		 /* swap RX & TX pins */
 	bool fifoen;
 	int wakeirq;
 	int rdr_mask;		/* receive data register mask */
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
