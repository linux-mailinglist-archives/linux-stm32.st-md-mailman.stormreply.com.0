Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF704384E7
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Oct 2021 21:24:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6030C57B6C;
	Sat, 23 Oct 2021 19:24:32 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B4EC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Oct 2021 19:24:30 +0000 (UTC)
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id eMcymCjNuTdRTeMczmKM3J; Sat, 23 Oct 2021 21:24:29 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 23 Oct 2021 21:24:29 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mathieu.poirier@linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org,
 leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Sat, 23 Oct 2021 21:24:22 +0200
Message-Id: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] coresight: Use devm_bitmap_zalloc when
	applicable
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

'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
simplify code, improve the semantic and avoid some open-coded arithmetic
in allocator arguments.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hwtracing/coresight/coresight-stm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 58062a5a8238..db9eada24275 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -862,7 +862,6 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	struct stm_drvdata *drvdata;
 	struct resource *res = &adev->res;
 	struct resource ch_res;
-	size_t bitmap_size;
 	struct coresight_desc desc = { 0 };
 
 	desc.name = coresight_alloc_device_name(&stm_devs, dev);
@@ -904,9 +903,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	else
 		drvdata->numsp = stm_num_stimulus_port(drvdata);
 
-	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
-
-	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
+	guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp, GFP_KERNEL);
 	if (!guaranteed)
 		return -ENOMEM;
 	drvdata->chs.guaranteed = guaranteed;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
