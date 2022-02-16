Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4FD4B7BB2
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D49A5C60471;
	Wed, 16 Feb 2022 00:18:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FBC0C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970719;
 bh=KNlkTrX8x7yAcANSC5T8c+HtH9VyTbcyT6PC6GXfNX0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lmL5TL9e+J65+t5P61LMu2xnn2PLAmk9tl1GigRmC544abjRh0xeCnXitGDoqa8Iv
 jbAIamZm0+kOtISNRSLq9i/v6hNTYAsr7AAWmA+P/zHi2/yK3xQe0Oey7U0dha42XY
 p3iv0OvZNfnx/WbVS9gFykVcP2t/5i/isqMVlkpM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV63g-1njwcK3TbK-00S74X; Wed, 16
 Feb 2022 01:18:39 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:55 +0100
Message-Id: <20220216001803.637-2-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216001803.637-1-LinoSanfilippo@gmx.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DwBoOp3Hdle0l17X4ijaaS7OBJw4SZaNDHP7xyTK6n4Ia+pqp61
 m5aTrloSjRFLWCErb6bGxl+l45wdG2RZGKpDO8a92NbQobSbg5o8vrxWevw4wFdrF6rYRI6
 1cMPsfUCYy9egVD77ZpRSaNixbyqrj8RjtewfB99e/arVo5MJqcq/SpvMi+njnaJDMsdS51
 dQrqvKKE9JRUOK6s85f1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bmNCB1gxVX4=:J/sglHkC1SJ4i/puh7f5KG
 dCF/XX0YugPYdaSgqSNypFVuDenNFU+oCu4TKRRwGWAIBLeamPuuMf+aucPSGfwqoqqYTncMJ
 4Y2C0vtbYbQYCje6UG921VNMRlWV+ndKj761KYBaJT2X+78KWkMS1noc2RoIWcAN6v/pF1YyH
 +Fby8SiOTsGBG1mDDTN/ssLKhahM4HkYrinnTh2cg+R5jTurQNhDTfFm+gylQVR1/Mobs/K3M
 X/8vHQo8fXHoC7b1S2KSlvR2ncMjkFQnlAGmtw+TyBVryZg5PogTjvbT0wTGapNf0hH/Twhux
 mAgtbfH5jYgHDZTGcQuV4b6Cn8ZBhCVnsK+q0PAJ44GFyHiHk3xlB1Z6LgM/4Mhk3SQZYAt95
 HQEp+v9VbHJzldFFRpAnmN4lHxtdoud7052dQJk80JS1fIja/+3A5flzITM5O8xN3fob/PLwZ
 aKoet4dDHwT1lJmkc6QxgACT6iKX2EdbcJ43kot45O0ML9yAydqQ1LOGfRbI6LyI3nxlC+NpR
 f0ldMq0bSoIXIiyTDkdoUyqCa4U9jkzfwt9riKJVC0fTWwbD1GpWXjvxtJeppGBbxxd6epXsf
 OBbRFtP2rYa5Q9gzazfKov7NFaNE0sq6h8eWClMzzh3jISA7+wlgEWfHKcCZuAS3MXLDDS0vp
 8ITJrqIIZvQcTeMG2WzcNDXIRl53L9mj6PQUwwz5koz6EL6kI9/Uaj0eg3hPRaUGSsL5F2Xbl
 M8LFguEVjqKtgnzICeLDLiMYV3eBRHONudG/f51BQhHteKhnY7j8VB8RKhH/mdNguD7/Awai1
 ArXuA3seKBHMYr9gTPayeCQx/Ik20Mn2pbRs6XUaAHrOFqH2kRlIRBq5i8bY2ievvJzigcJad
 Xtny68ZVsbldCPRcHxk6RRaov343h1B1sHtF1FP9NS82gbvPMpLR2jcK41RmFzREE3UKt7U/l
 BvQEh/nP4YJpnfdhA4LZH9WYP0fDechUpM/GRzRVFvOOSbrhh7z5gjuypt43stQ+xI+0LVLM3
 I+g8dcrv00Dv/2ssYMrBKToRgCMt2ZJhc600Jx8OxBsTOf6suchlWHJkb5F8RJMy8BQDNWBQZ
 jm/PSdl6IbIHOI=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2 1/9] serial: core: move RS485 configuration
	tasks from drivers into core
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

Several drivers that support setting the RS485 configuration via userspace
implement one or more of the following tasks:

- in case of an invalid RTS configuration (both RTS after send and RTS on
  send set or both unset) fall back to enable RTS on send and disable RTS
  after send

- nullify the padding field of the returned serial_rs485 struct

- copy the configuration into the uart port struct

- limit RTS delays to 100 ms

Move these tasks into the serial core to make them generic and to provide
a consistent behaviour among all drivers.

Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
---
 drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
 include/uapi/linux/serial.h      |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 846192a7b4bf..a4f7e847d414 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1282,8 +1282,26 @@ static int uart_set_rs485_config(struct uart_port *port,
 	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
 		return -EFAULT;
 
+	/* pick sane settings if the user hasn't */
+	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
+	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
+		rs485.flags |= SER_RS485_RTS_ON_SEND;
+		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
+	}
+
+	rs485.delay_rts_before_send = min_t(unsigned int,
+					    rs485.delay_rts_before_send,
+					    SER_RS485_MAX_RTS_DELAY);
+	rs485.delay_rts_after_send = min_t(unsigned int,
+					   rs485.delay_rts_after_send,
+					   SER_RS485_MAX_RTS_DELAY);
+	/* Return clean padding area to userspace */
+	memset(rs485.padding, 0, sizeof(rs485.padding));
+
 	spin_lock_irqsave(&port->lock, flags);
 	ret = port->rs485_config(port, &rs485);
+	if (!ret)
+		port->rs485 = rs485;
 	spin_unlock_irqrestore(&port->lock, flags);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
index fa6b16e5fdd8..859045a53231 100644
--- a/include/uapi/linux/serial.h
+++ b/include/uapi/linux/serial.h
@@ -128,6 +128,9 @@ struct serial_rs485 {
 							   (if supported) */
 	__u32	delay_rts_before_send;	/* Delay before send (milliseconds) */
 	__u32	delay_rts_after_send;	/* Delay after send (milliseconds) */
+#define SER_RS485_MAX_RTS_DELAY		100		/* Max time with active
+							   RTS before/after
+							   data sent (msecs) */
 	__u32	padding[5];		/* Memory is cheap, new structs
 					   are a royal PITA .. */
 };

base-commit: 802d00bd774b77fe132e9e83462b96fb9919411c
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
