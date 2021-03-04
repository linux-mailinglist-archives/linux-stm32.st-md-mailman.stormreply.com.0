Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7004732D78F
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 17:23:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37354C58D46;
	Thu,  4 Mar 2021 16:23:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE34C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 16:23:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124GCA90000387; Thu, 4 Mar 2021 17:23:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=GZECXrVa8RezLP5xqpK3fzW5NSXQRDaLtRmdfnsYyXg=;
 b=Vi2FMz0W3P/2XdfRJGsEMFX4EVwkKZRNe6X8+lU08x1fHF63paDCJ3mHFxn2pEtzPkqd
 KZXbLVshLjjQHX2hQUMyWMvTt+T92y0ULGnXkHuUto5y1UuvaMohhK1/Mw1F7KaODXGq
 chuedxeLxAP/Ti7ebD2xgxJQtWEbXdv5wAN6sa6jWGga7FqpVyGqDDBClVPK506thRBd
 K0A5cH7YAqzg10qgnJ8cY4aUsxvZU1bR/T+Kd7kj2nQ8hHodkvpCKb3OhEIFThP12phl
 jjrpQeVGPAKXx7e0H+XdGoPJ2cu2jSjcptaJiETwcOjLukiuy4qAwnPqSkM/h8/ErIgN 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9qgk9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 17:23:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70EF310002A;
 Thu,  4 Mar 2021 17:23:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65AAD20741B;
 Thu,  4 Mar 2021 17:23:16 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 17:23:16
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 4 Mar 2021 17:23:01 +0100
Message-ID: <20210304162308.8984-7-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304162308.8984-1-erwan.leray@foss.st.com>
References: <20210304162308.8984-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/13] serial: stm32: fix wake-up flag
	handling
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

This patch fixes several issue with wake-up handling:
- the WUF irq is handled several times at wake-up
- the USART is disabled / enabled at suspend to set wake-up flag.
It can cause glitches during RX.

This patch fix those issues:
- clear wake-up flag and disable wake-up irq in WUF irq handling
- enable wake-up from low power on start bit detection at port
configuration
- Unmask the wake-up flag irq at suspend and mask it at resume

In addition, pm_wakeup_event handling is moved from receice_chars to WUF
irq handling.

Fixes: 270e5a74fe4c ("serial: stm32: add wakeup mechanism")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 370141445780..326f300dd410 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -218,9 +218,6 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
 	u32 sr;
 	char flag;
 
-	if (irqd_is_wakeup_set(irq_get_irq_data(port->irq)))
-		pm_wakeup_event(tport->tty->dev, 0);
-
 	if (threaded)
 		spin_lock_irqsave(&port->lock, flags);
 	else
@@ -463,6 +460,7 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
 static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
+	struct tty_port *tport = &port->state->port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	u32 sr;
@@ -473,9 +471,14 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 		writel_relaxed(USART_ICR_RTOCF,
 			       port->membase + ofs->icr);
 
-	if ((sr & USART_SR_WUF) && ofs->icr != UNDEF_REG)
+	if ((sr & USART_SR_WUF) && ofs->icr != UNDEF_REG) {
+		/* Clear wake up flag and disable wake up interrupt */
 		writel_relaxed(USART_ICR_WUCF,
 			       port->membase + ofs->icr);
+		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_WUFIE);
+		if (irqd_is_wakeup_set(irq_get_irq_data(port->irq)))
+			pm_wakeup_event(tport->tty->dev, 0);
+	}
 
 	if ((sr & USART_SR_RXNE) && !(stm32_port->rx_ch))
 		stm32_usart_receive_chars(port, false);
@@ -901,6 +904,12 @@ static void stm32_usart_set_termios(struct uart_port *port,
 		cr1 &= ~(USART_CR1_DEDT_MASK | USART_CR1_DEAT_MASK);
 	}
 
+	/* Configure wake up from low power on start bit detection */
+	if (stm32_port->wakeirq > 0) {
+		cr3 &= ~USART_CR3_WUS_MASK;
+		cr3 |= USART_CR3_WUS_START_BIT;
+	}
+
 	writel_relaxed(cr3, port->membase + ofs->cr3);
 	writel_relaxed(cr2, port->membase + ofs->cr2);
 	writel_relaxed(cr1, port->membase + ofs->cr1);
@@ -1476,23 +1485,20 @@ static void __maybe_unused stm32_usart_serial_en_wakeup(struct uart_port *port,
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
-	const struct stm32_usart_config *cfg = &stm32_port->info->cfg;
-	u32 val;
 
 	if (stm32_port->wakeirq <= 0)
 		return;
 
+	/*
+	 * Enable low-power wake-up and wake-up irq if argument is set to
+	 * "enable", disable low-power wake-up and wake-up irq otherwise
+	 */
 	if (enable) {
-		stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 		stm32_usart_set_bits(port, ofs->cr1, USART_CR1_UESM);
-		val = readl_relaxed(port->membase + ofs->cr3);
-		val &= ~USART_CR3_WUS_MASK;
-		/* Enable Wake up interrupt from low power on start bit */
-		val |= USART_CR3_WUS_START_BIT | USART_CR3_WUFIE;
-		writel_relaxed(val, port->membase + ofs->cr3);
-		stm32_usart_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
+		stm32_usart_set_bits(port, ofs->cr3, USART_CR3_WUFIE);
 	} else {
 		stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_UESM);
+		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_WUFIE);
 	}
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
