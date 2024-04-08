Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07A89D4CD
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69C1FC7129B;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57CCAC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso682007566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591608; x=1713196408;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5Y7DfeV8VLm+4dkW5onFx6zdkwwBWr0ksWuO3GWgBgU=;
 b=iJe8iZ9rI03eWb0KKHNYip9x59uZ6SnZMCJT9Npy8BxXcanUaE4n6xAVwU8Y4Pk1k2
 lHplz2sHxOxo4fKMQP7hS0S9tsBZRoOLuMoH9LwPoK0QXaW+BvWea6IvqZbIgGCqfEmb
 byXDBm19xehzl4+uwRQh9lt5l2MFNjoRZT06BIUe/2QQ9OrtJmvF2oRUjBFiehBgdu/j
 rDP2+bJ/mp+6JXNek9/Lu11bFb+6pLYCTzfr2ybn+dZSQmQ3UTXV2sObKuZoV5mqQM6O
 bSxIIzehxspYCXYumRUGqjIGUCJ3Ezqowh9wGfOk2+o8Gx0IDeySSZlbWUtzgqQ7DrxC
 Ku4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591608; x=1713196408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Y7DfeV8VLm+4dkW5onFx6zdkwwBWr0ksWuO3GWgBgU=;
 b=QA0orvOxeY5wBgP7vnPPOrjrfmsxipd516cHLR8jYkXfQCG4Ks8UF2aFm7xEdPyzwy
 R3Mb0M0UiJoAyu1PZhCqWEqFRlvfpRCRCzB0XMsvbNDgB8vHnPqJLeAn6McceMzYKOMw
 3GgcUvRj4WUttmMrhYxsVjIiVkofz/Vq6EdweX9rmSqqA7mP3Xg+Lwc5SUD5a9dbFHy0
 WP7Rhp+7vLh1R6XooV8rgnIFSyw6VAwsDNjZI+TDB7IXmE+Kcj0NJeLSjjGyI8K8jb0I
 bKQkqMo7cB87Z5LK8rRmkh6u4cTm1h+D/wyKMr0/ucFa+ylme0dQITVaDA33H+hG9wMw
 vw6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+FpbRtFpKiP/phOkW0ZcKxLikBwt6qe3UL8IV/o/2th0yiLS2oJP41vdGKvx0zAKBgwucXJFldZJqVLLzCiLi/A12lESfeh+MRBwHuaARJthH3MjVDWH
X-Gm-Message-State: AOJu0YyhpCNNr4CDnkfiOtte3iGF4tlFPCSBRbct70W+OdFm7MdG/XRk
 Vg1Pudu4DnzFSupwPFBuuw0SoMmQ8gtA7DjaGXmjykrkECfrQgQk
X-Google-Smtp-Source: AGHT+IGdfX/y51Nks6qsHsv5sXslTDtqdDAyN1/b0esXW0O17PcNWR7tUFhV60oXtdma+8MhUzqNbQ==
X-Received: by 2002:a17:907:3da8:b0:a51:dc1f:a44b with SMTP id
 he40-20020a1709073da800b00a51dc1fa44bmr1941414ejc.29.1712591607822; 
 Mon, 08 Apr 2024 08:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:08 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-8-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AIsscuJi094OEVGSsAf9Wlesp0w/0ZWJH8OIPmC6tCw=;
 b=SjxANSNsLql56s4aBhO5sITwOL73aDDWw1tzYNIUF/EDIaC42lzFW9WBN+FJIfBZhJZSJUWG5
 L8HyqJln2diCnF1A3y5vZJJOTZpEnbK/pWIrvAK7sqt7PRQjR8fDhvQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/9] dt-bindings: rtc: stmp3xxx-rtc: convert
	to dtschema
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

Convert existing binding to dtschema to support validation.

The 'fsl,imx28-rtc' compatible is currently not supported, and it is
only referenced in this binding and in nxp/mxs/imx28.dtsi. Therefore,
that compatible has been dropped, which triggers a warning when testing
the DT against the new binding.

There is another reference to fsl,stmp3xxx-rtc in nxp/mxs/imx23.dtsi,
where another unsupported compatible 'fsl,imx23-rtc' is used, and the
same problem would arise when testing the file against the new binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
new file mode 100644
index 000000000000..bf70cce2701f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/fsl,stmp3xxx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMP3xxx/i.MX28 Time Clock Controller
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: fsl,stmp3xxx-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  stmp,crystal-freq:
+    description:
+      Override crystal frequency as determined from fuse bits.
+      Use <0> for "no crystal".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 32000, 32768]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@80056000 {
+        compatible = "fsl,stmp3xxx-rtc";
+        reg = <0x80056000 2000>;
+        interrupts = <29>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
deleted file mode 100644
index fa6a94226669..000000000000
--- a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* STMP3xxx/i.MX28 Time Clock controller
-
-Required properties:
-- compatible: should be one of the following.
-    * "fsl,stmp3xxx-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: rtc alarm interrupt
-
-Optional properties:
-- stmp,crystal-freq: override crystal frequency as determined from fuse bits.
-  Only <32000> and <32768> are possible for the hardware.  Use <0> for
-  "no crystal".
-
-Example:
-
-rtc@80056000 {
-	compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
-	reg = <0x80056000 2000>;
-	interrupts = <29>;
-};

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
