Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C11017E4CA7
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Nov 2023 00:22:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 692BBC6B44B;
	Tue,  7 Nov 2023 23:22:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 354ABC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 23:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7CB11CE0219;
 Tue,  7 Nov 2023 23:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5B1C433C7;
 Tue,  7 Nov 2023 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699399355;
 bh=+CbiV6rpXCNM6vhS/PR5+TmIMmNSjDz1OXp5IClnHWY=;
 h=From:To:Cc:Subject:Date:From;
 b=ppLF/uAX6TCx6i0kRXOW+epaJ/1C9INp1UglbkanA6RtlUloLywiBg0Iuxtawgg9H
 2Tt6BPxkT3Xb6NOuIExSc5dNX8bGVDlRb6FPL/S4AFl+yPFcADIpPyfDxkahI4tXVf
 b4z9nprXsiifyxHq5/Rwp/WZRnvsyZkeKuYMJnCil0pZ5LpN7SD0WOTHG5zBDcKxJl
 F3HCFnaw+S/dsyKhL9Iy3iyN0rofoydLK2RWH91oIppExdX8QVTXMozO2C1LLeTHB8
 JUQz3VJSxq5HMHDyf3dF2nVDSal8c4xN4uXS9cUWfSjMm6jycqmkjJYP+KJ+RoQ4Ja
 pYMW8Wyk4aQSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  7 Nov 2023 18:21:55 -0500
Message-ID: <20231107232231.3775605-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Cc: Sasha Levin <sashal@kernel.org>, robh@kernel.org, heiko@sntech.de,
 frank.li@vivo.com, linux-iio@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.6 01/18] iio: adc: stm32-adc: harden
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
index 2f082006550fd..bbd5bdd732f01 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -708,6 +708,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	struct stm32_adc_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id;
+
 	struct resource *res;
 	u32 max_rate;
 	int ret;
@@ -720,8 +722,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
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
