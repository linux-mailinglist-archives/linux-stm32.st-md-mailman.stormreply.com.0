Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 089ED6793EA
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:20:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7FCDC69054;
	Tue, 24 Jan 2023 09:20:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54D24C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:20:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k16so10906604wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
 b=lJt9WL7RKgvvoDL5lBaSpU4gI2CocxNuvfSF7KVONAUJZs6yobUDwpIrRRcqnKcSlh
 aNDWJDYWKfjIEQmmfZgp4C5NLnLeNKnOJesf6wxCwj41xz8PqrRZ7tjSC8H8N0V4EEeX
 +xizfcHf3c82CKkFo7AQqRhYNYPvoRtBDK+EXg+6QmTy9xPPR8CBPOC8DoeiMSYrSbRs
 +2DI2O+4byNqNaZyrmaj3+gStKEZGYRL2VdyxtSesXHBrddWdYqIhFx4JI+GWpKz3Slh
 OWFvdMspBlVRsUsPNBB+Y+39reJ3/ujkk2aEvYLuP0fdQ6n4AIU3td9/81nygjPGkAD3
 XXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
 b=n8lZ4T0KYtgTWv9dq42uc71P1ACbIRjQtNpv+LxfxrxQWzAEN4ZFtLqoBAK0tzwqGj
 yh+lIKDKS8dHjRGvGDw8HDy03tQldOk+u6if/SA88w31AHt8eCnoyn11FucOfIePy587
 8wr/FIQWdz8rAnxhFW8cWm0vffy4dslXus7Xsyb1PW9qW09waJKRuT/6EUPiOYoQ2VQE
 Ufo3bBG22/wzq+VmRv7ljKHT5Jx04w8XV/NMrteAXg60rTM00Wzk2YfzZCx6tgkXaNkt
 N55sbfEFpNNNbbUzAHr047Lc2pFlyNg0flfm9CTCUe+08y9LaR1HWX0aS2ZlIlmkkAGU
 hjFQ==
X-Gm-Message-State: AFqh2koRT85U3SgnsZEjYrQxQCUxkS61TM5WhnqoXesuDZe7bN/S3sj+
 ysaaRW7Kiw7porkkUCgasXYe0A==
X-Google-Smtp-Source: AMrXdXujRawjXpcdvGx0/kXpoe2kFjce8Y2HGF30EtbJZyHYimc6YERQVrxgL3vyTREcg4RVSGKu7A==
X-Received: by 2002:a05:600c:3512:b0:3db:1665:2a98 with SMTP id
 h18-20020a05600c351200b003db16652a98mr22374802wmq.16.1674552001966; 
 Tue, 24 Jan 2023 01:20:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:20:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 10:19:13 +0100
Message-Id: <20230124091916.45054-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 09/12] dt-bindings: serial: fsl-lpuart:
	allow other serial properties
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

Reference common serial properties bindings to allow typical serial
properties:

  imx8qxp-ai_ml.dtb: serial@5a060000: Unevaluated properties are not allowed ('uart-has-rtscts' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index b1e81a6451a6..26c3593fa98b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
