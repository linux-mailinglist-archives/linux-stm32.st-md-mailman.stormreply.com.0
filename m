Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E1A7BBF6
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BEDFC7A829;
	Fri,  4 Apr 2025 11:57:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10344C7A826
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:04 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3913290f754so218061f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767823; x=1744372623;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
 b=b3OCvX8Zviv5ekSlwDEcMXTuTNZlRcl4CGwZ4sZRMvbfoJmGHdGy4B2hsymQlS5xYA
 ao4mg62FvU//0VD6+d7zIxXJ+aG4yCh4rK2y89mi8HMwAReO3oeK9aTL+RTuOAc19t1B
 KSXrEQCVubrAQ7xOlj+o7t/ML5oMn4+03SoQpk8XCTESQEGNfHNEI0uL+Q4SCwio3Mwx
 rlTp90fXUhbQ1kTI4MwkeEtMZOGiHd3JgRKutSaKk0dHzGxawdbRDJTwVEYQ2pWeRsiM
 UrXxIX9myYkOyAxIRf/gSw9O+LWVyHPL09MC2OtlwKfYeeUiPz5fuw/nd6pOslfP1koU
 sM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767823; x=1744372623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
 b=nr3yM7wdgMNIHsaW1jAbuyl2pGVX7Vl9pwqzn+i3/pz7xT79/ORdTE/UHM3p0yokOb
 rTYMSKxCuny6SCgLp3Ff3UCcGdRZvpZQ/wEzWqAHQoL2yD61+qPPyEQMI4nZGHpuNDau
 hca1OhcAn2gS68FS7X7vOZoFTLhtIB4yRCH7nxyWuwtFAeyyWwQtvvBKf6VgMXibQt1Z
 J5rWXJnU4tZURrY1Nsk+YxxhsSZtlf0DZ+bZy/+jRJedZ1Ohk6FwS70SMG7tZXL12GqS
 ZAObzuY9WOV+UFGaIfnEVK+hIOPegpE2lXI+fH2wJjsDsctAU6uLf9o6+3hukomgbs4h
 i8CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/tXHzdULCufkGvJxU10ZVeEqsmV3yXn5/whnPBE7/V3GgVELmHDGi5RgPybPcL3CrGK2ICKTBZZM11w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPXNxBEfaryW9xHCb7yFX3ZkyvRn6oKLKPnZK/un8U2IoSP4JB
 gwEwIGbvRVQbOewSX/CszCZLWGqt8OD9XH8NCpbGMdPInsJxuzROwmtK6ZSUCzzon2gzjCqPS6U
 0
X-Gm-Gg: ASbGncvz9CHLDRLevSb6u6C6sQspIeLzfg7Q+eU/YK6eUNbbDgMZciW9rj5qBlmsckt
 +65evV28gSlLxV9K9YZIqvXnI/sZNhDn32Ogw7sgzUWMp69n34MIh3S0sGF+R5o0AjqKgG++mKk
 VUGSWc5nbG7H5W3TUvgbnFUpWZ1nEKEEkNgLGaBM/jXduYO81fN3O7DQJYnE/hfxPwlI0LnCofu
 iieLmyi+OloCg5hyPCepKC8D1MmW4AXJVBC331ZzkoeORq8NfkYPwEO5QpBZeKzyF+550NS1UrP
 Cpg+Pzl0QX224WMb4R7ftyaZ/eS12dqT/PPL7aBRPujE7IosH6B3AjAXN/V7EDM=
X-Google-Smtp-Source: AGHT+IGREdRnQ2gEflgpMySypGT2xrFpTeuT80iZBzxVkRizH3MB1Iv/GdfxP0Mu67TBThpOTa6MIw==
X-Received: by 2002:a05:6000:188e:b0:39c:266c:dae with SMTP id
 ffacd0b85a97d-39cba936215mr862740f8f.11.1743767823172; 
 Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:57:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:58 +0200
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
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
Subject: [Linux-stm32] [PATCH 2/5] clk: nuvoton: Do not enable by default
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
 drivers/clk/nuvoton/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f467048b7c86890972d55faebd066947..e7019b69ea74824de6943108f30ec259aa52e5f4 100644
--- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -4,7 +4,7 @@
 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
 	depends on ARCH_MA35 || COMPILE_TEST
-	default y
+	default ARCH_MA35
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
 
@@ -12,7 +12,7 @@ if COMMON_CLK_NUVOTON
 
 config CLK_MA35D1
 	bool "Nuvoton MA35D1 clock controller support"
-	default y
+	default ARCH_MA35
 	help
 	  Build the clock controller driver for MA35D1 SoC.
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
