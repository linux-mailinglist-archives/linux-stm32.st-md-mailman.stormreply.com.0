Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D98AC6729
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:41:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92EE3C36B30;
	Wed, 28 May 2025 10:41:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3200C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:32 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-450828af36aso214075e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428892; x=1749033692;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
 b=AedA5sJxG/A/d/e7Rb6VYwQmm+Robu/vf3T+1IRESBDrjDhGPh4+WKV2DjNTyN/Z6T
 u+i9jcQifsAwf/ike5izvNqb74gE3N0wPfyeJ9zJy4m9Vf56MeTrE90SSefYIOAxuz6f
 RvxaLvkP2CfGWpX8Duzn74TaX41VJJyvcOo1E3bL/46N/lBoKDItp9XsBc0UtthNEY8L
 xh2x70RcrveycF0moD2hDCeyxcbgnZpJkX3NKb3iHhF5wVuHM1yYE515m59xWw2qpidw
 WNeIw2kNaWlkJw4pfY6nUts9zmddAOSdsegIl2wxCruFmBG1zT1z2V+7fijZBGL9jkPW
 KU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428892; x=1749033692;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
 b=ZGfWKeiORMaLzLig4zpi5ITyVSZnW0KvHYP6ey682U7k1V9N9NsutY2umO8Yf8FhyM
 rc7h23waSz2XuPtodNECyAH5mGUDm7BvXjNaGLaRIEon9hNhq1ptVES7MYisDV6NBtMg
 kQfd7lMt3jAUNm5UrneaQYq+JtXXLWKqyAtsISE4fU1/Z5am1PmKbdy5bH1w1zlD6Z/j
 RpxgN93Uaa1qlwV3EFC78ZAwI8VzGmUmcLBMTB15jfk+6+cj5hiYSK+bD4V02qsdOMTU
 17wNL3zxXdw6wmOzqG+B+GuaBYD+ZL9VHjRPf+zAvnnWT+jtYoHtLTSKyrdoGw0MFj4L
 wCYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiNkT4F1S61UnHBIWZwa1N92xIuwDz9mqo5WtODItB+K8F5VRJWMkmPEe4AKkEusJE2vUeNQqyYLVd5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz91z2Y1Awt1vLq6MvzTrWv1Y3wFYTiZnziJ+CZrq0X6TFKO8Sx
 d7mRXo+b+p8RNdqpSeu/GGqi23TmNjg/SlNd+hEoY8HSZ7/Eal3K8WMBH9fiWc+9Rto=
X-Gm-Gg: ASbGncsi65xS/RmiVyBcA4bgH8a1xVMhVcAU4xicapO7uzpWHpzHeI3OeeFo2Mh9uAh
 MWIQtLKPl6Nrh7lc28pcc8QPNe7U+golGcnkm6BYYU4A4SZpvhvFz0hWz1wA/dRa1GQXeFC5bQ1
 +UDnjYZ47Gz1ID5SANB5QB7ABv1r8X4JLnX5U9kMqbBz5/T5tRC7VO1JDtTWZtaMBT+AADb/CwY
 10XtDYWiXjBdjYSsC1EfxHco4R+qhimRkeOGkvhwLPA4IfeAA6mIsIurO9uuv7TB9FU8uHiSDbQ
 kVD0y99RrHY4gwkdIa6oEjexdR5kFGMr3PMx1s2C1msVYSQuvfnTpgYs5Jr1+FOBsX9OWI4=
X-Google-Smtp-Source: AGHT+IGEfOLQIkgSBlZ2iFouY1f/KgLVcIHYsjuV4CgQ8KecLfZQnSg2l0D8HirR5K2pryTmJCchcg==
X-Received: by 2002:a05:600c:3144:b0:43d:fa58:81d2 with SMTP id
 5b1f17b1804b1-44ffbf6531fmr6551045e9.9.1748428891894; 
 Wed, 28 May 2025 03:41:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:56 +0200
