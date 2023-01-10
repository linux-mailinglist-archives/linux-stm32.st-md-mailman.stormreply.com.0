Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA6664C38
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 20:19:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06435C69058;
	Tue, 10 Jan 2023 19:19:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ACD6C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 19:19:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id v25so19988061lfe.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 11:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4+OWBA1+r8w2OcO6/gRNLV+SbjGPnm7JmC4LYSiKYI4=;
 b=jBFgbqrTKPsUjyBlPD+b8nNXygbS1LXXv1GHK2bC7muFTSW1JsHYAScaB8fixOeuHc
 HvdeYk4vouKp/0mqM1dv3H+/J0x+HLagbcbmhz9ou//WaSxXfK+I30+MjgBO0T3zy0EN
 /t3dZd4wWhH6gycy4T1Ww6XiqvsSimqt0d0oPdHgbRU3qC+pocTqfp5ImtSim2tKwYUr
 NmWSyyHcZ4wTUFiJ+68vNutRqUZLfkBjERafNHs51FDjAfEuM95RjSRMPU1mqf1VJd6e
 giSSnRMUqcR06qzjnGtRab2jUroxcZD1GRC4zFUNIBB5fkCvQQ5JrIUIHR61QGxG3mXj
 FKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+OWBA1+r8w2OcO6/gRNLV+SbjGPnm7JmC4LYSiKYI4=;
 b=UnQPJCpiwWPC9dDjfpNnnBMcfnH4riurqWMjjMA+gYKCl6EF7G+fluTiiOFQ2qiEWH
 6kyntReCeKkbfw16Mkbkt1Y9kxcCquU/cCDS/S1LdvzRKj6Gi32F8UHUZ79pxxxviAxh
 IDxD1BW2etzwqN8lvJqkZRSPNd5vPdQRScqrBXU/RygLuHa45hsUqMpg9CdF04ShADZX
 zWMy1O16XQn3JSMdaplhv+GrkjmyKM27g7VkbK9weId/ZNZUnO5+NID6wTDK0zZskt7L
 hULa/dObvXcyg8YiZhgADx0gKQZPV2hCe9slAAfz78s5D08UkZSb8MffvlWMgJEcvNsy
 lepw==
X-Gm-Message-State: AFqh2kqKX+9SKkjEIycn9r4+imSjr7x4eBEroSiayWvJLRFJD/0UChLN
 QvNrcCc34j9RHWwO/BEkwfORFQ==
X-Google-Smtp-Source: AMrXdXstDHWetjgC0Qv+so7RKr2iJFZe5YESIH6+9Zd+P8RgQ4tj3oBgosTOd+i05swE2dlUluhJgA==
X-Received: by 2002:a05:6512:3f26:b0:4a4:68b7:d625 with SMTP id
 y38-20020a0565123f2600b004a468b7d625mr24170805lfa.12.1673378376953; 
 Tue, 10 Jan 2023 11:19:36 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b004b549ad99adsm2297725lfu.304.2023.01.10.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:19:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jan 2023 20:19:14 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v2-3-bc443bc44ca4@linaro.org>
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 3/6] crypto: stm32/hash: Use existing busy
	poll function
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

When exporting state we are waiting indefinitely in the same
was as the ordinary stm32_hash_wait_busy() poll-for-completion
function but without a timeout, which means we could hang in
an eternal loop. Fix this by waiting for completion like the
rest of the code.

Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Pick up Lionel's ACK
---
 drivers/crypto/stm32/stm32-hash.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 0473ced7b4ea..cc0a4e413a82 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -960,11 +960,13 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
 	u32 *preg;
 	unsigned int i;
+	int ret;
 
 	pm_runtime_get_sync(hdev->dev);
 
-	while ((stm32_hash_read(hdev, HASH_SR) & HASH_SR_BUSY))
-		cpu_relax();
+	ret = stm32_hash_wait_busy(hdev);
+	if (ret)
+		return ret;
 
 	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
 					 sizeof(u32),

-- 
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
