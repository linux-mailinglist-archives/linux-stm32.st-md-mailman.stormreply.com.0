Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4979A7BBF1
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51120C7A824;
	Fri,  4 Apr 2025 11:57:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE8C8CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43e9ccaa1ebso2222175e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767820; x=1744372620;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
 b=EsKahtTyK4w2oRWbEDO8Faknl8ulzUYtep5mIbnskYXXYE6XeqFGvFk3yk6mrwReKn
 sUbzFV3IHMOMfkI9kEld76WWXEmYPK0xoa76tLK/QhNOLGkEX/f7U/KZmi/jrpZfH/Nz
 Wd+nQtPHHbVp6kIdb82b1ZxyHVS4+YSKm5jYUShbmHNrhioQW4WQLHMJJ90BEuYUP1w1
 ckj2Ynyc3PqETvF6DvqbC6CaxYY0PBdCu3mZkQQnS5bN/4gt26/8Nq5p1mvopm4hJ/5N
 RFfksbKSFxzqZ0MrLB50yg5NSHkOuGu94+0kS/D4lo3JSzFLObce0NoyeosXhee2YZHh
 aK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767820; x=1744372620;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
 b=mFMMakuPzvdjIjIp/OZoxp7BCTk8wqjdpZeoiT1ha7G6XTczT8uTFVGBQosHVpTCHu
 7BVZUo1cMQ+1U0JzBYWKM3ltvwvY+QTqUAOuxrPA2mQT9mPZlyFoX4UVJVF9v24WP9Ap
 Kqn5Ry+I9yT0nvBLHzVfKb32kq8k/al3A32mr2HVCUMnuCYxRx+3uyMDN/O67EFBerb/
 LxZ2rmkvBGVTqnWZ2dKa42om6SJbJB9I7Mm6fPm4GfQ1q/+dM8INr89NE1B6N9Plbcgg
 5o5imQS6u0qNT/bIuW8qieahmd/o/xNoCfgabfog19xp62Kqu+xPTpQe7ntbEfgkvk3z
 5faQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPjw0WqZM7GmKOnqFQJoOzFQfFwwd061zYsRbxdl5DDtvn+YvxJ1jk4ONeKooJGQ6BdX1l2Py8k29V3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9nohGD+UTT671ENcXxazgcIz8hFYwms5pBRU+EYGbeDXXz/30
 H/ccId+YYRrr3jk4jQ+CfaAM2zJ/Iwp7E1g6vap8UvalBR0ZF4xVZ2WcD29MUjl6aPfE8688HbT
 U
X-Gm-Gg: ASbGncvejbqdkyD9txXQ//7IuUb7/rAJUKy/kk+Hm1CVgkdFSKCAqb7epbS3z/KUFEV
 Cgo5oIg/w2BH5zi3jP3cAKVP8qRbs4Sg+IQLfsHyPaEW2O01wSU9wzi+M29/tXsC4vSq/XsMRM0
 n22RRarfj3571IYYJsajvp5cf61lp0XgcwQAW9wB8PBrMQCRreEb/mU1JklxBnd+aYbIP29M5a0
 4YIF0fC1X3KRLH4PVHIFyDWBAk+26NiWCBx/y4k8p22iDxo1a89vgn4RSPgCRJhPKluvy2LGZIT
 oxnR0MN0hQGC43EHeOnJyFbfAXx2d7Y/sBsalKONbB2M937EYszFL5q6lqdOK3M=
X-Google-Smtp-Source: AGHT+IE3YMdROfy4Pz/lL2bVAErbCHUi9OQZGeJfx60uexq6ErgRMWHK+iTZDQBEUem01jamr5n43g==
X-Received: by 2002:a05:600c:3ba2:b0:43b:cab3:1fd1 with SMTP id
 5b1f17b1804b1-43ecf81ce08mr9264575e9.1.1743767819747; 
 Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:56 +0200
Message-Id: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAjJ72cC/x3MQQqAIBBA0avErBsws4iuEi1EZ2ooLLQiiO6et
 HyL/x9IFIUS9MUDkS5JsoWMqizAzTZMhOKzQSvdKKMMLm4LLBN6YnuuR0K3LshWG+68aytTQ07
 3SCz3vx3G9/0AHeSjdWYAAAA=
X-Change-ID: 20250404-kconfig-defaults-clk-fa24f8dc6143
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
Subject: [Linux-stm32] [PATCH 0/5] clk: Do not enable by default during
	compile testing
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
drivers.

No dependencies, can be picked by individual maintainers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: meson: Do not enable by default during compile testing
      clk: nuvoton: Do not enable by default during compile testing
      clk: stm32: Do not enable by default during compile testing
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig    | 16 +++++++--------
 drivers/clk/nuvoton/Kconfig  |  4 ++--
 drivers/clk/stm32/Kconfig    |  8 ++++----
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 drivers/clk/sunxi/Kconfig    | 10 ++++-----
 5 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 07951d09335e96138e0595208fcc66c35ce0447e
change-id: 20250404-kconfig-defaults-clk-fa24f8dc6143

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
