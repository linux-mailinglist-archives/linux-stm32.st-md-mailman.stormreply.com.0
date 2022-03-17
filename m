Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657004DBC88
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 02:37:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17C70C60467;
	Thu, 17 Mar 2022 01:37:52 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21A0FC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 01:37:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R641e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0V7PI2DK_1647481060; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V7PI2DK_1647481060) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 17 Mar 2022 09:37:47 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: patrice.chotard@foss.st.com
Date: Thu, 17 Mar 2022 09:37:38 +0800
Message-Id: <20220317013738.122877-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: platform: Remove unused including
	<linux/version.h>
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

Eliminate the follow versioncheck warning:

./drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h: 16
linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h b/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h
index 5ab7ca448cf9..f8d97841f366 100644
--- a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h
+++ b/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h
@@ -13,7 +13,6 @@
 #include <linux/dvb/dmx.h>
 #include <linux/dvb/frontend.h>
 #include <linux/gpio.h>
-#include <linux/version.h>
 
 #include <media/dmxdev.h>
 #include <media/dvb_demux.h>
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
