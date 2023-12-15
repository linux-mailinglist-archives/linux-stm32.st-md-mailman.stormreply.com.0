Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06F81512B
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 21:41:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1625C6DD6E;
	Fri, 15 Dec 2023 20:41:00 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE69C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702672857;
 bh=IFa49JzpSi/BzGbymN8hqKqmj592DFz7UCEiaxLgfsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K7VbS9RRJ1bSXDMiww8osDVqzOWXgZykW2QNe/1eP7XDwlnZCluVDJ7q+BvAo1fOv
 ux+WdATJ0TCdk/RqWkYez2xhe7ewSy/ezzvUQlC5RqxjXN1MSm8+IZ+jKesuhR1ZKs
 oWzkN8IrWre9/X/MFJTxAKmxyHzmZ0XjyTb7tuItutphf3ycYdF8grJolWgVUTPMba
 wSMkufkvxDNyNZzoiOFD0BljHIGOgH7QeR+GdHbF4D3supzAg+G9o9k0UYVE+/sA7D
 4QFNI2fz7FTx16fwqNwkiRFOp2baE7/n7VH6suky98BSVkENutSr2gBNdkLjjB1d7j
 z6Iuj5qG965bQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6EA803781FF1;
 Fri, 15 Dec 2023 20:40:57 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 15 Dec 2023 22:40:44 +0200
Message-ID: <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/9] riscv: dts: starfive: jh7100-common:
	Setup pinmux and enable gmac
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

Add pinmux configuration for DWMAC found on the JH7100 based boards and
enable the related DT node, providing a basic PHY configuration.

Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index 42fb61c36068..5cafe8f5c2e7 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy>;
+	status = "okay";
+
+	mdio: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+	};
+};
+
 &gpio {
+	gmac_pins: gmac-0 {
+		gtxclk-pins {
+			pins = <PAD_FUNC_SHARE(115)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		miitxclk-pins {
+			pins = <PAD_FUNC_SHARE(116)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		tx-pins {
+			pins = <PAD_FUNC_SHARE(117)>,
+			       <PAD_FUNC_SHARE(119)>,
+			       <PAD_FUNC_SHARE(120)>,
+			       <PAD_FUNC_SHARE(121)>,
+			       <PAD_FUNC_SHARE(122)>,
+			       <PAD_FUNC_SHARE(123)>,
+			       <PAD_FUNC_SHARE(124)>,
+			       <PAD_FUNC_SHARE(125)>,
+			       <PAD_FUNC_SHARE(126)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rxclk-pins {
+			pins = <PAD_FUNC_SHARE(127)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <6>;
+		};
+		rxer-pins {
+			pins = <PAD_FUNC_SHARE(129)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rx-pins {
+			pins = <PAD_FUNC_SHARE(128)>,
+			       <PAD_FUNC_SHARE(130)>,
+			       <PAD_FUNC_SHARE(131)>,
+			       <PAD_FUNC_SHARE(132)>,
+			       <PAD_FUNC_SHARE(133)>,
+			       <PAD_FUNC_SHARE(134)>,
+			       <PAD_FUNC_SHARE(135)>,
+			       <PAD_FUNC_SHARE(136)>,
+			       <PAD_FUNC_SHARE(137)>,
+			       <PAD_FUNC_SHARE(138)>,
+			       <PAD_FUNC_SHARE(139)>,
+			       <PAD_FUNC_SHARE(140)>,
+			       <PAD_FUNC_SHARE(141)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(62, GPO_LOW,
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
