Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F244F38A9D5
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DE4C57B69;
	Thu, 20 May 2021 11:05:49 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DF1CC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:05:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so5084321pjv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D9D/SebRgoz4N6yfdEXII2paqsfOcRWX2rFKjrxzcw0=;
 b=n0+pkU5PxKkwmp4xF6CdTboKamzW/tXcbrQ5uXy2S1kHdB5TLUZi7cGi3k+SOHvE4o
 oFZnjz4BftMR8+VLdluJFMVcmP4YlAIu00+IsW2LLvZgSKZr67LBDBY8lEL3/F6DghhP
 xZffUIOFKV7EZ+rOU8BA1+a4hSFq46cOoV63aRe2FJMC5oMl6up6enEpbYe8Tq2sWCk3
 xdiVvEwRzKxxnCK9m80tbvIRxzmJi8TDsyc3bUd8/FrWbWSMWLbtBiGOtLX37MKeisbx
 z82lHVVzGYxJbh8pnmnc1vlqpTS7EDxVV7plJQZP8233WL2TBIx7D1Xr8OobCJkli8cG
 m2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D9D/SebRgoz4N6yfdEXII2paqsfOcRWX2rFKjrxzcw0=;
 b=LQUbF6nhmPE9fEqcghpRwV5PqkqIRf+fGVM88Hq13AJhtzRtMuL89DcgXtHF42Ofgn
 TodX6crFxgk0CY+38ns89AkeNSVQdSnoi0B7XW2RoLDoBu/KTMK6ZyqkivA7n/iHQyrb
 Bup+LpBiCxPDKXyfvJyZfdEuzOUNyC9XuogMICXeXtWUXZbpJHJEDs6m7eAuNJG7vrut
 5VMgL6Eb10Qg29izLFnzth+Um/VjvGc7O5wXSXTx8rZcO1qkk6b69/d5qbQ+ZGhbhiNS
 +U1749HCJRqv27Fx0PdcqKvxtOgq16bq3+bhD84CooIQzLIDUTEVpQ88GFRbvhWuNVzP
 g2FA==
X-Gm-Message-State: AOAM5327dIWTHhMKabUU1/7XKpwGLClPP9oGbyycmsO8Sfpe0hZD8XHa
 drrAbpII4v479ywP7V0DO+o=
X-Google-Smtp-Source: ABdhPJwfmZj1H42oTeBLXCHtpO6AiQLahgiJ5qI8ckQKEweXFrnWuGUD+EQDwyvtBQTlxDZuPTySPw==
X-Received: by 2002:a17:902:820b:b029:ef:4c29:2950 with SMTP id
 x11-20020a170902820bb02900ef4c292950mr5291860pln.78.1621508747020; 
 Thu, 20 May 2021 04:05:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:05:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:23 +0800
Message-Id: <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/7] clk: stm32: Fix ltdc's clock turn off by
	clk_disable_unused() after kernel startup
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

From: Dillon Min <dillon.minfei@gmail.com>

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
---

This patch was submitted in
https://lore.kernel.org/lkml/1620990152-19255-1-git-send-email-dillon.minfei@gmail.com/

 drivers/clk/clk-stm32f4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce5ff85..b6ab8c3a7994 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -211,7 +211,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
 
 #define MAX_POST_DIV 3
 static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
-	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
+	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
 
-	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
+	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
 
-	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
 		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
