Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIHHNNLCs2mEagAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 08:54:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5727F0C7
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 08:54:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E7E5C8F28F;
	Fri, 13 Mar 2026 07:54:58 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [52.237.72.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E83CC87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 07:54:56 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app1 (Coremail) with SMTP id TAJkCgD3jHHBwrNpsxoIAA--.34817S2;
 Fri, 13 Mar 2026 15:54:42 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 15:54:38 +0800
Message-ID: <20260313075438.1633-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260313075234.1567-1-lizhi2@eswincomputing.com>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgD3jHHBwrNpsxoIAA--.34817S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxtw1DWr1xtFy8WFWDCFg_yoWrGw45pF
 47urZ5XrWrWr1xA34YvFy09FZxJws7GF95Krn7tFyDGF4q9FWYvr4jy3WfJF17ArWUX3y5
 WFs3t34FkF4vy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4U
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRdWrXUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, Zhi Li <lizhi2@eswincomputing.com>
Subject: [Linux-stm32] [PATCH net-next v4 3/3] riscv: dts: eswin:
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:lizhi2@eswincomputing.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[3.1.11.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3.1.50.16:email,0.0.0.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,3.9.72.96:email,3.19.90.128:email]
X-Rspamd-Queue-Id: 75D5727F0C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhi Li <lizhi2@eswincomputing.com>

Enable the on-board Gigabit Ethernet controller on the
HiFive Premier P550 development board.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 42 ++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 66 +++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..5a40be1d2a25 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -13,6 +13,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -20,6 +22,46 @@ chosen {
 	};
 };
 
+&gmac0 {
+	phy-handle = <&gmac0_phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio106_pins>;
+	rx-internal-delay-ps = <20>;
+	tx-internal-delay-ps = <100>;
+	status = "okay";
+
+	mdio {
+		gmac0_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0>;
+			reset-gpios = <&gpioD 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&gmac1_phy0>;
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio111_pins>;
+	rx-internal-delay-ps = <200>;
+	tx-internal-delay-ps = <200>;
+	status = "okay";
+
+	mdio {
+		gmac1_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0>;
+			reset-gpios = <&gpioD 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..f1a01d5736a1 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
@@ -295,6 +297,70 @@ uart4: serial@50940000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@50400000 {
+			compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+			reg = <0x0 0x50400000 0x0 0x10000>;
+			interrupts = <61>;
+			interrupt-names = "macirq";
+			clocks = <&clk 186>,
+				 <&clk 171>,
+				 <&clk 40>,
+				 <&clk 193>;
+			clock-names = "axi", "cfg", "stmmaceth", "tx";
+			resets = <&reset 95>;
+			reset-names = "stmmaceth";
+			eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
+			snps,aal;
+			snps,fixed-burst;
+			snps,tso;
+			snps,axi-config = <&stmmac_axi_setup_gmac0>;
+			status = "disabled";
+
+			stmmac_axi_setup_gmac0: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <2>;
+			};
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@50410000 {
+			compatible = "eswin,eic7700-qos-eth-clk-inversion", "snps,dwmac-5.20";
+			reg = <0x0 0x50410000 0x0 0x10000>;
+			interrupts = <70>;
+			interrupt-names = "macirq";
+			clocks = <&clk 186>,
+				 <&clk 171>,
+				 <&clk 40>,
+				 <&clk 194>;
+			clock-names = "axi", "cfg", "stmmaceth", "tx";
+			resets = <&reset 94>;
+			reset-names = "stmmaceth";
+			eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x218 0x214 0x21c>;
+			snps,aal;
+			snps,fixed-burst;
+			snps,tso;
+			snps,axi-config = <&stmmac_axi_setup_gmac1>;
+			status = "disabled";
+
+			stmmac_axi_setup_gmac1: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <2>;
+			};
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpio@51600000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x0 0x51600000 0x0 0x80>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
