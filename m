Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FC264EEC
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 21:29:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAFA3C424BA;
	Thu, 10 Sep 2020 19:29:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF6DC424B9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 19:29:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E329221E3;
 Thu, 10 Sep 2020 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599766173;
 bh=EfUI1dyzt3SWILGjbm4xkkgdUT1vq2/kiW2omjKTGf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OSCBpD756N1pMGFV1zwLMRNM19gRS8a2dhOg90mvNF7mb+Ar1IgS2igUxh3Bo2Weq
 ESCmBWUVBP2inW2aO8MjkGBUVRmj/A+FiXF6LGNzv9ryvdxBQJZw5U0AbFk1DOJwNp
 S4UkmbMXjHDszVqNzkujQJ/hVuLqH1mvXIH0NG4Y=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 10 Sep 2020 21:29:18 +0200
Message-Id: <20200910192919.12503-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910192919.12503-1-krzk@kernel.org>
References: <20200910192919.12503-1-krzk@kernel.org>
Cc: Iuliana Prodan <iuliana.prodan@nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 3/4] crypto: stm32-hash - Simplify with
	dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/crypto/stm32/stm32-hash.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index e84330f247d9..e3e25278a970 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1464,14 +1464,9 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	}
 
 	hdev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(hdev->clk)) {
-		if (PTR_ERR(hdev->clk) != -EPROBE_DEFER) {
-			dev_err(dev, "failed to get clock for hash (%lu)\n",
-				PTR_ERR(hdev->clk));
-		}
-
-		return PTR_ERR(hdev->clk);
-	}
+	if (IS_ERR(hdev->clk))
+		return dev_err_probe(dev, PTR_ERR(hdev->clk),
+				     "failed to get clock for hash\n");
 
 	ret = clk_prepare_enable(hdev->clk);
 	if (ret) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
