Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD5A7BBFB
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A63A5C7A826;
	Fri,  4 Apr 2025 11:57:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7FEC7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:10 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39127effa72so177456f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767829; x=1744372629;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
 b=j0Rp6eui1TQ31vWm8ASm/Y3yxcVOlkyXXXJ6jg/PEhCCUCohko2HuNVcAcTOPh+55W
 M7u8iQIpsGKBFy2DiqputJczmyWguUd+zZXst+Uo2Z6hLVUnKTCUNFHNloGnVNgy6sCr
 GoxHSYDj/q3SsvYU/gWA64EmIEaTOCS/tnHy4qsRNWcRwyHQ6KQonu6iRYTn7xJq/wYx
 vv9FTEp3NhX0xbduFZP1Kzw2MVz4inxBhXIUgHwyfFDSpozNHNAd8bALJEmdw+Tf8JDG
 na3fX9LuOkCWCKYwnlmQVN6byMeFldL0ZDO74kaATJOh9Alcdc+pG3yL9wy1QurX/j+S
 qZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767829; x=1744372629;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
 b=kdqPYqQIO+a+uN1rcKxEWnmHbhJns1Kr4I2JMlj4nybmF0jYtnvBsFgGqtvgswn9rG
 xHmFh2xRDlfBbzXbDKKhWGZ405yO7fd/ewMsYHAiyo0FnMkkKfvfKAZ/Xu3A2NPTwr28
 fPK11G2UpEdvZGGSFGH65XZEnBvW/DNK97gcOp/RuO6e/eRcFWGDsGzdjGYc91p1FzRV
 UDrYcSamlutH0QYrJ+isdw/8Sth08PkQhZBEHVKP11PXrT7Qr9LdYxXkJnxAyeZkvYXo
 xCRGCMPd1mdKZgaysFWQIJuaub15b5+T5G2bbkcxQDnvSMHfLLKVPKjl8qdMX+62095C
 pV6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7aK8AF+YlreICIqblQ8pBiBbdNRLb1Z+hoILmcnJ6VyytIX0jH+X9jjqtBLMy7RQk6VsCPjNphM6H0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDf77tNDHRya/abnTl+6sfLZpJUR0cDQyjK9ndeWLISTGOfEWi
 0VpmxikPicRNU7Sx3j76817Ah4u9QgeRHlemBlwA12i7N2hUtHL7fMxma+DFMlxR4ErBdLDDqVo
 k
X-Gm-Gg: ASbGncuHtLPe+Xeg3iVGo5LNnuKS+ByVxBa/RTXJkX0v7ZDl97uvHZu6kOeaswVCa0o
 niuCWU0u370kNXEp/65oCe1mgZ/cuQx1ICtGNHyp+5gjVHrxvq0I6NH6j5ezNkyOmMo5lWx9/+H
 xSIhZonCff2czjhcFai4RL0XduUfN19cYgiGVeKL+BqpSiUeZBEnsHQ+qjlDFWflgvNXFwd+muy
 oQpMe4bvfaYWLTBpi0WdsIpk65wzCmfBRBLLKCu7AIMEGk9/ktqA38C5QrPmuN1DxzXPamyOYUc
 BfoTpq0TcezUENJ/G3CxXsVcbTow5sOsOuFlkC3IuJ4KA66jNE2aj349VZQh//g=
X-Google-Smtp-Source: AGHT+IFUn3Ncq3UJFAd17WQ9Pi1CnRMlttoznJGCzpSMvyRtLW9B9mLaVZY4lCtohUQhqeiWfvicpw==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id
 5b1f17b1804b1-43ecfa18f83mr8121025e9.7.1743767829072; 
 Fri, 04 Apr 2025 04:57:09 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:01 +0200
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
X-Mailer: b4 0.14.2
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] clk: sunxi: Do not enable by default
 during compile testing
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

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175dce798ac8b3268b0 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -2,13 +2,13 @@
 menuconfig CLK_SUNXI
 	bool "Legacy clock support for Allwinner SoCs"
 	depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
-	default y
+	default (ARM && ARCH_SUNXI)
 
 if CLK_SUNXI
 
 config CLK_SUNXI_CLOCKS
 	bool "Legacy clock drivers"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock drivers being used on older (A10, A13, A20,
 	  A23, A31, A80) SoCs. These drivers are kept around for
@@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
 
 config CLK_SUNXI_PRCM_SUN6I
 	bool "Legacy A31 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A31 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.
 
 config CLK_SUNXI_PRCM_SUN8I
 	bool "Legacy sun8i PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the sun8i family PRCM clocks.
 	  Those are usually needed for the PMIC communication,
@@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
 
 config CLK_SUNXI_PRCM_SUN9I
 	bool "Legacy A80 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A80 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
