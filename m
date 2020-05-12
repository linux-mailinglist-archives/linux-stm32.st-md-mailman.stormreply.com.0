Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C341CED8D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:04:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEEC5C36B3F;
	Tue, 12 May 2020 07:04:10 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 836CBC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:04:07 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l73so182694pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cPYlxJhfKmWtbP4a2dRiIg5n9Tzb/bTlK0+j+KORUjo=;
 b=fJSL2ofei13tcbkZZb/Pr2NnHzs1Y2rSHpEwbHjNlqAa7o8IvZixYeWVN0GwMPsg3e
 NxAQzgeAo4o4vpJAckHUOcH80IP1TYeqpPIGlXUVpc42ex8nU7V6rEYV9TBblsrf8BEC
 HUIAaYhUqYBYn9phOtOrgDq3qusl55w6vxMQXl5OXAtVE1omAufTXfeTU4xVweno/ouS
 68tFoeeXP1DdaqcSkvQo++6sfqHAGqbOkBYkn+s2pyoxmE1/GUPGaOX333CbZjrumHIZ
 +/nrG+kam+ITLvosujZ2z0x8Ewa1/gON6f49XZfUVM0/KPLnCoXNaubyBmYyyCX5Zkp0
 /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cPYlxJhfKmWtbP4a2dRiIg5n9Tzb/bTlK0+j+KORUjo=;
 b=dr0ldwFxa/VoZpPp5eBoitXxk7ebYWi3f3Pgqkexl8/PB3Wr08LKU0ctAzYW9KiOEV
 Vd5sfLm5jPO12bsLHBzf4//FfwI8A+CEg3SBvt92hQa3qoPxaEXYxXURNShh0xd+gJ7l
 +uDZCfx3+yPFWS5x3FUzSHlee4LmkD1Ni6oIg3nYdNgmj4WQotHceokvWrGD7mtj9PdW
 nMZBjrfmL0r0ZitvaE/16V/jTx5diMXmwCnbzJlK8jx39yLmAyQtS/DUdY2FXttv0OJJ
 5I1OT0gO+wby2ztFVSUMsegF+YO38llNX6ohrkJYyxD06Z3F+3JHEKusA7j17zrvUIiO
 eW0A==
X-Gm-Message-State: AGi0PuZcvUPMepRnEW4CK21RuavIwdtBQPwvq49bm5Z9o5VEBLAijRkE
 7zJMoc85XZuFL+dBUpN8ATw=
X-Google-Smtp-Source: APiQypKswW2iqMgYeLIiYULPyqI7RQPh0iMAPiCh2qROGM6rAR0Y5+8mNaNz5BngqvD9sBNfVV306w==
X-Received: by 2002:a17:902:8bc5:: with SMTP id
 r5mr18978437plo.218.1589267046097; 
 Tue, 12 May 2020 00:04:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.04.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:04:05 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Tue, 12 May 2020 15:03:36 +0800
Message-Id: <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/5] clk: stm32: Fix stm32f429 ltdc driver
	loading hang in clk set rate. keep ltdc clk running after
	kernel startup
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

as store stm32f4_rcc_register_pll return to the wrong offset of clks,
so ltdc gate clk is null. need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

add CLK_IGNORE_UNUSED for ltdc to make sure clk not be freed by
clk_disable_unused

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/clk/clk-stm32f4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce..0ba73de 100644
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
@@ -1757,7 +1758,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
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
