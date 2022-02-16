Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7094B7BB7
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 611C0C6046C;
	Wed, 16 Feb 2022 00:18:58 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0C21C6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970727;
 bh=7qzWDUNopK0bho5I5nYj0J78qRs15cAksVO/Q8GWxsw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eFU5XYTy+SpZQMBcsDZPHFLFN/heaRrGD12W2PBjm6CRz7xdnfZoP8qKfzPPfmuOc
 3+6+eam14QnT0azUMnqf/WBAcu7kQiwsONOTFuW/SMqfsadjkX9ieNX/FDot6bU4kA
 OfiAarqevJrMmzFMdzFEyCjsspbIhflL4hq93ViQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1oMKQo09Jx-016e1C; Wed, 16
 Feb 2022 01:18:47 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:18:03 +0100
Message-Id: <20220216001803.637-10-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zA2TdkclBElvUYZlMDu80hyoLmVC33BJetCeueVe0nw+noQF1V1
 L/Ab3lZ4xwopWgLe/eddWpj7m2jLKl0mONq2uA12enhs6iQJxOtpVQrJETJo4TM51LKZ6c0
 +Y+sXtpzeFP2FmWNq4E4DBv6OtQJnx4A4iFaBoQHkepgsEcvWh4VjPlJPmvVR2PxWjPRczs
 f23tAxie8X4MJm+pJhDow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XcvYYdJUjWo=:atOtBcfRRm4xT8HMi31JHV
 MbZ0MzpH38gakA0WlwxC9/E+/3FI3Z+FityUADReFMjaq3vTJ9I2e1YOyQ8BildGgsuXd2PyZ
 +AvQxESyYnhUifIsSHX2MWHyJvtWL4WEkDD/KDeyaEIZjcP+hEk778pUGf1Nkrh1RTmzKKw1B
 Lr37gftv5eooYIwdiR1RQ9yon/wx7d7yYbgFqUTCLp3YN4VhrYgfj6lqgy7pCvhiLHdY30aRm
 Hm0bkWxevHH2BvoFXGlZ4XdpixJxqB5aWhNMnZel39s5RTkP57rO6vk2c4odwvOPFBN1LH0yQ
 vlGZGCNK0n4ZqP8T9PzGxdxGkBMHlfeMo8DuDmXCg0x76823YlQzeJ7UYl6CaLDpku7RKEgua
 zcODuEHFEw3EGfhqnazMtsONy0qbQ1S4Qchw/vV94NRDGQFYTooq8dwzCDUADHUu2K3PQzHPi
 X3jBGID2ilgamDREi+CNmK/QNlf0iRCcRf4n9eUNCsfkAFBzKjg53h3Sscd+CiyhLS9ZJUPPm
 HLg1eVHcdvC8RRzSRmF8mQC45aNo//ROuotXzo8XzYM3ebtn3wJ/qb9oLg2ZnbGM0nn5lKAwM
 JDTXzZgHHmNh1wT6mk39LGoUh5Q+WR9Oo4CWjkMt6Uh8leEOeyPVGTW8onq01k81gTx4rX0b1
 /aSibjYS+4qMoptOh/CT/5h5zNmt33okgKLIkPJSWrD477+cU5X2JmvXj8vc9DDCVegtVTPG6
 bPvAF7yy+GhSCr0HR8Jft0y2qu3tACB/Mvj6dOPzVm0dkLmu9YZJuUGsBePTOK8O/zL+xXaLV
 4nQpcbEPrPai/j7QLPrQ3/urza7oqfCO1WEJ+1l+4VODlSk0VjMkbq2YvpfwAMrzs6k2eOYxP
 m9VAhPFJQASLD9792OlrxmOuVcDt73IjYVlxlRffIck/0fKnJ5FiozF46os6DBMTDXVlDrnNi
 BpbCJugA5GMy1hUwNtAaW6axViMSoDL8/TzxtgqZvxLvif6yTKj0jhC2Q4jyTfrty/siL099k
 CjFptrr3RbHdWUyu1uOgXqDEabjS0WNKBHkjoqzVhI9EDsVw5kp9FKIVtUBhGcqSqIBStgeyg
 QCIQxHcXHriSmE=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 9/9] serial: atmel: remove redundant
	assignment in rs485_config
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

In uart_set_rs485_config() the serial core already assigns the passed
serial_rs485 struct to the uart port.

So remove the assignment from the drivers rs485_config() function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/atmel_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 2d09a89974a2..2ab589a3d86c 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -299,11 +299,9 @@ static int atmel_config_rs485(struct uart_port *port,
 	/* Resetting serial mode to RS232 (0x0) */
 	mode &= ~ATMEL_US_USMODE;
 
-	port->rs485 = *rs485conf;
-
 	if (rs485conf->flags & SER_RS485_ENABLED) {
 		dev_dbg(port->dev, "Setting UART to RS485\n");
-		if (port->rs485.flags & SER_RS485_RX_DURING_TX)
+		if (rs485conf->flags & SER_RS485_RX_DURING_TX)
 			atmel_port->tx_done_mask = ATMEL_US_TXRDY;
 		else
 			atmel_port->tx_done_mask = ATMEL_US_TXEMPTY;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
