Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6512B782C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Nov 2020 09:10:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64AE4C3FADD;
	Wed, 18 Nov 2020 08:10:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B4A5C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 10:31:33 +0000 (UTC)
X-UUID: 3bb1a0b9a4ec404886dacf2d310416d8-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Mvyhzzz480bTHNxzx8M3bNTK2s2ot06ii8kFK6sWRjE=; 
 b=gYUZM1SgmhQtO8+j2Svz0rZqvn94MCZ4bai3S74ewgF/pf4rmvQ5jboz3eOKZxi08BCboPqLtjAvR7OCfameNYXEVkn7XC2GRNucw68ysZehZNFWLOTdgu5QWACZ36PfVOMSCeSa4rtupanuhRfIQZ5sK1PCbwBbFzPktiudQn0=;
X-UUID: 3bb1a0b9a4ec404886dacf2d310416d8-20201117
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1204436010; Tue, 17 Nov 2020 18:31:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 18:31:22 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 17 Nov 2020 18:31:22 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Tue, 17 Nov 2020 18:31:23 +0800
Message-ID: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 64BA0CAB5322F6A2CB7697EBBE69A14D0E372BDA8C2F7146FB60D1BC1C5650B22000:8
X-MTK: N
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:10:04 +0000
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: arm: add additionalProperties
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

Add an explicit "additionalProperties: true" to avoid
dt_binding_check error caused by:
'additionalProperties' is a required property

This will not change function, due to additionalProperties
is true by default.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/arm/actions.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/altera.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/amazon,al.yaml            | 1 +
 Documentation/devicetree/bindings/arm/amlogic.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/arm,integrator.yaml       | 1 +
 Documentation/devicetree/bindings/arm/arm,realview.yaml         | 1 +
 Documentation/devicetree/bindings/arm/arm,versatile.yaml        | 1 +
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml    | 1 +
 Documentation/devicetree/bindings/arm/atmel-at91.yaml           | 1 +
 Documentation/devicetree/bindings/arm/axxia.yaml                | 1 +
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml          | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml    | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml    | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml    | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml     | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml      | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml         | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml         | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml         | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml    | 1 +
 Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml  | 1 +
 Documentation/devicetree/bindings/arm/bitmain.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/calxeda.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/digicolor.yaml            | 1 +
 Documentation/devicetree/bindings/arm/fsl.yaml                  | 1 +
 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml  | 2 ++
 Documentation/devicetree/bindings/arm/intel,keembay.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml         | 2 ++
 .../devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml      | 2 ++
 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 2 ++
 Documentation/devicetree/bindings/arm/mediatek.yaml             | 2 ++
 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml     | 1 +
 Documentation/devicetree/bindings/arm/moxart.yaml               | 1 +
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml            | 2 ++
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml          | 2 ++
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml          | 2 ++
 Documentation/devicetree/bindings/arm/qcom.yaml                 | 1 +
 Documentation/devicetree/bindings/arm/rda.yaml                  | 1 +
 Documentation/devicetree/bindings/arm/realtek.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/renesas.yaml              | 1 +
 Documentation/devicetree/bindings/arm/rockchip.yaml             | 2 ++
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 Documentation/devicetree/bindings/arm/sirf.yaml                 | 2 ++
 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/socionext/uniphier.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/spear.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/sprd/sprd.yaml            | 1 +
 Documentation/devicetree/bindings/arm/sti.yaml                  | 2 ++
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml          | 2 ++
 Documentation/devicetree/bindings/arm/sunxi.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/tegra.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/ti/k3.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/ti/nspire.yaml            | 2 ++
 Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/toshiba.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/ux500.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/vt8500.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/xilinx.yaml               | 1 +
 Documentation/devicetree/bindings/arm/zte.yaml                  | 1 +
 59 files changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/actions.yaml b/Documentation/devicetree/bindings/arm/actions.yaml
