Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E678A3E6F
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 22:22:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0E61C6C841;
	Sat, 13 Apr 2024 20:22:52 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26831C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 20:22:52 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso24366631fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713039771; x=1713644571;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
 b=QFt5b9AGq7c6a2BtIHWfX1oe3h4tg1WM6+h0JDvWokN4VSFjFqMf169r+S1mT8vZ4+
 EALP6W5YrfG78JEZ8f+67XRTzIrrxuGeQUb6f/qXhHzO1Elw55zRMKA1TDyqVTnnJM02
 MiilajahyVIQMjbI2UcgWhauiDa0JZy9u4jMJbCdM9B7DcyjbbFvqL/PHb2o9JTQ2apO
 jPqZ1jqxrzrSU7syIYBK2wueACqPVAtCnl/m42+e0HHt7sfvF+g6iwr9QLIPImD1jDFb
 FcCMk0kJha+ag7Q4VTFUgPg75KLd8cAhCPjtrsxSMhwjmic5GZ/yP1eWXThGIc2o2oM0
 5nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713039771; x=1713644571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
 b=iQ4IFQEGe+xV7U6+rAfzxHhUxd4V6CgSrEjDtBJCMRU2btKKrou+Znm1SeqNt5uqi3
 YXsiFf99o3gzyOoEaDzjYSF4q0haq9DdMHzsCpGWZAjP2j1H8rhPLpifeFBWpOGy9T5a
 0RMiQ9ZoY/pEX0ugWn9j941X/96Z2W8Bx0O3Xu1WdyA28ja7nuQEQGUb4dyyLXCz1WrB
 //uLjmTVLk+8dpZMnccuBCHztVZ4yw3X0cmMQzBKeX9MlqIg97MVQgirsYCsYBBkXmW+
 osXaqzs1jCzrAyhe5PNwxmufpim/PttFMOfdeOVjT3DlbQA5YgAisMh7c3ZH77rkNlTm
 JYNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC1Ckw4bkwjVnArzAKd7GpI2n28TevuzhFxjFuRRs23yetjgTgQmGPLlia2vrHSAqg+kmHuNHqvJNP7YQBOjSxVWyONJJyiefvMCA0l1Fal6/TxsGl455Y
X-Gm-Message-State: AOJu0Yx7/gGvwDA5j5q77yLLGzeYB7pA4gFu09hvDUnbycSDHiaX6+XN
 EFqZiH3fZwZskj1OFybKNTt3Oy0vzOvkZ8jbP7eiC7S6+k1sMyAd
X-Google-Smtp-Source: AGHT+IH8pm98C+MIRAOaUO30GuhCqlA7nqVnCkzi+qWv1twrQuvRXLCHEscsJF51tgcr39Bl8I72wA==
X-Received: by 2002:a2e:b98a:0:b0:2d8:7320:e36a with SMTP id
 p10-20020a2eb98a000000b002d87320e36amr3641252ljp.17.1713039771430; 
 Sat, 13 Apr 2024 13:22:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 13:22:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:19 +0200
MIME-Version: 1.0
Message-Id: <20240413-rtc_dtschema-v3-4-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=2723;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BajpLIZvweL+aLqlkIOgDvaU5J35KCKUJstIeHQsxoU=;
 b=S/47bucyIciRGwOyIDM4sCMC2ax8kTneRsSd1bLRdQE94vG3Y0Nxyh/wm8FM1t7r6CkFTA87M
 btFBUkYaNdOD81nx3eSUsBIfPwCF1xZL4/z7cQjrzsUTpq8WroVMQuO
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/4] dt-bindings: rtc: stmp3xxx-rtc:
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
