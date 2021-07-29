Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5853D3DD35A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AF47C5AB66;
	Mon,  2 Aug 2021 09:51:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB907C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:11:28 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso17440345pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuibBDljza9+RanigNcsGbAD/Bl63vVbtTN8yokwV00=;
 b=KJTLA5BADvsEc4snFUUYn0AqkGNtsRftFI8d/hubfBe0MsnO5KAfuQzKkMcWrgG5jz
 VNXcs1ccs+nVVGb6/YA6jlqOxnORL1+qZAYk4abhc0SbjFcuzP1cEHJaVqlHqxBmR7+W
 MB1dun1i1H1Wg01eKdMCvBj+AX4Cv2aqVoAPE982Y9Yo6SqZne8y//+xaQmOibKRfXFQ
 lmm6affl0PS5lRD6q7Xc8U0D0In1Q1ZJE3MnAFfWb/78h0ZbnfMD0WXMwZlmkEXsDREe
 1ILX5IpiE9TvrsL6gTeFhlGL6QRP0TbXkWtVgyGCMz9CSZqMPHBheaky7EFazV11vPsa
 KYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuibBDljza9+RanigNcsGbAD/Bl63vVbtTN8yokwV00=;
 b=i88fqInYk6uDanqyccwjE93xDYU2L2p68swQHyQ90OlNQrjLkjOyaPD8/K3lZrEM23
 s37T0EX6CiSfLRALbUDxg3L133LiAFi/4fZowVvce0wyJkR6NsrPtbuqaTSGHSJgbNUk
 NHaImP5/hDqZELWYt7VH+3M84E2DhqoA7+pFWMqMd5OxMNagEKORVPOdR/s7jK8g1a/U
 z3GPa/OsMTN2pwg7QMQspL1kUHoprPhMF0MLsTQkoYcWbYgqZDuKXdc4ojtiQshXPsQh
 J9QuKOpsuSR2fYtR0x6z+PaU3oCsiYNGWOriMJGXeXEoogBor+QBrw7O0GL5wEGHmbXd
 M6kg==
X-Gm-Message-State: AOAM530iLBaxQCFNPlDyAfHCCQnAqNYuaUos1xevZGX2+ohaXNAwZM+n
 XgSC6+FAhi7XzWVfwzvqZo0=
X-Google-Smtp-Source: ABdhPJxFrMpP2T7mTwT1/NZWyi0QSLLwXHv3nNxFg5K1uwnPr5fLpHAgkSkXf0tzZ/xV4F5/yMLS9g==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr6718675pfn.3.1627589487476; 
 Thu, 29 Jul 2021 13:11:27 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Date: Fri, 30 Jul 2021 01:40:50 +0530
Message-Id: <20210729201100.3994-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCHv1 1/3] arm64: dts: amlogic: add missing
	ethernet reset ID
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

Add reset external reset of the ethernet mac controller,
used new reset id for reset controller as it conflict
with the core reset id.

Fixes: f3362f0c1817 ("arm64: dts: amlogic: add missing ethernet reset ID")

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..da3bf9f7c1c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -280,6 +280,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			power-domains = <&pwrc PWRC_AXG_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00c6f53290d4..c174ed50705f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -230,6 +230,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			status = "disabled";
 
 			mdio0: mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6b457b2c30a4..717fa3134882 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -582,6 +583,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
