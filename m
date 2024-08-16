Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC901954700
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D7D9C78018;
	Fri, 16 Aug 2024 10:54:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99524C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-530e22878cfso1860512e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805687; x=1724410487;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a+AKBEGtmBS5pejKHsx1RQDN0WL4LYiNHXE6IWWpnkE=;
 b=MXeFaClAti85Wxc8d9NmmAy8IUV3FpFwcURfirQgMgCEKEsjjJ+pilmiMwCx7nMjGB
 7tATQXmSQqIXnHJC9nhUDASbuTKzSdToSBwm7GJW6JDp1K/Wi0sn90vVjk3P7G2KEHJA
 J2u7dPP8sxXEnkEhEzA4dxo4UnqveCO+o3mfz/+VOZjHFLbLu9fsicNgtHABfSyBHXm+
 jN3dF+5lZ8oag7BNI4iZY+ILmcc5AXEZBtjDmcL3LlpP5+/OM9SzzIKYYGbBeBc7BpOr
 w3YxDD/P88LkYrTge0dtvD8QPgg8k/RgIyT9E/IZuEczE/FDRpO9J8b1ht2TqC3kZo3a
 x9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805687; x=1724410487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+AKBEGtmBS5pejKHsx1RQDN0WL4LYiNHXE6IWWpnkE=;
 b=VrVYmsPRz/wgFxIhrNsqrYZ/JoqHlTE4fOlAmuizGftck2SgOvxz7+ATJuSx588nKw
 oLJGqmTH4ermdJeNDHBiAix9V2ZfXDBZGdgLJT6Ypin2tWFdtqtbDWnxF5+QqF1oS0cs
 pfu8l6uVQf6pDVnvPMPl+q+kYCZmqkkPGGS59Am/Owoga1ptjofrUZ3b5IFVx29hkKn6
 uIn11HP6m+gpkGqjziWmEzyDAXmgR1++0rHkHaEJnvRJUAgiHEPO48bcK8Sce7eGycdj
 2LflbPzioy4jLRdcltA2gsKgkVRkWGAbo0ZReP07EYcBKoDyvji31y8PBGXBWpbEcNcD
 Rn1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRQ/x5sqHvomD93k61QHd9OSS0jP7DrW4Qz1RSC2FeeQCsrNS+t6C8jLHJvt1UI+r8roXsXbbADltjg9pIosIKIL84PKNtRiwXV8BCg+AbpsbFQdwRUNPb
X-Gm-Message-State: AOJu0YyATeWXeAPpX5D7pwe5peAIGwPOJp+bCTBO8H4+hY4OVD9rqvY2
 B7sgK+PEj2eRmCHjBLnAQrkzFFbkyDSg6TgIpjUao0pfvRLHC2xAVSDop/CcdZg=
X-Google-Smtp-Source: AGHT+IEHCNscwqa+rPRNLeeVn6uCgC3dSDA6leygkbNxDpdQ8UnjMknEsIcEe+W0Kzt+2BBEbRz3Fg==
X-Received: by 2002:a05:6512:1114:b0:52f:d128:bd13 with SMTP id
 2adb3069b0e04-5331c6dca4dmr1237555e87.39.1723805686484; 
 Fri, 16 Aug 2024 03:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:25 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-1-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2512;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y1tXQQLMiykATrg5422AQ20ni2RJaK4UYZemsQjrfo4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/nVH8+q0L69iLHcs6Nn94lY9P0zHH98yQG0
 wm6yDSp03iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v5wAKCRDBN2bmhouD
 1/CTD/4vBsb11t4ahtO9hgXQEOilBIsCGlpNiFvOhW+vWaNhLGR4ycmNq2tTW9pYLAxKoEhs9lm
 MmOy7g1tpQCAAH9pByIbx55vqIFfpDzKWPPo65H1k5tMHq19FOTxPLISCCxtG/p3bKMvmCuKUCQ
 PppZ5IiweAX7wT0y5MhYblCiSpuT0iS0A0C3zaS2NceA/pfLlsQciP1ryPAHSF0yGtDecLOjIZj
 kG93Ydr3phmWl239TCsc35QuetxOktkjec7toqqrJEP986JYxFde+IYseUDQlFdAl2/0oZp1zO9
 1MyuheP0T4lhBiWejSAP3VOFzzYHvFyYiJ0FuI+53lQpOh8u3fhQ33cxUA2Bu/mJ5651qQM7GWB
 Z+ybSqTaWtGJ/JhXAS7Vc5T3YpI1WuX7UAxAzqZ/h8aJGSmXBS4lJXKnl5Qvilqyda05uEHaA5K
 x+QuyXZW15sg3BFzrUWXfKkkPfCtQPGfOr0Jy1pPCq/dsXhP1j3UsmsiOg8oSIx7/bNqliCgnrC
 KCOilpLMjwlQUKl8ooZtIFY7akYK7Lo3chtMeoQ5B1zz90dQ/lkLudzm/tQs2eGqv8A8fDVpFHf
 Tt/1mJjmAMDAtjuHf5xdKj21jLN2y/aU797yDF3Bj6HaUwDYgntnKsO/rtn6kXZeubNG4QJO+lz
 ibM4wB69kv5gAZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/13] memory: atmel-ebi: use scoped device
 node handling to simplify error paths
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Wrap line before of_parse_phandle()
---
 drivers/memory/atmel-ebi.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index e8bb5f37f5cb..8f5b3302ee30 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2013 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -517,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
 static int atmel_ebi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node, *smc_np;
+	struct device_node *child, *np = dev->of_node;
 	struct atmel_ebi *ebi;
 	int ret, reg_cells;
 	struct clk *clk;
@@ -541,30 +542,24 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 	ebi->clk = clk;
 
-	smc_np = of_parse_phandle(dev->of_node, "atmel,smc", 0);
+	struct device_node *smc_np __free(device_node) =
+		of_parse_phandle(dev->of_node, "atmel,smc", 0);
 
 	ebi->smc.regmap = syscon_node_to_regmap(smc_np);
-	if (IS_ERR(ebi->smc.regmap)) {
-		ret = PTR_ERR(ebi->smc.regmap);
-		goto put_node;
-	}
+	if (IS_ERR(ebi->smc.regmap))
+		return PTR_ERR(ebi->smc.regmap);
 
 	ebi->smc.layout = atmel_hsmc_get_reg_layout(smc_np);
-	if (IS_ERR(ebi->smc.layout)) {
-		ret = PTR_ERR(ebi->smc.layout);
-		goto put_node;
-	}
+	if (IS_ERR(ebi->smc.layout))
+		return PTR_ERR(ebi->smc.layout);
 
 	ebi->smc.clk = of_clk_get(smc_np, 0);
 	if (IS_ERR(ebi->smc.clk)) {
-		if (PTR_ERR(ebi->smc.clk) != -ENOENT) {
-			ret = PTR_ERR(ebi->smc.clk);
-			goto put_node;
-		}
+		if (PTR_ERR(ebi->smc.clk) != -ENOENT)
+			return PTR_ERR(ebi->smc.clk);
 
 		ebi->smc.clk = NULL;
 	}
-	of_node_put(smc_np);
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
 		return ret;
@@ -615,10 +610,6 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 
 	return of_platform_populate(np, NULL, NULL, dev);
-
-put_node:
-	of_node_put(smc_np);
-	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
