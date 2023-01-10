Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F46664C37
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 20:19:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D919DC69057;
	Tue, 10 Jan 2023 19:19:37 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7953BC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 19:19:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id f34so19994456lfv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SCPDekvQnYc0U1/C4X/WLhbgW1GiOmXO0Y/OcmXjz4g=;
 b=NSZZg6ljcsHxy6iaetUWCUDZodgGFOXzmB2NnPy61OSJYetit7Z9I8LaZ4CwJkLft8
 xIKfNYaRL+yTamvlPx5opIis+tDTIcHllt5Nw80vtfJZKnOOxpzdj5SiEwySzXZRhBB0
 dmr40mHf99sJyh/VpoprShIUHYK8CDZ1i1+yH0/D9x8q4rsDlhtu6jH2zCIPKnXSuYdT
 zexhuUbAXWBr8uXQ2VF/fEARnBMRMFuWQ4Tjhbfzgtbqn6Uh2Jd1cCMkoomVAouxIinX
 YHTnoiunhyuIgkNRsa1j3xT6Ts4rdqMVLj68WG/yv6/Uu/0yR0lLenip8lE9jZZ8PM+Y
 USRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCPDekvQnYc0U1/C4X/WLhbgW1GiOmXO0Y/OcmXjz4g=;
 b=AHfkD4xBVzPsLq06THGvBLcV2rJc80LjAt9ZipnjlyEU90GuJVtypvRdg2X5zOi22W
 bsC0pYr6POIAVF32fWcwDkY6oCzg4AcbQtqfgYGZ83C9VdmXX3dUXvADcO7rrXdtdRYS
 iBbPWJyMBcz+N6ZObw0Nc3FEyFfsWQJipdQ7iiOY0+2PHz0JTIhKwvrudB9Bq1qr5O+v
 ZNYJrb76D4ikraRPcdXKATfFh9KlGphctf+D4TH3oc6ydKGD78+l7oihqIRw9O3WGpMk
 4tlLKbv0Kom9l9CByHZV3T9A5DO+JIQcEDN/joudLXNzuf9lMlXdj/zdL/ASvpEKMnfa
 6eGw==
X-Gm-Message-State: AFqh2kq18FdUpt5hX5KFZ/xEjbZr/ecYdIQjTU3UhK104R9Jh8ryEpqT
 czeCdpTykU2lH3hOCeNjtW6uOg==
X-Google-Smtp-Source: AMrXdXvDjquxxa8PiOfFXuBQYP6yfkkdy3dZOWGEdXqtXrF1ljgiWwju5LbgngDIZZH3szBERdHNFQ==
X-Received: by 2002:a05:6512:1390:b0:4cb:4307:eda5 with SMTP id
 p16-20020a056512139000b004cb4307eda5mr1903598lfa.25.1673378375936; 
 Tue, 10 Jan 2023 11:19:35 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b004b549ad99adsm2297725lfu.304.2023.01.10.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:19:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jan 2023 20:19:13 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v2-2-bc443bc44ca4@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 2/6] crypto: stm32/hash: Simplify code
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

We are passing (rctx->flags & HASH_FLAGS_FINUP) as indicator
for the final request but we already know this to be true since
we are in the (final) arm of an if-statement set from the same
flag. Just open-code it as true.

Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Pick up Lionel's ACK
---
 drivers/crypto/stm32/stm32-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d33006d43f76..0473ced7b4ea 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -399,8 +399,7 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 	if (final) {
 		bufcnt = rctx->bufcnt;
 		rctx->bufcnt = 0;
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt,
-					  (rctx->flags & HASH_FLAGS_FINUP));
+		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
 	}
 
 	return err;

-- 
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
