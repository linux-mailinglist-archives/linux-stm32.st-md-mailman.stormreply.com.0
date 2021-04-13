Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932135E527
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 19:40:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2824C57B78;
	Tue, 13 Apr 2021 17:40:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58FE7C57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 17:40:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DHWjhg029971; Tue, 13 Apr 2021 19:40:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=WVmHBLOEqQLsN3slXuOeeS0dh0JFTB6Rgs+D02bF5a0=;
 b=78yK8p/Mq+2SWIjG3a45DBzgYXpaoXwOGO0dlwVM4lvfS96J/O95z1X3lgahYuk38e7i
 WtU0widxjs/W+i23RMEWCNn2WrWQ6FT7D9NG92hp8ht0WSovzez7qnqA1giWM81lV62X
 5vliWJyfxLZM4uib8F38kjRpOHGKWUon50g7AHb6cf6v4waIV+FG5fvxsDp3xZowP6Eu
 7MisbMjLvOBO4g9n7EnQi37JJ49kBKU7ueeCRvSKhwYwZ8mbnMlwWwIj6/B8tH/3RX45
 Pdy+tra8w2yCdhpNGZ/RR5cpifMdXcS+/pSnooCM3gihzmyAIutMLHofoZVBT3+P4KAZ Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp5f39k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:40:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68CD710002A;
 Tue, 13 Apr 2021 19:40:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B6E02159E9;
 Tue, 13 Apr 2021 19:40:23 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 19:40:22
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 13 Apr 2021 19:40:15 +0200
Message-ID: <20210413174015.23011-5-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413174015.23011-1-erwan.leray@foss.st.com>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] serial: stm32: add FIFO threshold
	configuration
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

From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Add the support for two optional DT properties, to configure RX and TX
FIFO thresholds:
- rx-threshold
- tx-threshold
This replaces hard-coded 8 bytes threshold. Keep 8 as the default value if
not specified, for backward compatibility.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

Changes in v2:
Change added properties naming as proposed by Rob Herring.

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 4d277804c63e..409cfd15a933 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -312,7 +312,7 @@ static void stm32_usart_tx_interrupt_enable(struct uart_port *port)
 	 * Enables TX FIFO threashold irq when FIFO is enabled,
 	 * or TX empty irq when FIFO is disabled
 	 */
-	if (stm32_port->fifoen)
+	if (stm32_port->fifoen && stm32_port->txftcfg >= 0)
 		stm32_usart_set_bits(port, ofs->cr3, USART_CR3_TXFTIE);
 	else
 		stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
@@ -323,7 +323,7 @@ static void stm32_usart_tx_interrupt_disable(struct uart_port *port)
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 
-	if (stm32_port->fifoen)
+	if (stm32_port->fifoen && stm32_port->txftcfg >= 0)
 		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_TXFTIE);
 	else
 		stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TXEIE);
@@ -801,9 +801,10 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
 	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTIE;
 	if (stm32_port->fifoen) {
-		cr3 &= ~(USART_CR3_TXFTCFG_MASK | USART_CR3_RXFTCFG_MASK);
-		cr3 |= USART_CR3_TXFTCFG_HALF << USART_CR3_TXFTCFG_SHIFT;
-		cr3 |= USART_CR3_RXFTCFG_HALF << USART_CR3_RXFTCFG_SHIFT;
+		if (stm32_port->txftcfg >= 0)
+			cr3 |= stm32_port->txftcfg << USART_CR3_TXFTCFG_SHIFT;
+		if (stm32_port->rxftcfg >= 0)
+			cr3 |= stm32_port->rxftcfg << USART_CR3_RXFTCFG_SHIFT;
 	}
 
 	if (cflag & CSTOPB)
