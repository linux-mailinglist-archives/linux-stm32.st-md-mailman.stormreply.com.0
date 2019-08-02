Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9C7F9E3
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2019 15:31:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E68C35E04;
	Fri,  2 Aug 2019 13:31:14 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B765C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:31:09 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 98B08AA14CE5C9058219;
 Fri,  2 Aug 2019 21:31:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:30:59 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <lars.persson@axis.com>,
 <jesper.nilsson@axis.com>, <davem@davemloft.net>, <thomas.lendacky@amd.com>,
 <gary.hook@amd.com>, <krzk@kernel.org>, <kgene@kernel.org>,
 <antoine.tenart@bootlin.com>, <matthias.bgg@gmail.com>,
 <jamie@jamieiles.com>, <agross@kernel.org>, <heiko@sntech.de>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <clabbe.montjoie@gmail.com>, <mripard@kernel.org>, <wens@csie.org>
Date: Fri, 2 Aug 2019 21:27:57 +0800
Message-ID: <20190802132809.8116-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next 00/12] crypto: use
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

YueHaibing (12):
  crypto: artpec6 - use devm_platform_ioremap_resource() to simplify
    code
  crypto: ccp - use devm_platform_ioremap_resource() to simplify code
  crypto: exynos - use devm_platform_ioremap_resource() to simplify code
  crypto: img-hash - use devm_platform_ioremap_resource() to simplify
    code
  crypto: inside-secure - use devm_platform_ioremap_resource() to
    simplify code
  crypto: mediatek - use devm_platform_ioremap_resource() to simplify
    code
  crypto: picoxcell - use devm_platform_ioremap_resource() to simplify
    code
  crypto: sunxi-ss - use devm_platform_ioremap_resource() to simplify
    code
  crypto: rockchip - use devm_platform_ioremap_resource() to simplify
    code
  crypto: stm32 - use devm_platform_ioremap_resource() to simplify code
  crypto: qce - use devm_platform_ioremap_resource() to simplify code
  crypto: qcom-rng - use devm_platform_ioremap_resource() to simplify
    code

 drivers/crypto/axis/artpec6_crypto.c    | 4 +---
 drivers/crypto/ccp/sp-platform.c        | 4 +---
 drivers/crypto/exynos-rng.c             | 4 +---
 drivers/crypto/img-hash.c               | 4 +---
 drivers/crypto/inside-secure/safexcel.c | 4 +---
 drivers/crypto/mediatek/mtk-platform.c  | 3 +--
 drivers/crypto/picoxcell_crypto.c       | 5 ++---
 drivers/crypto/qce/core.c               | 4 +---
 drivers/crypto/qcom-rng.c               | 4 +---
 drivers/crypto/rockchip/rk3288_crypto.c | 4 +---
 drivers/crypto/stm32/stm32-crc32.c      | 4 +---
 drivers/crypto/stm32/stm32-cryp.c       | 4 +---
 drivers/crypto/sunxi-ss/sun4i-ss-core.c | 4 +---
 13 files changed, 14 insertions(+), 38 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
