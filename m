Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD19546FD
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F3EFC6B460;
	Fri, 16 Aug 2024 10:54:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F4FC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so13222725e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805688; x=1724410488;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6k6SD0aSljrln4HTu6lTRnYpdZxqX1kReSkeJCWA8tI=;
 b=Oo+6IqvDZb2q/KFi0xiQYQArcyX2kab7rjAlG9yuRlXpm6S+9wQ+l3jJ1QzEcLLjtT
 WffOt+UwKsCK1eCbSM8RrUW1dfzBpEUQFbXM93+DGClNk1kY/y7Y2M8WTL6nODEb78Gt
 cwKUVmCa/sw025eqFN9LYFeYOAJ5dpbQengmycVT8S1hqWORoL0AqTIksDTPIwc43cVK
 7QXxWpX+GIpRovpg7EaYy54HFJIfS5KuAgJkr626XfZtsFVwxGykLIU96JheLNmIZIxe
 SMcRDcHNVjgoCDgx5I2g5Z7ZXt8/tW6GQurSVP8YmD8ciQMkxKwNiJ27RaUMzWAtfvd1
 J8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805688; x=1724410488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6k6SD0aSljrln4HTu6lTRnYpdZxqX1kReSkeJCWA8tI=;
 b=JIdyAdaI2lCpuO4l/FVoSEBCIs8bOPgmLMiyIloy0n7scfQPlwYDQC6f/aVTMxakuh
 1wNfZJ3phWlBFV3r50S3YhngzvFBvMQBewG5y2R5nSm7IZNoNXFNB44efuvBqU/6WrE9
 Ff8K5JIlu2udR9ZBwe9HJWr8WdNE7zcsYDjHKkRq1XOE3SDgP3t16eYG64cxBuXFKiAx
 2OBOuTq86vcckLyaP+WA5QaEhMTsbampxBBV5UXKN0FRsMvURPXADgEhm47+P09Q1wte
 zXQ3Ek8aCFmnDDv6rmzU0V/ChnavMFh8P5oc4HQcjjJebRSicMeuCbQlsP1HDLiqLbGD
 fK3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhHdLpirya8SNENRyCgwaZivYgi9is637bX3hymiPH5jZSTEC8QaNEy7mPcWp1tljLHvSDEnbnHtDscQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/npw1DNiAWCu66dxee+O69N+/9wjryPP5qPJxVPn+uSPOFK0u
 2aHUaIbaQSePnoPQtXGJqvJEzVqgSiiVTY5dIdtpLjbq5FUoDuoDk7USfWjSGwU=
X-Google-Smtp-Source: AGHT+IGySjZh+j8sC30c+hTT7NjTBz/cevAJKuIL9WcydZdhm3gwMTKibEaXN40CzJLmokWv8APCXw==
X-Received: by 2002:a05:600c:3114:b0:428:ec2a:8c94 with SMTP id
 5b1f17b1804b1-429ed79b8d5mr18949045e9.10.1723805688147; 
 Fri, 16 Aug 2024 03:54:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:26 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-2-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3WljQ4S40lAJKTSAlp1/rnFCza433JZA4ZcGKxWq3B8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/o4IJ9C/1vwBLKqlCDJibipxPCOssPkOBVA
 lUD/dSK0cOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6AAKCRDBN2bmhouD
 13bzD/90oli7rKlPTyFDijLjZXCBlyAd+gOeBxMucElPf9bjthSj/d0Egf3LFElhNSpgHbcUgmF
 IYrSj6gTIQEcTMdT7fImXfCY+JHRweAnbhPn1YLAAUiXVWbrQEVN/q9CP6dRReBP6TDqUq78YMo
 jtmFQTQZXuvbzlg3k+Xe/nBuLdBAK6cAX33qOqh3z8rXzViLT8utrBWPjDGCjisjUQPv9O9NP9d
 RYwrjNXGpSSrRkYZalG9QgCTN05F1So4ML8XYR8qMqvSSv9qxFbuUPVESf/UClUPyjU/TwN6Ee9
 /joZRI/TiIXgYhGD/+yYi0snpZTHJ6SWPVTGfvZESeRS0sAWQNWsw+MuNAi0QobBWrX8RQ4R0/c
 etqFzpwVoq7jRthBRauZO7cun5gyO35V9OpT0VkPs6q8rZFjnfXgsAoS3ReKiSMG6pawA0KsAxd
 hKkmg3DXaQ5pFlR+KODklIz2EvAMcUxcSE6vdOGhm43uJYUCwPzHhiM0xYYw8mhMY7h2RP04s8L
 aKJt4lBa1kyw3xqW52DwKB+NY3AqxMaZvoVTpVOgY3nlZG+hncKHA45VECUGTQxFlXhHhBYFO9S
 Osh3WKboPcOZp5GVEmVYHFJi80NbYJXdmSgTh/5mjqJEa8/ne4JuKAzX+TpRgQD7+pWdP13nzeI
 7bcaQ2/6/4azprQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/13] memory: atmel-ebi: simplify with
 scoped for each OF child loop
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/atmel-ebi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 8f5b3302ee30..8db970da9af9 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -518,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
 static int atmel_ebi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	struct atmel_ebi *ebi;
 	int ret, reg_cells;
 	struct clk *clk;
@@ -592,7 +592,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 	reg_cells += val;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!of_property_present(child, "reg"))
 			continue;
 
@@ -602,10 +602,8 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 				child);
 
 			ret = atmel_ebi_dev_disable(ebi, child);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
