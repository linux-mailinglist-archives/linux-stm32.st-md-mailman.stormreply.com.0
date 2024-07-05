Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18692857C
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 499C5C78006;
	Fri,  5 Jul 2024 09:52:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4501AC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:51:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-367963ea053so1100709f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173115; x=1720777915;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kJu1vmWUxTKY4ACFv7SXUQFPNZpjog7M5wGF280T4yg=;
 b=prD+qMchbeMpgG2pV6AefUqywA9W+ohwegcQ37sLESy5OcCIaPRogtIOyQHvtVIhK6
 8Bk887y9mqUjeZUqZHab1hM1wXeL5u7VAzKvRLmaz7QPWFQdEBUTOMucE2DuMciRN4y1
 zJ3XOFY2BaKFSTkrncXEHZdjx5fLzFbf/wEpeY7PTt1BsdMQv/AXjgoEQXScZyJynC30
 MDQEtg6vrA3Ofy0cZNzJsfIkLK5v5+2JKftHq+jxHzyxQAVAB0kwnxpwyWLHn7mJZXAQ
 cw7eeAR5tWgAj5lELpZFitxXCFe3Xd79AEa7ai/TJ/pnlgj8wFjCO9UYC+7/kUKIM6Yh
 5yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173115; x=1720777915;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJu1vmWUxTKY4ACFv7SXUQFPNZpjog7M5wGF280T4yg=;
 b=g4j/4MnK47jcHNB+Si+gXZ9xd+iUrJQ162Ier3C7TwR/AHKUx02F1dehS7OivM1Wz1
 jZIpyUeyAH9BXfI5w56pYhCI4a38XaXijiTxRhDHdq4+tYSkFd+9Ch3jDfhzkN/hAIpM
 hDfUsxNo7EWZ2AYrKZ/18n8B8dgl7gRnR1yIUiLbxJXY6SFWqhfhRiOtF33bsVtI2L/X
 8aamw7gbaN7YQaK+6wnJc7Yw7qMTJFhwV7MRnv0DlJVwGUW247iXVEx8GQGK6YQIWhph
 agnJf9zbG3QNsZVSyhTUzG9X04GLMLUDJR8N2bnxvCyacbR157r6oOg1wNsRXR5bHaf3
 AyJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2oE50zU2QlkL66HCumh/+S0vVMe0gg8rSMg0DM9wI4DqTSmoyCUnBIajQi3IjZjp8ZUiOftZbm2BCAZqisp/wSx/hjnNe2sbCg0UZidd+LX0nvn9TOW5b
X-Gm-Message-State: AOJu0YyiIgoG7bDpYbAfQbrNnkVim+130AhpQ4D8mZ07FlJyQDvA1G//
 PJKsOEazfaGcLbuWSAJCa5poF1UONRwQ2KU/yBMbEwIys+XvlfmQK3Ldzt/Q9aA=
X-Google-Smtp-Source: AGHT+IH8V0hkcfYPUlBscK7rDTKJum3Y/kp1D4wfK5gH6s/Rm3xSZgQUyKRbc81OqnK8GjQSgcWNiw==
X-Received: by 2002:a5d:62c4:0:b0:367:957d:b46d with SMTP id
 ffacd0b85a97d-3679dd71ef8mr3422417f8f.66.1720173114610; 
 Fri, 05 Jul 2024 02:51:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:51:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:19 +0200
Message-Id: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABjCh2YC/42NwQ6CMBBEf4Xs2TVtLRw8eZCrBz0aDgUW2KS2Z
 kuIhvDvNnyBxzeTebNCImFKcC5WEFo4cQwZ9KGAbnJhJOQ+MxhlrKq0xX7GlkPPYUw4TyQv59F
 5Hwe0SnelokrTYCDv30IDf3b3E+71o75docn5xGmO8t0vF723f9gXjQpPqjWlqxwZSxfPwUk8R
 hmh2bbtB1q92lvLAAAA
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=e0XnXkSS2UbFWN0Enj/RykHQGyKigRvVK0Ae2vPy69Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IhQOLA3YgiesM3X3PsNvQ88/UNWP+TTpAnV
 HPEl13fLgmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCIQAKCRDBN2bmhouD
 16lHEACAIqQ6rJ+IssE7c+6Byc/DFWCacf2uYgdbCx9SEJkdhTd2FBmqtuIGorS7GWv7sQjWxUw
 s0tkl2uvy1SLpEwSsjDX8jifZyU9Isz2koX+MPKaBiaM/l+shANrL9Ub8nkbK2VdKHVoqlBJ1jx
 CRViJ5HwLCQ+xul2EKAI8qfZdiBhLCvCWXiWyqNVOzGla8SXM2b07zV+Akza3BDZPfw42QEbgVE
 ZCAP2eYkIe0ZJiHNJ6PwjIb94/46R44k0NevaC/FRcinUnaHRNaKcUJ+fkPQ5XZjFH9sg8TCkxV
 vRMnI7NYrYrvYIOgRBa2T0QfbAP2dnxqo1gMdxQy0kJowh61zrLfLKAbYNJvlRh/r0AYziRZHrc
 U8k2+NDtbOPfp0vKsIvEtEC3qnpVHB8LTlfPNK+cpvv8uj0wWe+H0kJ/DCxIhbCjYZk/63YOAl8
 P4xRXaf/fFVZy+HxPYFCNrvf4MYBSg2XOhwvfprdm8AZXX3yR3YyZGVJ3UoGlbYvSkJDxTmP3Ii
 J1lsr1ay4TULQcqQNg3uiC5RLHxzMo/USu2p/M0FBbi2TJ/OlJynDRAO8z0Ox8Ggk1eiruF+q83
 92qWVFjKIhRWyHIkXpUcZhNw7GNERqxdsj6jrNJBa1nRCBdhobA/n7B8PPeqcsgzie6AEOHo9Ji
 h+HUlL/i4jtZxAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Amit Kucheria <amitk@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [Linux-stm32] [PATCH RESEND 00/22] dt-bindings: thermal: few
	cleanups
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

