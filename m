Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E29709087FE
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C62C78011;
	Fri, 14 Jun 2024 09:47:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 515BFC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:14 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso243533066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358434; x=1718963234;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H1L1hUKhvb8qMRf1UscQN2W9C1hTFJkKm90Yn4dmB8k=;
 b=OvJ+cRBt3XrNl4sxz3UwMQUzAOj3nv6C/PSO4H45KPmtlv2yFXoJCHjt/BucP/bG7q
 EdGtSuKmFPQSWzxAa27o+XLY2ERwcBL6jY+PrOG50nONP1HFHWNP9l0bV429afOYhv5V
 S4JgAUvRgF/9iBRQeD5zqpsMMfaM4t3gtmHJNorRuI4nWvX4b8uDAqk3NKvRfaXHMU0n
 r73oMaRUNiUEm+Rn4nrwg3sINNdhYg7ReR0vw0TEevs/wHALJpvBojwentqu7HN7r2Pe
 2gK5pOrczvAAPrvceGPQTtd2t50vefvlYRj65evhBa1ZS4nbeIX432DxUR2K4zIAvaqc
 kj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358434; x=1718963234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1L1hUKhvb8qMRf1UscQN2W9C1hTFJkKm90Yn4dmB8k=;
 b=LF6s+JP/fTewJFJAsFE5OUIRWGzG3EAXvyJxFsBLwW+cwPBc1vFu+gDx5ej6VM3W5B
 ELzw4zX2tGX4JNfC0JQOAhSTsj90ennLC6ts5SvPn/P8Mu0glCQ7IaF9BxCi0uDqHctw
 phEHwV067J5NCv6IAbByJfCUxsX2FB5sPcnHuohb7ebR8717SvZkVlwL5SWwHaWeLmOS
 3nuvE/zJJwgT29KkRRwZLLmVeRnmeXaKJtT0btPzqfPH/8/zfliTye0rMoJqKI/JIBX6
 dQzWXd946m8JtTjbrQSr96C1oTQXFmJY/Gosrz87TNID1u52DEFAP13awk6TRbolbMnb
 rhxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Tvwu7opQSfjQ4wzGm2jhKQmwIFG2UuTl9o6/atjDWuf2JcUuL9M5K+s9r+PV3ZQyONjccAXoys+7Vq8UxJT8WQj84RmxUTAT+PAAAtig7l8rEBe2nd4Y
X-Gm-Message-State: AOJu0YxLYg/beLlib28YqNoR4FA0ISLzuSAYanP9WzZjhM+a0A1rrMej
 BoiTXasDg4rTBPBxcvIL1K///Sn1JvF4onWys7lgMWSoHZZTTrrp6Oa+7MsJQdQ=
X-Google-Smtp-Source: AGHT+IESUfkXPP4PfG4NWjsxbxp6NlwMJWMU5nP5/by69p2zzzbRxPpfOQIPY19suOJaj0e0fGtyQg==
X-Received: by 2002:a17:906:1c09:b0:a6e:fe97:b33a with SMTP id
 a640c23a62f3a-a6f60d27c9bmr135962466b.29.1718358433828; 
 Fri, 14 Jun 2024 02:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:17 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-18-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3L8KlXex0s7qoR5YcxPA2jc6XZ2NrZwE3MC+jn02OI0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFvVBZGRKV/QP0IvsM9xQ7ICCZWH+Dk9XKXT
 QeAll8jTOyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbwAKCRDBN2bmhouD
 15jEEACAeCBwooCDdYSgCgknbyYtJysaUKzyYrYH9LKW3iH9vLFvBYECLMzvA/BwOarmAczsVAn
 fTlAGnKMVex9imbHWzOiNhf5ZXJTAyeGmdo63wQlftWI9gXXCb3Xc6Lv4UOwCRCd31OgT7hbyzZ
 wA3bUPn9xpqvEw4ehdlFsQkxanu4ntK1/aFsss1ruH8J6Bwio6yXlukjniaoB4tjPouPwRHLEau
 qnnIw5VWJwicO9aMpZn7cuhafO+WIXlSvQ35WQrlsT0dCdmwWa8ghuHOMX4kCOgVsTlAbsYhZsf
 8TXEFNmKAij2Q0paybkFaDqAUJeLHQ9KpBaZMmCqL2IeRqn8pftQuPiOtLn/g32Nv8ltQ5Wup9B
 FGG02Dke9RBEGHc75ujsQMC6I7TMWUcslAcU0oTczDA1j/7mMe9pym1p1A4OepLhZWuJCOy53kT
 TqXiJ+AGHI7NYE0i1YtdiTME5h5mx4xsV5p4wEgKq83VqZG3f4Um+sQfVhJyPll6dchA1xVh6mn
 UHPg8yItoeRub88Q5cRPGvwDCf9PdtNQIURSCXSK0p8znfBo4uVgVpGj6VLJqFtei3hEw3L/Czi
 WJC6lRFVr4kIKqTKckckW6ov1GA1SzZd+uPLlAWlY1dK7VkzLkh1M3jmGs6xCjm0nsb+xIJ7PKs
 lu9YouNtXcCBKHQ==
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
Subject: [Linux-stm32] [PATCH 18/22] dt-bindings: thermal: st,
 stm32: reference thermal-sensor schema
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
index ab043084f667..1c01a80a0cdd 100644
--- a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -9,6 +9,8 @@ title: STMicroelectronics STM32 digital thermal sensor (DTS)
 maintainers:
   - Pascal Paillet <p.paillet@foss.st.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: st,stm32-thermal
@@ -30,14 +32,13 @@ properties:
     const: 0
 
 required:
-  - "#thermal-sensor-cells"
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
