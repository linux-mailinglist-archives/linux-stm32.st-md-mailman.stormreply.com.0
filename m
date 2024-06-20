Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C99102E6
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE18FC78015;
	Thu, 20 Jun 2024 11:35:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40638C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so4722135e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883315; x=1719488115;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vwhUYUm1LCcouMp8HtttE3x8uGAo7twu336vKpgolWc=;
 b=Uul7Y90wJ0gdrQisXI/69eiAfcf13f0SF+VCdfGL1KWeicWTPZiThR69zkhr/D+AN8
 XnmqbN0+GnO69zqHAEc/cWxEQB7/xJpGYndQJKNycWFjp++zJjcltKpba0wJ1z7rY6KQ
 eWpDMKF33XsnGk4YF6/U1rbm8whI1ZWalHPLU/CPnp5fWxcc386Re1zcvTYzouruYvYk
 eft1RNmLE2iV7/76Y/IYmu0fVCPR9lE9vAKitTVBHotNysLmeizhrjHtbcjWnguJr9p8
 p5eFWm7ickzBfEGgCdrR/+re4NIJTVr2ISyB9uM6P8i3cHICn7esKEsjCxHSy3iE7M40
 BviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883315; x=1719488115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwhUYUm1LCcouMp8HtttE3x8uGAo7twu336vKpgolWc=;
 b=f3j8LFVu1BKNSQGv03Q0cbgGNhdWVfrhyOmqh2AYx+xYK8UV+q1W5JAjh32h8UeZ46
 Nyojfzc7f8h5l3pC4/xT0+tks7rIQ1ZU2fsOcJH+fowPFG38dSsbe0v53sQBYZ8Tin/4
 lLolTehiGZuVkTRNvNnN/SSPw0W82fya9xjFWvE2qUStCDdJ2/s6coDijOQoQyzmajcV
 +2Z3ThwlSt3b0dfTEn6+iPawsciUaTyaAk7OI30pjJaIkU3wosp1j8bJyiEkxMI2NmtG
 sANXZpEN/xulVj5PCIxi68oDxWIgTv0Pfg3l6vz0byBix9QGDPGDVZfaYWjYAPdI0OnM
 Dy5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKOS5xfdCEH/zRVuk45mK5XBLCT48p0g5+YIPqRJmMPISzbV/OjGHxbH1MlWy2KESkixAuWnbJ9Cw1Li/QHItCyEf8dxsD0nRKybDibI5LA+Gu1vTLELyj
X-Gm-Message-State: AOJu0Yyo0GKQa1wC8dM1DH6q3Yq8DiZMAe8pkSR1JUT8X9Liiw0Vi1SW
 W3eRsf7Z1PQSHELEZM8NBLh8bNnY/g3+yVdHsDL1YNxICatcJ/r/RKtYZaS6p4E=
X-Google-Smtp-Source: AGHT+IGi5yGLp+acd2pIdKmRbWvISb3mjF6HWkCd3+3m9OrI9Xm2zm7H3RAJLTnEbn4GReVJ1cf5AQ==
X-Received: by 2002:a05:600c:3587:b0:421:661d:89d6 with SMTP id
 5b1f17b1804b1-42474d34551mr54893695e9.14.1718883314652; 
 Thu, 20 Jun 2024 04:35:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:52 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-4-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rVL5TZdNAPCclrb5nE/XztIDuSnB+tAbeOBu2bqcECw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPhjRGCc4lUC0U2O07I7kHcdltVj1nTGFgwC
 sahQvJaFr+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4QAKCRDBN2bmhouD
 12X5D/4yRWWhLEtJEV2feHXZffzW+59NtR0n+V00C033mlHpgQOTkhIS6zxDZ9Ih4FxyzLDj7YK
 O2It2+JIbRxDrecf85UGoK+tTE0FzqCP7d69y+m/UzIgFRP2pNU0NPWnfOBBzxiiML3umIdULgJ
 +dUK1G/T9q3fKI37S6r9tgcToya4zy9hc+u3epP3GNDyzSV5a+zu8I/8ixl5sUmVQZktup9m7ne
 z+77q551bwrbrlt827awh4P92x4TUFZf6kmjmFhbOBQmPiRClZrCaVXMRNxCWmegmRhu4jrE+wi
 fP0Rn7GayfdZGnB1saS8C0pk7HeZ9TdsdJLwKd59SrfIj35el2+XJNIG8F61/70oGd3/inIk2lu
 TdWGlqbT9KY8akeyN91YjW2iJPDpW2E8MjuzpDtMPHhN/NNZ7i5NTOSa/k61K51GA0CapxzmSKR
 hnrfwBfEL8hx49L/5etkLgTSv7P1lGG3ciAYf5qtvIWqTCFLpQycfuw8MP/WRBpQYf05igbxknN
 WFLaqzmm/h4jcIhixhvwXQg7HkX8gYQJaSFp2+HGzgQnWD0QR3S1Iv7d2kGSPJx5EWn/TvO5CIK
 byiD4qhrGyvTGswfSZ9mK6OWmGtpFqGSnH25fmndDM1KCre0xxbt0qUE4AZ5NJwTHLfOcqfxDBJ
 HPsn8SEE1+PLGag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/7] dt-bindings: i2c: nvidia,
 tegra20: drop unneeded address/size-cells
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

The reference i2c-controller.yaml already defines 'address-cells' and
'size-cells', so drop them from list of properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 424a4fc218b6..92fbc1a2671a 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -87,12 +87,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
   clocks:
     minItems: 1
     maxItems: 2

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
