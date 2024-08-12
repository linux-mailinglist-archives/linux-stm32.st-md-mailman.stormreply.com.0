Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29D94EE48
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 335EBC78027;
	Mon, 12 Aug 2024 13:34:34 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF46FC78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:32 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so50635351fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469672; x=1724074472;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
 b=Z+sjc+J7ITCMJnLTJ97HwWYWIhn8cjiXa71uizqPiVSc//E5R2b3FFuGa9XSWlF/NR
 /C/T3ZGGduXPAhwZA46LRhs54EWwbZ9gpB0OJ1jQTUsbqSY71kQi/B8wT71QLhUqmWvo
 Wyu3iBXEXc9ybOkNweMr9+QobUJDMUKAWXURbhpRz8rE9qjGBFD7cf0c5kJVf9DCgJbF
 iwBRUqLfzz4PZzTVGxSdtvvrl7FYgLStDoEnjsCu5RLWXkt+LTVJXZ5CS3erKyYYRXPy
 La23DSCci7hboQujLCUMAJdeklag2cP9i5/NV3FZUOJrFUyyD7WWzGjgV9VasW239gMX
 aVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469672; x=1724074472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
 b=v2ZzSimzxR5iiubLRVwrZXVQDZd5I1Rj1k1grDWW2HP2taoTxoZ0z8v9t6EuALjYa0
 IdMGojKUlkJ6m890CbZLx4jqxxHuQ6mzGBym/TS0wPX+G+BVd5/pFz1ki7K0hHOI/h32
 pYx3uK8zYKmUe6l3ybjTx3SuxmUmtcaEXHXf/uGCJVXv5XouARVCU6aRs+p9FlMO0vMg
 y01dP+S/hNQzATIEvMT4EY7FVkyo9qvYeqPeqQRK/0U/0hUuYrNe6ZZdMjGfei3rU/Lx
 Du+KpofaTKtjW5EZjMqbyVxinm4o4P6QmZCfi/Ha+IORk3MEhbDHBhwCfzyt2dc16zpF
 yrMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXByD0f0sisChPiddcpuWSydx1Ffrrl4XbOSpbWkNuEbItpL3eyEpE+QSQW44dUVKatfkB0mqsnvnilemcGQDUaL3qgJe4tibh+jKZBzXlPWTB+0Qq88Zg0
X-Gm-Message-State: AOJu0YzR6njGZGhWKieF0XMwbMOeekp3Vtw7Igv4sJjwLpRd4IHbOVfx
 coWBHHtpn6orvOvtAwmUSPJk42R7Ij9Pk8orMgWoLUV0UC+l/MDzPKreHah+8d4=
X-Google-Smtp-Source: AGHT+IF4Zea8h7AbclFyhVQtS9eZT2Tc6EMfJdGvwHFdzc3KpbF32S6sd5GGemZ+KlUJ1S/LzaVfaw==
X-Received: by 2002:a05:651c:b29:b0:2ef:2281:2158 with SMTP id
 38308e7fff4ca-2f2b7132d7dmr2306451fa.1.1723469671912; 
 Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:02 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-8-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Qm8I2XYrN4e568eaRkgeUjoCW+fRdkjecwXHEHRljxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9X8NotaoXkCeoFvECQEThprz5ONHsMuzD7b
 NbNcj+DjQaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVwAKCRDBN2bmhouD
 19OvD/94A99rooiagSr1yUUB3q7Tj/0CpbQTlx8GEwagkJMZgezQJ8fSt8lsJRwMBXaisbT1RUu
 /ugtoQOyBWqkLkCZWhr/dt2MLe/xTHkqATxxMe/q3D+SgaGpBqnpb8s3OCcUoLRH2zLUgkSNI/B
 uuVVzd55ascHajpNWi6sBkx/4Ze24W/M4Kzrur9iytpTE0r8vhXx66INDaF8DWK1OKaSFR5C+87
 Xi3jQE9JUlz3sNAXyieSjga2IaM8ORwSZu5uDrQ9H5dih3U5zFbTcVXbvZgWBaehrOS6NJfiCd8
 SzqME8XywWSTxtLCXarn4TdGn3FqnR/O4walESXFoC2LygReE3WiwB/R+ZBHx3iQ7m+4NGDKZK6
 VBpdwrbh0T3/x+HpB1Q1KJZvfqxuUUEOFea5K/1geiiMiFJCWOk3r7PxgZgoHWn4SwuTSHrvFYI
 +219oxZut/xhcq+BqRzL/oR4EZ9TyOFAxpt7eqTU670YOGIom6tb2FG/KaN0L2UuCqlodmYVNsY
 iJbDxcpq4gIrMimT2QT6S+AsS5JZAIV6l0Rg+otm9KBlrSMLK0JFVzGsM/vcvY9suDvqXV0rtwP
 LNsXWOvL2mgzo2mkBI5TGQ0g7g9fhaRALj9GU1rbiyjbDY3dZneug64Vgj4jUmWBINShFwvH3ag
 Y/cmVhGViQKghBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/9] memory: tegra30-emc: simplify with scoped
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
 drivers/memory/tegra/tegra30-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index d7b0a23c2d7d..921dce1b8bc6 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -979,7 +979,6 @@ static int emc_check_mc_timings(struct tegra_emc *emc)
 static int emc_load_timings_from_dt(struct tegra_emc *emc,
 				    struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -998,12 +997,10 @@ static int emc_load_timings_from_dt(struct tegra_emc *emc,
 	emc->num_timings = child_count;
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
