Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A435A8272
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 14:35:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4922C35E0D;
	Wed,  4 Sep 2019 12:35:07 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3458AC35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 12:35:06 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C8C813E6C863CC25DDB0;
 Wed,  4 Sep 2019 20:35:03 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 20:34:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <miquel.raynal@bootlin.com>, <rui.zhang@intel.com>, <edubezval@gmail.com>, 
 <daniel.lezcano@linaro.org>, <amit.kucheria@verdurent.com>,
 <eric@anholt.net>, <wahrenst@gmx.net>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <mmayer@broadcom.com>,
 <computersforpeace@gmail.com>, <gregory.0xf0@gmail.com>,
 <matthias.bgg@gmail.com>, <agross@kernel.org>, <heiko@sntech.de>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <marc.w.gonzalez@free.fr>, <mans@mansr.com>, <talel@amazon.com>,
 <jun.nie@linaro.org>, <shawnguo@kernel.org>, <phil@raspberrypi.org>,
 <yuehaibing@huawei.com>, <gregkh@linuxfoundation.org>,
 <david.hernandezsanchez@st.com>, <horms+renesas@verge.net.au>,
 <wsa+renesas@sang-engineering.com>
Date: Wed, 4 Sep 2019 20:29:39 +0800
Message-ID: <20190904122939.23780-16-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190904122939.23780-1-yuehaibing@huawei.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next 15/15] thermal: rcar: use
	devm_platform_ioremap_resource() to simplify code
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

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/thermal/rcar_thermal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index d0873de..d7f6aab 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -523,9 +523,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			 * Then, driver uses common registers
 			 * rcar_has_irq_support() will be enabled
 			 */
-			res = platform_get_resource(pdev, IORESOURCE_MEM,
-						    mres++);
-			common->base = devm_ioremap_resource(dev, res);
+			common->base = devm_platform_ioremap_resource(pdev,
+								      mres++);
 			if (IS_ERR(common->base))
 				return PTR_ERR(common->base);
 
-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
