Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFA5FBE2E
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 01:11:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88307C640F5;
	Tue, 11 Oct 2022 23:11:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68FD5C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 23:11:05 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4DD3184F00;
 Wed, 12 Oct 2022 01:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665529864;
 bh=yEW+tkEuff3nzVnUoqcCLQiVufYXXZ2BrS3mZUbKEg4=;
 h=From:To:Cc:Subject:Date:From;
 b=TD6HA8pZ04BZPSoqMyKKwsBkWYydtOo+7QSwXHNShJnz1BlqkKRs6JHLoKQEfmuQR
 Z1n+DEdkBRAz+4+NSoq5tdajgsaHWBJtZYfU3GUDXvXmPNJTydUP/FnlNxtAg9g5tk
 nAvl7UStfPDegQ/FYqdAOctTmvK+o9cJryWMG8F2awc+ZQ/G9HqTJPrOJCY1iLanIW
 4oMevdAVLJl9+Ji/7jPRPpcZ7/VSHxzw84pYXh3eBwiEW0VxrLGstdF72myXd/4K4m
 fxVbVn7nEf558nPpttSv1ySoBo2aJ/tfZtUJtprec8fRMVNjRSMgxXYzYoioMegkxF
 GnJP8TNJzpqbQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Date: Wed, 12 Oct 2022 01:10:48 +0200
Message-Id: <20221011231048.505967-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: Fix resolution bitmasks
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

STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC synchronization size configuration
register (LTDC_SSCR)" on page 1784 and onward indicates VSH and similar
bits are all [11:0] instead of [10:0] wide. Fix this.

[1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/stm/ltdc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 03c6becda795c..639ed00b44a57 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -111,16 +111,16 @@
 #define LTDC_L1FPF1R	(ldev->caps.layer_regs[24])	/* L1 Flexible Pixel Format 1 */
 
 /* Bit definitions */
-#define SSCR_VSH	GENMASK(10, 0)	/* Vertical Synchronization Height */
+#define SSCR_VSH	GENMASK(11, 0)	/* Vertical Synchronization Height */
 #define SSCR_HSW	GENMASK(27, 16)	/* Horizontal Synchronization Width */
 
-#define BPCR_AVBP	GENMASK(10, 0)	/* Accumulated Vertical Back Porch */
+#define BPCR_AVBP	GENMASK(11, 0)	/* Accumulated Vertical Back Porch */
 #define BPCR_AHBP	GENMASK(27, 16)	/* Accumulated Horizontal Back Porch */
 
-#define AWCR_AAH	GENMASK(10, 0)	/* Accumulated Active Height */
+#define AWCR_AAH	GENMASK(11, 0)	/* Accumulated Active Height */
 #define AWCR_AAW	GENMASK(27, 16)	/* Accumulated Active Width */
 
-#define TWCR_TOTALH	GENMASK(10, 0)	/* TOTAL Height */
+#define TWCR_TOTALH	GENMASK(11, 0)	/* TOTAL Height */
 #define TWCR_TOTALW	GENMASK(27, 16)	/* TOTAL Width */
 
 #define GCR_LTDCEN	BIT(0)		/* LTDC ENable */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
