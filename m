Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E1444865
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Nov 2021 19:39:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B127C5E2CA;
	Wed,  3 Nov 2021 18:39:23 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CC1C5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Nov 2021 18:39:22 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id iLANmt2fXUGqliLAOmrupw; Wed, 03 Nov 2021 19:39:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 19:39:21 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mathieu.poirier@linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org,
 leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed,  3 Nov 2021 19:39:18 +0100
Message-Id: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] coresight: Use devm_bitmap_zalloc when
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
v1 --> v2: remove the 'guaranteed' variable to be even less verbose
---
 drivers/hwtracing/coresight/coresight-stm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 58062a5a8238..bb14a3a8a921 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -856,13 +856,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret;
 	void __iomem *base;
-	unsigned long *guaranteed;
 	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct stm_drvdata *drvdata;
 	struct resource *res = &adev->res;
 	struct resource ch_res;
-	size_t bitmap_size;
 	struct coresight_desc desc = { 0 };
 
 	desc.name = coresight_alloc_device_name(&stm_devs, dev);
@@ -904,12 +902,10 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	else
 		drvdata->numsp = stm_num_stimulus_port(drvdata);
 
-	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
-
-	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
-	if (!guaranteed)
+	drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
+						     GFP_KERNEL);
+	if (!drvdata->chs.guaranteed)
 		return -ENOMEM;
-	drvdata->chs.guaranteed = guaranteed;
 
 	spin_lock_init(&drvdata->spinlock);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
