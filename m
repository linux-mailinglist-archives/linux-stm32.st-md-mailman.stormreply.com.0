Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1819102E2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB89C712A2;
	Thu, 20 Jun 2024 11:35:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84D58C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42121d27861so8184645e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883304; x=1719488104;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Glq2tMaifuOAdzvop5Ltj2KSs2eGaTbj/dbnplQsCrE=;
 b=w19c2nZILqhwq+vcOXtNvb2MIUTXXGF6xsnjy99eYUrXWs72v6m9r/jQYX8XGUNsxP
 xGlY6VaglwDy4ygcRaJqZ9pGr+9aLeCfyaSNAXG3UctXQrtqr0sF6PV7D+XVD0Eu7Mbl
 ok3FMse66vG/n30bjW4PPaZjPXDAnlGvq+UWBo7qeeyer7OAKXV54UN53UIJwonncovj
 40QSKsVGuFcVCgtZ0mpKYLLthgHTlm4LMnzoOAx4b39hdW2uLGsK/0R9wDp0iKaviYP1
 koe3h+mad3gBYwyjdUtf82PISc0w66rD3nXz74YsX6w49q+TyjLKjDlxBkOf59uNscAT
 Ok/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883304; x=1719488104;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Glq2tMaifuOAdzvop5Ltj2KSs2eGaTbj/dbnplQsCrE=;
 b=YJC/F57l3E8myrKplOz/MK7vxFlmlZzLAbxV3Mg/RIkUp3X4vpAz/RP0HXVX4iKibN
 CmRXRKI/NMi0YJ/EqQT8TMsoysIG/jLdCepq5Y4UBUA6fwjcC+KJOQK1rEmcJ738JoUD
 3dQjOmgJwIMI6y39XucFjsLLXpXdcRPnBM+Ugh0zP+hnFGDccXYKrfwgWNqQd5cuUxGX
 Btz7aVu2tCVftJVxyiSo4/Iz85NC3NfNohYEmiTgeAsSKU1NwmGL1TMusB7vJDWAj9iH
 8C76gTHCG/5cb3L6PJidwqUHrHi4ha/BiAH4V/uUprC+2KjRRG/eyDSXw/3KCm6TPOwB
 hlOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUax6Ia4U4kcjFTa37LH1Y+IWGf2/WnRpytvk9I6G6exix2w+S+kAwRpKUMOqLAS4PfG8pc5e06ID9+hK4LvnIefdNmOY7YzaZ2EgNpi3FDnnCKIFuq0et
X-Gm-Message-State: AOJu0YyndOVVdOY09xR4sZAOHhbqxmzXak5t1MKsZV0nmUA/I7M8dYzt
 qiJj+CPrUycNTIGcHqnZDaGG32/c6iTEpA1bHcWSeG+r3YTLicP8X3vvxIAkSAc=
X-Google-Smtp-Source: AGHT+IEC333EUO2VdZZgiMKDT3IOG5Ndy0ctNQWLEfPi1WjOb00373ugVPyZ9Tm+mewPfuUng+mSoQ==
X-Received: by 2002:a05:600c:3587:b0:422:683b:df4d with SMTP id
 5b1f17b1804b1-4247507831emr41097855e9.8.1718883303885; 
 Thu, 20 Jun 2024 04:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:48 +0200
Message-Id: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANgTdGYC/x3MMQqAMAxA0atIZgM1qINXEYe2iRqQKK2IIN7d4
 viG/x/IklQyDNUDSS7NultBU1cQV2+LoHIxkKPW9eSQTwxqrLZkVIoYN/GGofMuEM8sUaC0R5J
 Z7/87Tu/7AQPg29pnAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YHKoaWAcJ+E4X2k8gwY2x6AxEmhfp7BeziwiF4EyNK8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPbcGv1s7Mfb86Y03fTN++vt3SrVwitqTmvp
 PjKNhugL8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT2wAKCRDBN2bmhouD
 1y3MD/4rvCpsB6iB+y+tU/COMJL7PG9Y86Yyz+XvNfpgy86am4K1TLbZ8Sny/9oXRnShDlLPq/H
 WiNVGeCHtmrCa3ns9Jjbxz52NuAFSa4yTyjWIy3ibTBkbeR1Jr+y86y6Lnv8NvzK44v+XbcI5FM
 ci6uH4KG8b1CwU/1rDDA4gWiT7JPEAQZPkeydJ9KLakahgPTbDOkifM37vjYLxJTJSjwlodAK3r
 uKRtEQxP3pAIeHlAgV3DAi8tKwnkGOOQ3tC9iiiaYTT+CyA9Hn/NQlojUkPMhfS3ye0/HGpmyi5
 livlJ9EPWJC2C7sTZ/4OTHny8BtNU5OE6n1gdOXk8y9ueRkfdABW66IDoOdoIpqoBMcFw+CkYh5
 yyzUAUVllosS7j+wrPK0iy+fAhjPZyvfuss2n+Sf8P+Jx8kghLANqPkAoaLuIqSWLnbFCJoME3d
 JHdsLZlsNq5W0y4cobEBTs6744XtWrd5KZXuYR72LcpvLkJZSJZ4DP7o1vpCTvhzHbbfPTY8Z9e
 tMoCB76WkcZC51GzYi3x9I8y/5hjhOwDIxZr7D7fxKR0fhM+STQZ0LaLlihTtceBvZ5fH96mO5F
 UQM2j755vk4CruBVO2fMSo9ABYwLZaXAtpTv0sWlOH8eVmDRYEKM4kamjLlpi/VHebYYg5nrVlz
 ZconbQdG6ZzLgsA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
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

Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
depends on first, so I suggest not splitting this into fixes branch but
take as is via next branch.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
      dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
      dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
      dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
      dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
      dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
      dt-bindings: i2c: adjust indentation in DTS example to coding style

 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |  10 +-
 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  28 +++---
 .../bindings/i2c/google,cros-ec-i2c-tunnel.yaml    |   2 +-
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 106 ++++++++++-----------
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |   6 --
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  14 +--
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |  20 ++--
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  34 +++----
 .../bindings/i2c/renesas,rmobile-iic.yaml          |  24 ++---
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   6 --
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  66 ++++++-------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |  64 +++++--------
 12 files changed, 174 insertions(+), 206 deletions(-)
---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240620-dt-bindings-i2c-clean-b5a0b2dfdece

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
