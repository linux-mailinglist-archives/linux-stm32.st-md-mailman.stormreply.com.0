Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418891D810
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 08:23:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 245B5C6DD9A;
	Mon,  1 Jul 2024 06:23:26 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFE8DC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719814996; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=K0ZmPMNyaItxarb5ePgYH1LDi6uPvP8+DUmCHVAnCI8=;
 b=nZbgJZCxTgBcGZlnl0+RLFfGgY7XpOAPSU2LJua1qozkTvwbei+josdHzrtyAtRNneZISkcQFBQJMAvyfx9Jfwe3nYLDxgCwxLuiWmgu3nzOVNcLfCGQ3y40Qs/K9hu7XXVHtB0b6BNWHZbBBRWAIxYqpU/hxW5FoUdsFsIN7vg=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067111;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0W9ZzIKT_1719814985; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W9ZzIKT_1719814985) by smtp.aliyun-inc.com;
 Mon, 01 Jul 2024 14:23:15 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: yannick.fertre@foss.st.com
Date: Mon,  1 Jul 2024 14:23:04 +0800
Message-Id: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, daniel@ffwll.ch,
 Abaci Robot <abaci@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 tzimmermann@suse.de, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: Remove unnecessary .owner for
	lvds_platform_driver
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

Remove .owner field if calls are used which set it automatically.

./drivers/gpu/drm/stm/lvds.c:1213:3-8: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9457
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/stm/lvds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 2fa2c81784e9..06f2d7a56cc9 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1210,7 +1210,6 @@ static struct platform_driver lvds_platform_driver = {
 	.remove = lvds_remove,
 	.driver = {
 		.name = "stm32-display-lvds",
-		.owner = THIS_MODULE,
 		.of_match_table = lvds_dt_ids,
 	},
 };
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
