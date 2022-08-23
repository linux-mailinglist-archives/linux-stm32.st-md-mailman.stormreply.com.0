Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A547059E572
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 16:57:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F123C64101;
	Tue, 23 Aug 2022 14:57:42 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D635C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 14:57:40 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 z23-20020a4ad1b7000000b0044931ffdcafso2479220oor.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 07:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ooqlkbw3TE2NJhyebQ5cGozeHzUv+AJJEgZF4B67gIY=;
 b=YznrzxqJ1P1JaXeQEn4bSEc1KvI2hSbxAa8AuU87cj4FAu3YaB7cYBvj0/9QAnKdj9
 qZUDoUZ3GBlS5qXy7OQEFkgLwFVhHPOz/Fqup9X8i1pzFOCVvqXE6PgxUPkGJVoLytf+
 +OVVU+ro4a6gijycOH4/Y00VwnOQ5mAZDWmEblxjp67pKixxw4HjAgHKMZrNjd576kAP
 AsyujSX7GF46qjWsFOx117cQaCW03U0lia4jhxlMFskRYqvdKGZS60dwSDhQc5XLyoeH
 HNkPjt//hJ8RcCQUbBoheG7Bvq7bkkbZKcsyI4XKcVKhIetnCrxGbYgnQpQl1MOut305
 ORIA==
X-Gm-Message-State: ACgBeo06KwEN3TjsEZvY2hwCRXxpTm5NE3kObny4tUS6WYc6FBbWheZo
 7JUvi1Uxomp7KRKvkOoTOA==
X-Google-Smtp-Source: AA6agR5+a7sOjSPzaSgig28307qEt+b/EO4MrhzoXJrDqx7W1/FQV0jwLw+HKQCyDk3RmgEqKpT4Hw==
X-Received: by 2002:a4a:e411:0:b0:442:c893:86b7 with SMTP id
 t17-20020a4ae411000000b00442c89386b7mr8088683oov.22.1661266659387; 
 Tue, 23 Aug 2022 07:57:39 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:38 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Date: Tue, 23 Aug 2022 09:56:45 -0500
Message-Id: <20220823145649.3118479-14-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ray Jui <ray.jui@broadcom.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: phy: Add missing
	(unevaluated|additional)Properties on child nodes
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

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml          | 1 +
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml   | 2 ++
 .../devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml          | 2 ++
 Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml    | 3 +++
 4 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
index 045699c65779..808e90b2465d 100644
--- a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
@@ -32,6 +32,7 @@ properties:
 patternProperties:
   "^pcie-phy@[0-9]+$":
     type: object
+    additionalProperties: false
     description: >
       PCIe PHY child nodes
 
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index dc287d428e49..801993813b18 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -77,6 +77,8 @@ patternProperties:
       connector:
         type: object
         $ref: /schemas/connector/usb-connector.yaml
+        unevaluatedProperties: false
+
         properties:
           vbus-supply: true
 
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index b078009ed509..563e85c48c6a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -81,6 +81,7 @@ properties:
 patternProperties:
   "^usb3-phy@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description:
       The USB3 PHY.
 
@@ -121,6 +122,7 @@ patternProperties:
 
   "^dp-phy@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description:
       The DP PHY.
 
diff --git a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
index dcd63908aeae..7c7c3e3e6346 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
@@ -79,6 +79,7 @@ properties:
 
   refclk-dig:
     type: object
+    additionalProperties: false
     description: |
       WIZ node should have subnode for refclk_dig to select the reference
       clock source for the reference clock used in the PHY and PMA digital
@@ -108,6 +109,7 @@ properties:
 patternProperties:
   "^pll[0|1]-refclk$":
     type: object
+    additionalProperties: false
     description: |
       WIZ node should have subnodes for each of the PLLs present in
       the SERDES.
@@ -133,6 +135,7 @@ patternProperties:
 
   "^cmn-refclk1?-dig-div$":
     type: object
+    additionalProperties: false
     description:
       WIZ node should have subnodes for each of the PMA common refclock
       provided by the SERDES.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
