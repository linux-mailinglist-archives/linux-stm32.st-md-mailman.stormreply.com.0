Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6095470E
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C731C78006;
	Fri, 16 Aug 2024 10:55:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F084DC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:55:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso13415695e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805702; x=1724410502;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c/iamU9GEr5KdpKg86o77KhrKhRKzAxdW+GEgZ6rSGI=;
 b=FKNg2Awjej6McCETnatOMYiHcxcgD7NQnWRYot8wHWBq/eJ52wVxxEk+yb8sbttXvu
 8WroknyL7hAUYkFY5GCWdG3wBtE1M9Kx0Db3zORtyMhOqLn6MDSx8CmYUpAKbY/pmKTz
 CTB/nzcNLjj2prjqXt2UReKc4aSeqqjI9T2DG3zYrOoOMVdRgCTlYckVPWwGMR/1UzcQ
 EbMz8VYzj85QeZRLevdT4YRaKBrB0Ml/Lg78N+ofG6pP+8r2BfdlmPbyZ0U58pL1BAav
 XH2PTaC1eInZB6lkiTGNx2OGwi3H1k8V3BNAPR4gVcezQ2y5i9PqvXN/wkasq/mzsg4F
 4Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805702; x=1724410502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/iamU9GEr5KdpKg86o77KhrKhRKzAxdW+GEgZ6rSGI=;
 b=ieaLBtWJV6SWkJcXWw3pkxkBaU543bWRZPKJLf4SBhyR3ADVlszYDtIGI+zXj1G29g
 ydRxqtl0OIq2VLfzt49QfaA/WUBuetqxWoUyLsBSHAAiQBLJoshKLMBAo/gVpbLb0Zyk
 GqQZsaVLsLp92HCAAeRe9JSVh+aOT/vgskPat58AoQEhRZz8L3hA+TZFA37VA7s0sa7R
 m1oYjmgD/ZTTvcXkO9oB+1qUU076n8EJmtKPPkVsmA2817BcTXuvqcwYT7WB8FDjW6GB
 aJl9b1K5KkJVuMjIiL6EJFAdpEk1+4HysyajZSG58ZErsFyo/kO/3envUNs4V59V2IQQ
 9GNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3wEnne9/iiIfm+LyScR7MeKHYitDWWkpYxg7nLmNWhG00lIV58fm8HMMO91ucGpk3kX8UU+1f/n4fDLLhKRtBHviQAhUkQTsVEEh9lrJYm5kwjb8LYpQq
X-Gm-Message-State: AOJu0YxoXcphIDac/Yo+i7MGh5YoY2HGFXlx4puRZJZk9dz+MgcjsMaA
 HEzVsK7BXi2N/aXx05GC4g31UxddnOH5yLwAqoSPriLXU0VfSDIxJmJtQ3dUgPw=
X-Google-Smtp-Source: AGHT+IFqPUcKioelayo+oH3fVDDKVUXmOzw5MuZiD+mM3WrmH/wV11bVb9kfp9ex06bAss09/vs1xA==
X-Received: by 2002:a05:600c:4688:b0:426:6ed5:fd5 with SMTP id
 5b1f17b1804b1-429ed7a5f5dmr16488295e9.6.1723805702352; 
 Fri, 16 Aug 2024 03:55:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:55:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:35 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-11-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VDRAiPcP3Nj5IaFsGnt2Bd0rnGw6XleemS6wXHO20gA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/wrCSs8PTy9a+acv6ve1DhHDKLl614GOqhd
 SLF3vaqGJuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8AAKCRDBN2bmhouD
 19QTD/4ph7Rh9kOERlKeQFJlMtStsZ/eIUNcyB0K1URSMda/NtsfAfnuC/k29h6RvyDDcqr8xlU
 4XTcEwCMwQ1nBxT7XwQosn1m7gZ0xyPyfstMv2PIQ4dlIutMxCGBsUUA9XUiKnVr5Z3C+ifWmVs
 hiCR6YfmrmHZfjvpidFRdVOhblMIxh7DEwIV8WTCeMQBlm79y3Ah4KYJtwZrjMnnC5Y3roYoOEp
 FKnlAjPZuA76rEN8IrNHYMKtm+G1yAKENn2PtnYN7Fl/JtRFPjhS5jz1QZ+svOcTVrUTb1oBBwh
 8O8Rwtppmn+QM6HXf6B766Qs94/nbBi0B61hffqHUDWqAYbcQcw3uHydhMv2vIFyskftpsIjlCv
 iz5SDKPf5wpdk0t8K7FRVMAGAMtDCgeCi4ncPmwW+lnJp3AmiZp21UWGHROnv3cRo7bU3de+WGy
 lV8Kqsp2Yrl9qRYA0I21p4fKoMY8E47YKHjbZ6d4EL/7ADBxSrAWDosifQkJXVrSNWp5xhoMA7O
 uzrobE9b0fbPc1tPdhHj9rq9uog9sq6xmJOthMwvkmCNwWUrDCya6BUOkeQ8OAfA6Ax53z/WQG9
 ADoxcmY3NwxxKo3ClqYQRpvaRA8CgXN4mBgz95fJty1IUKESCJ+a1idDrbVjqLVO3i8cgccxA2T
 bGuzLnFPy3XU9CQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 11/13] memory: ti-aemif: simplify with
	dev_err_probe()
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

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/ti-aemif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index e192db9e0e4b..360f2705b1ff 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -345,10 +345,8 @@ static int aemif_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, aemif);
 
 	aemif->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(aemif->clk)) {
-		dev_err(dev, "cannot get clock 'aemif'\n");
-		return PTR_ERR(aemif->clk);
-	}
+	if (IS_ERR(aemif->clk))
+		return dev_err_probe(dev, PTR_ERR(aemif->clk), "cannot get clock 'aemif'\n");
 
 	ret = clk_prepare_enable(aemif->clk);
 	if (ret)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
