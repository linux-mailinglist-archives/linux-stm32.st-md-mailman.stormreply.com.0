Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UThXAJxjQ2r9XgoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 08:35:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181C6E0C86
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 08:35:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C83FC7A830;
	Tue, 30 Jun 2026 06:35:07 +0000 (UTC)
Received: from mail.eswincomputing.com (mail.eswincomputing.com
 [123.124.195.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80422C7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 06:35:05 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app2 (Coremail) with SMTP id TQJkCgA3S56IY0NqcRwwAA--.53065S2;
 Tue, 30 Jun 2026 14:34:49 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maxime.chevallier@bootlin.com
Date: Tue, 30 Jun 2026 14:34:45 +0800
Message-ID: <20260630063445.1226-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260630063123.1118-1-lizhi2@eswincomputing.com>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgA3S56IY0NqcRwwAA--.53065S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xJF43WFyUKF4DXF43ZFb_yoWfGryUpa
 13urZ3Jr4kZFWSvw4jvF40yFZrGa1kKFykurnrtFy8Jw1v9FnYkw1jqry5XF1DZrWrXw13
 XFnrJ34IyF1Iy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4U
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRQ6p9UUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com, lee@kernel.org,
 pritesh.patel@einfochips.com, Zhi Li <lizhi2@eswincomputing.com>,
 horms@kernel.org, wens@kernel.org
Subject: [Linux-stm32] [PATCH net-next v9 6/6] riscv: dts: eswin:
	eic7700-hifive-premier-p550: enable Ethernet controller
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:maxime.chevallier@bootlin.com,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:pritesh.patel@einfochips.com,m:lizhi2@eswincomputing.com,m:horms@kernel.org,m:wens@kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org,st-md-mailman.stormreply.com,bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	R_DKIM_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,eswincomputing.com:email,eswincomputing.com:mid,eswincomputing.com:from_mime,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9181C6E0C86

From: Zhi Li <lizhi2@eswincomputing.com>

Enable the on-board Gigabit Ethernet controller on the
HiFive Premier P550 development board.

This patch is included only to provide the DTS context for reviewing the
binding and driver changes in this series.

The upstream DTS series will be submitted separately after the binding
and driver changes are finalized.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 240 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 105 ++++++++
 2 files changed, 345 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..9d37bafdd1b2 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -13,11 +13,251 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vcc_1v8: regulator-1v8 {
+		 compatible = "regulator-fixed";
+		 regulator-name = "vcc1v8";
+		 regulator-always-on;
+		 regulator-boot-on;
+		 regulator-min-microvolt = <1800000>;
+		 regulator-max-microvolt = <1800000>;
+	 };
+};
+
+&xtal {
+	clock-frequency = <24000000>;
+	clock-output-names = "xtal24m";
+};
+
+&pinctrl {
+	status = "okay";
+	vrgmii-supply = <&vcc_1v8>;
+
+	pinctrl_gpio0: gpio0-grp {
+		gpio0-pins {
+			pins = "gpio0";
+			function = "gpio";
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio5: gpio5-grp {
+		gpio5-pins {
+			pins = "gpio5";
+			function = "gpio";
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio11: gpio11-grp {
+		gpio11-pins {
+			pins = "gpio11";
+			function = "gpio";
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio14: gpio14-grp {
+		gpio14-pins {
+			pins = "mode_set1";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio15: gpio15-grp {
+		gpio15-pins {
+			pins = "mode_set2";
+			function = "gpio";
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio28: gpio28-grp {
+		gpio28-pins {
+			pins = "gpio28";
+			function = "gpio";
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio43: gpio43-grp {
+		gpio43-pins {
+			pins = "usb1_pwren";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio71: gpio71-grp {
+		gpio71-pins {
+			pins = "mipi_csi0_xhs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio74: gpio74-grp {
+		gpio74-pins {
+			pins = "mipi_csi1_xhs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio76: gpio76-grp {
+		gpio76-pins {
+			pins = "mipi_csi2_xvs";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio77: gpio77-grp {
+		gpio77-pins {
+			pins = "mipi_csi2_xhs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio79: gpio79-grp {
+		gpio79-pins {
+			pins = "mipi_csi3_xvs";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio80: gpio80-grp {
+		gpio80-pins {
+			pins = "mipi_csi3_xhs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio82: gpio82-grp {
+		gpio82-pins {
+			pins = "mipi_csi4_xvs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio84: gpio84-grp {
+		gpio84-pins {
+			pins = "mipi_csi4_mclk";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio85: gpio85-grp {
+		gpio85-pins {
+			pins = "mipi_csi5_xvs";
+			function = "gpio";
+			input-disable;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_gpio94: gpio94-grp {
+		gpio94-pins {
+			pins = "s_mode";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio106: gpio106-grp {
+		gpio106-pins {
+			pins = "gpio106";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio111: gpio111-grp {
+		gpio111-pins {
+			pins = "gpio111";
+			function = "gpio";
+			input-disable;
+			bias-disable;
+		};
+	};
+};
+
+&gmac0 {
+	phy-handle = <&gmac0_phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio106>;
+	rx-internal-delay-ps = <20>;
+	tx-internal-delay-ps = <100>;
+	status = "okay";
+};
+
+&gmac0_mdio {
+	gmac0_phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0>;
+		reset-gpios = <&gpioD 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+	};
+};
+
+&gmac1 {
+	phy-handle = <&gmac1_phy0>;
+	/*
+	 * The MAC silicon unconditionally introduces an ~2 ns TX clock-to-data
+	 * skew (MAC-side TX internal delay). The PHY provides the standard
+	 * ~2 ns RX internal delay. The driver additionally inverts the RX
+	 * clock at 1000 Mb/s to correct a silicon RX sampling timing issue.
+	 * phy-mode is "rgmii-id": TX delay from the MAC silicon, RX delay
+	 * from the PHY.
+	 */
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio111>;
+	rx-internal-delay-ps = <200>;
+	tx-internal-delay-ps = <2200>;
+	status = "okay";
+};
+
+&gmac1_mdio {
+	gmac1_phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0>;
+		reset-gpios = <&gpioD 15 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+	};
 };
 
 &uart0 {
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..041ecc5cb007 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -5,6 +5,9 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/eswin,eic7700-reset.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
@@ -202,6 +205,11 @@ pmu {
 				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
 	};
 
+	xtal: clock-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -245,6 +253,85 @@ plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 		};
 
+		hsp: bus@0 {
+			compatible = "simple-pm-bus";
+			ranges = <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
+			clocks = <&clk 171>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			hsp_sp_csr: hsp-sp-top-csr@50440000 {
+				compatible = "eswin,eic7700-syscfg", "syscon";
+				reg = <0x0 0x50440000 0x0 0x2000>;
+			};
+
+			gmac0: ethernet@50400000 {
+				compatible = "eswin,eic7700-qos-eth",
+					     "snps,dwmac-5.20";
+				reg = <0x0 0x50400000 0x0 0x10000>;
+				interrupts = <61>;
+				interrupt-names = "macirq";
+				clocks = <&clk 186>,
+					 <&clk 171>,
+					 <&clk 40>,
+					 <&clk 193>;
+				clock-names = "axi", "cfg", "stmmaceth", "tx";
+				resets = <&reset EIC7700_RESET_HSP_ETH0_ARST>;
+				reset-names = "stmmaceth";
+				eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
+				snps,aal;
+				snps,fixed-burst;
+				snps,tso;
+				snps,axi-config = <&stmmac_axi_setup_gmac0>;
+				status = "disabled";
+
+				gmac0_mdio: mdio {
+					compatible = "snps,dwmac-mdio";
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				stmmac_axi_setup_gmac0: stmmac-axi-config {
+					snps,blen = <0 0 0 0 16 8 4>;
+					snps,rd_osr_lmt = <2>;
+					snps,wr_osr_lmt = <2>;
+				};
+			};
+
+			gmac1: ethernet@50410000 {
+				compatible = "eswin,eic7700-qos-eth-clk-inversion",
+					     "snps,dwmac-5.20";
+				reg = <0x0 0x50410000 0x0 0x10000>;
+				interrupts = <70>;
+				interrupt-names = "macirq";
+				clocks = <&clk 186>,
+					 <&clk 171>,
+					 <&clk 40>,
+					 <&clk 194>;
+				clock-names = "axi", "cfg", "stmmaceth", "tx";
+				resets = <&reset EIC7700_RESET_HSP_ETH1_ARST>;
+				reset-names = "stmmaceth";
+				eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x218 0x214 0x21c>;
+				snps,aal;
+				snps,fixed-burst;
+				snps,tso;
+				snps,axi-config = <&stmmac_axi_setup_gmac1>;
+				status = "disabled";
+
+				gmac1_mdio: mdio {
+					compatible = "snps,dwmac-mdio";
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				stmmac_axi_setup_gmac1: stmmac-axi-config {
+					snps,blen = <0 0 0 0 16 8 4>;
+					snps,rd_osr_lmt = <2>;
+					snps,wr_osr_lmt = <2>;
+				};
+			};
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
@@ -341,5 +428,23 @@ gpioD: gpio-port@3 {
 				#gpio-cells = <2>;
 			};
 		};
+
+		pinctrl: pinctrl@51600080 {
+			compatible = "eswin,eic7700-pinctrl";
+			reg = <0x0 0x51600080 0x0 0x1fff80>;
+		};
+
+		clk: clock-controller@51828000 {
+			compatible = "eswin,eic7700-clock";
+			reg = <0x0 0x51828000 0x0 0x300>;
+			clocks = <&xtal>;
+			#clock-cells = <1>;
+		};
+
+		reset: reset-controller@51828300 {
+			compatible = "eswin,eic7700-reset";
+			reg = <0x0 0x51828300 0x0 0x200>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
