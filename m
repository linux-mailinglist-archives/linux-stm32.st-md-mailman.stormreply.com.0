Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAE4FAD57
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9225C60494;
	Sun, 10 Apr 2022 10:47:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 185C6C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587636;
 bh=Xte7M1bRnOD5NSoYEInJ1WmZeV38/NX0bKYXCdSsO2o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DVGhTTm/NXu0o+/g2bdw8brZgxrBTHybd3BWNaJh1kJr2rsKXxHb3m9oR4uxcIDSk
 ui93ZJ3LM5rRgM0fSH4BPQjJVhsr8rX1EK1jNYOiQ7PwLzRsPySIYR1BWW9QydItQR
 L3DBIlxHkupItI1WSbl1J87DGbDB0eQBqzAjjP3U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOREi-1nKJHm0RKQ-00PwU8; Sun, 10
 Apr 2022 12:47:16 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:35 +0200
Message-Id: <20220410104642.32195-3-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5XcnLtG0AFB8aIZrVZAD7/6S88KFrH/NQwP2XxSsUivAQ80QcYo
 FUHjHq0w+heXuQeMfsMKG7JLE/49rcVvEHtmP41JpRy6UIx0sI/G3+dB44ex+qC8AwD+ohX
 KlU2SampZVORw8/lr9P0HpL11vxnHZdd6RS+gfL7FIZOnP8uKzMYYMvRmVf3EnCTd+kJif4
 SqczGChNFdFZiTyqItqPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jhGmW4ADquU=:y2fQmYcM4VbvPb4zc+cqsG
 /Ak+a0WpsOnQWTpEsfQUCMHmF3kVuovmyQtM3TsbpBaVrbTWeAI10W9798RO98lXjpXTberKq
 x3qXcW0wPOBiZv52DQrtetnkbXW6JZewTY2H4qzOluWIWSfe87Zmq1MhLpWUvdl7B7g9D5kAV
 wxTnr3zycG9/zyLIcd+q2sX6wSyb1T0wcdzSK84zup2hWxA/Hv7In+zFFkD5DexASHlxt8I3M
 ruPWtjCsq1fcP8iGeHIpN/d5Po6gogK3fN78FDGssh9kyRVcAois6vuFV+8yoCMGTH1Dg5Vvv
 EqLE7lbVN7ZSe1Aeq586lc2FsVRG8bOJmflOdYDoCnrBLN4VyJ8OWtuBlKUMbj6iRpr3mG69G
 AQd8PP9WJttk1kFnqCUDw2QWCkJsh77M/pism41BlEfB7LHKfSt2iKxukc9BElZ4BCV6aZ8d8
 gLVuH5MVd4bfhxibi5Wzye6s7oBr+X/coJ/rVD1PKm6WmTHdo8tjr0lLq/il+I/9hBzK3hYT3
 rB4wr8ivyDwZrILjWzBnS+0XHh42tQF0th+6uEgJi+d3g4cEp5D4QokzsEHlxIORDvsgRZ8r9
 ZbRbclE58bJZ5wVBlTmOxFMl3G7VqAV4xjLh+C0kukKx0QPiw3V26SbxYuBkEvD8wsoYKHnQJ
 Mcdd6JFCEsAiQESGXgkDCWlPRoMCMFwXOUbnZbE1oQiKg/Oj5oGkZxZFDTm10he8ZguR6y5J7
 MSsI3WUeLOE44OAuGs58SvZfr9SXDX3mZTgaRj6qmJ5kEpODnf6EUc6B4sW9d6o2bKXuB0cxq
 /Izlk1HDm6u94jdCbf+8s66ZnIwullfwXH+OFA0oVB7zornhfyg6uzEj61EZIaej977b+iPbp
 pScoCIUdz72M/moKPwD8d1P2WGXOTilrl3lyTVcZ15sICMj64nJ6GTST7vu0tuGwEQU+flnt1
 ljDSXQyHZEUhyS/TUcy9pGMteXKB5eb67qX3BH44tvwRpmcwvz8paM69/drwkTw6fSytAfzZy
 lL4IDyAYLKCAINdeeyljVfHKKrnY4bVGVO38Tto9bb7DVAXbdWUjMmzSbRPvJh/u/qmzlR82Z
 r/gj5BTfWTmpSo=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 2/9] serial: amba-pl011: remove
	redundant code in rs485_config
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
index 51ecb050ae40..de2c4dc6257e 100644
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
