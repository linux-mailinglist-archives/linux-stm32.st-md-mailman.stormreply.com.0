Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178C4B6B2C
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF3E1C60479;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2333DC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791290;
 bh=5wRzDJnH/MZt0kXSTv+r+X6s4j4DfxLFn8KhRpAsf+k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=drwtnPZpDdswVRyGbojgh3QOoOb+gOjLQCjfgwFWtLfhCavf8/Z01ndmtAxI5ujNI
 xwYzXWomVIXPipmJk8bW4cMmzMdFbOreX4iFQ85cmDego2brQgSGfsVi1UoLiJonkg
 It7BOS0PPSZYtsMRgpEyTUB67w3ymF8rQ0UAzX1Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1oGT8l1INN-012LMu; Sun, 13
 Feb 2022 23:28:10 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:35 +0100
Message-Id: <20220213222737.15709-8-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VQAd/OJ1jhpk4ldceF25FblvAEPLGdXjHdVFpiuPSuwADkBeT7V
 yCfW/CI9M5DgE8+jVQFlBr63McC7604NjY1wWsZ2tTsR7Sozw6+IX5Obol0dSbpjd1lf8Yz
 d7NCqZrRweC/jyYIQGhtkgyi+wplMUxGkGwA6sEPNfHm8KWDl2h3g53uxVYJILCCzU+VFLU
 oj5ppYlcbHf2/n11GstWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5jXlo6iGtGE=:2aF7oQ2b8dRXTmb9YMU/9E
 N59bqsjvTyI8lRoO97eqDWLgQzLdE4gPbzjdn1pfmvnEHT4fDWcQCiF/FOMJk9p86a7xzAGaQ
 HIVuaN3kR2sOeUDTcXsM99sQ16YeXQz+x+OrHuKOT/F7lYndAyXeTXJlYate248QxBV/msw5l
 x+iH9vPNrWEPLsqTlxt3PwVLdPLyiVaJbbP4uiZdrY2SjvpDDKcPE6+8TRWaf15hGuAnBB5ht
 v/leGM8Zb0gmIBCF+IdUP+ZdWZChtUCA9kDRV5b9aKXpL6kYlQePvBBR4ECgfia57JzBKko0X
 ISGzA5liPhq8ZDkEVZpfjalx2nj+BaeXOSNFgLFtDDkjR/dRLpHGNmknYnK4/jAod3ja+yBTj
 f1ilnGiXN0Bx+RraTypO7LQwQmOd21Zu1R6cGHoZofHLgJ48V9VYcrz6B58vCV4o1FkcaSEIi
 kVBRu93pxzqNrko5tAQt9/V6UH7sY0A+f0DfVF/DbYIWypQfTVhti3lFE6IayJY1CQmHYp081
 stHZIa/KyskpiTUjN2WDwUJDGD1HGb63lS08fOr1Luv90vn4ipI01ZsvlNn08FsZhz5pjDC9n
 z+SRL3zDV1KGjriEZz9aEYB0aehKozbjyp9NpPlbO6KaBLudgvr+RlsLuNNP541zq+Mvek2zp
 3X+OJtU9sjnkvjTszBxU8jipdg1QzFPQeWtihfOv2K/nGScHRT6kKcrPGdl8ENs62f7giofdX
 10w/i5LAc94AZdWtZ99/UPtgCozBWlnT9jAlHWgLo+i5TIq503XDc/MVt/2kmLT5yHQFVqhJS
 oRWK/HlT0REhLyiUlsnWe8dkY/Rlzfs9rGu7U8/nGqRM8FJeyxzVOn1tuQxEjXcz6iMRmaYeu
 PKaWtr4Y1BU/pg0ZlWMM/ovwjeX0IvpNQ0D3wSS2rybaBeU5OXy1hmen6l+5fRSWMYf9vKg1L
 6CWY7tBK6cg7FtincYaNvjyC0WgYGqjLRINTzDecW5uK6/XMcpWtjPDsOPeyFCThvY80iQXDG
 NE7LA3Glz53CKTaZSKpqfYvRj8NfAgNghT/lmi8nxHDkb72oY4uNs5bcrzrQkhaKjZUcLlYez
 y0XBaXQACqP8QY=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 7/9] serial: imx: remove redundant assignment
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

When RS485 is configured by userspace the serial core already assigns the
passed configuration to the uart port. Doing the same in the drivers
rs485_config function is redundant. So remove the concerning code in the
function.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/imx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 0b467ce8d737..ab56ff23e8a9 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1937,8 +1937,6 @@ static int imx_uart_rs485_config(struct uart_port *port,
 	    rs485conf->flags & SER_RS485_RX_DURING_TX)
 		imx_uart_start_rx(port);
 
-	port->rs485 = *rs485conf;
-
 	return 0;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
