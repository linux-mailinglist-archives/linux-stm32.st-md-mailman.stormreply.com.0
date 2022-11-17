Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6A62D405
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Nov 2022 08:25:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A77EC65067;
	Thu, 17 Nov 2022 07:25:30 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E12C6504B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 06:09:57 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NCTz71KRBz8R03x;
 Thu, 17 Nov 2022 14:09:55 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2AH69oDu086933;
 Thu, 17 Nov 2022 14:09:50 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Nov 2022 14:09:52 +0800 (CST)
Date: Thu, 17 Nov 2022 14:09:52 +0800 (CST)
X-Zmail-TransId: 2af96375d030ffffffff8b256cdf
X-Mailer: Zmail v1.0
Message-ID: <202211171409524332954@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <rafael@kernel.org>
X-MAIL: mse-fl2.zte.com.cn 2AH69oDu086933
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 6375D033.000 by FangMail milter!
X-FangMail-Envelope: 1668665395/4NCTz71KRBz8R03x/6375D033.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6375D033.000/4NCTz71KRBz8R03x
X-Mailman-Approved-At: Thu, 17 Nov 2022 07:25:29 +0000
Cc: daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH=5D_thermal=3A_use_devm=5Fplatfor?=
	=?utf-8?q?m=5Fget=5Fand=5Fioremap=5Fresource=28=29?=
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/thermal/st/stm_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 78feb802a87d..e7834ccc7976 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -488,7 +488,6 @@ MODULE_DEVICE_TABLE(of, stm_thermal_of_match);
 static int stm_thermal_probe(struct platform_device *pdev)
 {
 	struct stm_thermal_sensor *sensor;
-	struct resource *res;
 	void __iomem *base;
 	int ret;

@@ -506,8 +505,7 @@ static int stm_thermal_probe(struct platform_device *pdev)

 	sensor->dev = &pdev->dev;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.25.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
