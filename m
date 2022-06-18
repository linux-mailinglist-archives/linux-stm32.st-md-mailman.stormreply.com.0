Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A655074B
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 00:23:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9546C03FE0;
	Sat, 18 Jun 2022 22:23:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3423DC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 22:23:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D4EE802F2;
 Sun, 19 Jun 2022 00:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655591001;
 bh=kJt70BUTl+NEUpAdMwZZ+/3O2PeukyKpB52c+lZ7PUs=;
 h=From:To:Cc:Subject:Date:From;
 b=zXoH7uNR9fBpASqiabYjxoDoFxrq7HPEvWQh3OH3TjsiGAifn79tretKJGJmZfV4X
 126k/PcwiCMDcEJLAzcDr2hKtDUg7M1F2ul29rx6BHPKHWPCjht9EDz6Bxi3nQ69qC
 uPjEC7basp6DFEIO1OglV/GWZTrX8+4Ap+S8oO7JAIONfh5i84SMJ445T6kd7F3X1r
 j38qqUBMYwrXTj7nJ9o+nimKHAWkZQV6easCWdmkQYjPiVM64pwdEa93kuQplKAuP5
 5KJn3+fziRRm2KhDH8H3jSxgiZo+jNgPSodnpLuJmcIiuxFwsusUeRW567N94oywKZ
 smgWD09zPpsIw==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Date: Sun, 19 Jun 2022 00:23:17 +0200
Message-Id: <20220618222317.478187-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] media: stm32: dcmi: Fill in remaining Bayer
	formats
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

Fill in 10, 12, 14 bit Bayer formats into the DCMI driver.
Those are useful e.g. when MT9P006 sensor is connected.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 09a743cd70040..5f08ba47ea96b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1631,6 +1631,54 @@ static const struct dcmi_format dcmi_formats[] = {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.bpp = 2,
 	},
 };
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
