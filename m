Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02166954705
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77FDC78018;
	Fri, 16 Aug 2024 10:54:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94F0AC78019
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-367963ea053so1277971f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805693; x=1724410493;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7xWelpTr/XRUqKFM91cNQuNNebnp+T2/XDk25EhyUnU=;
 b=X9fEKTRB+Cp1SPLeYMCzRjQSM9Z1c7eOuzhzT/d4oRn5IV8RAIgUAjjbskkvy7Mn4N
 IhHp+v60wUpR1dI/YfZjrfyc0C4qehyeD5vMdKuPkw+30Oxy/O1OIwXvdsYfPGARjIG1
 y5wum3g/mkRHPSVqPE/LsdmT6yhPLJjPYWo/TWYNFD/belcc6Z0XBLM3wRqgJvaREcJO
 edroUSEC45HSJxDdBM9p9RLLa0h0/h35C7OdNhVLgOoxo40iIhsJ0KfjcigdzfCSIiom
 v4tj0HDJuiGSGZ6Hgj5CRXJ1kOpOBIYoZHkeSJczRKKwtCOTlaWWvtmvD9zvuDLUU2TM
 QL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805693; x=1724410493;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xWelpTr/XRUqKFM91cNQuNNebnp+T2/XDk25EhyUnU=;
 b=iru9WrkHqM3MjI81TetEEH/L0PJPqAXbdl49FXvKWOQ0F6zmOmP1swMpr9dHDUbrfI
 cIFZkoWVZhqq5T4jQ3e4PtI9sAs2KtZjHMicLSqLErpdapMHlA1gwVXwOi0BMAOV8Pix
 RgFa/4E6Jw9DD67FQ//Z4UccsC4lzXGPfdPfsiLUDx7G8ZFUlipuTIvdTooeKpKITopI
 XVGmgCKUeHfJFxR7ZOohePZMZZQcTJaFLUkLsfGuoqGAabO/isPGl6yOOFDMWO931+4H
 Ag7uH0jIxgotulMGEqlxhpmjHJ2is8PMxcxWAmV+8jxTsNregQdIWp17N4gj7glhw7mI
 NSLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULzObxFnSRgIdOXpwfKui5JHHMkSia1wQvUzB977tobPTe4QGGdJ4CBQTACS0oOWnlLzQ9xOYScGppmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8w9JQeMs0+b9S3oBA0T/BPfJDl17mqF14V6r/rwuyvXVaT4KB
 8i9O83cC1Kvom7p2kGQ5bcstK3LcUu2B7ROQU4GLpG2vXNSz/tH6+zdjeBjE9J8=
X-Google-Smtp-Source: AGHT+IHD6wj7Dw8hXlamLzfXLE0YX9yxmT0kZMl6frJAfF1JNE4GaKBDulB0vb8SdWVJZ+hZ4bUsCA==
X-Received: by 2002:a05:6000:1368:b0:368:6f64:307c with SMTP id
 ffacd0b85a97d-371943285e6mr2028271f8f.15.1723805693032; 
 Fri, 16 Aug 2024 03:54:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:29 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-5-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G2yPrpxBXb4PKw54ECzRtlVki76Ov9GcRLuKMdvmvH8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/rb4znf7Gc13+IjmByAMk6RS/9zPzPfxYqw
 7Z6nvJ1sLGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6wAKCRDBN2bmhouD
 18MYD/oCLaJmWOWxy5n36CttxJFqbO51zWjtlcst6hRwuUgHToAatzCC4rqdYj6BqW6udSiOq2x
 MaCjbbXPxz3iOpxzfwcKWbg19No+lmlb1qk/33S3x0U9G2QJPvwticKeSkQ8rVKoCQ0axG/Jk64
 d59f87Oj+o4vvSe7bsarfpHSoxwEgjUVHG5/GvzVue/zwwfqsjCGsyd4eXS+7TCNWhyCIn5arMy
 d8Na9fDtC0X96Vjb5Pz/N289yVyYzZMtPrRDhdCQf0mxVKutUKhovg+VIGQwfBYJn8zh/ZGk66X
 DnuFEXvtDvlbr3h9lprlTzxCx/NRlVE/inFAV0lmj0GkErB0jire5a0G8+2/TMBDPuOTQu67sWA
 AZbrnvBUiv4vNpo9dtFviLw8KmYvUiZQ9VJCtwrVDwAYjtaKvWwu5pUiODcp98nbefbrm3pI2Rd
 THvcNlzPdoge696l78CgQUFoI5nxUVT8pPm4jjf82IsTJTWP2SWRg6NIldGL9doI71w+PQe6u+I
 dn4MAXawWNYuqEYgnvKY6sKASV82gYBZRe+W8jWBdobXx46WliBPxQqeY5WU5WaZe8OQpG7haL8
 DtnPg9H5b0Fdv+igpVtGJ1c7G6tDzTSUiatX/wgxRi1EO61LToCYLGG6PmXswqAUADLuNbXmpWd
 5flfqJkZrR5Iblg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 05/13] memory: stm32-fmc2-ebi: simplify
 with scoped for each OF child loop
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
 drivers/memory/stm32-fmc2-ebi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 1c63eeacd071..7167e1da56d3 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1573,29 +1573,25 @@ static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
 static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 {
 	struct device *dev = ebi->dev;
-	struct device_node *child;
 	bool child_found = false;
 	u32 bank;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &bank);
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			of_node_put(child);
 			return ret;
 		}
 
 		if (bank >= FMC2_MAX_BANKS) {
 			dev_err(dev, "invalid reg value: %d\n", bank);
-			of_node_put(child);
 			return -EINVAL;
 		}
 
 		if (ebi->bank_assigned & BIT(bank)) {
 			dev_err(dev, "bank already assigned: %d\n", bank);
-			of_node_put(child);
 			return -EINVAL;
 		}
 
@@ -1603,7 +1599,6 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 			ret = ebi->data->check_rif(ebi, bank + 1);
 			if (ret) {
 				dev_err(dev, "bank access failed: %d\n", bank);
-				of_node_put(child);
 				return ret;
 			}
 		}
@@ -1613,7 +1608,6 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 			if (ret) {
 				dev_err(dev, "setup chip select %d failed: %d\n",
 					bank, ret);
-				of_node_put(child);
 				return ret;
 			}
 		}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
