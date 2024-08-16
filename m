Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71E95470D
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 012D7C78018;
	Fri, 16 Aug 2024 10:55:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A9AC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:55:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4280ee5f1e3so13347775e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805701; x=1724410501;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
 b=vkj1vQyiQ+eEEivbK1esnGMmIfg+Ql2RgI0WWwHLi7h+Vo+MgXEQ4GVntuHpXiNSxX
 ZH+5w3S7LxmS/txEEj8Ty866ZFq5lICZZZfYgl9IqGuElu5L3DBq2EgpDFDEjijrhJO3
 rrMXCLo7AKLjb+tF3tOAdXqLqGq9zo/0kZQU8QMkh0rFCpbXrSUw6E1zg2DaGKJp9juf
 pckhA6wMQZfGzjwMcs1lyG8i+na05ttXDzza4HK6hpfwRNKVg5qVtCU9jTTmJs1aI1bY
 ngBBh3tWrFNG3+M+vrK07rGNyg5MP0A0bEzoMW5384Yq0IDRjjN1Eu4pODC3AZdFl+/Q
 ttRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805701; x=1724410501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
 b=jarHiuJk7JsUQKLNvu0l3WZpaBGNOCoUXwPTeI+krkKvsZ2Nx0pKxy+LqlYbq+S8AT
 nDhL3YR6lE70lvm/dk2opU0Zr8wDtDs67uW4aiqMutgiq5xEI+ico7Vhe942R98AnShS
 IiibS/3CEwd4glMDpWCW9SffH9CMaEnkuzj084liiMTqg33KL1CPAZV5NBD5LHtmFX9m
 b3nIS0ZBAeoVkmAv1byF+HT2YC4jMWYvJOapV/rNrI2tOvn0LNs+HpuoqgYLKAeetZ9Y
 0XJQixdtdKj7kQ/pN0GF+jTKGdWQG1DfvXyKaBdWmsjVr08a0xfX0a7I/PZLLRnTl6wR
 Y/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsmMMKodcVUbDPfWzS5/LsNLcFtmDRfC9lZvRLKqYd/vSPAcTX5p+VRc1ECVn4uY6rvSO3njGpjUIAoQM2biHnj9FbCmLjCEcwVSvlb4i5hfxvv9QWGCkH
X-Gm-Message-State: AOJu0YyCSWFdxAGP33ufrL+M5zMO6GFplGToF+dLN7KAeMOTdS+IwvWt
 nMK9Ci5gsF7iMTicx0GPYnzACTHu4HHXGzuZ+7OQFaMIB1UWeqmiVXE3rtgHKkPdIOh22prI28o
 YItk=
X-Google-Smtp-Source: AGHT+IFUFl3LQZH8vi3ztVQty6MRmIGJqwYCsBA71b8YZWr3zj41X4UgzipPWDyIskK7OaUErYWEjA==
X-Received: by 2002:a05:600c:5101:b0:427:abf6:f0e6 with SMTP id
 5b1f17b1804b1-429ed794e83mr19346385e9.9.1723805700849; 
 Fri, 16 Aug 2024 03:55:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:55:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:34 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-10-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Qm8I2XYrN4e568eaRkgeUjoCW+fRdkjecwXHEHRljxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/vcqoU62xWOzA1Uh1XhtoPiUJ6/p082Y6tV
 /NdOgZszgKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7wAKCRDBN2bmhouD
 1wTED/91/aMKQySe34DvngSXlprbbqVy6N5seV1kcoB1yChmNG0FsMDP8UW9rQzbmi9E2LC9gvo
 93BdO6pP3JQTRaEvxG3bDLyFWuENgrfLBLw74JQI0x0ph+OHns7cxJfxiG/0gLhSPsfA5s8Y5U7
 cjBNMhBLld9JvKkhu4vketv8eiWTxu4aQ2u8dVwfqXQadDhAqfEGFzctPWipkWQoHlkZdXOTYGw
 ty/HFh/Q6mTWG2EFRNxEQ8OAVgK2d7s6CkTRdi82rdRn8aAlhQHqH2M0V68PS0Yr0QhbpV5g9nd
 eb/Xn+8Dtz80s8P8RoHX7nqhZuGEXjoLwTmWoO0LfUGpUEXB3Mzxap0OdBYMHLkMyDtF60rv7V8
 Hkc3LU9yZ+InrVgGK3WWYcrJI1lQhZH7obEFJjuPaCxQ9NefcMJiryO/30ctIdU5go0XSAgqgCt
 tTyKtsLD997xfQT2GMAxAzCjQ+CJ50MQS+h2pJjs3QT+LKbr7aMKEyLCQpVEyNtOgqYlqkd/AyC
 Z5jHXbA1Q0ThDYTURtwDz08/yMB/VYpCtqbYuHGhWVetzB8ndOMbJqVl0AulziVSLPjwZOE/M35
 WV/hGezQJCAHALZ7CxOXO3EXB3aXTC6PJQGTSl3qAJfUwvYBpMOCbU54aWOnGSJoe/t5Mt5Cxw0
 joPKpZTK0fVMryA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 10/13] memory: tegra30-emc: simplify with
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
