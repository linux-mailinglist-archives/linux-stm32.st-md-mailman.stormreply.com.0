Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 087384BEED9
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B84B7C6046E;
	Tue, 22 Feb 2022 01:15:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F0BBC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492507;
 bh=KEo4sc077TnUumY/3jbiNcL70WXfdFpW/wOHZwtSo+c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R321iE05JyltOvTziTJucz7Aha2pQui3BMZ5o3fES3OdohzSi5OMoPakHVdjD1VlB
 ZbT06e/aqiMoRzYJ3e2aRBl1G3gurFIxguG757H8IySbnvfX3EzmH8GUGjfUokgKe5
 cbuUuEOFgTbGukGiaoI8e/pK0msdmRuDy+XckkkM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1o9SNF0rOk-00vtVm; Tue, 22
 Feb 2022 02:15:07 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:26 +0100
Message-Id: <20220222011433.8761-3-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MRCzCFZwVGuHxJ4XCUOnuQ+k6jJA6DTfVK0pMx7+grgupk352jS
 xmocgmDITGUQJKhjfKpuSW0zwubnakFfr3D4RUaDlmBh7Id8BQ/jPjHYzZS9elgY1WLACnc
 7tSOYpKJEnuoHPzUMbi5/BjccZodi+fjg76bLmAZZTVh5U2rhSRFwrdxTleHx83Xu9VKwqr
 PX0IayxvHad2vb4qRBtSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AqfelYdZ1ns=:8iaU/xOJxj2wUkOKaGPiZB
 8Dd0SAkrmad1IkGQa0bD7nKfMr8BinRUeEz0f5NOlassvDKA/zluwVnWC3a46driuBB2Au+sf
 Xr0c9VJ+YhkyKYHw65wXQ1JSlS7++qA11IZVWUn151k2B7S1LTgxj9PGWVNXgSTTgmu1l6gVS
 ZqXePddIOithJ5FregzycM6cjRXrxbR1mXM4ZPR/hrcHcjZblEOZljNf0k/Q4hJh2+wcUuLD4
 oXIbRk9VYUAm7yDypPvcPEjdMl6xJPAYjV3zYWiA81YTFL5DZrFuBbz6VBZgn0G088ipgoW7G
 wbj+ycT0rFPk3dJtrNsb5PoRcj45GG6xIOqpG5T9o3QlSFePCn7B9WQjh3xm58Xrpvkm6FgEi
 JY5J582OcKsYSMT9dJXgRsZmjZZvRrX5Xpp2p5IC81EyU/u3Lp1zWGuCp1DTCKDRdPWZcsF0L
 xEuI2jxkwgRaZRmYdcFCwpJTI/4GAuzwKJQCR2ReAttlNdbepVCk9pP3p2OXmqmZDzP/Fhqab
 uua60ggBHPKPtIAi4BtYRHbLMiRh8vvLpq10qmvnEG1RygJPXl8V4ce2Xfcaai69z7PvwOuhb
 10DFNG7TAdxX07G5deC3sw9Th5uBQjBIGwZgta1pzV74hVgVbzr1ObItXeffijQnCn7rXALD/
 Je56MshTG7CLoFiVajKUxtFotuGucKCiK8jfDWaikghiosPuR56L990VclwjjDtmFnj505q8S
 swVQk3sPyX75Kq04YO7iZdHtvIe6CM0mYSed3EJt+uvLQhM8+SxrK/wQqJL38+4C6KcGDHiMH
 WMdCbPaZc/TztadptmNOFLFT10lTY5aJx61Rcm+Pe9pik521NnwR5dAwXfeFuaUVoBLcMrPTh
 X/mR8A6zYvNdiWwdSAJBWSlu8s7fLtd7xPVMnNH9ESFSoxMSbuvkOhKVlt+/7PFlGbuD9DpWK
 gjLhBrJzakLmqgoBZmdEuEFLbQvWdYJq+/Sp2Hs2g3AyoVlXV0Qq3DU8CEJ+oJd4cCeGNuMa5
 u3hJib2lLJncip04WArDNIxJWL1A1wWiWsIxYevSbvGTS6PxmybpMxkZ0JnDbjUFFLUAKTkjI
 NBWMXhnMkbmiL0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v3 2/9] serial: amba-pl011: remove redundant
	code in rs485_config
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

In uart_set_rs485_config() the serial core already

- ensures that only one of both options RTS on send or RTS after send is
  set

- nullifies the padding field of the passed serial_rs485 struct

- clamps the RTS delays

- assigns the passed serial_rs485 struct to the uart port

So remove these tasks from the code of the drivers rs485_config() function
to avoid redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/amba-pl011.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index ba053a68529f..35c633739975 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2170,25 +2170,11 @@ static int pl011_rs485_config(struct uart_port *port,
 	struct uart_amba_port *uap =
 		container_of(port, struct uart_amba_port, port);
 
-	/* pick sane settings if the user hasn't */
-	if (!(rs485->flags & SER_RS485_RTS_ON_SEND) ==
-	    !(rs485->flags & SER_RS485_RTS_AFTER_SEND)) {
-		rs485->flags |= SER_RS485_RTS_ON_SEND;
-		rs485->flags &= ~SER_RS485_RTS_AFTER_SEND;
-	}
-	/* clamp the delays to [0, 100ms] */
-	rs485->delay_rts_before_send = min(rs485->delay_rts_before_send, 100U);
-	rs485->delay_rts_after_send = min(rs485->delay_rts_after_send, 100U);
-	memset(rs485->padding, 0, sizeof(rs485->padding));
-
 	if (port->rs485.flags & SER_RS485_ENABLED)
 		pl011_rs485_tx_stop(uap);
 
-	/* Set new configuration */
-	port->rs485 = *rs485;
-
 	/* Make sure auto RTS is disabled */
-	if (port->rs485.flags & SER_RS485_ENABLED) {
+	if (rs485->flags & SER_RS485_ENABLED) {
 		u32 cr = pl011_read(uap, REG_CR);
 
 		cr &= ~UART011_CR_RTSEN;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
