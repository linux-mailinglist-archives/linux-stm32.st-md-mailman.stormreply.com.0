Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D844BEEDE
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304D7C60482;
	Tue, 22 Feb 2022 01:15:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4B7C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492508;
 bh=iPI9Eyd+3C6S85WoH/RH9YiOHOKEC2bR9K+d8H8925A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jjT42f6heZiJwoGFdqhGVNEsThg3FASN9KHgvZ82tGkVa01YSvpMnI7qFnQoX0401
 d7c/u/kromWD/RY+B0UKGLmRhORjvzkJ4zs7exioVzkNWMO7NVWIdUnjffL/9FMWfP
 IbBJOINbX3DOuEXrkq8nH82EZTINm2KG7jOJwXbM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1ndRTm0MWk-00JHRS; Tue, 22
 Feb 2022 02:15:08 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:27 +0100
Message-Id: <20220222011433.8761-4-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Yr0zSx6AgYnin7QmZqOIPPMUBfNDEjL9oTFYL5o617rgkNvXuDB
 hlhQpzkCAQ+uDw+7QhFXeoWxgexLrBgiOLiyof+cafoviC/NV7CqNcO6MeEYhWkiopEYsuQ
 yqARWg2J5T9jbHbUp4UFulMt7F3NS1/U5wcUMZ42ctgEIAmWIfi6xPLQs807ORTkEqgtj57
 6wahqPtwNc2UuUgOIbi3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CglKYrDvqsU=:yLxwhJW99Zwnj5ZRfhd/tF
 d3ykjhn+uHspulRZ9LdoSS8eRrQfXsW48Zqu5y7LbRHUjqtWsOJTZ7bcDHTCm5Z/feEBZmG9g
 QTTw+NBMyReQAVYfymSY/X2Nca3LTaUqurSolHvSkNpdq0V0H7bh8KcUuCSM3lVJlzgHW7WBX
 wrLBMIugfPyIiib7XyW8wPhSyGhjrQtbd5aBOJ+N7Ugxiw+nFHyreDFhM9FLTGckowPmch17X
 ndYBkaQCFuVU57Suo0xhitzaF7g91xr5W1VFzMuPQpiA4PEe/Uz0A1gp5743pfs7ozDjm9oU/
 5DYjjYj6xXk20vWVew2AmDTpXgfIfz6lFC4Yz0HnVJEQp4e38/kZ0rXrdxkCmP/Z9QoYxSp/v
 MXwe6KV69iKtBalllBMaLNGUfoWpNG0x8SullFMxnXAzG3iiMAo54EOiyCdEeZZZMRwywPr1j
 E27AKp0Dx+oKC2frvW2k3uJ35+2y9hqTmTMmezv7fLO2LuzRhwY8BAEQICZCCnSfAsvsIx0wM
 MDoUndbZ7ynHj7xhVZR71JyHpo2EHZbvPGo+kNwcrLJ/xgB83fK/sH8GH3hqpP8p8V7F/DFKr
 vhAZVH6T+s9sE/zoqmaoRsD2Pgr9fWAoaCRlH56tr6EFLQA+lR/yXZdVpgXUHVfBfiCwrYcKJ
 zj74IvsFO4AKWU9HE7IrMsh29j2SbsXMm7xGkN9A1ZSq3Y4kIRRGFt/aa+zkvhtwddehk5/Bk
 IHilBEYPe+qRnqW1ARDjUev7suh18E7xI/AJNKe7t3d/1MtgDKAv3MHvkcVzkpEwqtb+3crzZ
 R5mC50LfZnHm5k/dtbALO4DX2Cs1gfiin+nOcxQq1JIWROZcWBb2J9dOpjZAmIV/DCHiIugNB
 7PiOcvN71WsaUoOtVdE2MJcTZ9JXhrnl04/ojga6eMhCslBwjfCY7F50zFOetRLlrhGSNeOUO
 D+CdlP+aYvqypGXw7CGnIMJ8RdLNKEIOLrlTUxq6iYg6gEu8sDDQbY5K4z2pmSLZXzKtAxjKY
 9X0H1WXHKoSVcnQIJEo2Eiz6fZjohQqfClAxXADR2+e5N4jc0aDtVUh3ErcoAZwHLDfQZ315x
 X6diRwpdLWdmow=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 3/9] serial: stm32: remove redundant code
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
