Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7979087F9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7334DC78011;
	Fri, 14 Jun 2024 09:47:05 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE590C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:04 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6f3efa1cc7so522591066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358424; x=1718963224;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Iwmc7YyUOm4xBDbjnVE/cLl9RXPcTzMFZ8fnvjc/kFM=;
 b=TVlWkDOtleGlE3xS1vPVlPoWuil7Kb/n+SA2IPAujyam2KJRQP1VRK2NkiQV/HdCh3
 tRU1RBBxGzBSgeYXI41lC4DMMhxLDE9WFpC6XS4ZQPJL1/0wqH8Q4vFsBFPZUfHnPbTL
 1glRRe/TPbFP/IjeGd2DOdlxhtcsRmkKkGY9edgt96DVbaDc7jiIbRunAVYMdVWZm1hA
 NInl68WtbfzYq/DUGvq/LlaE4d5wzHiCHXnEFyPpqADTzwzyLrVkKMuYzW/qaaukVpFD
 1YlLlH7/S/bR4z0v5CCbqAVqvzJ7i9xsiDn7wINb2HQtTx7xE3tm/Bd0hgqmiv/pfDEl
 g5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358424; x=1718963224;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iwmc7YyUOm4xBDbjnVE/cLl9RXPcTzMFZ8fnvjc/kFM=;
 b=bXldSJGrlkBbYX1jlouHOKFSxIPqnkJnAsq/NWQnQS1LT4YuvHOcpEkDJ9TV68HZ7K
 1b5bVL9blg1Hx8iMKXwaDN0ha8xGMX3YjFCtK2y8IsyS8cvhNRbmS1RxVnkGhV5yFKO1
 qTiNSNOHerrzYz9Zba9WNGiN0ZpcoYDx+zHDZnJYzy5ip0sHEP+/BZ1BM0cnYy/V8OjV
 Q9VSCI3GnlPCF14apNKG3UfFIsajWCRgIARBGFi/R1TJORR5gRuz4fYXmN92QuvcQvtT
 zwdZGk+YI52POzEuC4wFhzx/GVgqj1koYcYJFnKpXPvY3PPfArBV00Gyby+TCJgsOnPQ
 9R2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhDjYEK9QpvgAjJU6o2Ev7Ba7mPAFMPoZIKx6L0XJFAZWx8XH08GkwcpNm5cXchpiXRANLeFhKRiXFQk7i19jl1trW8+bTEWmFq/+1+jA3HDhdDz9icx1q
X-Gm-Message-State: AOJu0YyUbs+WJsOZV70WxUkU1S72POnHdZnDrw8ds1HIMoBuo8h5zJo3
 JMwmhBsvccZax0pr2RYkAtxrF5gVW3W3jfznmaVjLtaWCjo+nE50aDjr/tu7sxY=
X-Google-Smtp-Source: AGHT+IFGHX4cF4M1r2y8AHK5kgGVnBSOah5PGU+We1I9mKi7qiDqk6ZzvLWJM+Qwin1N8Vfc/vcJnQ==
X-Received: by 2002:a17:906:c0c5:b0:a6e:f53c:8da0 with SMTP id
 a640c23a62f3a-a6f6080c781mr154203666b.8.1718358424287; 
 Fri, 14 Jun 2024 02:47:04 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:13 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-14-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6a1ezUMQBbtM3uBevrHObXqlW1KAkGO0em2HgJT7Ukk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFsTvtf1ULZrtH6GWJrZWn/jbBu50Y0K1VTc
 0Wt6oeUybGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbAAKCRDBN2bmhouD
 1/NwD/9O4ot8cobnhA94V3eGyRXw9zI5iESIUEkI1Mbbo7u21Zss4doBkhIDxJVQPLibQlpPDKs
 vl14uXutFJcltQlm/A30q7/jGYqin8KK+/fxS+lF14J7Fm+3oR2w5nhGXJq/9eptPEvk3xiH1p0
 6sQMjw0nuX+vqvIdVI0HSIGysiYW9eHWrwjfT2H0x2AI4eSjoOjqRw8BCVG1NOXkiOcWojysyie
 6Pe/a65m99arhY72cNG5XsPMldFzUjctBN5RFrE6OKZdohirpSSKFR4ui2PdxAp5GhEkcvlApXu
 JTKC1SMMHbFFDPVGHC4z0FdwyT7hbxBnR4zeVza8HeF7gY1NwvdMte/ICkBOm4nLC9XiXxBh8Ox
 gRb5WbhTZMcA2D/BRpTHEH8cJRx9l++VITdFXDh2DKM1zJBSyTXZLBp2T/nznU4UCoZvGVo8L/6
 SL6E6301KeFidlqEV72QLyq6H/+0idmujB7H/OwDlIz3rWlt8WAbKmtD8gwZWJAconS5R/wzo0q
 qwhIyGQup+u9pvI87775gFYyWIrMSKJUCjFFjCt+azCgzvgFIR1RFwzl+4Um4RPBXjtpfLa8Sv+
 qUC1e3KXvqeGpd2hDPVFEIJxO/3TRP8QqO5N7KwNG1PZSSDA/LKALNPT6of5MqC/u13zepj07zJ
 tHBm3LjcR8x8A1Q==
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
Subject: [Linux-stm32] [PATCH 14/22] dt-bindings: thermal: rockchip:
 reference thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 55f8ec0bec01..b717ea8261ca 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -9,6 +9,8 @@ title: Temperature Sensor ADC (TSADC) on Rockchip SoCs
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -76,9 +78,8 @@ required:
   - clocks
   - clock-names
   - resets
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
