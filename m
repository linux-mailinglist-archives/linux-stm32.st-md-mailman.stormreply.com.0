Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EB75EB97
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 08:35:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14CEBC6B45C;
	Mon, 24 Jul 2023 06:35:24 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 406CDC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1690180523; x=1721716523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qo77yFF1+Xe4+ux9WT9zH/pvobHjGv17l93nkcfgwNc=;
 b=G0HBgnsPFQRce9fuimJPKireBWDn0K64HtgUakhvglcj4lBWqD4FajS0
 /WAU7fJNvX3/6A+Jto6BLsgU13RXc+uqhM5fZC+ALB0xvzCNxuKmoac9U
 ONvGZGVRWs9nlZU1EDTJEyvm2F88XyN2YOOcFqY1HEBs0BNFaOwrA0LjR
 fgMC8xlcP1xwKb5GwC1+xla/bN3sRgLyut97CJHalIL8MNutT3sufUJjS
 qtYE7PE9OO0VaeKoWWBSNjb+lMLTWxC7ISFAET5dN3urTZaRbp5dsnul8
 nEeQbtSvbK+lImjpcFE2o4NTsAk2KZHc5y6nqyu1V9R9Q/JJJGNd4xT7L w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; d="scan'208";a="32070465"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jul 2023 08:35:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 56C1B280084;
 Mon, 24 Jul 2023 08:35:22 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Date: Mon, 24 Jul 2023 08:35:20 +0200
Message-Id: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names
	to PCA9532 GPIO
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

This is a gpio-controller, so gpio-line-names should be allowed as well.
pca9532 supports up to 16 GPIOs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Add min/maxItems

 Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
index edf6f55df685..9610bca57dd5 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
@@ -29,6 +29,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 16
+
   '#gpio-cells':
     const: 2
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
