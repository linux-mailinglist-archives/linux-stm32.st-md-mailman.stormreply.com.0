Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954434BD02
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Mar 2021 17:46:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 463DDC5719D;
	Sun, 28 Mar 2021 15:46:10 +0000 (UTC)
Received: from smtp.wifcom.cz (smtp.wifcom.cz [85.207.3.150])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48326C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=/6zusLrlarjoJKgAyXwKgpDFQJDYaG12zzl0PqOu+pE=; 
 b=iOmEVd2h2FjOysT1WCaXG7jx9rnkY3KeVovNJIBjX2mZpxw+Cj5Uf86dB1+3DC9WjWN0Is/MJBws5j09mxJD8Vh8n6ugRQEMj+hKd89CWLiRJxkO2jNUxHvf2p0jE77fwvE2A465k334/ehqCSqeR4aNdg5MFE6UqIYSNgczjxY=;
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Mar 2021 17:43:06 +0200
Message-Id: <20210328154306.22674-2-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210328154306.22674-1-devik@eaxlabs.cz>
References: <YF3tKmzX1PtlX59x@kroah.com>
 <20210328154306.22674-1-devik@eaxlabs.cz>
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Wif-ss: -1.1 (-)
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v8 2/2] tty/serial: Add rx-tx-swap OF option
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
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
v8:
  - rebase to the latest tty-next
v6:
  - add version changelog
v4:
  - delete superfluous has_swap=false
v3:
  - add has_swap to stm32_usart_info (because F4 line
    doesn't support swapping)
  - move swap variable init from stm32_usart_of_get_port
    to stm32_usart_init_port because info struct is not
    initialized in stm32_usart_of_get_port yet
  - set USART_CR2_SWAP in stm32_usart_startup too
v2:
  - change st,swap to rx-tx-swap (pointed out by Rob Herring)
  - rebase patches as suggested by Greg Kroah-Hartman
---
 drivers/tty/serial/stm32-usart.c | 11 ++++++++++-
 drivers/tty/serial/stm32-usart.h |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)
---
 drivers/tty/serial/stm32-usart.c | 11 ++++++++++-
 drivers/tty/serial/stm32-usart.h |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index cba4f4ddf164..4d277804c63e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -671,6 +671,12 @@ static int stm32_usart_startup(struct uart_port *port)
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
 		writel_relaxed(USART_RQR_RXFRQ, port->membase + ofs->rqr);
@@ -789,7 +795,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	cr1 = USART_CR1_TE | USART_CR1_RE;
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
-	cr2 = 0;
+	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;
 
 	/* Tx and RX FIFO configuration */
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
@@ -1047,6 +1053,9 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 	stm32port->wakeup_src = stm32port->info->cfg.has_wakeup &&
 		of_property_read_bool(pdev->dev.of_node, "wakeup-source");
 
+	stm32port->swap = stm32port->info->cfg.has_swap &&
+		of_property_read_bool(pdev->dev.of_node, "rx-tx-swap");
+
 	stm32port->fifoen = stm32port->info->cfg.has_fifo;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index a86773f1a4c4..77d1ac082e89 100644
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
@@ -76,6 +77,7 @@ struct stm32_usart_info stm32f7_info = {
 	.cfg = {
 		.uart_enable_bit = 0,
 		.has_7bits_data = true,
+		.has_swap = true,
 		.fifosize = 1,
 	}
 };
@@ -97,6 +99,7 @@ struct stm32_usart_info stm32h7_info = {
 	.cfg = {
 		.uart_enable_bit = 0,
 		.has_7bits_data = true,
+		.has_swap = true,
 		.has_wakeup = true,
 		.has_fifo = true,
 		.fifosize = 16,
@@ -268,6 +271,7 @@ struct stm32_port {
 	int last_res;
 	bool tx_dma_busy;	 /* dma tx busy               */
 	bool hw_flow_control;
+	bool swap;		 /* swap RX & TX pins */
 	bool fifoen;
 	bool wakeup_src;
 	int rdr_mask;		/* receive data register mask */
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
