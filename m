Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4D2EC108
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 17:22:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE38C5718D;
	Wed,  6 Jan 2021 16:22:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B39FC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 16:22:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106GHLA0012027; Wed, 6 Jan 2021 17:22:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CHpNSWEz7IxlEunBAvqrckY+hacS/RfitpwbipXC5us=;
 b=qmjOZKyBdLyzpEPKikGpwj9Fs/GvWp8+ouCKOIgPJuDOsw+3xxNjRTABKnVWd4CTl5Kj
 JBvaqBgzOVS4kMyESKrp8n+KR5lEMFGpCI7+Dgekvth9yOXzgVo+G7kd4nazJYFgMM7i
 NIHot8+j5U6Y+HhLNYGTsySy98C3m+HgcqqKLWqP78BGNCtpt+8ddIppiaSIDrqpDQMY
 LwTRx7LPEVM2OzZFO6QQwzl/5jqmj6gvt/QOSKAjnpIhK2lBR/u2Jk686/zZStOiqiUM
 ZDcXGhL6jGMOL9RwGi1f0t/jDv5x7JOIVO1U55W+urFx3gKFgb7CZlheG0dKQ1CE3j3m ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf6740ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 17:22:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FC99100034;
 Wed,  6 Jan 2021 17:22:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52BD92A4D9E;
 Wed,  6 Jan 2021 17:22:42 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan 2021 17:22:41
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 6 Jan 2021 17:21:57 +0100
Message-ID: <20210106162203.28854-3-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106162203.28854-1-erwan.leray@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_09:2021-01-06,
 2021-01-06 signatures=0
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/8] serial: stm32: fix code cleaning
	warnings and checks
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

Fixes checkpatch --strict warnings and checks:
- checkpatch --strict "Unnecessary parentheses"
- checkpatch --strict "Blank lines aren't necessary before a close brace
- checkpatch --strict "Alignment should match open parenthesis"
- checkpatch --strict "Please don't use multiple blank lines"
- checkpatch --strict "Comparison to NULL could be written ..."
- visual check code ordering warning

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 6248304a001f..a0ef86d71317 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -176,8 +176,7 @@ static int stm32_pending_rx(struct uart_port *port, u32 *sr, int *last_res,
 		status = dmaengine_tx_status(stm32_port->rx_ch,
 					     stm32_port->rx_ch->cookie,
 					     &state);
-		if ((status == DMA_IN_PROGRESS) &&
-		    (*last_res != state.residue))
+		if (status == DMA_IN_PROGRESS && (*last_res != state.residue))
 			return 1;
 		else
 			return 0;
@@ -464,7 +463,7 @@ static irqreturn_t stm32_interrupt(int irq, void *ptr)
 		writel_relaxed(USART_ICR_RTOCF,
 			       port->membase + ofs->icr);
 
-	if ((sr & USART_SR_WUF) && (ofs->icr != UNDEF_REG))
+	if ((sr & USART_SR_WUF) && ofs->icr != UNDEF_REG)
 		writel_relaxed(USART_ICR_WUCF,
 			       port->membase + ofs->icr);
 
@@ -620,7 +619,6 @@ static void stm32_stop_rx(struct uart_port *port)
 	stm32_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
 	if (stm32_port->cr3_irq)
 		stm32_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
-
 }
 
 /* Handle breaks - ignored by us */
@@ -724,7 +722,7 @@ static unsigned int stm32_get_databits(struct ktermios *termios)
 }
 
 static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
-			    struct ktermios *old)
+			      struct ktermios *old)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
@@ -923,7 +921,7 @@ stm32_verify_port(struct uart_port *port, struct serial_struct *ser)
 }
 
 static void stm32_pm(struct uart_port *port, unsigned int state,
-		unsigned int oldstate)
+		     unsigned int oldstate)
 {
 	struct stm32_port *stm32port = container_of(port,
 			struct stm32_port, port);
@@ -973,18 +971,17 @@ static int stm32_init_port(struct stm32_port *stm32port,
 	struct resource *res;
 	int ret;
 
+	ret = platform_get_irq(pdev, 0);
+	if (ret <= 0)
+		return ret ? : -ENODEV;
+
 	port->iotype	= UPIO_MEM;
 	port->flags	= UPF_BOOT_AUTOCONF;
 	port->ops	= &stm32_uart_ops;
 	port->dev	= &pdev->dev;
 	port->fifosize	= stm32port->info->cfg.fifosize;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_STM32_CONSOLE);
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0)
-		return ret ? : -ENODEV;
 	port->irq = ret;
-
 	port->rs485_config = stm32_config_rs485;
 
 	ret = stm32_init_rs485(port, pdev);
@@ -1101,8 +1098,8 @@ static int stm32_of_dma_rx_probe(struct stm32_port *stm32port,
 		return -ENODEV;
 	}
 	stm32port->rx_buf = dma_alloc_coherent(&pdev->dev, RX_BUF_L,
-						 &stm32port->rx_dma_buf,
-						 GFP_KERNEL);
+					       &stm32port->rx_dma_buf,
+					       GFP_KERNEL);
 	if (!stm32port->rx_buf) {
 		ret = -ENOMEM;
 		goto alloc_err;
@@ -1177,8 +1174,8 @@ static int stm32_of_dma_tx_probe(struct stm32_port *stm32port,
 		return -ENODEV;
 	}
 	stm32port->tx_buf = dma_alloc_coherent(&pdev->dev, TX_BUF_L,
-						 &stm32port->tx_dma_buf,
-						 GFP_KERNEL);
+					       &stm32port->tx_dma_buf,
+					       GFP_KERNEL);
 	if (!stm32port->tx_buf) {
 		ret = -ENOMEM;
 		goto alloc_err;
@@ -1322,7 +1319,6 @@ static int stm32_serial_remove(struct platform_device *pdev)
 	return err;
 }
 
-
 #ifdef CONFIG_SERIAL_STM32_CONSOLE
 static void stm32_console_putchar(struct uart_port *port, int ch)
 {
@@ -1335,7 +1331,8 @@ static void stm32_console_putchar(struct uart_port *port, int ch)
 	writel_relaxed(ch, port->membase + ofs->tdr);
 }
 
-static void stm32_console_write(struct console *co, const char *s, unsigned cnt)
+static void stm32_console_write(struct console *co, const char *s,
+				unsigned int cnt)
 {
 	struct uart_port *port = &stm32_ports[co->index].port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
@@ -1388,7 +1385,7 @@ static int stm32_console_setup(struct console *co, char *options)
 	 * this to be called during the uart port registration when the
 	 * driver gets probed and the port should be mapped at that point.
 	 */
-	if (stm32port->port.mapbase == 0 || stm32port->port.membase == NULL)
+	if (stm32port->port.mapbase == 0 || !stm32port->port.membase)
 		return -ENXIO;
 
 	if (options)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
