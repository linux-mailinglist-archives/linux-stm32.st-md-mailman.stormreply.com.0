Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8DBEF6BD
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 08:10:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6C4C5A4DD;
	Mon, 20 Oct 2025 06:10:33 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3D26C57B7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=668tN/r2sYEV2dclmY+UlmPJ9GaHeFfzvPli8gfAk68=; b=CHSmqV
 IpmdTBm4jaalCqch73ilElfVg1Qz17FauQ5L0jpIJa75U8alYSkbt5wIIlyTrACj
 RmEnP7SdJNGJpLtVxOHVNJGIyt3ArcdaPYDR7or9Nt8AtXYTWQ4cLuEtTaeeYF6a
 eayDSN69vVG/s1mOi0PhUdoS/xbiE0r4148b/+/jjU1R3IoFlbE3qsMJZpMREBu5
 s/6+f3HE/SkKysFECGiQKRCgCNq4qlIeNS10j85hxObdzsLuUH/T740IF00pmv8S
 /my68GZYEqkI+/5KKbltSExMzw5T/aDzBDsLK5X/Vi3vtHMwj3iBxZtQ3Q4kVZzT
 Rl0s9cVsl7wTgQeg==
Received: (qmail 941026 invoked from network); 20 Oct 2025 08:10:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Oct 2025 08:10:26 +0200
X-UD-Smtp-Session: l3s3148p1@zSeC8JBBJIggAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Date: Mon, 20 Oct 2025 08:09:50 +0200
Message-ID: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wens@csie.org>,
 imx@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: bus: don't check node names
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

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I'd suggest to give subsystems some time to pick this patch before
Rob applies it?

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index 24c939f59091..cd5c2a532a92 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -43,7 +43,7 @@ properties:
     maximum: 20000000
 
 patternProperties:
-  "^.*@[0-9a-fA-F]+$":
+  "@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
index 4adbb7afa889..6645352c7f6b 100644
--- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
@@ -70,7 +70,7 @@ properties:
       - const: ahb
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Devices attached to the bus
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
index d12b62a3a5a8..bf0af3424c9a 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -44,7 +44,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index 20acd1a6b173..9eb0b48b4f51 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -60,7 +60,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
