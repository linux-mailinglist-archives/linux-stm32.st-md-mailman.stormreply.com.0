Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF04C613F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F0ADC6049C;
	Mon, 28 Feb 2022 02:40:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E045AC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015997;
 bh=lEGAOtzgMEFzQKENfjNLVN0s0ToEzWqdhUuUbTO2bGM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QLvB8/eHK+/SvsTwtT0eawHbDf2gnk1IMj5JWgZ+vCETZVKmKPM2nuJfdhBfSEZRu
 bRzvBLKTPZVNZVTLqV/IGZ6bzfPyV2SgNKo2gBSrnTeOeIdMP5ivp1byPVagCOKZ8S
 A6rVBx4fhRaGZ3u7xjM2cGODqJzdjYREc14QqDuk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1o0pd80Sst-00pbxb; Mon, 28
 Feb 2022 03:39:57 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:28 +0100
Message-Id: <20220228023928.1067-10-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YV4KYBkt5vzMrAX6xWwquDgNmwuBCgeR6qBMGU7OtpSXlhEZBgV
 hsctjceCxGWP8JlM7yusdI+xE38Ji9hhrArnUSILM6GzTNnW/S6iSXrTnTqyfdqwKRI1lv5
 G2rO+BDEbqb1V+s8OguTgqmQ40B1DtCvgIjOo17IFLvGAVwD0HUu4DPGrNPkSdrZ0azh2T7
 1GtHBqoFveUeOa9p2lVJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h4UaHU7djQk=:7t0EOHwetVvLoSDwyT7kQP
 5ypQC6G1iU+SvNNR2VaSPgp9T0yrtmocNDX/1Ud/Qz9+tFSaoQkGJ1NELIRvmJoMXakodYOZ0
 eb3IdiMM+cjtSqr8d1bYBBt4tDgetKjfLhbIAIRH7qAco4QYFadummZjZtjUSCRvpuvyGN7y3
 3GIxDs7tXEBPFzrLOcjJPX0qqox1omm9eByXUKifeBb/U44RhCg/jn+sIKPzfzvt6jasXJPW7
 RWlzOErH/JJ9/nlbakntOHw/UoLse7D30NHkVsDrhL9rM1WY72B3nP2VBSr0WsckTP2+JxHUk
 kNddDvMhfU9oIKaZjQCa8eyZNyMPajPNKWHtYaaHmol7byZ8rwagKQq10Q8+ahdJPTRXAsSq+
 7ZuotDHY9eOB/hcnrwrdk5rx8HLFDPF2qQcAtj41AOdum2cWTApdITbgXY2Ivtff3cTkz0DEU
 DYuzpYWeMKarqjme48FqRuZ60Gk80qN/r9YjFOVOux/OLTIfDWxqBZcDwpX6ZPzvFILkhdE05
 oHia0+xtN9CTrj+Q7UItQHRfQsXfFG90aooHaQzVniAK9LeUTC/+DL0z5sWbFhUe8/zeeNHD6
 L8ToIX8Z7UTqiWzbWvkrVZhtl8GEuqJWb2JXzLFSbo9CqFUZuqgVEZ3Kn79pC8ETyApVuGxmA
 T4HAgYu86TGI0ufinZAjKRMRRS9kzeAJBRd8YNyrTpmLbnkh3eSNBwJ8qxtbgcQv1NNRtPAmg
 k8nSng1DKhTJFDuSW3PHhsMA0CGiIiXkqxYHKTgGHf3gLvAbV+tk5mregVGHVCDE/6TBC8vwc
 N9cVHsdOnJUR4D4xqb+rtPTRvRUQ6gq0zXsJumebwEZOpW7HbczSQRMh/p6dweI7rDWX5zHMa
 UCPNi0ap8fCExByFvY6qpUwTSAsdMkPuoOJpxo239wln9qau1TE1NOX3zwh87AvnK9GEkUuxA
 CXz+tq+pn48xPThCwFUZnTJ8sojmmJURtPDFUlNeY9sOhgzoJOs1SBRNrhf5JDJgjPTjvHMtc
 B23hTJ/kucecTA5bCBDHjidOzD+w31Yz+HU6ub8sWdwpj0DeJhLEegLi9xYbQ+GhhTINAxTfC
 zFbNjUzFRJekGI=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] [PATCH v4 9/9] serial: atmel: remove redundant
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

Acked-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/atmel_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 73d43919898d..18d3bbdcb7a2 100644
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
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
