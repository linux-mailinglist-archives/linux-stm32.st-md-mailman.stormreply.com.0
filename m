Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715B7BFD97
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 15:35:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B40C6B442;
	Tue, 10 Oct 2023 13:35:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2355C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 13:35:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so3719972f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696944931; x=1697549731;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aw6UgjAaJ8qgdoYorSKFrZHMQyZGneinKTuRi4ShVJM=;
 b=Hr7XQ0/7XlwdFAev+qjYgvgcVIOF0jE7+fh9ePfBu+wxoK5oSWSGyyVfdltua5fXun
 x/X36bROPO3d2GaPQhRm4e+kWyUsixXfkGEA02NRlm4PF3wJiCtSWXqUDwTiFRjpETO0
 u3HgVZSBri1n2azTtD+moeNCWhGXpnogSkeft0gLWQ3mYhS/GhyB/sBSPAf878Xr+6wD
 ksWZasos+q1gYqtpMgmefRjRJ7OLoxqXa1DhBoOey5vmVBOICW3FOaRKY08xTm6x2VXm
 FFC+JTMgqjajk/M0xtSv1XlzhgzQgp9EK7ezGhsxkE58p/huUsGVvhD94REwQn/JWSzD
 mjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944931; x=1697549731;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aw6UgjAaJ8qgdoYorSKFrZHMQyZGneinKTuRi4ShVJM=;
 b=ljMHOJNUhXe0cy+Le7rFywvmVqh7YEYZ5Su5kcDYGOKKp3eHshPZmbWmb8T7H9a48Y
 5jAOt2TlrRtP4jhuYNTqJdOgVW98Ej927RQ4WxFaC6tDG6ubc4x+ONvMO8hID6KhK78a
 0HCBUPb0aYfcgYJJ1899CM03EzSSwmJKfauZHb6fq73VUMDcfx2oBBr3pGes+3IGnxsD
 e8fTsn8anSSsbTwNFZIyZGbuR5/UqV+VR3jeK0ni2vKbz5hPf1iCuIiILYAu/fWxU9zV
 YxOr1TDsHWoszKQUOKIoUU/k9DzF83Jx69XtM6DEUO4A/8KA8nuWjFIJ0Hl5Dz/t1ADH
 4g2w==
X-Gm-Message-State: AOJu0YxZDvOY0bjuYjLFU6xfryyOR7PI+rI9QjnUInQvENoy5vcujlpM
 zP4B7aYyCzTivBeXRIBSlCAeBQ==
X-Google-Smtp-Source: AGHT+IFw0S6b8g/kvtjWSB5E2ensCP7thl7P6ePtjXo8nKPhrToH5H95gZBpPNqgpHUyhd5SXj2FaQ==
X-Received: by 2002:a05:6000:1f87:b0:32d:24c7:a268 with SMTP id
 bw7-20020a0560001f8700b0032d24c7a268mr1899178wrb.4.1696944931382; 
 Tue, 10 Oct 2023 06:35:31 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q9-20020adfcd89000000b00317f70240afsm12596738wrj.27.2023.10.10.06.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 06:35:31 -0700 (PDT)
Date: Tue, 10 Oct 2023 16:35:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] clk: stm32: Fix a signedness issue in
 clk_stm32_composite_determine_rate()
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

The divider_ro_round_rate() function could potentially return -EINVAL on
error but the error handling doesn't work because "rate" is unsigned.
It should be a type long.

Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/stm32/clk-stm32-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index d5aa09e9fce4..067b918a8894 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -431,7 +431,7 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	const struct stm32_div_cfg *divider;
-	unsigned long rate;
+	long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
 		return 0;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
