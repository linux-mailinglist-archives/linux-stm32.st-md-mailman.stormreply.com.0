Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 137721BF459
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 11:43:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D106DC36B0D;
	Thu, 30 Apr 2020 09:43:51 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C28FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:43:51 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id y6so480678pjc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PMlWSW6ttnanNb8wF0bobaava2tVkjYUTBjAcm/ZuJs=;
 b=MFlPir4vo3tEZYxlusrpRQF5dV+NyqZ+15+TQFJLozgqv+/HoDTTsM9j5hQMDFgyI5
 /QPcVzxBAlfOI5DCpUcUmQPdN3BpfO5ImVwMShy5sFSa6XAqvb/69oqZIgApPKizVlib
 p2Z0OeoLvAPyMWpI5Ah+svBEvUfQfakzUXEWT/g36h6Imiwt2O/UwWeaWFpu/U2RrjI8
 3wJaz9cELshAdY2rUcOq4Q8NiaBW2R2EJQf6dkyPNvxcT1dhz+tVp3WI+UXFDtZDEpRH
 Wr4vCgcociS8CmaTZYdyDFNKYLMNQFgpCQEMJo3OzPjoQ7AR/utuwMPMTdoKeZSmF0M1
 NbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PMlWSW6ttnanNb8wF0bobaava2tVkjYUTBjAcm/ZuJs=;
 b=hsXUcehF34ME/6BZled5c+LGcr1tjShaaSPmgT+Uf4uSfX0/fXcIkEuWMjZZXZdsjg
 LhLNNZKS5F37lmnDFZBHzKhG3ZQ2e9rL55ubBeLnkPE6h7Wu5449g80TGaNr1qcLbtYW
 Xycc4G+Lc8hkBhYikD3ObYerEBwX0eioFzxhvu3M/sChXaObVFKjmJeMXpwJWIQwJ+ef
 lIjzYbfUloYS4zNqsPRZ+/pmqJsci0JnY41y38Ym66OuhEj4pWwtKnChllCi8Q5gqA3C
 SqWg1uvD7p2boCXZVC5msnBHzNhyCG0LYjnGbXz9fx+356ioFth9rpM2Aw5VpBAMNoKR
 rW6w==
X-Gm-Message-State: AGi0PuYjWdxjmblXOC6DiPASr81BeY5C06SUkdW1FTZHftEgMqCYD/jJ
 c6zYk/1+V+8TAAEbGbcQrXM=
X-Google-Smtp-Source: APiQypLKUFlZg0CytxNp74nTXeWU2B/WRcjEZ8j8XaaORn8LkrMUWInRi+XbgmfA/ZJJ++4rjGTf1Q==
X-Received: by 2002:a17:902:a586:: with SMTP id
 az6mr2779889plb.201.1588239829729; 
 Thu, 30 Apr 2020 02:43:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.101.138])
 by smtp.gmail.com with ESMTPSA id 5sm1307138pjf.19.2020.04.30.02.43.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 02:43:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@st.com
Date: Thu, 30 Apr 2020 17:43:44 +0800
Message-Id: <1588239824-11491-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] fix hang in ltdc driver loading bug,
	add CLK_IGNORE_UNUSED for ltdc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

1) in clk-stm32f4.c set clk_hw to the wrong offset PLL_VCO_SAI, PLL_VCO_I2S
   of clks array, should change to PLL_SAI, PLL_I2S, otherwise get null from
   to_clk_gate

2) add CLK_IGNORE_UNUSED for ltdc, otherwise system will close ltdc clk
   before filesystem mount

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/clk/clk-stm32f4.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce..bdebe05 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
+	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div",
+		CLK_IGNORE_UNUSED },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -1754,10 +1755,10 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
 			&stm32f4_clk_lock);
 
-	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
+	clks[PLL_I2S] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[1], &stm32f4_clk_lock);
 
-	clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
+	clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[2], &stm32f4_clk_lock);
 
 	for (n = 0; n < MAX_POST_DIV; n++) {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
