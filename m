Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AC4FAD5B
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19D1CC628B3;
	Sun, 10 Apr 2022 10:47:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA8BC628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587638;
 bh=ujbfvAQbd8qp3JQ8+v0VTyxUc58rDq3/zEwlGiyKaHI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R8zJzdZfcFWCMg/u/yzzze7pbMrLpLu3EoMtblzUft30AAaVvRTnwCX7kvfYFFAi6
 EeeeVTj+kA47o7wIlqRWvrAC5/jt5LYcpDOLUa+95jwiUK5K8ozS6m8Qyj9AVAQRVo
 tu4uno0QS58F0wjI7ZiesZyq2Y8wCT0wSf5oST4Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1OXZ-1o5jJu3o0x-012sKf; Sun, 10
 Apr 2022 12:47:18 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:38 +0200
Message-Id: <20220410104642.32195-6-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2Rc0EsovuAn8Uo8sXY1SvLuxqDYGQz2n7zPfi2F2gSkdTaxkkWV
 mGzXqVm/mjtaENAsY7xCBFNqnk3srq0vkZtfq1Uza280CelVRnvHpKxT7uwyfJkDXiPRQR4
 3BcZlfGqr8dsyfAZXp8IwixVAnMsQ8GBqm712HKp1UD58GglZgCiSN5xCjz+6kzG5zsDw3H
 HB6wbRt9SX30/hg0j1Jhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6o8OgF7MF7g=:lsr6W5yjm+ASgDwuqM4coF
 bF/aHB7YyymNKd2NLv7OUqC0ctZ19dE+grRs3aKKzSXTmociiXgAvpU0edNT+B78AbaRT3xA5
 8CS8ZOa8yEted7w4yvNMhl5gyVrDE6TX5gyxhfou7JvzhwyXBjo0wLAQ5lF1VOHU/lGWYtI/h
 zYmxCX+Ctjm5pUyfb6RTKhv/QYuhaF5Mnxe5mDiBB1MREvWFfSpO4zC+MMNxWiHgoqn0FB/Jp
 6qHFCcgB+OIqXl7cs9jT1R+ClXPaIkDTS0UJnqibktdMtB1/4RWioSZwHQvEL8JB/YfgJkmrK
 3eGuS6Z3/HaDO4vprBByDHJjK/v08z21HYvpuJbML65LLSMrfApPBjUSiRwdWut3z3vtMr/1H
 rn9zHKv/k5QWHDF8NpHPcmrDXrwTgC1uccB3eTFJriurL4HA0/sAuDyK+pSHJCdrzBGbXn9G6
 xaVn34wnXByblpef9VTHADatdflCsJpA6i2emQNHo4RB3DlyLF667uKX9Efr9QNS7Kr4fjVt3
 EpmQXjv1e+w0SEEmgu+oWZhPYpvdnAcpphknJxbJnPEP9M3o4Orbh2e3B+Dp68Fotyy9kiL68
 Y+Y799VOvUCmd3f9BloK0BKTbGO4edKsUgmjXLOeqjDMmTS9bCClIFVtFo5KpySZkJC2bEWP1
 wAX4nv6onKDX3vzVzPFA8KfzrXnR7DfyOhwrrJhUC6c1S0TZskcM5/0cY8klqC0wrdWKos2Jc
 6do695q28nBRO/rUzuQvWpJJYh9YgikeV0ff2j24sbjfJ7ImeAzD6KYwti7hqxvabFcQ5Zs/c
 ZF4d1kd4ZJNEGgns6YqwaisIyPJJQo8YAhHB4BUFD4yvOlluwH5xDENE43Nl6XO1N4pGNkqP5
 tUpL0c50+wkm3wxQiwH48e92y/IWRWETQnnDAOIcLh/GEDaSOajPDwHdZCkX58jSGuNnvmVnP
 AJRkLgVmK9F/63vBKkzjaQ07odldalPiILQF29xa+Hdw9gsXT037j3y0uPIwcxXGySUV79Kop
 DXWOQYvkn9bLfmrvCrrUuOdHeKiemKXXJBW53npiX7qYd4tBaHwIeRNsSkYkqRwvrf/yR2Omv
 lHrMs8rctw9Dy0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 RESEND 5/9] serial: omap: remove redundant
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

In uart_set_rs485_config() the serial core already clamps the RTS delays.
It also assigns the passed serial_rs485 struct to the uart port.

So remove these tasks from the drivers rs485_config() function to avoid
redundancy.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/omap-serial.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index 8d5ffa196097..46f4d4cacb6e 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -1336,18 +1336,11 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 	up->ier = 0;
 	serial_out(up, UART_IER, 0);
 
-	/* Clamp the delays to [0, 100ms] */
-	rs485->delay_rts_before_send = min(rs485->delay_rts_before_send, 100U);
-	rs485->delay_rts_after_send  = min(rs485->delay_rts_after_send, 100U);
-
-	/* store new config */
-	port->rs485 = *rs485;
-
 	if (up->rts_gpiod) {
 		/* enable / disable rts */
-		val = (port->rs485.flags & SER_RS485_ENABLED) ?
+		val = (rs485->flags & SER_RS485_ENABLED) ?
 			SER_RS485_RTS_AFTER_SEND : SER_RS485_RTS_ON_SEND;
-		val = (port->rs485.flags & val) ? 1 : 0;
+		val = (rs485->flags & val) ? 1 : 0;
 		gpiod_set_value(up->rts_gpiod, val);
 	}
 
@@ -1358,7 +1351,7 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 	/* If RS-485 is disabled, make sure the THR interrupt is fired when
 	 * TX FIFO is below the trigger level.
 	 */
-	if (!(port->rs485.flags & SER_RS485_ENABLED) &&
+	if (!(rs485->flags & SER_RS485_ENABLED) &&
 	    (up->scr & OMAP_UART_SCR_TX_EMPTY)) {
 		up->scr &= ~OMAP_UART_SCR_TX_EMPTY;
 		serial_out(up, UART_OMAP_SCR, up->scr);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
