Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7E4B7BB1
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C24EBC6046D;
	Wed, 16 Feb 2022 00:18:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89C80C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970720;
 bh=E1/0CBI/y0oOFG0DQ494qpBejRTp/bZTNYxnMsztVd4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HFuvYcE+MNBWLyomC9FoyVS8iZUVIA35FCPft3kbzOo7mqNpUDxddkaVfQFrxzahc
 XcqQoyg8Aw7TdmwDv0P3gj5REk0YX1ZDscHiKZlJdyO0Ji1Z6TE427uYdE/1us5j8x
 U25SVBYNGbWsdWnabJtsuv5WWoyma4qcZqvFBIW4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1nbesa23oe-00HcxP; Wed, 16
 Feb 2022 01:18:40 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:57 +0100
Message-Id: <20220216001803.637-4-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ku9v7EnP2t/0qx1Mhz0lYhcdypUi6rPN81qUlh3w+IMTDfVfTYJ
 qfgUGSK0OQK1tkFHimlY4MVxFZ717ykdkF+hFTcFmLeCgAPbBisXiyEdjPJu88V3L164Zg7
 3LypsFm/mDYGL1DPVUM+aB9399sL+hw7OeFLyRjuELWN7s/VUZB/rEQsMi1mrH5zr0yOU/R
 1RFl5kWCs/RafZsW3lfQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hvhhztwvj6c=:d3BfR6Ur2uikuPq3XCa6Hc
 uj5wIAomeaMd5dZKOwUL0p4kXoFvYzOrCkorvi8qY20gQJ8D1V5GT0FvQSnJbjMlN5J+UwX2z
 51aGxYnHiukt3+IZ7TC7xorPKvcVF7bWrMF+q2CGIbpangB3blN9xUVmlxOF+McAkQ+va8ZxW
 lebuoS4nEL6brGlQEFhUIfxPdkRT8JUgNQN0gokAmTQo7/P4DqMesHdmr/HeUJFmgV+YT0ZKg
 rq3bI01rU9Bpjf9yrgjRfhrW4WyevnpJA84XLyqmdTjcdjQdLRqRGNkdO+6vDpM1CRwDF16jg
 SQ1wjKbf1ByPJcdAS1KE7lO1g3yVeZxfkbzVuqLngRueImhEnyLEcYL+ACCwfTYFLAiUtQgkB
 VZ2A0M5dXaJp87EFvo58JAoXM9EDDhyzKOAa+vskP9kZ6YqdRJ6JnjbJq8R5jp9cjwqMjXL7u
 Hi+MYuezfMfQoCHoiPxrGGfmvcXc+/FQYngM05REAmwK/mYrF8ENzLYNGNytTmXxFklexXnJU
 bjtmrMNuuwhVS8r70AFdoJBrVRIqj/46q6c+bqKQLAy4s/KTneNnFHAwqDvXsRi4RbgQIYCD6
 2w9+9Yy2NADjsfGE1q4aWJPwVXtCQjWcKrmmB01bS9rgt5/5HdV3jvMi/CeCEgVv48w/HI2ca
 2eOoM1Cqx4RpJUC2D0AbWX9P1MkCcSbW3BGG6TO+/rrpuvyt49zJXATB5x71eIc6a0brWCMn3
 eKR/bcaZH+YsVCQE9VL9/8AgQ9IbccBR5KJiJP23K6qHDt70UcgP6mujekMm+Hn5rpF3Q3l/G
 5C6EE+Hk2z79G8Jg8FzOLh8FE1E4YH6noAcAuBXPDiwmx5ANPJmdPHUHzChQhtZpYbTWG0BFb
 4Sm8zZ8voxi+moabEzyywg8y/u42vjZrPWLnJVx4KwahA7uEQvPZUHumh23WwZo3vMd2PSbqd
 15XP0hawAEd0UV3eJWAgkqEwxIvtT/RRpCcm1QxECLH/S819AMRht677NjjhAU64EBryQiG3j
 84CVJxd0EF8oZv2L3CJHFl9u7ykWf3cf+Gv/JmG6SmDWWV4JA9ewMe11GxghaeC3+qnzk/MaN
 fQYREPQj60EShg=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 3/9] serial: stm32: remove redundant code in
	rs485_config
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

In uart_set_rs485_config() the serial core already ensures that only one of
both options RTS on send or RTS after send is set. It also assigns the
passed serial_rs485 struct to the uart port.

So remove the check and the assignment from the drivers rs485_config()
function to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/stm32-usart.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 1b3a611ac39e..6a014168102c 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -107,8 +107,6 @@ static int stm32_usart_config_rs485(struct uart_port *port,
 
 	stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 
-	port->rs485 = *rs485conf;
-
 	rs485conf->flags |= SER_RS485_RX_DURING_TX;
 
 	if (rs485conf->flags & SER_RS485_ENABLED) {
@@ -128,13 +126,10 @@ static int stm32_usart_config_rs485(struct uart_port *port,
 					     rs485conf->delay_rts_after_send,
 					     baud);
 
-		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
+		if (rs485conf->flags & SER_RS485_RTS_ON_SEND)
 			cr3 &= ~USART_CR3_DEP;
-			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
-		} else {
+		else
 			cr3 |= USART_CR3_DEP;
-			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
-		}
 
 		writel_relaxed(cr3, port->membase + ofs->cr3);
 		writel_relaxed(cr1, port->membase + ofs->cr1);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
