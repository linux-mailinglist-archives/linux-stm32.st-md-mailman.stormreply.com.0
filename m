Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66A94EE41
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1EE5C78028;
	Mon, 12 Aug 2024 13:34:24 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02DDBC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f035ae0fd1so47358391fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469661; x=1724074461;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uOJ0Ss5PZ4IloZXXvkJRBvwO+cKYa9b2eKV5tMzUF90=;
 b=i/hUhbQ/9rloo2mBSEpf/cIZE5UHpxprnAddYebN+ZxcuxFQmZ7kkv4lZ9sU4NVpWc
 kFwIJg1kqRZjxs6zMXZrUDyd+d6iCqny1ScVvnYJj1WOZrqO/swWNJ4/YMutMb5LJoGH
 XvCTih6vvuevYjxMB2kjLOQm9dIOnibhds0f/DLfGB9TvvrXU+sJWGQQc8Um6sqUypF4
 vtKErjbT5LrgCszFrQAAFDItmzWdsDPTjRsNNJlsQJO9TF88tOlSazr+nXI34sWQQsFW
 kyvqxoxKNkK1rdhl2u6IHH44JEZuTovEka1Hw2rczt6tzsyCPksZpcdWIz7l5tHOPED9
 RKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469661; x=1724074461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOJ0Ss5PZ4IloZXXvkJRBvwO+cKYa9b2eKV5tMzUF90=;
 b=OEFDii5Ynvxzs6YtglKNb3RNZbctbio/7JnoAw5Fhw0nqQ7vPWslYYnvhIJkuW4TXc
 Of9rlhXCgGmwVbiTjtG+BOFcnI39LWvy+LhiZCSdWerTp5D7tyg/TMkR8Um1jNWLYtMP
 2kPfo4vCQd57cVIUngXAoT7mFxPOkohjo+7dnRDOk8oU6JlS302NG6Hhtq3Wz5jlon04
 L9giG5Vdr2WXvB+J1FNiKPaoSbi063jm7mCU5OujNFRoSMYbe+33qmVlZPu/h00behOJ
 ELunrBn227HZg8AMer0+0cQiPcQZR2OLEBs9lOnKafhYxtH059A29g+1kQmeqfKJzseX
 28FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeaFyaddd3QoQoID1UYni7X1i7H8UmR6SRIl56x06kHjnXAfzmeNA+N3lKv94hsAQw86Uo1QdNSUlpMLlzi6w+zarj+DoTQ3qyhTAwOBGmub1cDlwNFuLr
X-Gm-Message-State: AOJu0YwHIIu87EMZVzy6kpEWCA8BsJqWaqu4Z3yJUoKb7CeLDLB4Gr8+
 fPfeg6Mshv/HEz+H6sLv3vSDeLVixLRSkHJSST8UfT2tt+qvqmI7MKd6whlF5V4=
X-Google-Smtp-Source: AGHT+IHQihxBmTwZO+gpopSrog1h4Zwo6nfMe5CMTYHEB+GBFOYD57QnlF7TYHYQZ5mGOjHQLKtWjw==
X-Received: by 2002:a2e:9985:0:b0:2f2:9c23:3412 with SMTP id
 38308e7fff4ca-2f2b7156ee5mr2174791fa.23.1723469660887; 
 Mon, 12 Aug 2024 06:34:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:55 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-1-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xgfyKZmDDIbZTBcHgkC4HQRuoKCVphYVJo2Oqeoz2yg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9RWiZUzjyUB45cY5GRGscQmhk2n/JWQ8eCU
 OV6qDjUvVSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPUQAKCRDBN2bmhouD
 1xyXD/4zIloc9i56JR/7avOvWMonHwPMgxrw6eW1Ql3uMGbouCHddr07MRZROHf7FHGtaDBNSzW
 mxhzYldkGPh7W1K5fj9UFeZ2zvkfrn+rQdUhG83d4r5ihSPYCQzBxKNTUvwKDDrn2jZ/DWAjmfh
 TxjAUuNnwbSkd43KLCkjRjmKHg1bCsuc/NromW6Jla20roeAfx6ousA8KIh8deLOJvUSd9IjoTP
 vhWCOrq414zR2AtAX4vd2IsPJM2zqwKIUt/ZXVvpV6IA6I5emax215uBPI/tq0XEaLTbW5dH/v8
 JpZBGwkHxrkWhFaXEUS01fvJMEE2G+rqeMxi9GJGQSITpOae42sKZXL7jCxwsDsQ5zgfRwWGvJ5
 veNYQdH4lAPRjl8MUL3h1K42k3GfVx4S1i+6PqIyC7vk7MOfuUV2WBitHAcxMyjcQMbj8XsjyvB
 iMMGFF8VDH2oE6eJ4aaUv+Co83vS2sYyoIH7BWNGxvSW2ajjcesSADyFhNMcoelmhpGZTckxESl
 82l1O1qvrtFb0986Is0vJ6OhgHDX/Eja/dCxlk9T+SvRzZha67Ecrv1oWVyttwKxwqIrlMjdM0L
 b7iludiktLPGaXEtTrzpL2Xl3GZiWkzR9es+685yu7ltUGzpJVSzqu8GN4yqwd4riFxIzLgCaj2
 TMtGaSenJiohE3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] memory: atmel-ebi: use scoped device node
 handling to simplify error paths
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
 drivers/memory/atmel-ebi.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index e8bb5f37f5cb..fcbfc2655d8d 100644
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
+	struct device_node *smc_np __free(device_node) = of_parse_phandle(dev->of_node,
+									  "atmel,smc", 0);
 
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
