Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7B1E3A60
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:28:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D1C0C36B21;
	Wed, 27 May 2020 07:28:17 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A400C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:28:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t11so11387859pgg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PCXZ/XVMi8KpMlGOTwhqCP9MMMe9ESFVI+WU4Q3c6Jk=;
 b=I8hUHZ6SxFDEwHdk7/zeDaW/Z2P4AkgiDIFUitVnXJXeTb+IOLeTPT06lLpHqELqho
 cHkEkrWucnwxAI4w9z7QW+3XmUv+zgx2u7kPK3azIIIrFymuAxKAL2rCyR9HUboYPkld
 wqT/JAKpZN3Rkjfb3iniOF3m8C5DPT+SsWECsI3JVppNGION1BhqoLc424/hjUYe+gdf
 MRftOfeBuYnUlGuwdnwN/mCbfPthTvj4rWFgrDhEMnFAMYruktb7ow5C9Bp8aE97DvLs
 KQvPaaw1ZLWNhbSOq9Ad9O1TOPc/aVPRXPBgmT6xw+CPz2EOWGz/sLi6nJLgN5uQ6Lj+
 DJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PCXZ/XVMi8KpMlGOTwhqCP9MMMe9ESFVI+WU4Q3c6Jk=;
 b=XniaQTJriee6upQPFTy+lXVpsYZRxA515qZOco+CdqyAaD5Hf6thoMg3COBbhbJzAi
 FKyYOH+K1hUgNBkB7ljTMzPOr59gngDRTlpm5sByxcc6xZt5BkYixJFnhFYe801vgwaZ
 MMfuFnweFUz/d6L1w7WL84jt3uSdP5XCLQgUZLoazeOS9Fm68MUYd46VFZUIBsULbs1d
 jVvNp0mX+44YLGP/jU6bX76GYUEEZLh8+PVuiNywCIALSztHgrF1u10PMJ0mrtqIaJFw
 2vGnO/PG7p8BSlyeJUbVo7gWDeDLoQVPZza7Q0+OmHijEZ/IG9F6MN2rjjJsWFl9K7JI
 pvCg==
X-Gm-Message-State: AOAM533R6KtWjNdhPpmQX9vHg1IeL8FUCeeCsx5ArE/V76+SBdD2ufqQ
 2DPBcF1mw7kOg6Av+nC/B60=
X-Google-Smtp-Source: ABdhPJxPJhhSE88EJXZgUaSI8AhIFjINE/wSKKHD3Ql/J86dwwqEQCn2uj2TmRHGyg8Y6hFAjyIJXA==
X-Received: by 2002:a63:4b41:: with SMTP id k1mr2609543pgl.452.1590564491949; 
 Wed, 27 May 2020 00:28:11 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:11 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:30 +0800
Message-Id: <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 6/9] clk: stm32: Fix ltdc's clock turn off
	by clk_disable_unused() after kernel startup
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

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes since V5:
separate '[PATCH v5 5/8]' to two, add Fixes tags.

 drivers/clk/clk-stm32f4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 42ca2dd86aea..fa62e990c539 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
