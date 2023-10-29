Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E177DAAC0
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Oct 2023 05:27:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DE2C6C837;
	Sun, 29 Oct 2023 04:27:51 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C166CC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 04:27:49 +0000 (UTC)
Received: from localhost (unknown [188.24.143.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 56370660734A;
 Sun, 29 Oct 2023 04:27:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698553669;
 bh=XPFhkQiEs+IGnpXs/VjChiy7INWlUvumm6K55Zul0rU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8+/FjFH44VcIQoEE5TuvkJsBmdkwjJNiQYePXC8QCQKnlodiftL7rIknTTyFaq7S
 Cu0VbqfW/VBEVttKYtISUXNs0PBw0jHxh04y28J7NHmrnDTS3eRdvVJx/UODNaoDMj
 LpET5/HJOZjm/9hjPiyDrIz2iz/NBD/NneiJNgxOj5dBZHDS3NcBPosr5mN4pAc5uF
 +el73KBoQd7VP+auerViiI6gWlkmB5ErUZ5+YoRVzyBU0vbPdRCAUfhWPU+Iq7Nsx7
 PWGcn3za+cEF/I7zaVfxWipeZ1FgAgerFSYVvPiab548Chgqh25B2iTZfLmGAHIZ0U
 VI7eDOEjRiUOA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Sun, 29 Oct 2023 06:27:10 +0200
Message-ID: <20231029042712.520010-11-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 10/12] riscv: dts: starfive: jh7100-common:
	Setup gmac pinmux
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

Add pinmux configuration for the DWMAC found on the JH7100 based boards.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index 504c73f01f14..b556e28069c4 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -65,7 +65,83 @@ soc {
 	};
 };
 
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins>;
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
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
