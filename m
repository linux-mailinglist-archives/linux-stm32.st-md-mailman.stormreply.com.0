Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D60349EB
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 16:18:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0CA3C5774F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 14:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6421C055F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mg43HsbuIUpIY3IZlyoqhA6BT/bTMdQva0Wd1znkidQ=; b=mZBNRm0NbpbBZmnL/j+lOVKrJD
 ec/CqZkcU8Tn0FANuPI9rDCxmHE6x388Bg07ZRLESUJeiSMxzWAS/NwdxAkxYQSqBhRYYxm7ljyIF
 RDB7puPWazquTOozeiI6hM1i0fqqM68aEUCPAOYyJaHrpYASlRqTNghQnDcKwgwvq4Smb3wbRtswp
 nj64T47Mt4vC42bGlVpSvdFWnEqgQJAtJO63EI1llPpaacKJxt6bVPDbLqhFNn+iyzUf4EoarOQiz
 Bo4SuauI6J7/pG/TgUuQNLeEKowQtQ8J4aNee8EdIpoN5lzipPWLprpKZob2gEoGsfs2DjWzGZHWE
 MdMnATYQ==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAGH-0001S0-U2; Tue, 04 Jun 2019 14:18:01 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hYAGF-0002m9-15; Tue, 04 Jun 2019 11:17:59 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue,  4 Jun 2019 11:17:54 -0300
Message-Id: <92db0dbd37803154475fc73948fe59893ea041e8.1559656538.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH v2 20/22] dt: bindings: fix some broken links
	from txt->yaml conversion
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

Some new files got converted to yaml, but references weren't
updated accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt | 2 +-
 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt  | 2 +-
 Documentation/devicetree/bindings/sound/st,stm32-sai.txt  | 2 +-
 MAINTAINERS                                               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
index 249790a93017..3122ded82eb4 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
@@ -11,7 +11,7 @@ Required properties:
 - clock-names: must contain "mclk", which is the DCMI peripherial clock
 - pinctrl: the pincontrol settings to configure muxing properly
            for pins that connect to DCMI device.
-           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt.
+           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml.
 - dmas: phandle to DMA controller node,
         see Documentation/devicetree/bindings/dma/stm32-dma.txt
 - dma-names: must contain "tx", which is the transmit channel from DCMI to DMA
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt b/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
index 58c341300552..cbf24bcd1b8d 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
@@ -18,7 +18,7 @@ Required properties:
     See Documentation/devicetree/bindings/dma/stm32-dma.txt.
   - dma-names: Identifier for each DMA request line. Must be "tx" and "rx".
   - pinctrl-names: should contain only value "default"
-  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
 
 Optional properties:
   - resets: Reference to a reset controller asserting the reset controller
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
index 3f4467ff0aa2..944743dd9212 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
@@ -41,7 +41,7 @@ SAI subnodes required properties:
 	"tx": if sai sub-block is configured as playback DAI
 	"rx": if sai sub-block is configured as capture DAI
   - pinctrl-names: should contain only value "default"
-  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
 
 SAI subnodes Optional properties:
   - st,sync: specify synchronization mode.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dc7c3c5ddb0..2ab2337a029c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1298,7 +1298,7 @@ ARM PRIMECELL SSP PL022 SPI DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/spi/spi_pl022.txt
+F:	Documentation/devicetree/bindings/spi/spi-pl022.yaml
 F:	drivers/spi/spi-pl022.c
 
 ARM PRIMECELL UART PL010 AND PL011 DRIVERS
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