Message-Id: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjoNmgC/x3MMQqAMAxA0atIZgO1WlCvIg4lRg1IlUZEKL27x
 fEN/ydQjsIKY5Ug8iMqZyho6gpo92FjlKUYrLHOONvjJYHueCCdQW9cWAlb3xluBybfOCjhFXm
 V959Oc84fseaE1mQAAAA=
X-Change-ID: 20250528-pinctrl-const-desc-3a40e39eca15
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=31q5XaAMlBexIYczbpLSD3TpwdohBFMpqp6LWBCJyAo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhIG4ER1L7WtI9n7LAHBv7yR7/wd9Y62GAPM
 YOkBRMFzV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSAAKCRDBN2bmhouD
 1/WaD/9J3m4W4vBhw2XThuOyRYX1b6hv7wnFg0kwf/oG58B+tqan9UkROsMsYaftbalsBBZ5ZRN
 1M9nkKj1NYeRqNX8GD5zgdOlhg99/xoNAe4tKnXdHhemj/SZnMwRRpjoouoI5MZtU0Wyr3D/iRh
 apzqHY1Bktzyyz3i0o+EX3N6UGXKOyRFk/Nv4gpE89Tnp5pCpCtNpTewhTStIJo5v/+Zbe2YPrQ
 AnR+OeW0EPpY4/9GqX4FIXW/SBGtMEBrUl82vugNf3cxGgJTWmgAVoKYZNsVPsoZ7Cw5w9ZG7UJ
 nT+moUwF280v4jVOMoAy14NfrX3rj2HWST1PKwMiowU5NSmpEaJi+w6xE/2vB6qVh2QW7+3dAaA
 BpZVKNBQeFJMhZ8WdOg+Jh/qQ6uiZPxIFnUZRKqjwl44agPEeENckIbyD1wJJfAA+JkHuc8AiPh
 V9ANQmhknrtWhe7+PeFJI8GfxRXLnum00ByOaQGly2msm7YKUjNC5gshTcRyWaWNB5rCwL7LPa1
 0IdR7g9/Tt/4d5KIA6xWPHTzupJxtq1nsBEZwM9n0z2/82V8a2ByQNlhmzte2qCLPiweUR6oikT
 3AEpIeiINOC5++QtVlihhuU7o9fNUbOyMpEqQNMr5jj0m6eoELYBLii4S7gWJrXGzT0Ya3JNLAx
 mzmNbbD8leWapdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/17] pinctrl: Constify pointers to
 'pinctrl_desc' and more
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

In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
prerequisite for all further patches, including RTC patch, therefore
probably everything should be via main pinctrl tree.

I split several patches, although not all, per SoC-submaintainers, so
reviewing will be easier.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

 drivers/pinctrl/Kconfig                            |  8 ++++----
 drivers/pinctrl/Makefile                           |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-ns.c                   |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 ++++----
 drivers/pinctrl/berlin/berlin.c                    |  2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  2 +-
 drivers/pinctrl/core.c                             | 13 +++++++------
 drivers/pinctrl/core.h                             |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  2 +-
 drivers/pinctrl/pinctrl-amd.c                      |  8 ++++----
 drivers/pinctrl/pinctrl-artpec6.c                  |  2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  4 ++--
 drivers/pinctrl/pinctrl-bm1880.c                   |  2 +-
 drivers/pinctrl/pinctrl-k210.c                     |  2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  9 ++++-----
 drivers/pinctrl/pinctrl-mlxbf3.c                   |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c                |  8 ++++----
 drivers/pinctrl/pinctrl-tb10x.c                    |  2 +-
 drivers/pinctrl/pinctrl-zynq.c                     |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 drivers/rtc/rtc-stm32.c                            |  2 +-
 include/linux/pinctrl/pinctrl.h                    |  8 ++++----
 36 files changed, 69 insertions(+), 69 deletions(-)
---
base-commit: 08ea0cc455fbf6f6719b7a4cdcd1d132ea34577b
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