index fe22c66e9c15..02dc72c97645 100644
--- a/Documentation/devicetree/bindings/arm/actions.yaml
+++ b/Documentation/devicetree/bindings/arm/actions.yaml
@@ -49,3 +49,5 @@ properties:
           - enum:
               - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
           - const: actions,s900
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 0bc5020b7539..54d576248e94 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -19,4 +19,6 @@ properties:
           - altr,socfpga-arria5
           - altr,socfpga-arria10
       - const: altr,socfpga
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/amazon,al.yaml b/Documentation/devicetree/bindings/arm/amazon,al.yaml
index a3a4d710bd02..e1af14629536 100644
--- a/Documentation/devicetree/bindings/arm/amazon,al.yaml
+++ b/Documentation/devicetree/bindings/arm/amazon,al.yaml
@@ -30,4 +30,5 @@ properties:
               - amazon,al-alpine-v3-evp
           - const: amazon,al-alpine-v3
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0ee7c5b7b3f6..fc7962fbdb98 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -173,4 +173,6 @@ properties:
           - enum:
               - amlogic,ad401
           - const: amlogic,a1
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
index f0daf990e077..be3d294b602c 100644
--- a/Documentation/devicetree/bindings/arm/arm,integrator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
@@ -83,4 +83,5 @@ required:
   - compatible
   - core-module@10000000
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,realview.yaml b/Documentation/devicetree/bindings/arm/arm,realview.yaml
index 1d0b4e2bc7d2..e50980e91fa6 100644
--- a/Documentation/devicetree/bindings/arm/arm,realview.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,realview.yaml
@@ -120,4 +120,5 @@ required:
   - compatible
   - soc
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,versatile.yaml b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
index 06efd2a075c9..a909f620365f 100644
--- a/Documentation/devicetree/bindings/arm/arm,versatile.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
@@ -68,4 +68,5 @@ required:
   - compatible
   - core-module@10000000
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 26829a803fda..39b09fc0ce42 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -216,4 +216,5 @@ allOf:
       required:
         - arm,hbi
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 614c91956798..89c9d56de78e 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -184,4 +184,5 @@ properties:
           - const: atmel,samv71
           - const: atmel,samv7
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/axxia.yaml b/Documentation/devicetree/bindings/arm/axxia.yaml
index 3ea5f2fdcd96..2955bfda0946 100644
--- a/Documentation/devicetree/bindings/arm/axxia.yaml
+++ b/Documentation/devicetree/bindings/arm/axxia.yaml
@@ -18,4 +18,5 @@ properties:
       - const: lsi,axm5516-amarillo
       - const: lsi,axm5516
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index dd52e29b0642..689031968f0e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -51,4 +51,5 @@ properties:
               - raspberrypi,3-compute-module-lite
           - const: brcm,bcm2837
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
index 497600a2ffb9..e3ae81665c70 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
@@ -18,4 +18,5 @@ properties:
           - brcm,bcm28155-ap
       - const: brcm,bcm11351
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
index e0ee931723dc..478e4c4313d6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
@@ -18,4 +18,5 @@ properties:
           - brcm,bcm21664-garnet
       - const: brcm,bcm21664
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
index 40d12ea56e54..899df14606cc 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
@@ -18,4 +18,5 @@ properties:
           - brcm,bcm23550-sparrow
       - const: brcm,bcm23550
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
index 988e0bbb2a62..4df36ad376fc 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
@@ -87,4 +87,6 @@ properties:
           - const: brcm,brcm53012
           - const: brcm,brcm53016
           - const: brcm,bcm4708
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
index 9ba7b16e1fc4..f5868a6988f9 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
@@ -26,4 +26,5 @@ properties:
           - brcm,bcm58305
       - const: brcm,cygnus
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
index ae614b6722c2..e0a9b82a4a66 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
@@ -25,4 +25,5 @@ properties:
       - const: brcm,bcm53342
       - const: brcm,hr2
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
index 0749adf94c28..ab04ef343506 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
@@ -20,4 +20,5 @@ properties:
           - brcm,ns2-xmc
       - const: brcm,ns2
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 8c2cacb2bb4f..c1304082a7ef 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -33,4 +33,5 @@ properties:
           - brcm,bcm88312
       - const: brcm,nsp
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
index c13cb96545a2..2842adea56a5 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
@@ -21,4 +21,5 @@ properties:
           - brcm,bcm958802a802x
       - const: brcm,stingray
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
index ccdf9f99cb2b..cfdfa02f8061 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
@@ -19,4 +19,5 @@ properties:
           - cavium,thunderx2-cn9900
       - const: brcm,vulcan-soc
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/bitmain.yaml b/Documentation/devicetree/bindings/arm/bitmain.yaml
index 5880083ab8d0..93dd882d6400 100644
--- a/Documentation/devicetree/bindings/arm/bitmain.yaml
+++ b/Documentation/devicetree/bindings/arm/bitmain.yaml
@@ -17,4 +17,6 @@ properties:
       - enum:
           - bitmain,sophon-edge
       - const: bitmain,bm1880
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/calxeda.yaml b/Documentation/devicetree/bindings/arm/calxeda.yaml
index aa5571d23c39..46f78addebb0 100644
--- a/Documentation/devicetree/bindings/arm/calxeda.yaml
+++ b/Documentation/devicetree/bindings/arm/calxeda.yaml
@@ -20,3 +20,5 @@ properties:
       - enum:
           - calxeda,highbank
           - calxeda,ecx-2000
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/digicolor.yaml b/Documentation/devicetree/bindings/arm/digicolor.yaml
index 849e20518339..488078aa1b66 100644
--- a/Documentation/devicetree/bindings/arm/digicolor.yaml
+++ b/Documentation/devicetree/bindings/arm/digicolor.yaml
@@ -15,4 +15,5 @@ properties:
   compatible:
     const: cnxt,cx92755
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1ca9dfa8ce9a..55e23386ffc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -621,4 +621,5 @@ properties:
               - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
           - const: fsl,s32v234
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
index 43b8ce2227aa..e15a1f2040de 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
@@ -64,4 +64,6 @@ properties:
         items:
           - const: H836ASDJ
           - const: hisilicon,sd5203
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/intel,keembay.yaml b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
index 06a7b05f435f..da7fc9bed72f 100644
--- a/Documentation/devicetree/bindings/arm/intel,keembay.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
@@ -16,4 +16,6 @@ properties:
       - enum:
           - intel,keembay-evm
       - const: intel,keembay
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index f18302efb90e..d72e92bdf7c1 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -22,3 +22,5 @@ properties:
           - enum:
               - gateworks,gw2358
           - const: intel,ixp43x
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
index 7597bc93a55f..5cbcacaeb441 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
@@ -42,3 +42,5 @@ properties:
       - description: TI-SCI processor id for the remote processor device
       - description: TI-SCI host id to which processor control ownership
                      should be transferred to
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index a9828c50c0fb..e9bf3054529f 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -59,3 +59,5 @@ properties:
           - const: marvell,cn9130
           - const: marvell,armada-ap807-quad
           - const: marvell,armada-ap807
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 30908963ae26..b5df789a5151 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -119,4 +119,6 @@ properties:
           - const: google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