@@ -833,7 +834,8 @@ static void stm32_usart_set_termios(struct uart_port *port,
 			, bits);
 
 	if (ofs->rtor != UNDEF_REG && (stm32_port->rx_ch ||
-				       stm32_port->fifoen)) {
+				       (stm32_port->fifoen &&
+					stm32_port->rxftcfg >= 0))) {
 		if (cflag & CSTOPB)
 			bits = bits + 3; /* 1 start bit + 2 stop bits */
 		else
@@ -1021,6 +1023,39 @@ static const struct uart_ops stm32_uart_ops = {
 	.verify_port	= stm32_usart_verify_port,
 };
 
+/*
+ * STM32H7 RX & TX FIFO threshold configuration (CR3 RXFTCFG / TXFTCFG)
+ * Note: 1 isn't a valid value in RXFTCFG / TXFTCFG. In this case,
+ * RXNEIE / TXEIE can be used instead of threshold irqs: RXFTIE / TXFTIE.
+ * So, RXFTCFG / TXFTCFG bitfields values are encoded as array index + 1.
+ */
+static const u32 stm32h7_usart_fifo_thresh_cfg[] = { 1, 2, 4, 8, 12, 14, 16 };
+
+static void stm32_usart_get_ftcfg(struct platform_device *pdev, const char *p,
+				  int *ftcfg)
+{
+	u32 bytes, i;
+
+	/* DT option to get RX & TX FIFO threshold (default to 8 bytes) */
+	if (of_property_read_u32(pdev->dev.of_node, p, &bytes))
+		bytes = 8;
+
+	for (i = 0; i < ARRAY_SIZE(stm32h7_usart_fifo_thresh_cfg); i++)
+		if (stm32h7_usart_fifo_thresh_cfg[i] >= bytes)
+			break;
+	if (i >= ARRAY_SIZE(stm32h7_usart_fifo_thresh_cfg))
+		i = ARRAY_SIZE(stm32h7_usart_fifo_thresh_cfg) - 1;
+
+	dev_dbg(&pdev->dev, "%s set to %d bytes\n", p,
+		stm32h7_usart_fifo_thresh_cfg[i]);
+
+	/* Provide FIFO threshold ftcfg (1 is invalid: threshold irq unused) */
+	if (i)
+		*ftcfg = i - 1;
+	else
+		*ftcfg = -EINVAL;
+}
+
 static void stm32_usart_deinit_port(struct stm32_port *stm32port)
 {
 	clk_disable_unprepare(stm32port->clk);
@@ -1057,6 +1092,12 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 		of_property_read_bool(pdev->dev.of_node, "rx-tx-swap");
 
 	stm32port->fifoen = stm32port->info->cfg.has_fifo;
+	if (stm32port->fifoen) {
+		stm32_usart_get_ftcfg(pdev, "rx-threshold",
+				      &stm32port->rxftcfg);
+		stm32_usart_get_ftcfg(pdev, "tx-threshold",
+				      &stm32port->txftcfg);
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	port->membase = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index 77d1ac082e89..07ac291328cd 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -216,12 +216,6 @@ struct stm32_usart_info stm32h7_info = {
 #define USART_CR3_TXFTCFG_MASK	GENMASK(31, 29)	/* H7 */
 #define USART_CR3_TXFTCFG_SHIFT	29		/* H7 */
 
-/* TX FIFO threashold set to half of its depth */
-#define USART_CR3_TXFTCFG_HALF	0x2
-
-/* RX FIFO threashold set to half of its depth */
-#define USART_CR3_RXFTCFG_HALF	0x2
-
 /* USART_GTPR */
 #define USART_GTPR_PSC_MASK	GENMASK(7, 0)
 #define USART_GTPR_GT_MASK	GENMASK(15, 8)
@@ -273,6 +267,8 @@ struct stm32_port {
 	bool hw_flow_control;
 	bool swap;		 /* swap RX & TX pins */
 	bool fifoen;
+	int rxftcfg;		/* RX FIFO threshold CFG      */
+	int txftcfg;		/* TX FIFO threshold CFG      */
 	bool wakeup_src;
 	int rdr_mask;		/* receive data register mask */
 	struct mctrl_gpios *gpios; /* modem control gpios */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
