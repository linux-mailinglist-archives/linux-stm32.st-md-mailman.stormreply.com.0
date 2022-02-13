Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A688F4B6B28
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D20CC6046D;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E89B0C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791286;
 bh=8vbc9twoUnggUtV10g7Mb1U2iiUeZXUFcj4fWWaxiwc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KzjfhcAZczeP42Kc+7eSyADZ3vwREiZGBp9roVilY9ewt2ksqSuI/JvJg2j5kMVxa
 mJDR7n9ljR6OFNZ3KdB8vhU++9m8WQ/rMSzQELa4K0OgzDUbYM/bDEcT2TBNAGaquk
 vUaRBtGXKbKYyVlN/aGhNYikGke8j2X9kjaga7M4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1oEnO23kPb-00wEQc; Sun, 13
 Feb 2022 23:28:06 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:30 +0100
Message-Id: <20220213222737.15709-3-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:c6+Ys0/CKTSgWjVeoHGhXE+C7sk8b465AsFJvqvT7hz8+wtDILI
 NE3k60+XHiuNHEj2TtJpphtCYkCMo4QEpfjehlyIIi44xqXykt7VEWB7Quwjm++QSW9C1ok
 c0kE/CShtmVL3c5kTMdNm8WfIiYMVLwau6yNXOYtsq7yd9HvNp4HA/7w2J5S5dvZYxf5XwA
 zu8cffo7aTS44giQMVBbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:akt+BNB8rAE=:Bij2tUiEnDYYUcmCI8CH+u
 A4X+QoGrJhbTtvO81tUsSGH35FOJ9hYG/4EkmBjBWlUTdmgiDY90LejjQ1T1DOWbbD9nPP9ho
 0kMwdXf83JZ07EDk9e8rEFIEUkPTA5YQ76+KUyd2PTsk+krztvyEZUgIl8tVw+OvZ5aGXGPkU
 WEeyn5ENHzR6Bl7wDAz0XqLz9huU49AAUcCqUG3RQn39totfHr338TqD0HRJD6MLpPpw50xUO
 fn+H19tJ7/L7XojyykiBUoxb0U/CkH6b4AdUkcx27iN/sOPuy3CmMM+EOb22PlE3+A2cy8m5f
 jRjbW5XYBz1LWtjetZSfMhldFJUenIkLCIcxl9HfNEKPJIjwt6IaNatq3AxzvD/W6qGqbJPoj
 fc/0DDAQYcghgn32ByxAcVQcxr+ygvkbAdKHTHzjJ+fwHfHDv/a/SeK+YNVagaXmRqlPk810V
 ziIOIamhRohN/Niu2k+n3mlxrwehLBKh9USfwKT8DfgrnOO2DEdT6srG1qzkARKlto1Qj36gS
 MJwcGmlPJ+tiIg50bibbbXG3ktSP3j6o142XKCAnGH5NYR8+T+fSrnjr6OtzTaEceQLoPXp88
 CnO21q1/l3XdwCgOOF02PbPAl7TwNqP7ClB86ki+c4Ez7ExHt7eklnwxe0+JzA0mo+lFWUB2U
 ojqgyfDEpcLsZwSKvJ6Vg2e+HZuU0ok3DlnwiePXZhMekSJZW/8Oey4sUIAKrAGJVvcOlCxFQ
 I5ADBW0EPpxT4xG3XfUefQnfFfsfKiJ+GqdcIXuJ0EBkQ9bzrGmDF77fzKr9qKQh6cd8l1fTy
 tcs79czwiFw9j6JZ1RP5Z5HaOjUvPf5MrHyAPKDV2MBf5XvyxdPH3XEejYXsYbkz3xqqL6+Cy
 CNRj5KfoxNsrUxk9G1Ir3wQkCoJc7mhJWP5bcNN97Y/dvxrkBwUKvJnKnSBGvbC8ybIYMy1Nb
 CAfcQ1+KoVarO2W2L1P5VZPyIucsCrCP3n8UaUAIZW3R8ra41iTBKZ4uuIgPZ/BrMy2TEbjUT
 spGalwnWvT8DIdqumYaFRpCpAjvrGbx/KtUvYOJ1h1Fn/KT1JUI0yW6PLNFfXWaNJilrNcEtI
 S8gqQvcwhLJ36g=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/9] serial: amba-pl011: remove redundant code
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

When RS485 is configured by userspace the serial core already

- checks for valid RTS settings
- nullifies the padding field of the passed serial_rs485 struct
- clamps the RTS delays
- assigns the passed configuration to the uart port struct

So remove these tasks from the code of the rs485_config function to avoid
redundancy.

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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
