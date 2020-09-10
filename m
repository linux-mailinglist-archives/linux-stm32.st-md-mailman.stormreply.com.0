Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A76264EEB
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 21:29:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E401C424BA;
	Thu, 10 Sep 2020 19:29:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14408C424B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 19:29:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E598721D91;
 Thu, 10 Sep 2020 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599766169;
 bh=orngRUhSl9l3X7hGv/CI9HzZMY8gLdIvlGNKvUcPMhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0LrVyziBD+ZKBtC0vuwxz/pdDe5ERb2/m4gWYDms2mSX8hRmJ+3MJAfN5QFCstv8H
 hkk2UB3HmE0mb2UD26y1W/ya0AzJHesj0eCsa/mFutb1UQTxteRQu9siO1vi+7GJXH
 6H1PWhOGfcpaCDOdcgX9+9QnXwl1zRM6Un+Zfe3o=
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
Date: Thu, 10 Sep 2020 21:29:17 +0200
Message-Id: <20200910192919.12503-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910192919.12503-1-krzk@kernel.org>
References: <20200910192919.12503-1-krzk@kernel.org>
Cc: Iuliana Prodan <iuliana.prodan@nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 2/4] crypto: caam - Simplify with
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
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

---

Changes since v1:
1. Add Reviewed-by
---
 drivers/crypto/caam/caamalg_qi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
index 0441e4ff2df2..076c6b04bea9 100644
--- a/drivers/crypto/caam/caamalg_qi2.c
+++ b/drivers/crypto/caam/caamalg_qi2.c
@@ -5115,8 +5115,7 @@ static int dpaa2_caam_probe(struct fsl_mc_device *dpseci_dev)
 	/* DPIO */
 	err = dpaa2_dpseci_dpio_setup(priv);
 	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "dpaa2_dpseci_dpio_setup() failed\n");
+		dev_err_probe(dev, err, "dpaa2_dpseci_dpio_setup() failed\n");
 		goto err_dpio_setup;
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
