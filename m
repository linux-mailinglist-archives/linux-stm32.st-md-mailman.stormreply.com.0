Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69610954711
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E88FC78019;
	Fri, 16 Aug 2024 10:55:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF18BC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:55:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso18484265e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805705; x=1724410505;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xzZC0M9EYFXrRYfn9TDzsNDqOMCKTr68cWUMx7V2XT4=;
 b=XaGCmM4ppYq6DpsA6xJ7GWiVPdPskAJnZUGR4YLjb8HEuX81gO4v3NtYa9c6gcD3qP
 i2JEkResVAvO4hqZ7pLtLO/asgfGf4PVNGRFFRDlEwPvK98qWqWqDEb+adU0lIRMvxk8
 idMqbgl1NLZJylYeHWJWRGhAKGWXG5n1WhmA9qEVe/4xYSfAilW/WQrHjZJoJpcbF5B/
 BpkaA4xODbA6UyosS9hgCLzn5eCSUn+RBYMZCXPs4Z6tbj/3qq/qQfENO5FXnjgdxBvC
 s9zyUk0gTk68HBIPDJxQxXTgo3S2Fk/qvM9hWeYpradP4/ZliKNyX+U8bT0sAVfCaovV
 bWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805705; x=1724410505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzZC0M9EYFXrRYfn9TDzsNDqOMCKTr68cWUMx7V2XT4=;
 b=mXM4zBStCp3bCD1XnoCiklmawa+x88iHeK+kriNeHJ5vZWqWZzn3CkV2Ku5KDJ9ajw
 LfEXEBXmJ5ZEumFX3PTYujySoBVi+o/JRt+N4zLKohR3NeCHnr4F2mNsjH4kHV+6gfs2
 lmUnWjO/am+1iLq+J+zXmqNMEGyBrBiyYs4TVhBdP60kRevzf9bixafFTyT4ftWhMb8K
 qkcOxduokcSWN5wltDwCZgfFdwTgaWenE53sr5P2VEt0Xc5vi8Ith0T8M09is+yzLwTE
 QhjHvsH7mC7NJaVmA3J823u9pbmT3cbXgdkhAm8RguwRtk6unTmUry6QUtVQ4AoaWBSK
 z5hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU58qEd84dO282VopaiEy6byZbd/lLVi683C1QqXIMZ+G28fenvBA//rYb9Z7mdzYMrA87I2uyEviZtYaRk6b3UVYpizpiKSqxo5rKwxIlxEKrnUnSPU/mt
X-Gm-Message-State: AOJu0YyCwZDW3OGGT/joJ0hLdYuhFeZ1tbscOHUR5LwYN/fj//xMJ3Om
 7NncQUGFagBNaRwPSsuZphLP+0sS4hOSTxovfCQnTTQjOg5EfqBOBzYQnIgK98s=
X-Google-Smtp-Source: AGHT+IHjZHJdqi78iF456VbGb6wR7RxT96NknEiGEFoYeO6BRf1QVX7lFBSfHR9ooukIBdApMHs1NQ==
X-Received: by 2002:a05:600c:208:b0:426:59fe:ac27 with SMTP id
 5b1f17b1804b1-429ed7d6481mr18549855e9.26.1723805705202; 
 Fri, 16 Aug 2024 03:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:37 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-13-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XVq1bAp1DPzbReC84gkm7B7jCsUc7V7wiEW2r5jKKFs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/yjJOSs+fjUCguca37Fmp1Np6bS/o8AycYV
 q1DSeQLoR6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8gAKCRDBN2bmhouD
 1z3+D/4vIO8HONcnYaJfvUTePd6DMbBbn9F/+h5JlkVZ9zuC6/FNYFAdsOVvol0buCd7GaQWZvB
 xkVBikxYPZ/SpZ/juDJ1odkOaVuG+6NFpphe6DNYNdwhio6ejIUqUcPYrgF88Lkc315GuP4WaHh
 LQrpEtjlApG1WaiWbwIyWH2Pe6aYg6XG2Qt5641TUI4xcOu9mdemiA6giWEpFo8OS1fA3vgDolp
 YQWUT5h/oXmzvUoFRt6nTrOWpdPc0cUcectO/1sJxCzVAn6+idbkM/UCEF6dxovgd0Xq1rbtS8Y
 HSlVMFGLgkJ1ujF1QHVdPYR8Ms0Qgsk3cJUMNbvRKw4BWCyPBa9GM+1gp8V+5O4ozHdWYpNwdNJ
 WTVSTv3lSokPa/71tY2WlqDaLwd5Wz/5Cd3NxPrCYKSIti5jI5aF2DkO5fF1NES8LHwVKhwiBPh
 1GDrE73cb3PgoZQaGrPa8bA6QZNnFoZ0Isw68JLrfs8DvnyGnS0kJmGZsxZvO10+6iu7fv3BMeP
 /yJ5siDXH5HJP4f8bqPef8kK6KkDxp25JKag4raVN91XG1UeuBdgU+0dIOlTfpGHsfvIgcvemJ6
 N8nBHo+dkh0vyPbMITPZEbJASGRHeSS++0db3mzSmkBWtUYQx4Abnd2BV8WH1C0z24W+pTT3FS9
 U08Yg6h2nsqgtDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 13/13] memory: ti-aemif: simplify with
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
 drivers/memory/ti-aemif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index bb9c8132d8c0..7b48303f183b 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child_np;
 	struct aemif_device *aemif;
 	struct aemif_platform_data *pdata;
 	struct of_dev_auxdata *dev_lookup;
@@ -366,12 +365,10 @@ static int aemif_probe(struct platform_device *pdev)
 		 * functions iterate over these nodes and update the cs data
 		 * array.
 		 */
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_aemif_parse_abus_config(pdev, child_np);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				return ret;
-			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
 		for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
@@ -394,13 +391,11 @@ static int aemif_probe(struct platform_device *pdev)
 	 * child will be probed after the AEMIF timing parameters are set.
 	 */
 	if (np) {
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_platform_populate(child_np, NULL,
 						   dev_lookup, dev);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				return ret;
-			}
 		}
 	} else if (pdata) {
 		for (i = 0; i < pdata->num_sub_devices; i++) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
