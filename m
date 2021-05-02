Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5C370C20
	for <lists+linux-stm32@lfdr.de>; Sun,  2 May 2021 16:05:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF56C58D7A;
	Sun,  2 May 2021 14:05:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CCDAC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 May 2021 14:05:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 866DC6102A;
 Sun,  2 May 2021 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619964313;
 bh=lUX4eytSW0bGZZYiuwe9s9CZeSADcmyNb4eWnzvha/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KXR3I1Z3inrnG4in57J/MruXywKCsBE8xnlcdCmjouytG7jT8XmeNyeo+rVHEfD0m
 lytIJKbXzie2Ytoofam3zgb7VqWQuztf2PVRvLjkPYe4TeyxdX6wPQE7SxvOH2TDev
 OYud/Jxt8jZydQEGCJkfRJnWagY6oCbkVa8i9dPtfEq75JinnRBWoRZcTMKFox3uD9
 mVoC3pLrC8EFpJfkqsq2RMl9jZ4EX+RunomwnN2f9WRS+OZC7wbz8GMZgkuxQRKl87
 US8ZDWQ7KVNd4t/2xZJAp3CUHAzVYhH+RsVPBhDjVb8w8SSAaTIV3VdcxPrvBnvXLj
 Fp0aaOXRenXyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun,  2 May 2021 10:04:31 -0400
Message-Id: <20210502140434.2719553-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140434.2719553-1-sashal@kernel.org>
References: <20210502140434.2719553-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Shixin Liu <liushixin2@huawei.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 31/34] crypto: stm32/cryp - Fix PM
	reference leak on stm32-cryp.c
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

From: Shixin Liu <liushixin2@huawei.com>

[ Upstream commit 747bf30fd944f02f341b5f3bc7d97a13f2ae2fbe ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Signed-off-by: Shixin Liu <liushixin2@huawei.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/stm32/stm32-cryp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index ba5ea6434f9c..9b3511236ba2 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -537,7 +537,7 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 	int ret;
 	u32 cfg, hw_mode;
 
-	pm_runtime_get_sync(cryp->dev);
+	pm_runtime_resume_and_get(cryp->dev);
 
 	/* Disable interrupt */
 	stm32_cryp_write(cryp, CRYP_IMSCR, 0);
@@ -2054,7 +2054,7 @@ static int stm32_cryp_remove(struct platform_device *pdev)
 	if (!cryp)
 		return -ENODEV;
 
-	ret = pm_runtime_get_sync(cryp->dev);
+	ret = pm_runtime_resume_and_get(cryp->dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
