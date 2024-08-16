Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41E954706
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C55E9C7801D;
	Fri, 16 Aug 2024 10:54:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37895C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so14309405e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805695; x=1724410495;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n3JBsocw3Kxo+E25kYGT4nJEc4iHDY8+0T+RDH3CrwQ=;
 b=plxxe41cVSZlGD3C/XEIivsonoWkNgKChoQDcPenpxcwJYG4VsIlYpgOB2Ks3sR/rZ
 lxJHFY+z83eqNBzJ7nDvx6S9M9oIjSc60Vz0zNDduEorM3ZrmsrKcw3UMHPxUVmmoVFR
 VA2cjteksQvuy3jEc/SVhgvYZSzxzAvVMJDhbiau6kfs42hv8OnKA3mcAVebcuG6mJX1
 iycE74PW7yZ/CFRYiWPZ4gPvmUgTPBHFZ7DYZTHf/++DTz8D9TQUUEhKgvoJGxjzecMH
 83A3K9lUeP68dKgf6UHy/KFYx//xeFIH/ZP1t85PG85bO88vC1JPvBLfRUzIFaoJjdd1
 bIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805695; x=1724410495;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3JBsocw3Kxo+E25kYGT4nJEc4iHDY8+0T+RDH3CrwQ=;
 b=w7mTqka6jiCxi1FwP6/f3XEzV+evLsZ9tygr5rxiTOAEq0QETMLENxbphTFOnr7FPC
 ytXfzM3vVTl0+R/3kFVDCZtPBZ1X27qiJn1PD5525lxCRoFnwLpPy5rki8OV7+obEYzg
 TiGEck3Pxg58EVJn0dlQ4BVnSmcEFzp5S6AUA9vcbT2wMxcPRPhzX3gEuWHfXv+Q+nS1
 jU0hoxTXH4gg9tj2oo2I50K7b8h+WaUorODM4Y22GLkBMYSyRydnYUMCheJ/0rLh+h/N
 w57TeXemD3F0f03PqfCz1RE6qLhehESpjm0uB7fUCPYiJKj8hp8/5ypEJe4zWllywggR
 Z3Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtpOXR26BLW/CucrfnF9fVTXopVLmG18krWFbLvztRnIiTLva5c6eVvRWkVlaxda+NiPVmWCh97JxS3OXtdwYgG4XeVlSCMNhfCf4Y+jg4vBh1OOLtaWYB
X-Gm-Message-State: AOJu0Yx2gx2pxbq6Twu8Rj+pXBn26/evzTC9uSgoIpvGRdChbJGgDKXr
 0A/GM7p/x8pdLjfF81bllmY21xRADFvZFBaozcaxjpq/MwNpzR93sxh6SXrSiN0=
X-Google-Smtp-Source: AGHT+IGn24wROLCo//DeF9Mt4n5RqsRN4gzOTX6eoavLir3z179fbxoYWt2i3lJKrmfKXQrfoXgzyA==
X-Received: by 2002:a05:600c:5253:b0:426:5b51:109d with SMTP id
 5b1f17b1804b1-429ed7db6cdmr13568165e9.36.1723805694621; 
 Fri, 16 Aug 2024 03:54:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:30 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-6-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wJWap3GNtDgLkBsWgnZ2oGeVybItqtjwJfBbYGyPlo8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/sa1xUY2YBbxWKQP1tRrbI7EqugouDoNZVC
 Bxnkk/Q3qWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7AAKCRDBN2bmhouD
 14EjD/428b1j5rsiaZx68rdq6FjyH4n1esOcsNDQiNVBlR4beEtg6pbk2K+emMl87pLVexTc2tI
 Es+y1tj551HtjBN3PqK3+JqBC0trcXcilAiFzYScxywj6dzEmrD1gpMVj95qyaJSZQbemKTA+TY
 MKvjLPhQtIsoaNEOUWXyVoK4Q88HdIW6ZzKjEwnTi9cHljpxbOjpA6q5q3IT2pyzYTbzVHQzNpZ
 +3kg/GACYNB44ceLVjoCzujsdHfWY2VeIsO33kZMG3MYwjU7YqnCTUZsFOnSbvON74kB7tBW+i0
 HEWc9aH75+TQIRz/axO9yk/PymB31x5t/ClfslDUwoGvMui9XnVf4CF8XIk/3xjbykNxLXfrkJb
 DVpJvmhiHvF4+W1UZy6tEvIqvzJHMCogCGapsN8DsaPdCmDx5ipOy9RnxZ7PRKaU23KHA/9w/3w
 m5M14ycC5TG0e9cb9VoQaYKRftqHMIDDyUIHXXeC9IZuOCSPY9hyAxKvOLgpXL7itZU902JzVPy
 ZLT6/DluBzcv2jZTniQ20gHFVZzIvl14HMXmTlgYBJCruFV68W5nndXMCA84RyMLPHbNhTo1S0p
 YEllo27Ct2QdtJtan8MTc6dSbIgQ5UWchNtS38wgjjg9qRV9k1N3ZPaU+XRyViDL6FnJumJl+yC
 Xtov6VwsVHfu4Nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/13] memory: stm32-fmc2-ebi: simplify
 with dev_err_probe()
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

dev_err_probe() combines 'return' and error code printing, thus code is
a bit simpler, even if it cannot actually defer.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/stm32-fmc2-ebi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 7167e1da56d3..566c225f71c0 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1579,11 +1579,8 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 
 	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &bank);
-		if (ret) {
-			dev_err(dev, "could not retrieve reg property: %d\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "could not retrieve reg property\n");
 
 		if (bank >= FMC2_MAX_BANKS) {
 			dev_err(dev, "invalid reg value: %d\n", bank);
@@ -1605,11 +1602,9 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 
 		if (bank < FMC2_MAX_EBI_CE) {
 			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
-			if (ret) {
-				dev_err(dev, "setup chip select %d failed: %d\n",
-					bank, ret);
-				return ret;
-			}
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "setup chip select %d failed\n", bank);
 		}
 
 		ebi->bank_assigned |= BIT(bank);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
