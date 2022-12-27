Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777ED6570AA
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:04:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39545C65E60;
	Tue, 27 Dec 2022 23:04:06 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB82C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:04:04 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id e13so12488739ljn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=omVnieNGh1C2BQOqxL85pqNlOA8iwg1l4f9DGmSm+F0=;
 b=NpMquUy6XSCZlHF1B5JCxa1+IGZudC6z51dvvZyQWfgok2tgu+eONhBG59X2PafkeI
 K9nO5jMavETPIF67WKoPGuL+6WIhuWKFd2rOVSYXTXR6Wv7Uja617HpHDc5mv+N9zoDL
 srouCvYvhXyeEu3rHCBmx06/6txqAAy91FnspCCNRW9i+eDikpjySd3WFHrq0JtXSZOJ
 i8w/9xkbSxT0NTgOVQhxKKflSjTrfXlRr7ACVrurfcYE37o0ru88N2jBCtFB1kOjk/eo
 Kxb2cwoZndwWQMzjmEgg496wJ5IUAzr6ebbFKTYj5D7UboN1N5tD09vVUjCIEXVw2/WR
 xB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omVnieNGh1C2BQOqxL85pqNlOA8iwg1l4f9DGmSm+F0=;
 b=PSzI3qQ4qlUQyldUtJU+toNpmC0J+vhgDWnk5dnRnk757JllhuKEDBMFOKO271uWhT
 hFHwjDxxoksmiVNe0RnjmnjRz9i1USHYYuj+O3AIj0itl50WZtsyYsec9UoVrkxyU6A1
 PLlbVj8ORrb9T+XXfQMQ10WvzC2aAtA6vNIXiUT1BhUR3z7+Ng+b64Xaa1toRxSI6N5l
 61HTXxo2CgmIGDgjWFKubmqvKmtoTZkQxpNLqDptuc+gxfg6fgtfMdxk+5tiuvfhx1Hb
 o3ZHoBqTb32Sbp4xqan/uqLouBRrDCGN7Rfb5cd6SPzri3aXqmLUnO90Xyu18hIby2tb
 qS9w==
X-Gm-Message-State: AFqh2koQEeJU+Y8aKoLYy99JSuJAfgvhL+BMAyMUyiAPX0Hk9TzI5FKl
 DvUMbUe9buSXKlqGqk9rJI0D6Q==
X-Google-Smtp-Source: AMrXdXs6RKKLQeK7L+Utv1AckslGJBa9ecdEOR5vI3IypBndmXbMZ3kAyf/SE1bdQMkdDmv+mh+DiQ==
X-Received: by 2002:a05:651c:1992:b0:27f:b2cf:85a0 with SMTP id
 bx18-20020a05651c199200b0027fb2cf85a0mr4532982ljb.43.1672182244053; 
 Tue, 27 Dec 2022 15:04:04 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:03:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:35 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-3-b637ac4cda01@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/7] crypto: stm32/hash: Use existing busy
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
