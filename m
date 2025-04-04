Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF67A7BBF7
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 887A9C7A826;
	Fri,  4 Apr 2025 11:57:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF95BCFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39127effa72so177447f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767825; x=1744372625;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
 b=KKsX+4Bt2e0C3PB6RH7OWmTBqK3Fcg0l0gx1xj1rWaDUE5Zf2sOwCVGR+sJqEQBvkX
 CdcMY1Tdz3FQ95x3yCanwYSDN6QbiR7AAtDa62mz8KJLgkXHM2cJZRFO0f7e3Vszh8lW
 2bGFwmfDOaUk0H2HOJFQCZUb02o84VmTA05arH7lzVN3kAC019GfGzlJ4/Ukk4PRCadh
 rJmLX85oKq4lvC7DA2bIu/BgFjQoGjLuVbqqJZ2cT3VbdAwBJYVIUB/rm9X3dlWeMpUW
 EVo7xF5Vfs20bwgVnuCgUaiUkIVnbk8JqBlqzZF09m2jSf2prXPhBSbDxwIKr8tz7ULU
 23PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767825; x=1744372625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
 b=hH310mruPVmHT7bxXugYiQH2IvqMdE4dxEHFCMtIDr/OPvtM0TBWY278g9FqzuvlKr
 1uZrb8tXQ646IryCiyhsX7SmMF0uZSgS8a0hRTid04vnwwmK+qGKdsSZZVn2phbVIl8u
 XFAokRocS2X2+XDIuXVgdL5vDhE7HUttHGrqbAmgum+L2ofXZMssfekJKibgwThCWbT3
 cm6KgYB6xL+rLAKrvBwnlKI9R+s8NVaO3K4RmYpqiRQOPulCgFqwj2/W32g2V4o/dzEw
 1+E3NGEPbjiqdVkQMDYWbzB1KK/P3bZA9ZN0wo1DEyUO9dI3c2Z3UqoTH9lyUMWaPKZe
 AQuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMScVxsH17szR+mlu6/apa/flrhJ8McY7hmoLFSPBmtE1CNmkBJQ+5IRVgOE2nnXYIixpImn5ic3/Msg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxy+c8KMAJGyFNOHFBFzt6hvU4e+9WC+DJ2qAk5HEGGXvbjeXyS
 3wRgaaaiFsCV8VHxpTXlu+yAd4ZkcFwQQRyOohvdF54fs0U8DM1aV7r1FJpKZwEIii9lQOjmXh/
 n
X-Gm-Gg: ASbGncvj8JJIHN11QWMlSdd/Ire/qYfWQlX9SL/fUDzV+VGdnjr3NW9PLwAUCi/iWEp
 CMBUucY8Jbaa6OHBMOJZ7fCdJdrYz0bcJpO7ikV7aueGWzfsiOTppTa0LH3p9HJxemlaiUDqAPU
 ZRW+6XYe7im2P2zHv8ylOGfb7vd1yZUUzx/paXEbhODgFdmOFBXBqN8C0rMO1BQjwF5/X52GKg3
 x6R9pUnasM+vSL9vFVo+kz+Y9Zjxs7IemcnN9OVzt/xaBjh6TrQnzhUpmEeEIZXwDjG4fl8nDOc
 qvjHLLtUnT2qRFmwu+cQTsm/PCpQfxtbDZY9p3JeG4Zu9uUgQX+gA0hWehQ5IP0tbjH9B7T+OQ=
 =
X-Google-Smtp-Source: AGHT+IEbqWVdAZjF0/qLy/H0JxxfBZjOz1OHqDHaLpBpQad1gKc6l1hGJIvzr71knts2F+y5b2ubng==
X-Received: by 2002:a5d:64c7:0:b0:39c:1258:17d7 with SMTP id
 ffacd0b85a97d-39cba94bb2bmr852989f8f.16.1743767824815; 
 Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:59 +0200
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/5] clk: stm32: Do not enable by default
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
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/stm32/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..4d2eb993ea0838d408ff5b1e5b6d028cbcaa9301 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -4,7 +4,7 @@
 menuconfig COMMON_CLK_STM32MP
 	bool "Clock support for common STM32MP clocks"
 	depends on ARCH_STM32 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STM32MP SoC family clocks.
@@ -14,21 +14,21 @@ if COMMON_CLK_STM32MP
 config COMMON_CLK_STM32MP135
 	bool "Clock driver for stm32mp13x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp13x SoC family clocks.
 
 config COMMON_CLK_STM32MP157
 	bool "Clock driver for stm32mp15x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp15x SoC family clocks.
 
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp25x SoC family clocks.
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
