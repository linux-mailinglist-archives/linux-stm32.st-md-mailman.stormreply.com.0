Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD042D70B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 12:25:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7842C5C83A;
	Thu, 14 Oct 2021 10:25:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B47CBC5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 10:25:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y1so3845629plk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KXS2nUcAjz3o0YUh91xZNToPY0k4AGqu28iPxHecA3U=;
 b=gcsmDTCXikZipwe/mjfYMy0k+t8P0l4//3rPe4+Zt16aO3RzxA9aRKuo7ApV5uSiCl
 QuPt9Osur8/HV9m+5Z3xeYf3GUzuF7nt01+lPXt7UuG8uN0/zOME9cW6wqdWUkilfUOu
 C8QsXzsPXoX0TU/IZZH6BxYqSK83rtEruOq0jIb8A7GwctWEXBysx641mxZxgi65b3Xz
 a9f6fJbaUpKukhPBcaxIpSy9P2qJvCjJCZKHK9p2obv+p1TRWR1EY9VAh81WZSUuHQ9M
 ekfd+98ZDFeQ/sKnZB+99J4808ui+orAy13ODgRn8GUHWwLcpjVwadffLmfyvU8eMQUU
 lSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KXS2nUcAjz3o0YUh91xZNToPY0k4AGqu28iPxHecA3U=;
 b=O04/rdcD7H3/x26pUvuhHyeoqprDNtW7TMib2g8QDSwxTxwmJgpAbL4PsolhtBUxTN
 RpRdFYfQjgj3i9G9wMbvIcslNbgaVurrIW81nslVYtb3ee5W3JdRI2cA5KQypCJxoruy
 akohZ0CD7yqYqDceQxJceN7FZ/mrmGsQLRAljMTpmTjf291P7oKbk/rVi4VjautWScNI
 Gwts31SI160qB+RPIXCDjJ0fR83mF8FKQ6SjzUk1xZJC0zQEWxyZTqYua6gJQSyA642M
 pAkeaJjJ8gIn8tTJVbn++iReJ6aOeY8HGb4RN8zNP52/N7E5dwQlmiKSGnO5ulo8D/hT
 sDzA==
X-Gm-Message-State: AOAM532zuJaLmGgSruQfre+6qhpbX6Vu8Drl1HcnpEgwsfD1Mpz9uhcM
 tKzOVp9/IVm0grtmGW7mn2U=
X-Google-Smtp-Source: ABdhPJwVDaJUyUEgX1EvPHisAB+vEoDE9e/NrSa6GWYRIx4LR6DrxUimK8nk6LUMtKw6uu0YAJ5yQg==
X-Received: by 2002:a17:90b:30d6:: with SMTP id
 hi22mr19731006pjb.4.1634207147427; 
 Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Thu, 14 Oct 2021 18:25:05 +0800
Message-Id: <1634207106-7632-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 7/8] clk: stm32: Fix ltdc's clock turn off
	by clk_disable_unused() after system enter shell
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

stm32f469/746/769 have the same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

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
