Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632F25E8A0
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Sep 2020 17:19:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3137AC3FADB;
	Sat,  5 Sep 2020 15:19:42 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D40C3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Sep 2020 15:19:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BkJB34Lzyz1rtyY;
 Sat,  5 Sep 2020 17:19:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BkJB33fg7z1qy6Y;
 Sat,  5 Sep 2020 17:19:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HKxPIvQkAkdx; Sat,  5 Sep 2020 17:19:38 +0200 (CEST)
X-Auth-Info: 1P9+LL5s6mTX0SM2SwU4fZXO4EUujbYRKO3bgSiMtTc=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat,  5 Sep 2020 17:19:38 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-spi@vger.kernel.org
Date: Sat,  5 Sep 2020 17:19:13 +0200
Message-Id: <20200905151913.117775-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Antonio Borneo <borneo.antonio@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] spi: stm32: Rate-limit the 'Communication
	suspended' message
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

The 'spi_stm32 44004000.spi: Communication suspended' message means that
when using PIO, the kernel did not read the FIFO fast enough and so the
SPI controller paused the transfer. Currently, this is printed on every
single such event, so if the kernel is busy and the controller is pausing
the transfers often, the kernel will be all the more busy scrolling this
message into the log buffer every few milliseconds. That is not helpful.

Instead, rate-limit the message and print it every once in a while. It is
not possible to use the default dev_warn_ratelimited(), because that is
still too verbose, as it prints 10 lines (DEFAULT_RATELIMIT_BURST) every
5 seconds (DEFAULT_RATELIMIT_INTERVAL). The policy here is to print 1 line
every 50 seconds (DEFAULT_RATELIMIT_INTERVAL * 10), because 1 line is more
than enough and the cycles saved on printing are better left to the CPU to
handle the SPI. However, dev_warn_once() is also not useful, as the user
should be aware that this condition is possibly recurring or ongoing. Thus
the custom rate-limit policy.

Finally, turn the message from dev_warn() to dev_dbg(), since the system
does not suffer any sort of malfunction if this message appears, it is
just slowing down. This further reduces the printing into the log buffer
and frees the CPU to do useful work.

Fixes: dcbe0d84dfa5 ("spi: add driver for STM32 SPI controller")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Antonio Borneo <borneo.antonio@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index d4b33b358a31..a00f6b51ccbf 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -936,7 +936,11 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	}
 
 	if (sr & STM32H7_SPI_SR_SUSP) {
-		dev_warn(spi->dev, "Communication suspended\n");
+		static DEFINE_RATELIMIT_STATE(rs,
+					      DEFAULT_RATELIMIT_INTERVAL * 10,
+					      1);
+		if (__ratelimit(&rs))
+			dev_dbg_ratelimited(spi->dev, "Communication suspended\n");
 		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
 			stm32h7_spi_read_rxfifo(spi, false);
 		/*
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
