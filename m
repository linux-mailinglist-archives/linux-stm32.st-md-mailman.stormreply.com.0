Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB54F95AF
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 14:27:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5872C628C3;
	Fri,  8 Apr 2022 12:27:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69982C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 12:27:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 238A3ahR022061;
 Fri, 8 Apr 2022 14:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Z+C6qsQxHAO28SlPFqbWYQOw4PgvzJsq3Eypnf5gKzU=;
 b=DV8jPhv2oQFcW0JI70pCiV/+5meHiG3pEjC7Ya9T2rGFEtbfB/aq4J3XZI3LsJr24iwa
 UefdkkGMVb8BrdkdEpdj+1VeLYy8lTxGZPCqiCjfCgKvlprHZRPDFGrqC/6DscaqiO2p
 JH5Sx6SAKia4JYg/miMUr7h1KcWlRM5Wbaqosjx+8pjYtNccU10YSGSyLqgD0B5AaO/C
 nC18hPtVlNc8do5zy6QeJDu96FhNycWx39RNmzF2u6zbl03RWXRxDZUSwBJgIfS8RHAS
 JjM/3vXEadVxWNwcK/NMDa3h2lOQ/58G/8s12VPKzIzbRn54REl4wysAY+9Drc42P2cz ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x9gu5ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 14:27:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 189A2100039;
 Fri,  8 Apr 2022 14:27:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 105DD21A21E;
 Fri,  8 Apr 2022 14:27:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 8 Apr 2022 14:27:03
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>
Date: Fri, 8 Apr 2022 14:26:35 +0200
Message-ID: <20220408122636.505737-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408122636.505737-1-valentin.caron@foss.st.com>
References: <20220408122636.505737-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
Cc: linux-serial@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 2/3] serial: stm32: add KGDB support
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

Add support for KGDB in stm32 serial driver by implementing characters
polling callbacks (poll_init, poll_get_char and poll_put_char).

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
Signed-off-by: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 37 ++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 83895da84891..4307c822afe4 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -37,6 +37,7 @@
 
 static void stm32_usart_stop_tx(struct uart_port *port);
 static void stm32_usart_transmit_chars(struct uart_port *port);
+static void __maybe_unused stm32_usart_console_putchar(struct uart_port *port, unsigned char ch);
 
 static inline struct stm32_port *to_stm32_port(struct uart_port *port)
 {
@@ -1222,6 +1223,33 @@ static void stm32_usart_pm(struct uart_port *port, unsigned int state,
 	}
 }
 
+#if defined(CONFIG_CONSOLE_POLL)
+
+ /* Callbacks for characters polling in debug context (i.e. KGDB). */
+static int stm32_usart_poll_init(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+
+	return clk_prepare_enable(stm32_port->clk);
+}
+
+static int stm32_usart_poll_get_char(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+
+	if (!(readl_relaxed(port->membase + ofs->isr) & USART_SR_RXNE))
+		return NO_POLL_CHAR;
+
+	return readl_relaxed(port->membase + ofs->rdr) & stm32_port->rdr_mask;
+}
+
+static void stm32_usart_poll_put_char(struct uart_port *port, unsigned char ch)
+{
+	stm32_usart_console_putchar(port, ch);
+}
+#endif /* CONFIG_CONSOLE_POLL */
+
 static const struct uart_ops stm32_uart_ops = {
 	.tx_empty	= stm32_usart_tx_empty,
 	.set_mctrl	= stm32_usart_set_mctrl,
@@ -1243,6 +1271,11 @@ static const struct uart_ops stm32_uart_ops = {
 	.request_port	= stm32_usart_request_port,
 	.config_port	= stm32_usart_config_port,
 	.verify_port	= stm32_usart_verify_port,
+#if defined(CONFIG_CONSOLE_POLL)
+	.poll_init      = stm32_usart_poll_init,
+	.poll_get_char	= stm32_usart_poll_get_char,
+	.poll_put_char	= stm32_usart_poll_put_char,
+#endif /* CONFIG_CONSOLE_POLL */
 };
 
 /*
@@ -1640,8 +1673,7 @@ static int stm32_usart_serial_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_SERIAL_STM32_CONSOLE
-static void stm32_usart_console_putchar(struct uart_port *port, unsigned char ch)
+static void __maybe_unused stm32_usart_console_putchar(struct uart_port *port, unsigned char ch)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
@@ -1658,6 +1690,7 @@ static void stm32_usart_console_putchar(struct uart_port *port, unsigned char ch
 	writel_relaxed(ch, port->membase + ofs->tdr);
 }
 
+#ifdef CONFIG_SERIAL_STM32_CONSOLE
 static void stm32_usart_console_write(struct console *co, const char *s,
 				      unsigned int cnt)
 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
