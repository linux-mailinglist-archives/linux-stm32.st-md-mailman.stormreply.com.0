Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7A57D5E9
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 23:27:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63469C5A4FD;
	Thu, 21 Jul 2022 21:27:46 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48734C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 21:27:44 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id l24so2355392ion.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KIxfy3M0Qw4Df1rkR1Yg81rr6KYsi116nv1pvFQZTMg=;
 b=h7z8pSEFBHG5CAkrYE1/76ln+/8sZYF9L6kzNr4eYBWe54Y/USMcl7+XHbBLAbdgwC
 e+36orWO6Kg/lS6GxPFWBQlTl37156Aw0TnnG1jW0yMnRuXQLoLKkjhn30uQEJD5588S
 l7yI6VITGboHz32TotFtMfpA0MeWVnyENwS2axkAG0QKxD+nkvge7wcRWKpOzeJVVoXa
 0P8GX4kcQH+HP6LfF6a6wdqs+bGCyNXgyQiRZNu5bZbX8QWE93d0PbGHKu8R7s+CfjOZ
 yFtUcMgLr8U4RrhYI2PdjSks9er6YLL/K1WLcsl+eZpfqQOZEIc2miyia2S9yUxTYw32
 YaYg==
X-Gm-Message-State: AJIora/C4PuOTQ7+hhnW57viXfP+9PsgLYD1/i5I420O2pZ9gWc47AEs
 TjOTbA0Fbs5nfiOoaxzEXA==
X-Google-Smtp-Source: AGRyM1uKwvwD8nigZzlMOuNfSlgLHIPtzYb2nSwKIwaacyaagm9crD03qVvLPF/x92ETuZI69njexg==
X-Received: by 2002:a02:6d1f:0:b0:33f:8d28:4d6d with SMTP id
 m31-20020a026d1f000000b0033f8d284d6dmr249485jac.16.1658438863045; 
 Thu, 21 Jul 2022 14:27:43 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a05660208c600b0067bf99ea25bsm1285859ioz.44.2022.07.21.14.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 14:27:42 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 21 Jul 2022 15:27:14 -0600
Message-Id: <20220721212718.1980905-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: coresight: Add
	'power-domains' property
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

Coresight components may be in a power domain which is the case for the Arm
Juno board. Allow a single 'power-domains' entry for Coresight components.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml  | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml   | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml  | 3 +++
 .../bindings/arm/arm,coresight-dynamic-replicator.yaml         | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml   | 3 +++
 .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml   | 3 +++
 .../bindings/arm/arm,coresight-static-replicator.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml   | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml   | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml  | 3 +++
 .../devicetree/bindings/arm/arm,embedded-trace-extension.yaml  | 3 +++
 12 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
index d783d9276124..2bae06eed693 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
@@ -61,6 +61,9 @@ properties:
     maxItems: 1
     description: Address translation error interrupt
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 72ffe4d1e948..0c5b875cb654 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -98,6 +98,9 @@ properties:
       base cti node if compatible string arm,coresight-cti-v8-arch is used,
       or may appear in a trig-conns child node when appropriate.
 
+  power-domains:
+    maxItems: 1
+
   arm,cti-ctm-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index 1eeedc22857c..44a1041cb0fc 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -54,6 +54,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index a26ed9214e00..03792e9bd97a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -54,6 +54,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   qcom,replicator-loses-context:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
index fd06ede26ceb..90679788e0bf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
@@ -54,6 +54,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index e0377ce48537..01200f67504a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -73,6 +73,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   arm,coresight-loses-context-with-cpu:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index b9da30ab9ccd..06a1d346982c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -27,6 +27,9 @@ properties:
   compatible:
     const: arm,coresight-static-funnel
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 66ee97370fb2..5178e7fdff0b 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -27,6 +27,9 @@ properties:
   compatible:
     const: arm,coresight-static-replicator
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 905008faa012..378380c3f5aa 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -61,6 +61,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 3463b6e53aef..e0b88a71356a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   arm,buffer-size:
     $ref: /schemas/types.yaml#/definitions/uint32
     deprecated: true
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index e80d48200c37..61a0cdc27745 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -54,6 +54,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  power-domains:
+    maxItems: 1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
index 5f07fb166c56..108460627d9a 100644
--- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
@@ -33,6 +33,9 @@ properties:
       Handle to the cpu this ETE is bound to.
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  power-domains:
+    maxItems: 1
+
   out-ports:
     description: |
       Output connections from the ETE to legacy CoreSight trace bus.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
