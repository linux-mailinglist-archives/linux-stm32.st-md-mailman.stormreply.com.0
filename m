Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AB1C6931
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 08:42:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A84FFC349C6;
	Wed,  6 May 2020 06:42:52 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2929C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 06:42:50 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b8so347233pgi.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2020 23:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6OYAtQovas94oeU9iNU8MsCCycx+f76DGkCEYi2Qp+I=;
 b=l/A7OFjUswLmXEWx30U77o4/Wz7vsqghg9D/5bpCSueH68jULm3lmf58hL8+qMqpAJ
 i1747OQhv44vyaZ58GQ0UTYJmOp9034n+D9ebtjM6DSA82ofsmBaIhAWJIPk1YOzNvZj
 YewtH6m3zMLHZujXRq3dLBkfEXJAc/Xbe00F/UDNj/KbK0tPLv3jQq8IVf9E72uaZQ0M
 dboPrjM4njMwLoj/Wq+/bNOKAYaCvaC5uwF1GuX1EAA9Bl7OMz23N1S5/+cxbQVMrqS6
 jMPE6+Q3/ZdlMYlnh2fT25NXVSzpa+jRXnGqlPIL+UU5p4wYGne40lOXu5YdT7tNjxKw
 GxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6OYAtQovas94oeU9iNU8MsCCycx+f76DGkCEYi2Qp+I=;
 b=jnMaQE8F0uJ0RSAW+IDSw6ZGOgYHAEdtbOzEMqTcovEJRGysv/hR8nUXys4y9bzLHE
 VJWI8kScVu5RGuDt9emAqKYpxYBYMhFlzhUnmzskwovkQFF17j9hDygBZO3insIA3yU8
 7XQZT560G0jC4UF/gqzP4etctCYE7OGQP7IVptdg2bdk63Ib6oCPcErGIl3dx97bcQ0z
 UStbtvcTp+/gQPH8MKJNqv0jUzediCHK9xA77l8BE0MbaOIb0L1k58F6AKDSgGMSdkPl
 7CTefIaaLBey42HDgjvHKUg7i8Y72frDS6Mt5CLecZqv8R5RL3t7nP0cxg2pW7oT7XKA
 NM7A==
X-Gm-Message-State: AGi0PuYlDZ+TNprcMYbrH1WT4hQKs8lCIIxEHss2gJpTnx+cHFRsU75h
 jWiO9Mddrgi+3B2pPSOu2tw=
X-Google-Smtp-Source: APiQypLjH1m7IH+Es3ImYbRw2ZMow3U5CDc3acH8t4Lng+3TAVYPSQ/UIQdCmjvWz6d0JGPABQhw/Q==
X-Received: by 2002:a65:6795:: with SMTP id e21mr928114pgr.171.1588747369351; 
 Tue, 05 May 2020 23:42:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id b75sm3793254pjc.23.2020.05.05.23.42.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:42:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mturquette@baylibre.com, sboyd@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, sam@ravnborg.org
Date: Wed,  6 May 2020 14:42:38 +0800
Message-Id: <1588747358-31306-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588747358-31306-1-git-send-email-dillon.minfei@gmail.com>
References: <1588747358-31306-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/4] clk: stm32f4: fix ltdc driver hang as clk
	set rate failed
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

should use PLL_SAI offset of clks , not PLL_VCO_SAI
else can not get clk gate.

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
