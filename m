Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38747433166
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:44:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0258DC5C84D;
	Tue, 19 Oct 2021 08:44:17 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 854E8C5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:44:15 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d5so4186111pfu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qf2pjhCpfk07YQKtxJ7Ycuq1vo5ZtJccHCuLQD7alI0=;
 b=RLrSpFbXOk9mKOfE+/CLCAUA8uCHIMz3SBRn996JqGd+oOkg9sDjTATvfD9We6xH/i
 sRStywzhdvf0TRWHhm+RH0Bcm6ae+vKn98Rmhmecq92q4YeqeuTiwo5sXnpkBDEQmCBa
 sKbIXuZFdQIxrF2wM1yceaDJZtSYA+n6iWnsBslT8wsyhhG12aIMQ2OEVT0dsMhPMGGw
 DZa3rUH7h+jZ5SVygqD8zzh8/+fNM0a83/CQUzxcMk/fuhbZ8/7p32gT7zmLfpXPlvIq
 +PAA7Lh0BVHkkpafxeRqMdpC19sEqZlbrh/XC+G1YwaO1Z6wShdCOckiRrv7vZ35Lznp
 2uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qf2pjhCpfk07YQKtxJ7Ycuq1vo5ZtJccHCuLQD7alI0=;
 b=1nhNv4nzjKOxjucKynZXHxe/bS1sJUVkG5C9N3qklmnYcMK9CBwWsGtYv0um7CGGJA
 u/JdqrwRdrnTvbHAd4uj4D3h835FDpcE2PdjY73xj4PboavQtJ+Da9Ommhn8tmkoer6M
 lJg6RGyY3nI/AQpDCFT4zlFFjOpr6E5ry7b+z5skP9nH+t6x4PGfYBlwg0MlTE1oTqJW
 iFKTlxYeS04H1Gsen0n/I7uOgBAMCCtYQGmlSdzw5MvMe8C5GcGi+ywu5HisYFXy2EIe
 zlFzOnY0SYENPMj3WDXp8ItVxOY4cp7g0KsJBTJjAfOOVbdbMGTBevFsgyEwNwOsbJjO
 QC7g==
X-Gm-Message-State: AOAM533MCslmyPI3kbWIptDmXnuvO7DwHgatzMzGXzmrDI7LLYxeevyG
 wRi6twofe0Wp6nVTOVg9a70=
X-Google-Smtp-Source: ABdhPJyldc/nOmHnQzAvE7388dI4Radsjo0IQ0KG1jEUqZoRWSO82e9aTHcG8Mp9CkR2nSbMCLLR8g==
X-Received: by 2002:a63:1266:: with SMTP id 38mr27685059pgs.219.1634633054300; 
 Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.44.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:22 +0800
Message-Id: <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 09/10] clk: stm32: Fix ltdc's clock turn
	off by clk_disable_unused() after system enter shell
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

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

stm32f469/746/769 have the same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 drivers/clk/clk-stm32f4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index af46176ad053..473dfe632cc5 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
@@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
