Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129E4C6140
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA693C6049F;
	Mon, 28 Feb 2022 02:40:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32B4DC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015993;
 bh=iPI9Eyd+3C6S85WoH/RH9YiOHOKEC2bR9K+d8H8925A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B2rz/X9piz6OIHopWLOnR1oRrBHZcoepl1hpJNpfcIm+OiUYTw6smz/pw8AB3R3/a
 r55CrB35v7qGgwzM5kYLiE1rHZxQea60z3wcibVZZ3LnzvtzuigJJDCWwCDOGLQ8LQ
 YSHdfcPMvqhgB8dKcOG5rvMJsaZIEFf+Kd8YvqXM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1nUoGl3ZVv-00CxpP; Mon, 28
 Feb 2022 03:39:52 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:22 +0100
Message-Id: <20220228023928.1067-4-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lr8oCML/RhTrktKji37TkXyhwoDx/xbf6v8vFT7o7L2qTyz8hit
 oKCSc08BFqYzX5GwZKq9lLExSpUiQhfFLT5EOci7KGo+LUkxPUou2t97Lv1wM3WcyyGZvfV
 l/91l524sXYL8NTToK57V4ZpiG2plg+RpFsv2TQmMnQi6N3Ot+Q8I8o2Pe+YMZCVCowIlkM
 Kv3+qEqAJvy4CY8Y4w5SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:93hJ3foLheM=:31mi6t4gTO0FiQ+HU+tJpE
 Y5ApMv+V91qhpjpM8p6XwWY6rnTyF8EV/1mzKd2814MgpsFsif1pFJjKjFk+KkAJJAplpgBEp
 gZZiIlt4+XUnXvlPIsPJfBG8rE9fFnt7T98iXi/fu7ZXViWpjKcrCJN1FoEw9vBimsADRnYJQ
 LDUAZFYgwnD/ger09u29aj9vdDTDOrvmagFKVcVLuM/maf+V/dlbfaj2LtfNtl/OW1oOC4yhs
 3JnhQuWhMXwMJx8OqGp1w3VoTeP/7gOAZx4FVr6vFLsAKW4rDVoOtOnbtxfu0ew7iHiWilZkZ
 hZvjVjNMnCi/ph2jpLFWfeLWdSzR/8eUvA9zd/f4xgaLY5BBFlC2fZZcPQlkIzbCAhKRAJFO8
 BsLpkvz3riLcRvOaAANXNpm6yZl2kVyS/yRn+pdsamctncHw2XiPuUnXJ2yYqmTvASfM1oARN
 G747mNJGaZ1gk0LHh6qfEyCeO6V0kNfdyWbIxEoMji0XKGBUHf9VDO+X8tx9FIC9Wg8cjT6uY
 04SQEdaBvFwlkKvpE1GiTFhSuxIpZAyeawhp9qblDu9BgxnbBTrKmUZQ3sI5wJ1j4HwtWSNPY
 4qTdaWsqwWwfHf53lJ2Xtpkg/SwiOtrBPduNftDUrUBlicJOYS+cENHI0aLnnKW4O0vg5EfNO
 zbw7Fzvuqq5hDrWiHWugKULxY1p1AjxOcFefgZ3E8y5HJUGrHOORueTYV9HFGpFiOECNBmBx3
 eHd2dqaMRv94ud9Nj16g26AqmOX4URVwKkdByV+ZT14Kw70V+AZamPfxx5zvaCTmCKAgn0Dqb
 KAAcaTrwxrNFg1BHB4BTBv7EeHLVWOtL8Ha+S9GYgjrg4z06ZwKklXkJKVAPiP7wE5juP2sOl
 bVcooI3JRAttvCFMfJKf0wlwXoL03kp4u2UMjWdVP/gHuKCxELS+XjB8OUtDZtP9eWWg3eISU
 M3xsOA9VELAYVOopFuLdXI+aCo7/qUmuDtUKBbIK8ZA8myTp/x9GeWw6YthWkjjqjTpMgxrE5
 kOcaCVY2Cl4g5w0cODFb8K3oB2Dxk5yeq0g5J2/M6ibtuT8YGpku9IyAnP5AM8CYa+ZOSi38n
 dq7QFOS27y3MB8=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 3/9] serial: stm32: remove redundant code
	in rs485_config
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
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
