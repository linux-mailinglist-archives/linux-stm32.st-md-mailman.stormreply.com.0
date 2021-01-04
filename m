Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FF2E94DF
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 13:31:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BDCFC56633;
	Mon,  4 Jan 2021 12:31:36 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00925C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 12:31:33 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D8ZkF0tDFz1qs3D;
 Mon,  4 Jan 2021 13:31:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D8ZkD6kHQz1qwHL;
 Mon,  4 Jan 2021 13:31:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id UBpcbJBXi3YL; Mon,  4 Jan 2021 13:31:31 +0100 (CET)
X-Auth-Info: RgYTZg3PO1nqOX+KXtrEzYKNrMuAK5yKDL3Cn6k+JsE=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  4 Jan 2021 13:31:31 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-spi@vger.kernel.org
Date: Mon,  4 Jan 2021 13:31:14 +0100
Message-Id: <20210104123114.261596-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Alain Volmat <alain.volmat@st.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Roman Guskov <rguskov@dh-electronics.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: Simplify
	stm32h7_spi_prepare_fthlv()
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

Simplify stm32h7_spi_prepare_fthlv() function implementation,
no functional change intended.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Roman Guskov <rguskov@dh-electronics.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-spi@vger.kernel.org
---
NOTE: Please review thoroughly and test
---
 drivers/spi/spi-stm32.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 6017209c6d2f..510738191cd1 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -473,34 +473,14 @@ static int stm32_spi_prepare_mbr(struct stm32_spi *spi, u32 speed_hz,
  */
 static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi, u32 xfer_len)
 {
-	u32 fthlv, half_fifo, packet;
+	u32 packet, bpw;
 
 	/* data packet should not exceed 1/2 of fifo space */
-	half_fifo = (spi->fifo_size / 2);
-
-	/* data_packet should not exceed transfer length */
-	if (half_fifo > xfer_len)
-		packet = xfer_len;
-	else
-		packet = half_fifo;
-
-	if (spi->cur_bpw <= 8)
-		fthlv = packet;
-	else if (spi->cur_bpw <= 16)
-		fthlv = packet / 2;
-	else
-		fthlv = packet / 4;
+	packet = clamp(xfer_len, 1U, spi->fifo_size / 2);
 
 	/* align packet size with data registers access */
-	if (spi->cur_bpw > 8)
-		fthlv += (fthlv % 2) ? 1 : 0;
-	else
-		fthlv += (fthlv % 4) ? (4 - (fthlv % 4)) : 0;
-
-	if (!fthlv)
-		fthlv = 1;
-
-	return fthlv;
+	bpw = DIV_ROUND_UP(spi->cur_bpw, 8);
+	return DIV_ROUND_UP(packet, bpw);
 }
 
 /**
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
