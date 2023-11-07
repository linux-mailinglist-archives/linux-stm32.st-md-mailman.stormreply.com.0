Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23E7E4CEC
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Nov 2023 00:24:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B791C6B44B;
	Tue,  7 Nov 2023 23:24:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA4AC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 23:24:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B8ED61233;
 Tue,  7 Nov 2023 23:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82808C433C7;
 Tue,  7 Nov 2023 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699399464;
 bh=nKbL8zNE6DDMrjx3mFVmsXHLtjE3u1TKNWQuIqrghuE=;
 h=From:To:Cc:Subject:Date:From;
 b=RuixqnJa71xgzYQvtPo0evzwWXGTagrVSPzVG26KTWTsGC1OEJXHFXqNS0G2/fLMl
 VlOz6hJQSWygatHE0VCdk/XGVYvRZw8Ehor1LfX3m1oPRJaNF6dRbA6HCNb7GLZ9xl
 7kHR9DWB1LA8/VpR3q1Dx8aGcg9+1Fdq5zfs8Zm7yLsUCgv454+YHCp5LHQ2sdjulm
 zTNNugbmEFGyt1Jox0eCSbLKrPrXOlluTjY8Pxv/+3r7TRE6nTghQR9261KR/l94Lc
 JdMK/nGb0r9dPL82H7kJHHwDDjmNU0Ao8BmIfJS5DUgvGHWapoESxKXnOKyx5cGFzM
 4zxlYj4dU4ikg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  7 Nov 2023 18:24:02 -0500
Message-ID: <20231107232420.3776419-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
Cc: Sasha Levin <sashal@kernel.org>, robh@kernel.org, frank.li@vivo.com,
 linux-iio@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.1 01/11] iio: adc: stm32-adc: harden
	against NULL pointer deref in stm32_adc_probe()
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

From: Zhang Shurong <zhang_shurong@foxmail.com>

[ Upstream commit 3a23b384e7e3d64d5587ad10729a34d4f761517e ]

of_match_device() may fail and returns a NULL pointer.

In practice there is no known reasonable way to trigger this, but
in case one is added in future, harden the code by adding the check

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
Link: https://lore.kernel.org/r/tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iio/adc/stm32-adc-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 81d5db91c67bf..dee47b899e5df 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -695,6 +695,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	struct stm32_adc_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id;
+
 	struct resource *res;
 	u32 max_rate;
 	int ret;
@@ -707,8 +709,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, &priv->common);
 
-	priv->cfg = (const struct stm32_adc_priv_cfg *)
-		of_match_device(dev->driver->of_match_table, dev)->data;
+	of_id = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_id)
+		return -ENODEV;
+
+	priv->cfg = (const struct stm32_adc_priv_cfg *)of_id->data;
 	priv->nb_adc_max = priv->cfg->num_adcs;
 	spin_lock_init(&priv->common.lock);
 
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
