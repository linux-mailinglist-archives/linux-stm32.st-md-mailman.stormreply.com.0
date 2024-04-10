Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36E89FC1A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 17:55:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38832C6C858;
	Wed, 10 Apr 2024 15:55:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56CDCC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 15:55:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a51d3193e54so413589666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712764552; x=1713369352;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
 b=Ad3NLthDWERJ8SzS0Lcb2THnJcw04yyWzpJh6XqDzn4NeXBIdMIIcHiWjKfy8a1yiL
 p/5s/15fnmfU2djbkDo304dEoj5aUcWBahg+W5LIe8+4BZmB3MjmcxUzOXnxrwhuOwzw
 gG9EyYUzjNGzMtm9dF/FNMSRq3T3O18vxBS3kYb9OKIP5EwHJiLd3zlff6ywuO3jeMom
 Ot8Dx7KStL3kwLiypxDSGhsDIMHV2ncNAnsjCNnQ7pPhNm6J87lsXJNZ5VX+oVTjNpEA
 QOKZVCbfnrw6hqCxmk4TjY+e2pyhT4NuZ/KqdutNrMSWfzwoGHgr7rZmNuXlZyog0CUc
 UC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712764552; x=1713369352;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
 b=gqT5zLIkh6HXKFZjRVatFjSv7wTo1m3rZYZhQI3OTFgH6KinGqG6YUIAXn6RB4CzCN
 QBwpuGShrNb9tIu0CNXpy8XG7KZnA7gJE5F0brtJiU17Tplk7ki5WJo5guKmw2LiA57i
 ofejWjNUsFtDXg3jjXgFkwnbAUsw+V8Mvbn9G84NMlEcm2vGaXX5zhQUgIG4NqvcPoMI
 AyeP6gmLwuUaxpZNP0lKpChVvKkw9ZZXvmRpPneAusPHD/ZSJDSyTm9b4Vz+2BkabcjN
 8A4JSk+m2YoFPrU+sCbZV7gB5eDBo7rVhVDlansfMnKy43gSZ83zp51tzNImpeL4+UGh
 7IQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu04fOluFZNJayxSASHA7Wj7aJ8xGhBPxa/HkXdaXDyQEW/70DSbYPuWCKE5f92+Gut/enUqiCXrO3Qx2D1nIOHmeZbaeNW/nlLUppmgf6rGpmiFJZ/zPE
X-Gm-Message-State: AOJu0YzsDzrY3COLTisyHJH8nLa87mDwV/axEehBHO7YCP5t0bmcnE6O
 NGtqst6497jLyBCmJ8O+vw1HvuigdEHqMWB55u1/LWNIKlJlzvXl
X-Google-Smtp-Source: AGHT+IH9ECOyJ4wkkOwf2xtDjNIpUsIMg8Pw0iVdXkQDB4YvgTtP4jNyI9hrkYj+EGDElqvho8fUmA==
X-Received: by 2002:a17:907:368e:b0:a51:d605:49e6 with SMTP id
 bi14-20020a170907368e00b00a51d60549e6mr2268733ejc.10.1712764551807; 
 Wed, 10 Apr 2024 08:55:51 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:55:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:36 +0200
MIME-Version: 1.0
Message-Id: <20240410-rtc_dtschema-v2-4-d32a11ab0745@gmail.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
In-Reply-To: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2723;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BajpLIZvweL+aLqlkIOgDvaU5J35KCKUJstIeHQsxoU=;
 b=pHkT9z1UD5fi/tDYwREkpPZ6fWm/TGqk61RmoCGhwk+BHlwI0iLZdJFdVAqFoKOsy/rcgBj0N
 Wk7MHzYGe96AFVsO8eT0lvMCZduQXAoKHmPHQxBN9O9UBFkbRd66w35
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] dt-bindings: rtc: stmp3xxx-rtc:
	convert to dtschema
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

Convert existing binding to dtschema to support validation and
add the undocumented compatible 'fsl,imx23-rtc'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 2 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
new file mode 100644
index 000000000000..534de4196a4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
@@ -0,0 +1,51 @@
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
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx28-rtc
+              - fsl,imx23-rtc
+          - const: fsl,stmp3xxx-rtc
+      - const: fsl,stmp3xxx-rtc
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
+        compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
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
