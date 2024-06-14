Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5F9087E8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C992DC78011;
	Fri, 14 Jun 2024 09:46:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82503C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso266673066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358391; x=1718963191;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
 b=v87vore2UCQ6TJsMVlH5z4ZFugff9J+sQtE2Smox1kPN/7p4WU2Vq2PeP/vbv3xs7O
 hPXGYp6snN7EGMy6/wZnC1Bo2OZeQXUFIoOtoS96LtLtbn4jSvQmu4NNF76wkqX5HQPD
 lPJUYFW61cB4l0C7nFbqtIT0ZQ3xZMmjuPaNzmYO0JBhDw3Tzk3FRJQtMCDGe866qk2U
 6jVGE8yp8DxfG5PNPGa9hm0oev5nCiKhpCxcblMWmjbwBYUik3Zo5hf9nwLmDwZPPrvu
 TPFUi8aZIYDGS7lnGRGtMWNLWkXOhE2XW4ws/xt3OPRK1PH+KLQ7y/IrqzLk4YVARdFd
 nafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358391; x=1718963191;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
 b=STJrK4Dh6F59FwWep6U6Qa6axw1KdHESuMeXtLRkevlj/O4ZDOPoQiz710Jd5Bls3d
 JckDSc0XT7NojuRvhqcoZfGAe3zhegG0tSpIV5gCUPWEHD4CwGMvoYTSxXCuVCA7ftUo
 Rrhy8CN0eB8Da/7i+R8+nm2BbDV29YSKN6I6flCmpeR7SkQl16Gr9oJ8DLWAC3K2EYLC
 d6dY6vyfrSFwFwQbpn5IV+PAPWxO9XOEbpylqABsVwxLJ9PANTrqJgM8HHqSSqYU1LaT
 rsgSYa5rftFFTgU6yweqTQJWUuCULNq7pfnRilAd9JGrIOJkq+79E+62Mhs6qz1VK/PK
 snKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9jmpxQ4AdOFIqM8JArgVprY2EvG8InbUuoukW7YUS6gM3OTLkLJObfsZyT0EakYOYI4uJEN6w/QEB5kXUpOUpftnljXzvLuPFE1Al3Id9hw/HeW98/16M
X-Gm-Message-State: AOJu0YxtYkIG23Ce1Grjs0mzJApBo7tTVG4WV8RvNRM9OJVnWuKoVpSQ
 AvStj3Yz2wrVEgs8dcyaP9hYkrOw6Re5Ssfpb/PnRP216ls0ABUgy11TWBF01Vo=
X-Google-Smtp-Source: AGHT+IGov8h4HWz1vwXrMuZx4d9Kl8tLftrHfY/R0lPxIE7iVJTda8tqaONdGVeUAi1qLy3sNijSsQ==
X-Received: by 2002:a17:906:d8b2:b0:a6e:fc0a:efaf with SMTP id
 a640c23a62f3a-a6f60dc89edmr143181966b.49.1718358390766; 
 Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:45:59 +0200
Message-Id: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFcRbGYC/x3MQQqAIBBA0avErBtQsRZdJVqYjjpgFhoRRHdPW
 r7F/w9UKkwVpu6BQhdX3nOD7Duw0eRAyK4ZlFBajFKjO3Hl7DiHimekspmEJqXdoxbSDoJGSV5
 B649Cnu//PS/v+wHlGnZRawAAAA==
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=p3XfyX3kLTCraBOtA3bYk0nZWnKJv6DRa4Xv9JXFZPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFZ2k3GJoNNLFeKNDEm6wol3YrFjWScB/fEO
 gMayn0IsTaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRWQAKCRDBN2bmhouD
 1/1iD/0cmbLdy7BRDK+hdAHoMuk7AzFr49JqiJx9VLENFE1VKTi9ZqBN8aDoSCByUeWGR0qU+4q
 KEogi56HJQfUf74TNd3+SnFy0Sn+vjwhHn/CGv+mMBvy+WBQcLFhAVq8OPFrC6ZaHnMw+twYqdZ
 cJztoB4JHHpNSh4utMWjZ/1dCwew1GKPFztUKT8kK4OUhxotGA+oTqFklvuMza1LUOitasdXcWE
 NO5DOwXa3khj+DvmylZwD9aItPM+9lEIrSe1ZI7Im3INY+QlThZu8/jXgvQShu4wMFo6ZiFcGSf
 DZQw22RWE9MZfA5rprvMGcHRONNxt7Bj9+XsmFTvsgLNUMtn/4cgbR+H6XB53fYsCXd/U77WruG
 5FCXdX04NfpF63KybtlPqGyse++v9DRIjDqOl+YaajBVfY5AIWnNtWpkqo0pHDjr8imiQP7O9RM
 uJCHWeyn0PwumkruVCJHJ6atM6UxO20yBQIoccFirseDL9dbds/B7ghSRppjIKrS9caS0Zu+XK/
 i2UMwVJf+O4CyDzjLhIUmKwCDk2jNSqCbmUvcv3F5+o34uhViJYX6Lq22U/Nd7PS7LT1uFK5pNg
 xGjQ4xLDpRUyKC0lPvWUtf8qn7rOAsuoc6ELE0cz7nJbX0rDs1XLZl4fdMI6cRnxhT0CibGBy7L
 6PdmGjRdB0YzBJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/22] dt-bindings: thermal: few cleanups
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

Few cleanups witout practical impact, except maybe the Amlogic schema
(bringing required cells).

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
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
