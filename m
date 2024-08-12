Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 566AB94EE46
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BC87C7802C;
	Mon, 12 Aug 2024 13:34:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73FA7C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42819654737so32808845e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469669; x=1724074469;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
 b=xvnZ9A7xudoEs+MyuUU9/Fa/F6b7Je/PysJM8szToaVdjT0yOf94stbiE4toigWtOO
 AMQUiQ/1gN3n6nvKhIqzUSAgJXYWy4VrOVTyGsKSOuLXEKZ2km105+PQLxRuVQR1EwM6
 pLcnZumXVKt74hWYawHWP9OnEF4mkLL7dk2/uR0dg27IJd6W8pI3h4s/6qygtYqpWR0N
 KGE3TIzOwxWilxMnJ0gcWQHqPDFzlhHPh+YO92wM/x6xcTqLMHo4ApgCAl3Q3RFlueE+
 X4EsvdefTYSgBiewGqCVANV1bxjfY6Vjg5F9o4wEIWmJOrbWAQCAwkMDu2/ZxhRBZ1o2
 2nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469669; x=1724074469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
 b=Mz4H3f8kIkg54QUYwsI56ZcM5+3F55ihQF9DpAII+ZJwVI0AEvvlfG9EZ1DsnJL426
 cWq54y1IpMtQbwjv+U0QZthLjarqPhv7RujqBIwkWGSszlqzKey087exW0gijrDHXlkS
 hTVp8boa4vmobynSNJNs5eR9hdwdXsaQmffquRl0zIrx2sMZ/2Gmpl9MUDw2NDmGAReH
 9ld4Mjef2D0imDZEzLF8/lYF9mE2o2na2In8s4tsQ3LLst3PpuVcVu2mvaTGUH+tQFbU
 CpXzXL0z0ZKl188gMMDlzuFMX605360xBZK6fFjH9DLKe7O7/aHMmfdfTUN0nnbXWHwT
 wM/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGKA4zaPB9sQDookmrZ/nkFs7rqYjH5tnDdsz5N6bpEPWhxm7WtgWbG7PineEDglt/+15rYlNAih1HJYDTk3ZSKeP2MZ+hcEW9Gmc5/ib4CWqSgsBwYDbG
X-Gm-Message-State: AOJu0YzVEyZXkp4sP7TzYG45FsgNiHa6YxWLfHa3E/UWWiK2Ql2rWueS
 z2IcDWn+36PrXf0tvOk0HB1jr4AZCqFlJY7FhkjxNR0kuqfEN2XjhsNbK8YrJqs=
X-Google-Smtp-Source: AGHT+IEEUwAlG76HjxJAsyK8S8T/mYq4aEjAVVfNn3IzdOaUbHmzoELCalL3YkqLxnDddPuKFudeRg==
X-Received: by 2002:a05:600c:138b:b0:428:10ec:e5ca with SMTP id
 5b1f17b1804b1-429d4801e5dmr2984845e9.14.1723469668894; 
 Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:00 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-6-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IlxS+D8E+Bo6nHEepn+0mTB7t42TrSmGndFVSzcMSuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WY865X4GH2lunkVHCyM14mLujFcZgf8J78
 qI8SrlTVxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 10aeD/41meg3/8L8q4GOxl5Jxe+3hlN0PEmllVJ2SQY0syA/bR9hZ5HnHZrvd8TUzKepy5Pr/iy
 SDdFyfaLYElBSZYUrpBIJ0eSCjbPuaUaT3FfClCW3EVZXO+OxFPD/NC6IY1HJyaiegFT0SWc68G
 z7Qa0sL2FuqN0bItr5eRrGgOAN+nscmxIw4WqKd7VgPoDTN44IskG7JMI/CPEnJuGPhY5xqzCfr
 iYjP38QLXnQz1Qh9LZdeRg8hS+5HkEwTaqNoBE0kd3JiYjkxdR/5GUQEWeit8zufS8B1DM4/Rc6
 hQSZm6PkJDv9n5P9hLBD+ufLVQKJdYdfJVEC8iraYg/e06vlLB/elPsn/+qb/yM6alFuOb8AfDd
 Fi4yVboCoRyJuvc+V7wKvfz/TcqI2iqSmJNaJmzxtFeNxbsIp7lPMD8LyxYy3l3xQXW5DHKaRvA
 z6JJ4JSxAbNYluLpGBJZCTHl+fIUhU3S0CgxZH5GNnIgvq4Rf6HgIZIL4zky6HtPopfmW9TQAvH
 M6qgaLDwO8DwsDv5Bw1IF3VS0SxwBLiWxLQV1iVKRJiXcpLhDUReB4QFLv1X7ycVnOaouhNPrdb
 eavRIJkAtuQb6YhgpqUazX1eq/fCPLnT/sCa0s59ys02ye5w9qbbg0GqzWnGenksh6pnzHYOsX7
 fBP6UmhbugpR3vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] memory: tegra124-emc: simplify with
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

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 47c0c19e13fd..03f1daa2d132 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -992,7 +992,6 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
 	int child_count = of_get_child_count(node);
-	struct device_node *child;
 	struct emc_timing *timing;
 	unsigned int i = 0;
 	int err;
@@ -1004,14 +1003,12 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	emc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &emc->timings[i++];
 
 		err = load_one_timing_from_dt(emc, timing, child);
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
