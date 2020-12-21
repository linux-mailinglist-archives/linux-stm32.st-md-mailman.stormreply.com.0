Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C647B2E9165
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 09:02:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 845D7C57A49;
	Mon,  4 Jan 2021 08:02:44 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 AAAA1C5660F for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 12:36:11 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx3.securetransport.de (Postfix) with ESMTPSA id E39345DC66;
 Mon, 21 Dec 2020 13:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1608554159;
 bh=nST8Q8AKsnuSMPVhAthOon+hadYjnWFeGYymketrh0E=;
 h=From:To:CC:Subject:Date:From;
 b=c+EXL6MUMpv8uMPslEfGiAtrr2pWMEI6ANznFBl1wBiLdGK+h1kXo0tzIATG0f1x1
 TV5o2jWXApq91i2rOgUQ4XGqIlrADrDEguxsK2AZZB0Mj0ssc0BT/5C3ilk39eff7Q
 hvkPDvyMN9g/tfYmI9vigL0Sd2S63tK1ABpZPwhPhst5PicIZO8Nac0Kz/pxE5kPLa
 BRFAm8EUH5MC5gx7G5jtiqTYaPLm5eJxoHVh2oXmV3GBASugf25Pb4/kWldGk0YNSf
 Du5CW96/xJqRjd8mfGyi22Rh4iAsB7W02eZ62+s7IC98kOa6r1etLuCkBre+/SmMDs
 4vvFhW0VxpH7g==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) by
 DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; 
 Mon, 21 Dec 2020 13:35:47 +0100
Received: from Stretch.dh-electronics.org (10.64.6.176) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4
 via Frontend Transport; Mon, 21 Dec 2020 13:35:47 +0100
From: Roman Guskov <rguskov@dh-electronics.com>
To: <linux-spi@vger.kernel.org>
Date: Mon, 21 Dec 2020 13:35:32 +0100
Message-ID: <20201221123532.27272-1-rguskov@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:02:42 +0000
Cc: marex@denx.de, broonie@kernel.org,
 Roman Guskov <rguskov@dh-electronics.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] spi: stm32: FIFO threshold level - fix align
	packet size
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

if cur_bpw <= 8 and xfer_len < 4 then the value of fthlv will be 1 and
SPI registers content may have been lost.

* If SPI data register is accessed as a 16-bit register and DSIZE <= 8bit,
  better to select FTHLV = 2, 4, 6 etc

* If SPI data register is accessed as a 32-bit register and DSIZE > 8bit,
  better to select FTHLV = 2, 4, 6 etc, while if DSIZE <= 8bit,
  better to select FTHLV = 4, 8, 12 etc

Signed-off-by: Roman Guskov <rguskov@dh-electronics.com>
---
 drivers/spi/spi-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 9d8ceb63f7db..417c40154477 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -494,9 +494,9 @@ static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi, u32 xfer_len)
 
 	/* align packet size with data registers access */
 	if (spi->cur_bpw > 8)
-		fthlv -= (fthlv % 2); /* multiple of 2 */
+		fthlv += (fthlv % 2) ? 1 : 0;
 	else
-		fthlv -= (fthlv % 4); /* multiple of 4 */
+		fthlv += (fthlv % 4) ? (4 - (fthlv % 4)) : 0;
 
 	if (!fthlv)
 		fthlv = 1;
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
