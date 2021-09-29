Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8D41CF34
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 00:25:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F112BC5A4F8;
	Wed, 29 Sep 2021 22:25:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E64C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 22:25:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5633361425;
 Wed, 29 Sep 2021 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632954318;
 bh=gCBBC7JLGcZQaPz+Vpq0Pd8Hio930/7xgACvcEd+XUY=;
 h=Date:From:To:Cc:Subject:From;
 b=VQjSOMwzO2qj85XL58H9btVmTAisQxj9svagsvJ6Fs1umbMjHiELrKopvMjhlXg2t
 EAP0K+SlqqlNQ+pNDOw8GXjcAkF/wP/n31E5BRUhe82OBzspT6S7YBIzxJY79iu0/I
 jB8TWO2wVwhzXWNfWEdC2mznHwmsOI86fGjBusdQ2f6lvOpBHCI9xfrPQVLLh+5xqo
 GclWImlBNL0OMGqYw8Lk62q+IF6kHK+E70AgPj9Sx1alMFoOmilsKP8nr9OLwSkg5P
 hFxaUdEEYJiYFgNWjs4cDvbXUaPAwMfnUmfwJ2VLI7WxAzerck07FJkbcC6bpzksmL
 OTg52+ALhspWw==
Date: Wed, 29 Sep 2021 17:29:22 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20210929222922.GA357509@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH][next] dmaengine: stm32-mdma: Use
 struct_size() helper in devm_kzalloc()
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

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worse scenario, could lead to heap overflows.

Link: https://github.com/KSPP/linux/issues/160
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/dma/stm32-mdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 18cbd1e43c2e..d30a4a28d3bf 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1566,7 +1566,8 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 	if (count < 0)
 		count = 0;
 
-	dmadev = devm_kzalloc(&pdev->dev, sizeof(*dmadev) + sizeof(u32) * count,
+	dmadev = devm_kzalloc(&pdev->dev,
+			      struct_size(dmadev, ahb_addr_masks, count),
 			      GFP_KERNEL);
 	if (!dmadev)
 		return -ENOMEM;
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