index ecf6fa12e6ad..7d63b837c01c 100644
--- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
+++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
@@ -62,4 +62,5 @@ required:
   - compatible
   - axi@600000000
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/moxart.yaml b/Documentation/devicetree/bindings/arm/moxart.yaml
index c068df59fad2..670d24ce8ec5 100644
--- a/Documentation/devicetree/bindings/arm/moxart.yaml
+++ b/Documentation/devicetree/bindings/arm/moxart.yaml
@@ -16,4 +16,5 @@ properties:
       - const: moxa,moxart-uc-7112-lx
       - const: moxa,moxart
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 3235ec9e9bad..e7ac2204e447 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -35,4 +35,6 @@ properties:
           - enum:
               - dell,wyse-ariel
           - const: marvell,mmp3
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index c2f980b00b06..7c787405bb2f 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -31,3 +31,5 @@ properties:
           - enum:
               - 70mai,midrived08 # 70mai midrive d08
           - const: mstar,mercury5
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
index f7f024910e71..214c97bc3063 100644
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -21,4 +21,6 @@ properties:
               - ea,ea3250
               - phytec,phy3250
           - const: nxp,lpc3250
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ad25deba4d86..1598ed919e72 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -178,4 +178,5 @@ properties:
               - qcom,sm8250-mtp
           - const: qcom,sm8250
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/rda.yaml b/Documentation/devicetree/bindings/arm/rda.yaml
index 9672aa0c760d..be4a4ba89f23 100644
--- a/Documentation/devicetree/bindings/arm/rda.yaml
+++ b/Documentation/devicetree/bindings/arm/rda.yaml
@@ -19,4 +19,5 @@ properties:
           - xunlong,orangepi-i96        # Orange Pi i96
       - const: rda,8810pl
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index 845f9c76d6f7..d39273c61aa6 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -54,4 +54,6 @@ properties:
           - enum:
               - realtek,mjolnir # Realtek Mjolnir EVB
           - const: realtek,rtd1619
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 01a6d0c571ad..b9c701727cae 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -299,4 +299,5 @@ properties:
               - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
           - const: renesas,r9a06g032
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 65b4cc2c63f7..c81c936a8644 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -569,4 +569,6 @@ properties:
         items:
           - const: zkmagic,a95x-z2
           - const: rockchip,rk3318
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index eb92f9eefaba..272508010b02 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -180,3 +180,5 @@ properties:
 
 required:
   - compatible
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/sirf.yaml b/Documentation/devicetree/bindings/arm/sirf.yaml
index 0b597032c923..eb30c5e40a7a 100644
--- a/Documentation/devicetree/bindings/arm/sirf.yaml
+++ b/Documentation/devicetree/bindings/arm/sirf.yaml
@@ -24,4 +24,6 @@ properties:
       - items:
           - const: sirf,prima2-cb
           - const: sirf,prima2
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
index 2bd519d2e855..822e6603fbfd 100644
--- a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
@@ -19,4 +19,6 @@ properties:
           - enum:
               - socionext,milbeaut-m10v-evb
           - const: socionext,sc2000a
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 6caf1f9be390..8c0e91658474 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -60,3 +60,5 @@ properties:
           - enum:
               - socionext,uniphier-pxs3-ref
           - const: socionext,uniphier-pxs3
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/spear.yaml b/Documentation/devicetree/bindings/arm/spear.yaml
index f6ec731c9531..78a2913a2d92 100644
--- a/Documentation/devicetree/bindings/arm/spear.yaml
+++ b/Documentation/devicetree/bindings/arm/spear.yaml
@@ -22,4 +22,6 @@ properties:
           - st,spear320
           - st,spear1310
           - st,spear1340
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
index 0258a96bfbde..2b36f27a8d32 100644
--- a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
+++ b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
@@ -30,4 +30,5 @@ properties:
               - sprd,sp9863a-1h10
           - const: sprd,sc9863a
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
index 47f9b8eebaa0..1f67033753b6 100644
--- a/Documentation/devicetree/bindings/arm/sti.yaml
+++ b/Documentation/devicetree/bindings/arm/sti.yaml
@@ -20,4 +20,6 @@ properties:
           - st,stih407
           - st,stih410
           - st,stih418
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index deacb4e686e8..67214300aabf 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -58,4 +58,6 @@ properties:
                   - seeed,stm32mp157c-odyssey
               - const: seeed,stm32mp157c-odyssey-som
               - const: st,stm32mp157
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index afa00268c7db..cab8e1b6417b 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -893,3 +893,5 @@ properties:
         items:
           - const: xunlong,orangepi-zero-plus2-h3
           - const: allwinner,sun8i-h3
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 8ae44948e873..767e86354c8e 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -125,3 +125,5 @@ properties:
           - enum:
               - nvidia,tegra234-vdk
           - const: nvidia,tegra234
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 829751209543..d2d94c110f15 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -32,4 +32,6 @@ properties:
       - description: K3 J7200 SoC
         items:
           - const: ti,j7200
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/ti/nspire.yaml b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
index e372b43da62f..f3636429adf0 100644
--- a/Documentation/devicetree/bindings/arm/ti/nspire.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
@@ -21,4 +21,6 @@ properties:
           - ti,nspire-tp
           # Clickpad models
           - ti,nspire-clp
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
index a8765ba29476..40fc6deeab72 100644
--- a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
@@ -23,4 +23,6 @@ properties:
           - enbw,cmc        # EnBW AM1808 based CMC board
           - lego,ev3        # LEGO MINDSTORMS EV3 (AM1808 based)
       - const: ti,da850
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
index 0e066290238e..959feb591b70 100644
--- a/Documentation/devicetree/bindings/arm/toshiba.yaml
+++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
@@ -19,4 +19,6 @@ properties:
           - enum:
               - toshiba,tmpv7708-rm-mbrc  # TMPV7708 RM main board
           - const: toshiba,tmpv7708
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/ux500.yaml b/Documentation/devicetree/bindings/arm/ux500.yaml
index accaee906050..5db7cfba81a4 100644
--- a/Documentation/devicetree/bindings/arm/ux500.yaml
+++ b/Documentation/devicetree/bindings/arm/ux500.yaml
@@ -34,3 +34,5 @@ properties:
         items:
           - const: samsung,golden
           - const: st-ericsson,u8500
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 7b25b6fa34e9..7b762bfc11e7 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -21,3 +21,5 @@ properties:
           - wm,wm8650
           - wm,wm8750
           - wm,wm8850
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index c73b1f5c7f49..863f12999e77 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -111,4 +111,5 @@ properties:
           - const: xlnx,zynqmp-zcu111
           - const: xlnx,zynqmp
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
index 2d3fefdccdff..b0d1cc49504d 100644
--- a/Documentation/devicetree/bindings/arm/zte.yaml
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -23,4 +23,5 @@ properties:
               - zte,zx296718-evb
           - const: zte,zx296718
 
+additionalProperties: true
 ...
-- 
2.18.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
