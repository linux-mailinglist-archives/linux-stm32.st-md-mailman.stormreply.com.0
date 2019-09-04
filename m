Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC9A8260
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 14:34:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 033D1C35E01;
	Wed,  4 Sep 2019 12:34:29 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FBF9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 12:34:28 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9CD8AFFFA055F3DC3ABE;
 Wed,  4 Sep 2019 20:34:24 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 20:34:17 +0800
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
Date: Wed, 4 Sep 2019 20:29:24 +0800
Message-ID: <20190904122939.23780-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next 00/15] use
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

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (15):
  thermal: armada: use devm_platform_ioremap_resource() to simplify code
  thermal: bcm2835: use devm_platform_ioremap_resource() to simplify
    code
  thermal: brcmstb: use devm_platform_ioremap_resource() to simplify
    code
  thermal: hisilicon: use devm_platform_ioremap_resource() to simplify
    code
  thermal: dove: use devm_platform_ioremap_resource() to simplify code
  thermal: mtk: use devm_platform_ioremap_resource() to simplify code
  thermal: kirkwood: use devm_platform_ioremap_resource() to simplify
    code
  thermal: tsens: use devm_platform_ioremap_resource() to simplify code
  thermal: rockchip: use devm_platform_ioremap_resource() to simplify
    code
  thermal: spear: use devm_platform_ioremap_resource() to simplify code
  thermal: stm32: use devm_platform_ioremap_resource() to simplify code
  thermal: tango: use devm_platform_ioremap_resource() to simplify code
  thermal: thermal_mmio: use devm_platform_ioremap_resource() to
    simplify code
  thermal: zx2967: use devm_platform_ioremap_resource() to simplify code
  thermal: rcar: use devm_platform_ioremap_resource() to simplify code

 drivers/thermal/armada_thermal.c           | 4 +---
 drivers/thermal/broadcom/bcm2835_thermal.c | 4 +---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +---
 drivers/thermal/dove_thermal.c             | 7 ++-----
 drivers/thermal/hisi_thermal.c             | 4 +---
 drivers/thermal/kirkwood_thermal.c         | 4 +---
 drivers/thermal/mtk_thermal.c              | 4 +---
 drivers/thermal/qcom/tsens-common.c        | 7 ++-----
 drivers/thermal/rcar_thermal.c             | 5 ++---
 drivers/thermal/rockchip_thermal.c         | 4 +---
 drivers/thermal/spear_thermal.c            | 4 +---
 drivers/thermal/st/stm_thermal.c           | 4 +---
 drivers/thermal/tango_thermal.c            | 4 +---
 drivers/thermal/thermal_mmio.c             | 4 +---
 drivers/thermal/zx2967_thermal.c           | 4 +---
 15 files changed, 18 insertions(+), 49 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
