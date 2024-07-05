Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0192859C
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B59C78013;
	Fri,  5 Jul 2024 09:52:27 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2212C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:25 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e9f788e7bso1504159e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173145; x=1720777945;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
 b=XdxzxFnxYRPUWKNCsA9/ceouEuEQeLdVRRux3XvHgnSfeo1gPz9SVZYUid9wUGWlVz
 kWqW/9KfW+KsHN3QTcHIKZHkxA1OYl1+TRVsJMXew++gKlbNFjNR2dm8aTVQXKqTNn0L
 txeIr25LINR61NDEkGppined12D2grNXQuKb+H9Oduw28BgdP2/eaQuN0TUmAXBrDOpp
 dMgsUpXQkSHBNuQNSJt4DYCXY+hUxUWM0dZWt04C2Dd596Rjc9N6jWVY4fLR90hu9Oyr
 M5+b7/ufYHtpDNoepKTrg7YsJRs0V+GSEcucEkeGjQrRlFYLi5zW1I/IstzkzRqNSxco
 6HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173145; x=1720777945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
 b=i55nxJMjhnQd6Z0PtIGfGR9tQnVdPv9Xrg42UgFToBsenJ5TKLVpi2JD5iZFKTB+XX
 hBbynJbfFGNzhcgmkDlOnB5Sp2WpiavKnhnkXOsbYo0PK2KsY8irUEl3WoUnW8Wpvhsm
 6uC5jGjDxkdHkQSlj7ZsH4+a7PzwTYcLaXLMruQFo/bZ+vdRZXiHcNaik7vyoeF6YMcA
 /dKjOSjXqVXrcdMyvjV0z3Pgmnt47H8JXOt2faVwwjAWCHN09/ZGh8lXdo4KlJ5rYu6P
 mYl50tdPunwdeCHAbcQcvEv2wdBa0EgY5uZ2HKWTd+4K8n7EySnqe7uWXNjzb9yMl3Jc
 +Vbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDcxqj8eW2+P5VxbsZqmGndyZDwtPjB+zdfqRNtp8hAOVO9vZPFCa2lUaO7YsEfc3SaBg4hR14COHz3hA+G2yeUz9GggcgkgZLjDc5AQIAqUZUTDPUnhkz
X-Gm-Message-State: AOJu0Yz6+Juvl8dKExLwKVtmcoektfNhNNsbkn/7MLzuG3y779B3JCBI
 rC28vETlfh3biHX6gLaLOV693RvhP3oHKGEJBafnR6y0GIe11Ekr3j9GisWhxl8=
X-Google-Smtp-Source: AGHT+IGNfSuHZVFsjxGRqi721AgFHExWikVzZX/wJrHfHopGLF9m4l1eGZxSOMp6gJxffsVUPzQnDw==
X-Received: by 2002:ac2:5e2a:0:b0:52c:e112:4b0c with SMTP id
 2adb3069b0e04-52ea06133f1mr2313228e87.9.1720173145308; 
 Fri, 05 Jul 2024 02:52:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:36 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-17-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TGEUdfIgxrn5p+oeEOU3I8iRwVeJfrhCUIuhAZVBvgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IyLM7fgGzrFDU4lF7RNxv6EBHPu6d7Cyz/c
 4CXChnXZxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMgAKCRDBN2bmhouD
 1/CkD/9EEtVLnTR6HLb+RQ8ppD8kzzvgKrlRWNFNyulVlT+RxcwDrdvWUOKWp0+Wy529rcI+BQd
 kgGT76Zk08TYdy95tjLeShJw43znJlBAgXdoQpqcMYdANi3Cy7qwy1KuhaT6REsKsYLl0lTGPWn
 xdB96EUooRu49pYHGDExtWpxE1bboFwhGkQhF+U0yk3BZcPnT68Z2cPyDn+kkSjor1+eq+SLhdd
 KgnODZtv+sqS7FXy5GBAkZn5nBTKg/Aw2FN8rGyKL9DEjZxD0r5au7pi+nhVXXRkq9l2Qls8hG2
 q/OlwGwyhik9vnJmJGSEyqJHCQ5LeXWicHypvDdBQJI6NgYYxTXP763jyentekBZQgxNuKHhLKE
 kd8C7mWcvTxwQ/uYcQI/U2CUJmCndTpCjjqJ/pdfKQbt1Kgh41Ds+H0/iO0vtdvc7ph8O4lzV5n
 jR7OVueGt5+DFCEHEoQC9Q3bzDKkn52XbUixejyhNhyiuMs/MEYCxMwYW/jmOUKrCftEOFwbpFA
 6+vWwyww/34OR0DWbkr/f+2NJ0eIzeGTD3SI+t2lKPKRStxxS7J0ay86BxJeMhFy+lUpBuZUa5T
 5HhaVeWBMzKTDYo/rEBbLEUVxxJirKQgaBLueIQGp1+kir47wZidQZjkUIScpS0pSFVzMsTMbqH
 Z6z7AANGQXxg0NQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 17/22] dt-bindings: thermal: sprd:
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

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
