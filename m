Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09349AC3659
	for <lists+linux-stm32@lfdr.de>; Sun, 25 May 2025 21:13:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1B8AC78F6F;
	Sun, 25 May 2025 19:13:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DCB3C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 19:13:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ad57357567eso20390566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748200384; x=1748805184;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
 b=fg0aLZ52snrBt10Es3GEwMbax/D96yfAPT4/ZIcs1jqhdtEW/DmXeLGwkBbgEpesqX
 Li8QUkLeBzWivC4DmJRMfJEKfJuFMqNuWokxkVAv38jA6tidW5+g26/LxjmKCAKOJO5H
 qcobM9OtCPBaj8ch5daQsV7p0ujXrse0PrcdEsHBMg8TNYYBM+J52NIO39CgBEJICfrh
 0UGFlELLUwV32tBJeW6iPCWkcvGOB71nnYCRHezlqpdzKSTRgToGdoIfjPrXIdBSCTTR
 ps+XOoueEFv1VnMR9jlGM2FgyoWvX38vwn+ry0SCbFVwQru5UaZ0pOUolSs/DV+JZU+X
 OznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748200384; x=1748805184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
 b=MDcA1whmWmrbWrydU+9226yr1LEU7mG5VL+lZHNL6vmPVG9feRr/rRjySFF1jFfnLs
 yTtq9iil96idq9QB13+2M17thUw7k+sb8DU1QifEvfCA8IL84Ps1/bAZdGgOd3GxqqgV
 +DnGELn0zauREgFhIU3UvWg7mfgZy72jjQC5CR814KWXGWWDV/8aDpji6TksrbX0521q
 LWg8dJCJtyR7OKrpmWQLnExsk24h821KFZsXPUG4JHtX6gFAJzM1PbFIupvPO5oZgaHV
 sTOzRSgZ8dDEHzqXNh1B4ud14+5ru2hWKrKYwB0/eYwMOWwoOu0GJgUJ8NbClFYTTePd
 3GfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf6TVnBDGOR72blg050mqqI78BHpBX+7lt+JOCfdgE1ngsLf8WuD/9QeP9u6+dsAsEMl17vLMwWg6Kpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDV1jnOw50H6+PxYyMHmlhRYHnJGxNhamVtpCtAD7aMtek0GLs
 RmqlH8KSeQpY3eiQzTRpe+2GuygJT0WA3k0rxXDKwr2/HJiPq6GIDs7OLsIw5hJ0Egg=
X-Gm-Gg: ASbGnctkvBmAwct0T3OHneCV6ixtxR73OGlbU1NdnpnIrHjWzV2hOyl3UJ9EJArOdNk
 c2UHYLBBoukpRxx/sBkk/OItvaL54Kyq9z0gKbo8hWHI9Ge0K3B1GvoVT2k5E+6h/km1PhrlZnF
 ODc3Y4WeNZ7ghIyAFno6EpFLswiAm/JTHjHTvqX3Zr4cMk9Jbku/VpnGBpQ/hvZorZr7f7d9m96
 dyYNLnI8Bm9pY16adEDz+REZ4DxxUhiT0vzU1shSCXIv+6ETvn7RSOOsNwYj7/7kiRaj92p6ryd
 zwJM6X1WFMrBuSqegMan72Lz8W+rWCVR3aqccMJavVJenobTfpoAJ3VEzteaeA==
X-Google-Smtp-Source: AGHT+IGf+2TeC9QK6dYZbJRoR56I7p53ILlhtD29asCKt0/mN+wu+zXhz6Rm84i7lO34hXxNMSklQA==
X-Received: by 2002:a17:907:2ceb:b0:ad5:1ba6:2177 with SMTP id
 a640c23a62f3a-ad85b07045emr167132666b.1.1748200383657; 
 Sun, 25 May 2025 12:13:03 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cbe90sm1554533466b.165.2025.05.25.12.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 12:13:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 25 May 2025 21:13:00 +0200
Message-ID: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=UodeGMQ8/36hFynpdApuECu5dDrxfqy7USHoaaccAzU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2u8ux0aH1Fna9DGhdBNraJjTPdmFk5vieE69
 Bby+tFVA0GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNrvAAKCRDBN2bmhouD
 17PsD/9JDR2rnMkSvRHRyOxDJn9SHRhKbdOGbr/z2BZUD2Q3Udhuoagd9HJVcK/w8YczZc4hURK
 lU8HwJvJQmqZeNl52AbkfdE8AQwCm3Gq527piNZIF670p3fu4fvO6TTCfr0/7pQ0EypWkBTUMAq
 g3ntprR9Ltc0PvMRv6JoILjlg6iFlt+RPV1uWm9Dgs04QX40e9IoEmD/s/eX22eKaAMQKWiqInb
 i95/ALzUOFJK0UCt3WclL5kUv+Nm1jfgr27hV1A8uHuWQox2jpxqG+M2DxVenEhV8trKn7kaPPj
 AfYUg9qHg2KcZRAxoitg157g0y51YJDMWzRIyBRJuhO4b0H+w0X05yLS06CpdyY7dBQpjFFXv0G
 choT6n8YDDBtNDizwrSFeULMn0ASaThqtVctlLgzTUnbK+2br1abXSYlqOwaMiA7+twzcsX0yBa
 6+ko27RDUB7Kbu4FPFa5Iwl5VUqXK/oleCKlFPDdcGj/qYBEYASbYoH4wKYXy2OeKD3vFQHzL3x
 4qvgO67NFLfAV5+qEpCKQ9LcmImXPccX4GmIpiX96mGIm1gmmmwV5bCuNVOS5XlxHHpuyD4mLzb
 DLz3cX+M4ExbFfiSOMwBZQkd3UEOIohp5u2llvVQJY8ncZ+byPDkrSrYrUPLOMJV2JWJnR0tvzW
 88dCxUyJBpvPfPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] memory: stm32_omm: Use
	syscon_regmap_lookup_by_phandle_args
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/memory/stm32_omm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 79ceb1635698..bee2ecc8c2b9 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -46,7 +46,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 	struct regmap *syscfg_regmap;
 	struct device_node *node;
 	struct resource res, res1;
-	u32 amcr_base, amcr_mask;
+	unsigned int syscon_args[2];
 	int ret, idx;
 	unsigned int i, amcr, read_amcr;
 
@@ -98,29 +98,20 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 		of_node_put(node);
 	}
 
-	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
+	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
+							     2, syscon_args);
 	if (IS_ERR(syscfg_regmap))
 		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
 				     "Failed to get st,syscfg-amcr property\n");
 
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
-					 &amcr_base);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
-					 &amcr_mask);
-	if (ret)
-		return ret;
-
 	amcr = mm_ospi2_size / SZ_64M;
 
 	if (set)
-		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
+		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
 
 	/* read AMCR and check coherency with memory-map areas defined in DT */
-	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
-	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
+	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
+	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
 
 	if (amcr != read_amcr) {
 		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
