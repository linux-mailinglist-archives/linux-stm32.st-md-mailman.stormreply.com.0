Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 126DD94EE40
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5390C78021;
	Mon, 12 Aug 2024 13:34:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07E83C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:23 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-429c4a4c6a8so19966355e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469662; x=1724074462;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lgTXsPloyXfID4jwvyIhu24dRWJVHUfhWh9HifazGOU=;
 b=dRBMevG+fDXQmEN+NK/csxornGFJatBV3AGBfQuT4AgshIa+v/L+KB4v5IcBV5XgSk
 SWRTJ0+ADawhWbLl6m/GhNii4nIbFktmsrQN2x7vCgABrq4vltiiPgB6Ot9S5M0fHQ9s
 y1k4rPoNBwBYEYdN+deQBsmYM4wai+yBZh1uAKNpg9DB+zIi/7ErYKbFQ5e63NBK2EA5
 7Jklp5jeB9aVIP1bNLoYhCDv0Cz6ksuZH+iu4gTSnf48VR3TbZsBZLcW8kUDuQA/EzCN
 gvdcNeoRWKu13uL0WcuAfYkLa+qCKsQxQ7tMvrPVYZ3vqL4JpT3yjR1PYlmufZJxNCeS
 cA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469662; x=1724074462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgTXsPloyXfID4jwvyIhu24dRWJVHUfhWh9HifazGOU=;
 b=cbrg29suyyD2a9Iml8nfn5xgEQMx2KG72jKhUZtfN+FFj6UE837tkWP2k4tEqWA/lW
 15zKaXHdDVWgz7KI4evRobK/aqHQhWU1985m/uyLfgHtrWhExJLIY0iQvxPfaE7a71VL
 0VwkmCTZZEnjcEA/lTAaKMKceydXI3lriJboym+nd3YuPRsLhG3+Y59HMNBsOk956f5Q
 vZGOSYGo1jJTZEmkJ/YuNmQ2qkpFMy4SMEVM1TObZFl/v7Ou1S1xqF0w+e4xTY3IsWaG
 rjpN9AGOXTnQuJ34of3HnGdPxFBYQYyxkt4yrf/Ipe+xXhkRKL0S6lzyOACL42+rl7RU
 o8pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6o6ycmFC2TUHuKe6kpDBWN9/kSx+la3ZuvIs21SXFLUZw42Q9hcXifjeg76Ov53gmAVGns1zdylxU8xG2YHcj8/OnKasA3MI4tF1NaaolfjbO5uXTjq0
X-Gm-Message-State: AOJu0YyvXb8w2gdeSqh+JlMRCLDrfaDqHSLBFpy44WgKOuwrnCgHZ1+8
 npa+9FGQeEypabp8U3gZ1Ksl7UNlAzPkEtbvCioa9nwFkUl6AAzekrGe9sWyf4Q=
X-Google-Smtp-Source: AGHT+IG2U+2ivgdNzf99p2ylaUjGb2UicWlTptEg4n0FqVE6AqYOjcDIhqYbh/ow3uzGl5LVUnouOg==
X-Received: by 2002:a05:600c:154d:b0:426:602d:a246 with SMTP id
 5b1f17b1804b1-429d48976c4mr3808995e9.32.1723469662493; 
 Mon, 12 Aug 2024 06:34:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:56 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-2-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gmw7sdXN++0ul8rDzvdEpJ8YQFeG56dlD4XcPKrvG+o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9SBLK2/VucpJF/zx5ZBYvmfrRBNn21ar0oB
 3a/Cv0noJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPUgAKCRDBN2bmhouD
 1+yYD/4qcA8Bj3tzEWx6jyRjX8fDvf+bTdrauIEu4tdm0NhBSOPEGsMhDXH6CgHSvmu29T1Kvz4
 ZwZ+2AAdDjZmdWXiU9FiAnN0Q33OjNkDRlCR8sEXjyPyOmXnjgzL40SEALgNKIZi4bpTvB8XX2L
 X1RJgqy8kocB79a8itpXzdUz9K6D9nHmPXj31YzY8qhiq3bGZrMX0UayHyFFwZXzC4+MvpXbxpE
 0IGsNG3fZTX84XsBX8bMvnV/Dz6Qh52B2e5+3gd9szOpKHYQjmw8sqJO+VzdNJ8WexnOV1SJE7I
 qd4gUgPlThSU/cCUNWlsl0UmvrA2ksWUVvqU0BKHOj/SEmh6VCnJ0sCtEB9v3sjVC0uH/KDQedm
 1gwdxLTsFJugS6pDjZd3lpOH26QeWPz35qwz2kWyoFTFFhMDtygj7NtFrX/rXbXI2P/ykR8PKo5
 TYETYdEEHdUE+q6d8/kWbMERlzyuEcyKeCTWOndMO1tmQOyoV2g2JgD4a1ubtmwr/LSLRU4YldQ
 mAqYO/LNC3hE9xUwtG4Zyb+KI3NZLLfTdEOYgTIIA6HLUEPlN3wrmq/7UsP+t1+DPndJVaruZn0
 t50YYT/Qalyd0LGdIKkExmcImtEVJs7HbFZn784DibyT6IaArLfY99yM9caNxxgpedYMxOdsMT9
 lDEND5PW7HyCZAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] memory: atmel-ebi: simplify with scoped
 for each OF child loop
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/atmel-ebi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index fcbfc2655d8d..abc6c067b5f1 100644
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
