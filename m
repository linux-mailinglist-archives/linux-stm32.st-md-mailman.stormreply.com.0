Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573D4C6141
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9CF6C628A1;
	Mon, 28 Feb 2022 02:40:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58D51C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015992;
 bh=KEo4sc077TnUumY/3jbiNcL70WXfdFpW/wOHZwtSo+c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U8CVLIYXiQfrqrF3Yjy3gpn+AQC6h/ZJaZXpURCtDMlv0KBmxLHwtcKmvzcXGV5hV
 2pkN3IXlsTjoYCAhdygXc/xNawFZIWBuFadKOsOG/xBKU7fvAB5Ovgd4Uhesq12CoD
 PJ8L+cm8gO4UrISqst0Jo+UDBrdm9YohgxLPhzgY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1nHuEq0Vho-006cQK; Mon, 28
 Feb 2022 03:39:52 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:21 +0100
Message-Id: <20220228023928.1067-3-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eg1D8cY8KvkEzDEdzcKaQNPZTMDNYQmE/sDotx9MDKb/I31DIL0
 5CKcm4uTNggqI8C/ofN5Vew1u4vsHYN32jItoVnblyIFScaWN41z7y/v8WH4gqDk3bH5EEx
 J2G+EoxpAJ1kBGuF1nvCb/F9kG2+zGQWn6nTjHzWTZTFErY3dfhXr78tLI82jw6GrLsnLiT
 7QhnLoJMJ1+Sm3KV9ogqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:85DxpLLInRs=:wCHmfG21c7gZ19Wv6Kv/81
 T+8dRdhkRFJ3tDbkjy6xMhKIlQtKJIqq1YP0ep+UvQBNxaxI7EHq05x3bJpm7++PIwxi/CZeq
 Zjs6Vv+l+zVZEspzxlWhGkjZMQfNoFkFIyCx4wEo/RP2G1fRGCCQwm6K1lWK4hk+ARUAV1xXV
 AcSzQM1UHfCcRsGOhquQ99qiiCeZ+c9xs+5RER5yKn0gv25gdM8vXy2NaDPxMD/Oy1Oj86zPb
 Yhr0gw4fjn1a0Vaak0tFnEdxiC2X6KoY/hig0QQmijZXiAP0ZX63tXZdwPmyqq/tepxLdxFY+
 64K3m364CnWWCqqELzq0B4IzrtXuj8UJ+vElufO5J/1nFj9b/ru7yP55nIq7HFXjItlLfJHeL
 pgJhNbf1E99+5/sJ6CFo7Rntvpj0bct7dZDTkh+MQ8RNIZkOPWS6BU7z7dDZbV80/5AdWE0nY
 1OwafnyGkxJBoupSp4QgFw6omBN7jtIN1H8eBawCtJIeOJLFOGsZID0A8hX8nms7/soxw8xzM
 o0uzChZqM3GvjQI2oc4mLfPlDo/eN/LcT4UqkBlvflTONi6QAQJL9hn4sLGn/W8o5hqexpb2i
 Tf8YlscPdo6sK/tdrLjdtfYltLL3e6WA5i6v0zEimcvLAVd+J/aquiKQkYp3iwoOGvtgazi13
 w3pJU4v9BRy4+M+BAmxe6a3qWCDnq/5I4J3uneYQgLIBIN2yOTd/al+RAVGwroqYSUZyV+gMX
 8VFKNByCC5VqfpdeGUexA1YcYCecnTb9SpBSJonXZlk+ozWh12IUCzWmsuDu7IHX32L09GDFY
 PegosY5pPmApKqpokaXkIVA4CkAvjwJ+6nwui/y2aoJB90+lcXKym0s2rlyMiMYh9fnEYmE+3
 WcHPu1nFad3LZrVl160rHC/hKrjzVS7VFdB28Ra7Dn1UKtH5QmS/J7Oh577c9y3JZI3jMdsq2
 sz37jZgoxbjMTagnMKzu3tUw2a5ypuR7CBebq8nvkT96tzVyrCVsSHeCvps4On5yjkW+EOF84
 ginoopQbntbPgGgQW5XQSCGmWmUD18dpgw6uZfBYXYLs9kHeMnkhrqS1HJGN09donLovKo3xU
 ZLMPaQbO9K9WLc=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 2/9] serial: amba-pl011: remove redundant
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
