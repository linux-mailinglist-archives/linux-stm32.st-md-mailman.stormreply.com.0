Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616E908800
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC43AC78012;
	Fri, 14 Jun 2024 09:47:19 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0B8EC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso266775366b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358438; x=1718963238;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
 b=oAAiEbWA5NcaZJr7/Kyb/BYh7Hc+KVk4w+6uHb/n330bSwNf4DNjBEJmlNt+XPc799
 l/jN4V7hvjQqN65dU097b9cJ+zFcW7fjaBgxZC+1UnCMmPUnvqVx6WRIlfDgphnLjvb8
 uNv+GErMA0n4pEGcERhcVnaZMsuE0OLMIDql9/OGebAQ4bWwXoYRM7AoIBcMPyPlNTRI
 FQww3HJdJgQIfWn319N2esRQVSxn4Db0vK0OVrhFZ3XBEQ9JDBJO8fue/enrpoQmR/mk
 fdVfdsXdnOSgiLSWn/MzpfxxmKETQcdgBBwOWhdG590bMgdoutfx2cHIbkkPw7bm8PTp
 CEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358438; x=1718963238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
 b=f4BGcS7oyaa1OyXBUIn4AildcXNAW9bmCg8NDKs334brnyIylJ16Xm49nj4EDZ1tR3
 5Tb80c1PHOQM5+30WJ2eonKE4x3hTj3lFMD+YeKrJoIw324/5Jub4f4tzB+GBXFAGoc/
 vSpqtqvVRMbXSzrPPd8UoW8LSAUAS8DK/WdhCXyrFoIkt4VrQ72wc5BMdf5jLlDOxFjt
 91VK2Q4oDIcNY7YIZDIR9SujIBshma/OEaE4wVXTjY9robmhxGHSo6RNltATtdZk9Jd1
 8TJSCIPwkwEdI3eQDjlCkauV9fu3b1ChnQntbUGWLLpRZy8yKh86DDOFGqphUPr0mbBK
 vszg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRSMinkCGCB2WCkkF3aJ8+A72TVFzTtC+Xqk8TXts0MoNljEQvCbs7QRW60crU7GfBCSuobV8eAxl1Tibu9fUq7VZiFJtjWABBWRBbat3WaztRIpUg59IB
X-Gm-Message-State: AOJu0Yw4JFeXrWGsi4HoSwF3nUdtSMNyizqudR7BcvmZAQtAnL81E2+w
 fRNyxAKSTyPsN+ovh35R438C5seT5K4IqopvdFw63MF3VNk826K3aw+IiltiFIE=
X-Google-Smtp-Source: AGHT+IHImE03me+jBXAaJKDis3LvJaHdcyhORbJZDZPs74Uw4HneHqZI29aXqpZb3jL7FRfyUVcimg==
X-Received: by 2002:a17:906:f74b:b0:a6f:2605:aaaf with SMTP id
 a640c23a62f3a-a6f60d204a7mr143354066b.22.1718358438479; 
 Fri, 14 Jun 2024 02:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:19 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-20-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFxyygP0KDRWxDno4kM9DyJJF36q0Pj0JLXC
 R5ZthscE++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcQAKCRDBN2bmhouD
 10MhD/4/36ep6K9C/2A0+yLh/7h03kLK7tqhV1a2oEMiR/3bLKcpn6umQP6r9gvpMHFlRX5wP7v
 2Qcy7ULesoTVCRfLz4eewatjk+KaHWQsvPJPW3mM0/NcAviaPhVr4Rhx8aGE4qMZvaATX/EFkos
 sdCgL3T2E1K7AQatgcC+1b+PKDToD4VSvpUhUlBzal4f/lh5VFfaPlTkFL2hXw8RqukTXlnjwGV
 Z2dOi+pr+iLn4vPMTgOjHlqHYOY+Fw+LFfy0eGipU38yT3nZhlQ31rsNf3X6DNHQ8N4ZP4JWQfo
 azTKXqmkvo9KhPB1EyU3x1F3/rlnS9RNBFqis1F5jfUByE3A4wy8b3SskCx6A7KcUmHThp5zZey
 +vSWFb21wO7P4/0EM4SrAxnaRrSZ3EcyxVjx5jJlX9gX43bj2stJbhNQXNUKbMAVvz1tlqf8xX3
 GildL9Wcxj8bvNFfcGI6IrozJSx9uVjfA3xFZdHpjC6HD05/qSDT2Rts54sh8RhFhEGpir4fDaC
 gf3Yu6j3t9hhKWwwOaELcEKJw11d8RG23XGWH+voe9MnFlR3dGPlHvIAhq5lvkvvXNc0r9PLnj+
 V4Qlq76yHruzbODm+mWzdVMIu3SBsg1YxnKVpDzMgR9XhgoI0DAS8Kl0elUIaSplgkIG+amxYMv
 ym9A5pI2M7JT22g==
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
Subject: [Linux-stm32] [PATCH 20/22] dt-bindings: thermal: ti,
 j72xx: reference thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
index 171b3622ed84..82b77b9795a3 100644
--- a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
@@ -22,6 +22,8 @@ description: |
   Temp(C) = (-9.2627e-12) * x^4 + (6.0373e-08) * x^3 + \
             (-1.7058e-04) * x^2 + (3.2512e-01) * x   + (-4.9003e+01)
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,9 +66,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
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
