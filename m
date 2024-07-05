Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F173B92858A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B95ECC78013;
	Fri,  5 Jul 2024 09:52:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B7F5C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso12746825e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173129; x=1720777929;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
 b=Hhf1p4psfLuFWySfm8Ymk5nR3NP5zBg5vcVhzidwbmdXGDMII/7QjXrl5pLXdGKbeI
 oRns0yungNWnRLNfWe5UXFHW8Mv8uc6vERgC9rAXTo/yfc3kWi217si1A7Sz3CELkh5W
 GgELWcnwzne4DFIbdK2vl6+RAetxxoDS40JZtLyvvZf/ZbOeHZqoebhdnj4I4knokhwF
 QyaIPLyzgLQLzY6jQGhjC7LY4UvgoIH+qMbzVMadM6LGQmgXUGzOVrVXlLGhGi4SisfM
 vA7Pj6/zOONnWOkYRZjabvqS5pShbCmBLWHdRKQ/wMiAfssjfxa2lHJRQoOlQVZ5eNO9
 yN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173129; x=1720777929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
 b=aIMJ7Pe5q+ugW5CXW006VpcIBgzn6Qk6RPXydPFV4+sRCJE2vZfEzPSIa9oTvC8wku
 4cPpPQQdCDiHJEtR8WS+4Z2df8IBe6f+WBu65Wtana7viKoLB8ZeRbP82fpaIMFkDDap
 3mbyyHFjeFOY0UuXjXIfVVk2poaY0xe/ZHQ00C2r4FvzXjGH2RqUIbw9US0MpE0r4TCN
 NKABkF3FuwQeiRMiTv9W042O/Q2wCierC8MbelfwWCiMK23xLkRMNT5Omj2I9oCTYXaU
 JJYe+8O4TgiMDCZakDt4PIpNdjew162CbMfxxByvTJZ7+l/Oj+uKD7qJIhGp7nXY1wpw
 P3aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK7l/lxbNw6rTPwIFsdDpSae6pd/oU4Z0JavmNLP+v5/1TaGOlZ+e+Bz3WyF/VZHpYro6Ccmbbuwp77mZMaeJIFq4UftfSDsCOkyRjkRu4VaUyTGjhJz6Y
X-Gm-Message-State: AOJu0YyoZtj5fe52Le//4EhWn28GXBIW64OkgNLk7HwCpRybEfl7UmwJ
 NE1TpUQM+CkwStmvOv5Y+t+aiB0IwcpGfk6g/QmcnJx8ZulL67fsF/QFaBMDVjdRErICZeApyFa
 9
X-Google-Smtp-Source: AGHT+IE77ma2axxS7rLu+M9xLG6/UwCBbROAMMPTCHGq3ZddU86XnrD92GQDQqINuNvkwWFdRJTeVQ==
X-Received: by 2002:a05:600c:b43:b0:424:a659:c169 with SMTP id
 5b1f17b1804b1-4264a3dedd4mr36112265e9.24.1720173128994; 
 Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:27 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-8-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EE6uH3S8yooWjBbe3+z5cTSmhQC7QX5UA8UWn288lQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Iqd0ph0CUxcUs3PavTyLzOqTzqJvcdDYmVI
 xV0u6SX2A2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKgAKCRDBN2bmhouD
 1yBvD/9984PhWBMPV7QZqKhGV74x0JxB9WqUhV9r20PgsjaVgxSFnDGL7vJURSZVChE68EfgotW
 e8Ds5bHK3sPvyMXGka0eR6bN/2ofZ/K1k2TNKzu5MSqXIiH6q09J/0ZNqTeSL2iCj/yxNJuv5ks
 kPCAvVtdJgZl5pJh7DjsV4D+olOP2/bTiPU+i221P1+jJv99Qp5EX2ARu7JOIdn64vgkC90cHk9
 3kpF5u/PFB1v9hgJlqqZ/0CGUbg1AnjWnRTHAQw4DwlADG6HEFXqNWs1lyxQonEq+eSOPSxWirY
 2zgz/c3Q/s5jQTe2Y5zUthIweqFV3PZazTmAqYupWbTA3BAUy2Dbav9Usv7b/af2srFLraPJHwo
 Yl37jqf94DcICjgA2GEBM2HMQO/6OG4B+jxmAmyhp/Wu5f4R2WRcDHcqpye8BM4q/fiZJsQMZ9b
 5l4kbYSvoMe+KDLf/vjmvbv1fMsaT+WLBTCY4Ca+L5YYXa95dmHNO70ZZzYZZGTYd7uQad/5sP+
 BxnUEBAAiShjPGx/BzeTqMptlVmMSAv6Sk7No484Ay3DvbRnfnVonp0y+TaQrJC2x3qNsvuQTnd
 9HXsS4VgpSZ7zYubV+ms+is9qumXHtqpl6yiLcn22+L7/b/+pZPWaE/l6emYxwyOgrY+72xloOr
 N/C7nljDb+Oo7lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 08/22] dt-bindings: thermal: nvidia,
 tegra30-tsensor: reference thermal-sensor schema
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index a35da257b070..972d608ddf95 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -27,6 +27,8 @@ description: |
 
   TSENSOR has two channels which monitor two different spots of the SoC.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra30-tsensor
@@ -56,9 +58,8 @@ required:
   - clocks
   - resets
   - interrupts
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
