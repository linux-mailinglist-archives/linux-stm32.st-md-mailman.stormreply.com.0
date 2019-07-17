Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6306B960
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2019 11:38:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43228C6506E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2019 09:38:52 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D6AC588E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2019 09:17:02 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15d2ee76d2e7-86565;
 Wed, 17 Jul 2019 17:16:30 +0800 (CST)
X-RM-TRANSID: 2ee15d2ee76d2e7-86565
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65d2ee76dcd3-a1b74;
 Wed, 17 Jul 2019 17:16:29 +0800 (CST)
X-RM-TRANSID: 2ee65d2ee76dcd3-a1b74
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Wed, 17 Jul 2019 17:16:28 +0800
Message-Id: <1563354988-23826-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 17 Jul 2019 09:38:51 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stm class: Fix a double free of
	stm_source_device
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

put_device will call stm_source_device_release to free
stm_source_device, so remove the kfree.

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/hwtracing/stm/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index e55b902..181e7ff 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -1276,7 +1276,6 @@ int stm_source_register_device(struct device *parent,
 
 err:
 	put_device(&src->dev);
-	kfree(src);
 
 	return err;
 }
-- 
1.9.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
