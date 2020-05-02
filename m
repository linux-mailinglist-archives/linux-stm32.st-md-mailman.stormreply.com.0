Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B271C336A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 May 2020 09:14:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D566C36B0E;
	Mon,  4 May 2020 07:14:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 928F7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 May 2020 14:27:08 +0000 (UTC)
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ABDA2496B;
 Sat,  2 May 2020 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588429627;
 bh=SWAgqFjQtH+44KzNB37D3YGOf7TBc55dGtMgscD5tck=;
 h=From:To:Cc:Subject:Date:From;
 b=R/cAwhPZR5OcZx2udyqGygLoioE2/RPOjZzU81BkV1Bbxd4/Xsd3lQuOESkBKbeoe
 284fPMtqJeVoN8K6AWgWiNHhxmLhAuQG1B0cV/WN4jip15NVyRez4zUmHvLg+t3SwX
 M6zp+ufgHWECupQ8pCJWfoVhieunt71VFxl4tBPI=
From: Wolfram Sang <wsa@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sat,  2 May 2020 16:27:04 +0200
Message-Id: <20200502142704.19308-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2020 07:14:44 +0000
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel@pengutronix.de,
 Wolfram Sang <wsa@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] rtc: stmp3xxx: update contact email
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

The 'pengutronix' address is defunct for years. Use the proper contact
address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index ff6488be385f..c9bc3d4a1e66 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -416,5 +416,5 @@ module_platform_driver(stmp3xxx_rtcdrv);
 
 MODULE_DESCRIPTION("STMP3xxx RTC Driver");
 MODULE_AUTHOR("dmitry pervushin <dpervushin@embeddedalley.com> and "
-		"Wolfram Sang <w.sang@pengutronix.de>");
+		"Wolfram Sang <kernel@pengutronix.de>");
 MODULE_LICENSE("GPL");
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
