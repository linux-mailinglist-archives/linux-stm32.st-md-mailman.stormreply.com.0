Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA118AFE87
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 04:36:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDAAEC6DD6D;
	Wed, 24 Apr 2024 02:36:18 +0000 (UTC)
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9450DC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1713926174; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=BzHtv+v5FsZg+1gMY5pUqSRj6b5kc5jgOVdLsLwEFOE=;
 b=yB6fuoRtrcfc1o/xIsDTJJh+Cdjftco15vHMScvhX0290YJ4AfxePBX5ycgFDEJwgFN21iZMgMfXmlfz5zW+oVmncNwM1DfAXf/NeWsGMcnFWlKP5BpElN3Hpuc5oGGC66LxVS1iGPBs/zhwQD7irFFksplfCKfc36xqX7VH66I=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0W5AjFF._1713926167; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W5AjFF._1713926167) by smtp.aliyun-inc.com;
 Wed, 24 Apr 2024 10:36:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: suzuki.poulose@arm.com
Date: Wed, 24 Apr 2024 10:36:05 +0800
Message-Id: <20240424023605.90489-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 james.clark@arm.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH] coresight: stm: Remove duplicate linux/acpi.h
	header
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

./drivers/hwtracing/coresight/coresight-stm.c: linux/acpi.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8871
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hwtracing/coresight/coresight-stm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index cbf7f17556f8..9ca04fac53fa 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -30,7 +30,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/stm.h>
 #include <linux/platform_device.h>
-#include <linux/acpi.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
