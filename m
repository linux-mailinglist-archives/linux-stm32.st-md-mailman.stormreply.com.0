Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE66570AC
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:04:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC8CC65E6A;
	Tue, 27 Dec 2022 23:04:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF59C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:04:14 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id bt23so4767590lfb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kkirVz/33x31xBhYi0JWwLjL/jhzRe4WWEuKEkFMsWo=;
 b=RLGiwgxjXRKc4EsXCwQvENz0JiKBKPzIuszL+O72xNIyJFyyHKJeL8r9MEzjhKdZS8
 q4HqvnZwSMwOyApCGuSCpVLJWrEVHv4EdSQhHTZWdH+R1g7qB5uQRAd5NQ4QdD18Ugml
 twuEIRSX6sESMNwC7fenxmYuaQ8nL0sjFFB5sxfcPLRLqNfglSk2ap2gferOOXxEFAnX
 ism+O2+77CnkhV+3dIJfDwEqf9NUczrfpn2xsVHmzHLC+Eiwoq6NjYqf3haNgghsWgZh
 kXaHxyrS4GatK5nDBFeiZTHjfInTE1y5g+HYPADV+PvYxtkgcyw4u+AE/g40Oumfuaon
 u1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kkirVz/33x31xBhYi0JWwLjL/jhzRe4WWEuKEkFMsWo=;
 b=ed54n6sDe3q+dpTaNwgWh6Kh1OdAQWs9d28r/8Ty1uw7XFDwKrPX29EQuCYPLX7w7l
 DR4n8L8IeYjyepVrEYe+iZKrg7CFcV58wDdJzWF/NPc8q6y2frClIn3AN05cBM7HAtTd
 selIJt+XEdbTMG1cyqUbuZ/wPutGLDQytMkTefZEGwGJ7qn9Sbqk7mAfcXtw/MexF+re
 CAG6ExOLZUGbzzwOB70uUdp1MF5SoQjIvFUyyjH3yoMBSbvb0rbLIre8lDgNaf/Hfx8z
 2k3S0DNHOi781WtcqehwT1s9aT2fJh4OSEAbPZf7hibdG+NUMLey17m5wT86wbx84TwI
 esTA==
X-Gm-Message-State: AFqh2kq7HmfVYaP72v/EClrFSzFowEHWIKvCJrLHrwlX9X6YUgiZ3A9U
 ks3lTRKpAb8sdthraghJL49d6Q==
X-Google-Smtp-Source: AMrXdXuRg+RWZECcd05OZBukglo+UoFlAtGbMa+BgMEGs3zidEZnp+S5U/6qnvyErizFnkt12pIUFg==
X-Received: by 2002:a05:6512:3d11:b0:4b5:2ef3:fd2a with SMTP id
 d17-20020a0565123d1100b004b52ef3fd2amr12007982lfv.47.1672182254389; 
 Tue, 27 Dec 2022 15:04:14 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:04:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:36 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-4-b637ac4cda01@linaro.org>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/7] crypto: stm32/hash: Make dma_mode a bool
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

This flag enables/disables DMA mode and is a true/false
flag so make it a bool. Clamp the value from the
HASH_HWCFGR register to a bool as well using a double-bang
construction.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/stm32/stm32-hash.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index cc0a4e413a82..5f03be121787 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -166,7 +166,7 @@ struct stm32_hash_dev {
 	struct reset_control	*rst;
 	void __iomem		*io_base;
 	phys_addr_t		phys_base;
-	u32			dma_mode;
+	bool			dma_mode;
 	u32			dma_maxburst;
 
 	struct ahash_request	*req;
@@ -481,7 +481,7 @@ static int stm32_hash_hmac_dma_send(struct stm32_hash_dev *hdev)
 	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(tfm);
 	int err;
 
-	if (ctx->keylen < HASH_DMA_THRESHOLD || (hdev->dma_mode == 1)) {
+	if (ctx->keylen < HASH_DMA_THRESHOLD || (hdev->dma_mode)) {
 		err = stm32_hash_write_key(hdev);
 		if (stm32_hash_wait_busy(hdev))
 			return -ETIMEDOUT;
@@ -568,7 +568,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 
 		sg[0] = *tsg;
 		if (sg_is_last(sg)) {
-			if (hdev->dma_mode == 1) {
+			if (hdev->dma_mode) {
 				len = (ALIGN(sg->length, 16) - 16);
 
 				ncp = sg_pcopy_to_buffer(
@@ -602,7 +602,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 			return err;
 	}
 
-	if (hdev->dma_mode == 1) {
+	if (hdev->dma_mode) {
 		if (stm32_hash_wait_busy(hdev))
 			return -ETIMEDOUT;
 		reg = stm32_hash_read(hdev, HASH_CR);
@@ -663,7 +663,7 @@ static bool stm32_hash_dma_aligned_data(struct ahash_request *req)
 		return false;
 
 	if (sg_nents(req->src) > 1) {
-		if (hdev->dma_mode == 1)
+		if (hdev->dma_mode)
 			return false;
 		for_each_sg(req->src, sg, sg_nents(req->src), i) {
 			if ((!IS_ALIGNED(sg->length, sizeof(u32))) &&
@@ -1525,7 +1525,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_engine_start;
 
-	hdev->dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
+	hdev->dma_mode = !!stm32_hash_read(hdev, HASH_HWCFGR);
 
 	/* Register algos */
 	ret = stm32_hash_register_algs(hdev);

-- 
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
