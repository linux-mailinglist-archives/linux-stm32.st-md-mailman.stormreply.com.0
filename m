Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247394EE47
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AD37C78027;
	Mon, 12 Aug 2024 13:34:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5347C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-428fb103724so30362735e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469670; x=1724074470;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
 b=fZWJH5X6In50Pz9HA/WpZ6jndq+bBXhipyE8OX3PYHRrZSW1SD9MBjhvwNG2kN1MHK
 +Fz+8js0oaUlwRxhfw0Hsm4K1gsviOqej4NZhR4GD4ET1nKLSEKWEV891CYWcqsIeG9C
 +1qNRJk9JDICOPuoZqUxaWwHQwnx4ljBFOyUHd+6xpMgklGhsMOrej2k8ZmjvdB761BH
 t8VcnJ+4ETGf8PyBL9XYQESzA25f1o34oXCN/UjhdoKQE6rUMe6ztvosws9T+4eyShQv
 FYe08/byOzi1bg10BZGijJl/o8t8vbP7wS9/sqpGQoykGzGA3ChTS0PABHdagFqcSSeb
 jyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469670; x=1724074470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
 b=dggHwsmB6YB7u+xhcIW5ZNh0RQ4/Sp8v6H/W9+bbGpvw9zJQ75poqgO0se057zlegH
 CVclDWaO8wCjxmRFWpG28GcbCQ+pXNnv7djt/fcYqy5nboqy+zLd5+wTjdIiUtX9ykqp
 W83jFM8ET8taD15KWnKKtAsysZxZbMHIR1UTrwi7RaaJMSjt6KeNE7BuJMGUF2BTBwdk
 t3Qiak9+1eG6nxeMRVneMLSGE2r4aHh241Nrml/VmRqnx0hIimFk8gAkI++hY2r8/kf1
 8Xm0NwxCwn51uQfGAWgLJ49JZk5pmPmRWmrO9PFvae3vDQIjbM6IQUrckwca8YKOp3Uy
 rTlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj8uzEKea6EU+dA/zGj3fLBxPGk85kCgFz4jAdVdaptslFpKWiROx81xpxi5z10gDq1orPHsnEebWEYG/dU2m5vVRUXMbSBKeJGFIgXAlWIohSNe9gF2D/
X-Gm-Message-State: AOJu0YxzJJ328n9SjFSDPZlhbPfl0QrXUIXq9LLyaaknZiVr/pmgQOmT
 /pnyh7jyyBoAhqVvkAv87u2mVQGqBermHS/kBzGUn1qih9C0VnLg3nauRd5NY9I=
X-Google-Smtp-Source: AGHT+IGNiDAP0NpC4elbocTXmRTxZwypqEwP2T7NoNQBek7gp6Czs1sj30tLHKhrLESNRMviHtEwcw==
X-Received: by 2002:a05:600c:350a:b0:424:a401:f012 with SMTP id
 5b1f17b1804b1-429d4ce06abmr1140655e9.3.1723469670362; 
 Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:01 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-7-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0agCSQdAmRYcJrMldLHC+cO/HYUzM/jNOwE7xvoTJWs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WsUwse3YgLVrnCc6/fae3A3AcursWIyaSR
 hcKG6MOheaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 17skD/4mk0mqH2rEuc6Lpcv9Fk9Z9Ofg651HdFCPIT9SXWaxdSmtuzFF10HgMdna2jAU8gVSx5a
 teBho/PIDCcTaBnRl2nfMGaohe9F6FvBXUBt3gyoUK8ws7VHkvJDSa/KJPlwupUztYS3WvUSHFJ
 /EKc9LxNYJ8WOl4h+a0KHjCPQTOMJphsYrmP5wO1v5mHNoWuBnbxURpMSzEe0EXtHGKbL7ftoyN
 V/BvKwz/AlFcGp4vn7CRcjByp042rkUjWrM5C4QOffDdnaEVCsGlTdPd+Q9j/oGG1oPiwjNj9Rk
 EJXOpzGg5QR2OlVBAR/BiPH/O17Zo3xLAKEYGwnEv+9n5xQfoRhFkU8txLoW6kUVxO5EHRHQ9Iq
 VYYUKRr3n4cNsQXegkWk0h9MKqG2jWOe/sLHWWTNQTxBLqOo0PtVSqPwNVK0Yo4xadzdNZ4B/xJ
 DVjB1RIhzwfhUHHCqwIVYmOMmTnMUTTJZz3r3S0skj4aAHPWpyPj+S23pPD8bzAWFXDWETY+Vsy
 Qk3XC066YomliavGy2tfSIyRH61lPSAHFkN3db4nQcAqKVS8DlXh1sFwiBMUK1q1oAPQGu22y9J
 QwLihlnuAYhwjSTYotz/5tGVxKjNaIefeTjk+X+fU46eFbpPJpU7TYmqN7iQqDK38/OJ8k+YGO5
 /7zMI7a8ZaQdSXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/9] memory: tegra20-emc: simplify with scoped
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

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 97cf59523b0b..7193f848d17e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -410,7 +410,6 @@ static int cmp_timings(const void *_a, const void *_b)
 static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -428,15 +427,13 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		if (of_node_name_eq(child, "lpddr2"))
 			continue;
 
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
 		emc->num_timings++;
 	}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
