Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755551CA1DE
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 06:13:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD71C3FAD0;
	Fri,  8 May 2020 04:13:41 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0679FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 04:13:40 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q124so257199pgq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 21:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sGTXTVIeWZfMKGu2Tui/sSS6UaYWbPyLZVydf0J+7iw=;
 b=VrRdrzH7uKw/48TsVJC0k5uaudQ/8i4despiyT+mgT4Oe7Uw8VOpOj9Xe9kAwWSOrh
 FtHdoUcfmFSrMJMUPMSkVlbzZlsazu7YQ21sZyaU2m3P0V48G4dqdsiUOh2Q/rwbZXNy
 oqV1wlxFAiU8EQHraM/wta9w16G93woaX01sKbrtyrtgLftdjx/Zro/oT0KmPuTWsbfE
 LsmgyY+DZ9ULBA4C908KplqHUhCNMgRhNIYnh9D/GFBwWyo0nRqKQGw95vF8LczzNpsy
 OZII5c3ewtpx/1zWKnAbch5U03VOwcZd1k25XnYHOt1PqjJEBxdZ9kaLS8jj7SBzh/8m
 KTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sGTXTVIeWZfMKGu2Tui/sSS6UaYWbPyLZVydf0J+7iw=;
 b=kbaKZmO9IurAoZLBfrvNHk84EcR51No3MSwwkeYSmATWDohorwtcPJxDnlgeB6Q0MJ
 s1hkltZYAG1rf8w9SMQa06/GntfkEFzzJ50U36nWQ7pZr6QL8iSsLPuuxQX14KLi9VA1
 f7hFQEDCTlLIwham9OPw/FjLMWEo60NqH2EAAe44Xkt7B9Q8O8aouhWcbSPg3suYcDwr
 ndaLF+uIRTfOPx9q0LCgzz9XgXysi1i3u4Extl0y3fjIAzNJeMx+6BGD4RJpwD2lDdoj
 0I5J3YKS5H+zKMUk5QzGN9ZWLdQUJlaFIPYq3KjhJ1kTt0ryoT7LhLzQx2CgCrQvouWx
 wXmg==
X-Gm-Message-State: AGi0PuYNdlfT4tHCeUaz/X8fk6RbVzzW9DDQhpjSmiTiAm8Uw0h0kaSv
 yN58IGq2+VWc+7JkQIHafNk=
X-Google-Smtp-Source: APiQypKtSx7FFpg/lKRdr/OnMpMvj7PJ21YY/dFtMba1MMBSiMMuH8F3u50v0gIMSY0JufkuJgzOYQ==
X-Received: by 2002:a62:1994:: with SMTP id 142mr720891pfz.259.1588911218632; 
 Thu, 07 May 2020 21:13:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:38 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Fri,  8 May 2020 12:13:13 +0800
Message-Id: <1588911194-12433-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] clk: stm32: Fix stm32f429 ltdc driver
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
so ltdc gate clk is null.
need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

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
