Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A44F7016
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 03:16:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FDADC6049C;
	Thu,  7 Apr 2022 01:16:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 934B3C6049B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 01:16:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E6C6B8268C;
 Thu,  7 Apr 2022 01:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE83DC385A8;
 Thu,  7 Apr 2022 01:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649294188;
 bh=rtSw1l7QdPTLRBp089iUJcQX1L9N+GkfaDN1OeqXWJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rKJd6gA5a1JKgxjHsjUk/tTNgbOV+cREJGlqIV9PSBceCH31QBHU4YA3dlEuxWnD/
 OIAGQqyRj8XrrpyJNOlx8zFUYh7pDjl5rX9PcjxoJidgT5iPoBorLa5SCUM97KwmZF
 O4pTlqq1UGnUi3Kx1pnOz8/lQeFi37umEURymbZlVwjlOsciEuj84Nm5yEkImvP873
 abepI95O6bd+nb+jA2qEXSKGWJFpDsKwbmRNyE8Hv+uG0Y6OU+3mCxYDjmcq/5V/Bh
 CuOI0ToVLaqLr/QbugxleHQREFjzI3dx0621dp7RxufR6jBqNzySSVp9uEoqwZ3ttW
 ESTMDgI3KvEtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:16:03 -0400
Message-Id: <20220407011609.115258-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011609.115258-1-sashal@kernel.org>
References: <20220407011609.115258-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-stm32@st-md-mailman.stormreply.com,
 Zheng Yongjun <zhengyongjun3@huawei.com>, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 06/11] crypto: stm32 - fix
	reference leak in stm32_crc_remove
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

From: Zheng Yongjun <zhengyongjun3@huawei.com>

[ Upstream commit e9a36feecee0ee5845f2e0656f50f9942dd0bed3 ]

pm_runtime_get_sync() will increment pm usage counter even it
failed. Forgetting to call pm_runtime_put_noidle will result
in reference leak in stm32_crc_remove, so we should fix it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/stm32/stm32_crc32.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/stm32/stm32_crc32.c b/drivers/crypto/stm32/stm32_crc32.c
index 6848f34a9e66..de645bf84980 100644
--- a/drivers/crypto/stm32/stm32_crc32.c
+++ b/drivers/crypto/stm32/stm32_crc32.c
@@ -334,8 +334,10 @@ static int stm32_crc_remove(struct platform_device *pdev)
 	struct stm32_crc *crc = platform_get_drvdata(pdev);
 	int ret = pm_runtime_get_sync(crc->dev);
 
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(crc->dev);
 		return ret;
+	}
 
 	spin_lock(&crc_list.lock);
 	list_del(&crc->list);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
