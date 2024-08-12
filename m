Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737494EE44
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C1FEC78021;
	Mon, 12 Aug 2024 13:34:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85DAFC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so43171075e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469666; x=1724074466;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CxelJ2EbVi7FPWoh5bPyWxBtOLrcrZXgDmweNSFWgLY=;
 b=dczpnHOlzkLL19zSHsprOyobMWGz51O+3ZuLH6azxH8A53FRPLCZqb0eecmj6jqDlS
 BLy6KhLq2Gx6FWneAEgXas3iUl7QMJfIO3lzIttKp1kJPzdA3gfq0JRwBA5S/33oOJg9
 zeJT7x+XIy79ucxuWdXKVn1R36HONh4v21NtPx0sx2I2dS2u+M4nkdPkYxymRLSydb+/
 SWa3DX5e6vg5KUmfaTnhYKh8uAGDENp/5YftF0XU8fe7RokKQQccvy5K7PuHMzt8rayJ
 lLJvpkXfMFDez6lJXlNJHzxEO0t6LfCoDJFKgatDE3Ua3nlcRXPEmBDX9xe8PWF1vQd8
 2XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469666; x=1724074466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CxelJ2EbVi7FPWoh5bPyWxBtOLrcrZXgDmweNSFWgLY=;
 b=C7AgJfRP63S1H/oKxVZwTkuqY8sCsvLrNjf7CIKLqtNMvNj3eql2DWi1oDcL8waHfH
 dDa4PfZEjbRnqA/3iaav74E49qCgCjJ1q7w9MRfWwcEPxtA/YadXoItcfnIq4sgxDrjI
 rv6U/sLSRMqDPdAwVuYNqzG2LtsNIwc53dJelyyhkWDhVxSRlIjAYduou3UJBGp7EVWn
 aTxWUI5tlYevkZRhEWKILYgg7vxCqzrhJvm6Mm4W+ZjxOn1gZrsENPBnF+jUtp7GyQHl
 9a98Z1jQO1rVYo71qUNLFz9/nHDo4Dfs5CGa+X/0pBl1fpQsdxDt0b4oFkgAMlr4BbBB
 vCkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU90GRoQuq2/L0eUPtMMehFehtqWWShTSB6ThtSjEgsOKrAb29e1tO22dTowNVTskFUn60J0ITURbwysSMkYJG6MRoLaXZDe20j4+8r3zcXhvFmP4/8Cf5c
X-Gm-Message-State: AOJu0YxynuF6AkYuvVuP928n2s6/nPRehLwH2FQb8U8JotzqRyvcXg5M
 udQkHBE3uzTMJDOCYwsEYbTyDf9Aa+JeAfe7FeYTSKtRmgUnDqVa6pfG+pl2OL4=
X-Google-Smtp-Source: AGHT+IF/xqgp3fX5/73q32JxRWI738lXHcWaaxk8rQf5ZvZitjmwwt4tX7txoPGOt9wBMUleQlFSDw==
X-Received: by 2002:a05:600c:1c82:b0:426:59fe:ac27 with SMTP id
 5b1f17b1804b1-429d486efd0mr4284805e9.26.1723469665903; 
 Mon, 12 Aug 2024 06:34:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:58 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-4-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h5GVRyPEyZM7BuYLl+uIGy5XE4aa3GH8V2JRysNGv/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9UQ2G2MLUWfrT/ljckUzPqu+/Ti/gpvU3bj
 vLbozfzG9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVAAKCRDBN2bmhouD
 1/h1D/9FBIcRGxE/iNnzoy6kaQiSTt/zZow9zS313YkYxSmkqUcdnFL2JyYULkVMPta7hVQ9v9O
 bZJQVD0bif8TRwAQp1cB71a4T1IENrkqzP4iwFZ8087G4vZ9NdHeU9aLruLynBs9/U631XugQ9o
 SFXgY5vliVBY1jbiRMwrIPbvEPecG1O1/TKbCJYd8ZhjkDXln2l1HIVce++fZhyE07IJqPqBnI1
 8sUFAOB8Eme5pmhnTfeYVvoJ56i+shfDHmsBeEdwbG2M/iv38XN2rrE5+q79M5epLsDdyQr5doq
 0fafsJQocAYUgPZVgrdmnBcjhb9zEKgFVsPdEXvdPU1QW4t1RvSS+RzzrLbus/05ljfhwM5Ot0K
 Z6DywmDKh3uT+EdqtuVpHhIs6rcfAKyjHyEPg4r++MXTNRVWw1062emp7mAlljObs/Tqllgiu78
 uP9yE2NcARpF16zI4YXRDne98RDnw4oBeRx5oFD74w1SudLrioM1ouoFicZqJwMjrSAjuhcRb8K
 +dGLLs8fPAVE+GsBu9pu6z++punmdkhJfIqdCX1VCPrYHcYg0aOPPsaA2MgzrD9+gd5o0lRsQY8
 BAQtw11HqnTQwABAZ1MS5FtvJDkJelkJxE9hWQZZskoCPIq6vj45Ab7Ud2anz27txnCtpZ3ZNwe
 CmOBzjUDD19MKwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] memory: stm32-fmc2-ebi: simplify with
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
