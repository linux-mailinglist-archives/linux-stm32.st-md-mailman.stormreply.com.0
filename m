Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0466330902
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:55:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68028C57196;
	Mon,  8 Mar 2021 07:55:57 +0000 (UTC)
Received: from ms9.eaxlabs.cz (ms9.eaxlabs.cz [147.135.177.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B54C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Feb 2021 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=eOs4SLRlAzsZ6cq4rK82CE++LJAeAcVjjxdMbB7lWMU=; 
 b=Rx5I971fCaF8TayhMAbvvEUAhxGgYr1jPVgmB8i8nYoSENiKF/s0aIn15Ir/0Fgw1IDP9h7afe2u7Islsn7RcNMZpIeB2m7fpjgUviQBk026uhy9QB6XRP16Syo559ehrOH5wxMxsbZOTjg3ew7tMyZrg8wIO/PiHGdRxyuU31Y=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lG2fZ-0005pS-MJ; Sat, 27 Feb 2021 17:42:19 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Feb 2021 17:41:56 +0100
Message-Id: <20210227164157.30971-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
References: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:55:55 +0000
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v2 1/2] tty/serial: Add rx-tx-swap OF option
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
 drivers/tty/serial/stm32-usart.c | 3 ++-
 drivers/tty/serial/stm32-usart.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index b3675cf25a69..3650c8798061 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -758,7 +758,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	cr1 = USART_CR1_TE | USART_CR1_RE;
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
-	cr2 = 0;
+	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
 	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
 		| USART_CR3_TXFTCFG_MASK;
@@ -1078,6 +1078,7 @@ static struct stm32_port *stm32_usart_of_get_port(struct platform_device *pdev)
 	stm32_ports[id].hw_flow_control =
 		of_property_read_bool (np, "st,hw-flow-ctrl") /*deprecated*/ ||
 		of_property_read_bool (np, "uart-has-rtscts");
+	stm32_ports[id].swap = of_property_read_bool(np, "rx-tx-swap");
 	stm32_ports[id].port.line = id;
 	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
 	stm32_ports[id].cr3_irq = 0;
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index cb4f327c46db..2f054e2dc0ab 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -271,6 +271,7 @@ struct stm32_port {
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