Hi,

Resending (with added tags) because patchset was still not applied.
Daniel, can you pick it up?

Few cleanups witout practical impact, except maybe the Amlogic schema
(bringing required cells).

Link to v1: https://lore.kernel.org/r/20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (22):
      dt-bindings: thermal: samsung,exynos: specify cells
      dt-bindings: thermal: amlogic: reference thermal-sensor schema
      dt-bindings: thermal: allwinner,sun8i-a83t-ths: reference thermal-sensor schema
      dt-bindings: thermal: brcm,avs-ro: reference thermal-sensor schema
      dt-bindings: thermal: generic-adc: reference thermal-sensor schema
      dt-bindings: thermal: imx8mm: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra186-bpmp: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra30-tsensor: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm5: reference thermal-sensor schema
      dt-bindings: thermal: qcom-tsens: reference thermal-sensor schema
      dt-bindings: thermal: qoriq: reference thermal-sensor schema
      dt-bindings: thermal: rcar-gen3: reference thermal-sensor schema
      dt-bindings: thermal: rockchip: reference thermal-sensor schema
      dt-bindings: thermal: rzg2l: reference thermal-sensor schema
      dt-bindings: thermal: socionext,uniphier: reference thermal-sensor schema
      dt-bindings: thermal: sprd: reference thermal-sensor schema
      dt-bindings: thermal: st,stm32: reference thermal-sensor schema
      dt-bindings: thermal: ti,am654: reference thermal-sensor schema
      dt-bindings: thermal: ti,j72xx: reference thermal-sensor schema
      dt-bindings: thermal: simplify few bindings
      dt-bindings: thermal: cleanup examples indentation

 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |  6 +-
 .../bindings/thermal/amlogic,thermal.yaml          | 22 ++---
 .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 22 ++---
 .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 17 ++--
 .../bindings/thermal/brcm,bcm2835-thermal.yaml     |  1 -
 .../bindings/thermal/fsl,scu-thermal.yaml          |  1 -
 .../bindings/thermal/generic-adc-thermal.yaml      |  5 +-
 .../bindings/thermal/imx8mm-thermal.yaml           |  5 +-
 .../bindings/thermal/loongson,ls2k-thermal.yaml    |  1 -
 .../bindings/thermal/mediatek,lvts-thermal.yaml    |  1 -
 .../bindings/thermal/nvidia,tegra124-soctherm.yaml |  1 -
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml      | 12 +--
 .../bindings/thermal/nvidia,tegra30-tsensor.yaml   |  9 +-
 .../bindings/thermal/qcom,spmi-temp-alarm.yaml     |  1 -
 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml      |  8 +-
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |  8 +-
 .../devicetree/bindings/thermal/qcom-tsens.yaml    | 96 ++++++++++------------
 .../devicetree/bindings/thermal/qoriq-thermal.yaml |  5 +-
 .../bindings/thermal/rcar-gen3-thermal.yaml        | 69 ++++++++--------
 .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++-------
 .../bindings/thermal/rockchip-thermal.yaml         |  5 +-
 .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 41 ++++-----
 .../bindings/thermal/samsung,exynos-thermal.yaml   |  3 +-
 .../thermal/socionext,uniphier-thermal.yaml        |  5 +-
 .../devicetree/bindings/thermal/sprd-thermal.yaml  | 47 +++++------
 .../bindings/thermal/st,stm32-thermal.yaml         |  5 +-
 .../bindings/thermal/ti,am654-thermal.yaml         | 15 ++--
 .../bindings/thermal/ti,j72xx-thermal.yaml         |  5 +-
 28 files changed, 230 insertions(+), 246 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
