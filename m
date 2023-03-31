Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5516D1A08
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:34:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D6FC6A5F2;
	Fri, 31 Mar 2023 08:34:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 703FAC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:34:58 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id m2so21588972wrh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
 b=zpVKLNXIXAV4SUprLr3FH6VaLCVrQs08gq3PR6QBskuLieXpL9pEl0DVkVsySGg93E
 yLNJD1djIn/X5/LvUUqSRHXYEJVk7SAUsDK/K0+6UH1nscr58z0a2+WLSgpgFixAZ5s+
 XVlKqZi48mQZvF/zFCrX7vIRbb+FdULZG6d/Qp1a/u+lntuoZ8GZOg6zXBoOtlqkQjTl
 +3lMm0xkV7O4U1IG/ndjeBtRyTZWsdGzqvysaQJmpBAgxoXrpXG9j7WxvA4juS55aJJJ
 PrCK1zS9C4rMDksDfoq6YqSeSBN+2DD8GmU/GVEytLphbHRPoR6o2ael1PZWW4gdS9Sx
 DYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
 b=Q4KqphHL6s0FszVbMdoU7zTNtnxTKLzG7eZsWXbP/k4GuD5os2RUHo+58g9aXv+Vjk
 OMqrFHInzaJb/elhYTBfCYHHXObaIwYq/ax0d8sH5eo9BCj7AokifEmM6gxnlh4qJvtS
 Jy0yLsWjT7fp6MSvxXQsrvEGzveEhIy4Wn4rZEWuIX3rv9p3HyZhmFzejhQRVxilaTAm
 F6GRfxwiQzf518VtXooYuUSAes475h2gTfH/iHlPjPp7Uty7zkuhNlRZvXULXv21lP2O
 XFnBzhmtn4GeA78jG+ABmLVhR+V1yKoAuPo2mgPsYoq+i1Nmxqr6ZCk1+VZf0lZkc/lL
 G32Q==
X-Gm-Message-State: AAQBX9eLIJlrEpA6H6TCoLz/qlEBAWkrvM6perkOv/Q/AIqkZ0HFUpKU
 t0x3ILzkAsSzkFVDXvGgMVEPsg==
X-Google-Smtp-Source: AKy350ZEexxOqisnl/kxib2n7RjdcPxl4zAGraKXrJ/xa8HdVJ2bLN4RGB9qBmKUKQcdJQx9dqXdRg==
X-Received: by 2002:a5d:5342:0:b0:2ca:2794:87e8 with SMTP id
 t2-20020a5d5342000000b002ca279487e8mr19274846wrv.21.1680251698016; 
 Fri, 31 Mar 2023 01:34:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:34:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:48 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-10-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 10/20] dt-bindings: mtd: oxnas-nand:
 remove obsolete bindings
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
for OX810 and OX820 nand bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mtd/oxnas-nand.txt         | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
deleted file mode 100644
index 2ba07fc8b79c..000000000000
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS NAND Controller
-
-Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
-
-Required properties:
- - compatible: "oxsemi,ox820-nand"
- - reg: Base address and length for NAND mapped memory.
-
-Optional Properties:
- - clocks: phandle to the NAND gate clock if needed.
- - resets: phandle to the NAND reset control if needed.
-
-Example:
-
-nandc: nand-controller@41000000 {
-	compatible = "oxsemi,ox820-nand";
-	reg = <0x41000000 0x100000>;
-	clocks = <&stdclk CLK_820_NAND>;
-	resets = <&reset RESET_NAND>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		nand-ecc-mode = "soft";
-		nand-ecc-algo = "hamming";
-
-		partition@0 {
-			label = "boot";
-			reg = <0x00000000 0x00e00000>;
-			read-only;
-		};
-
-		partition@e00000 {
-			label = "ubi";
-			reg = <0x00e00000 0x07200000>;
-		};
-	};
-};

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
