Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A99087FD
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985DBC78012;
	Fri, 14 Jun 2024 09:47:12 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F4DC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:11 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso266225366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358431; x=1718963231;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m4Po3dZkYUhaAL25RngwAM+jSmX3BmhwR9LwsGE0XuI=;
 b=opnL+tGqu30F8eKNI6LgWVo2raBnOp32NYj8A5/nbkGaUgtdYO1JBOkuYK9K/WgiZD
 Zb/2VkqG+swF2vX8Mt6+TfLdvngoYxyypThgDJ7zpm34Faepd3BNqkya5/KS/9liRyLI
 l7KsYMGXYBExxukMs909cB1TK45okuJlulF2OJrmgJxIYBM/4WUZwWmTXy26Xz13A1wl
 JLb6WTFiz4QpkS6FfZYEYGZItV4WH6BCRLTLBi8ctJsyO8tErMvyI8RxsnALvQG80+Hi
 763EWIO1FcGodNWdwO8Bg4guJvnepHHWzhgxwc3hnq98Wsvk7bCUGrVO4SnubxX5e8DM
 oFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358431; x=1718963231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4Po3dZkYUhaAL25RngwAM+jSmX3BmhwR9LwsGE0XuI=;
 b=OFuvdpi3qZ5ZfKYuDw3Km/YZV038Qk/z0N0pEaL3wWieuVFEVOyVPNN+O5jjd4Lpu/
 yAeRGa2Q55VeG/58B1une/G1XzO8MAO9Weg+UZ6M8jxYEdDG1D5STWWN3QcIwLNFNm3s
 kibrIUUYI6FN02LH5vpR6T+x4jxVg0/ZXqXZOXIeBZC3V2ouXPL+VDpYp5CsI+F+qTJZ
 NE452DZyWbsj8CKBiwW7xvdRsF4B2wJh/rfHLibNfVO75bVC7jWlDRfn118i9IkVV8xG
 NrctyOvu/vzrHiV8Tl5W9yy/zD59jz2gRxFoZpqcAR4Y77K3lAoqGpU7jQjy0tiguZms
 7qtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpBF7ZM3F4neegMPwvz63fGWSxS8s9aPWMCz8HpiAXKiedNqd6956a7YeQXSBnHogR8iyHAcnfX+1ioQwiEtWEm2uKtrc3DLs0iUTVo112HNoQwvLFBr5A
X-Gm-Message-State: AOJu0YxRc/P25Ao5sbB5iGa0zT1DnPXcyG2HfIN5OFt1XUOzoRN/1xUm
 4RwiqOah3tf8dnrb9giRQd+atrjeoScJ8CieElWevvXbppnuQWObrp7lY/6clEI=
X-Google-Smtp-Source: AGHT+IGj8vHnUjzyQXLjakThkDrI8TADcYkwvsTFTeOcX9PO/UorHw4DDlmq9L/9O6hUgzTRz1KoDw==
X-Received: by 2002:a17:906:ba8c:b0:a6f:6ae6:8ae8 with SMTP id
 a640c23a62f3a-a6f6ae68dc2mr43152866b.74.1718358431505; 
 Fri, 14 Jun 2024 02:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:16 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-17-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dEicE4oTwCczzzSyDwiogCPoDffxWlAHYRiHMVel/ec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFuXyZKku6z8Qz5XDywxHtOOz0aHPstPB7Df
 ZOWxYleA7yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbgAKCRDBN2bmhouD
 177kEACWRRlV6yfOp6uidnIp+nHz4sLjMdBIDfzrzpVcp7iD4jWwecM8XI+I6lj6IDzxOnxVerN
 OZ6j8qRBgfiSEawZgjFHgIi85071JUuKrgk0N/lQEZXshx0xio+A9apGatt+66TWUfS/rLtkqKo
 +UAte/xkpG1cWdKplXf3ygInEaFnyLuZzKusoBU5Y0G4mBQNchDGKvc/zDHhQ7LOV8TDsk5Joxp
 lEz5NTW86srVdlZQRHK6M2NHNmjxQmYjTlZ4mNgn8ueEWPLyJXRKkJ8aKgAfFj2PufgXI1gq/gD
 Noq+61uXpkdFmDUik6l5ZRbEqH4NN/K6FHhtq+ZmT+IJpqkpdswgYK9qTCZ390I6B0mvsxx1nuG
 eSZwun4lh49YfJoX9sMvuts89ZtiJ94oO29zK+6bk8E1T2VKIll6F70H8KWU3GwqGhc1IkA3pkc
 YNqo4x1G9HZcGqtKg81wGxxPSjc/U/mOdLc6OBE6Wi0eFLbnXXlDEBqlnzMDHef3amQ06+52ceB
 pXkh9FevCjjNCUx0HZUNZjx8oCH+Kp+4RW7UQS64H9Ud244gGv7i5BZvyLsSXp9EKtLC89wm3GM
 BjrpkcZYfnENpVG3KevH4odIvbXlsZeHemznlCvB0Y77xZradFMiIqHW5fRUJ/4ZXs4kVHF3Ow2
 FzZcySJAMHGaqGw==
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
Subject: [Linux-stm32] [PATCH 17/22] dt-bindings: thermal: sprd: reference
 thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/sprd-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
index 76aaa004c8ac..f65076fc68f9 100644
--- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Baolin Wang <baolin.wang7@gmail.com>
   - Chunyan Zhang <zhang.lyra@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: sprd,ums512-thermal
@@ -77,11 +79,10 @@ required:
   - clock-names
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
   - "#address-cells"
   - "#size-cells"
 
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
