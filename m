Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GowQOkByS2pSRgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 11:15:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6A70E82E
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 11:15:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=cbWFBMWb;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB0EC8F274;
	Mon,  6 Jul 2026 09:15:44 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00040C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 09:15:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id
 d2e1a72fcca58-8454160043aso2739407b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783329341; x=1783934141;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JZ9Bilh0A71vas6RzcJ04y0kMrdOjby17tdvsBQOzSw=;
 b=cbWFBMWb7vVBLX0IxJ3FxE3gEowaIVP/q8SHCCKKPsmfWwVrmk/8M47VeDDV28CO/1
 AV/JRaIcigk+y+FG0DisT3jBw+rdXQt/zSC7JuhM2O9GfEpO7Y+3eRLyeV7P7y51/MxS
 j9vvL7vFvkTeScUHFdHjzBocLRvw0bF0MPsMYEcWhi5A1mNgtPkT2uvwF6ORl5Klr6Au
 g+wSkHcprk+uVyL3+5e7mrZ7KBrc+8TN5+NbrjTxuO8OWiFJiZJgQQdvrfqCEkdlEaCe
 GMMO0eNcy7ufl0JELdmstJet0YrAfc1/sJSsJmTXiBE3D5K03jpjyG+DCiiMZvO55/7y
 wgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783329341; x=1783934141;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JZ9Bilh0A71vas6RzcJ04y0kMrdOjby17tdvsBQOzSw=;
 b=e6YRP8hbodMpvj4xKZTkzkogS/zHOD/HsBzw5hA1GRqEjVXU+4XhqPNJ2qstFhKUzL
 YdNT8+WB6IxKhsOdelOxRD2/PhSI8USYorMlKilqaOBPwHs/2uBnRIsjf0bz8QqLZ2zN
 7uF7w9BECGqpHUx/IMzJ1hr9chHYkp4dJusvVWdCzuSGs/bbXCwZBHWLbqy6OcsSUQhM
 ZeIw8509KXOGuOZtwGRCA5L4eR4SSzBL+ibfRgOc8tdpAU/rpk8OVE9ibvR63khhBD+6
 9Ri40RudT1RNB19S/hfaZg7RL9tu3tk882KVevwCzz07PeTHmWEjIRLe/3bnstq+OuJh
 LlTw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqkEoZlN7mafR1cDw9A+zqEGLqm2zRIhZ7a2bYxfnzV/sg1XPgWO4XW+ChYqaxuFPL911o0xXQJTKYCsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkU8FDBmbuTK0euEIKpzb+3mO+LS1F4UflHluMhNOsk4snyvnO
 wlhq+N4RNLxMmK3Oq+oZMoc+HzrePmQ1MaQiqlbuMTcCp2y9kNSJ7ToR
X-Gm-Gg: AfdE7cm2bxjbyfAWkvzNXXqtPURE6gmuOQ7MsE4R1Y7WERhWUod42y2KcfMTPkfbR67
 CaZeNLnVUlJfRLtXUShIoWAfCBFyBt789mkIgyo0pYTHLRWwx6GrXMpy20mUca4dcvlC6ephQKp
 ReFHtweYog7wNOdXp4duExVYtWa03h2RhLQBsGakeQwY3EjSp4spR7OGcrYhoLTXo+DzFWk8o9p
 MnFUROAIUqsvBZNWxb831Az+m1ipfDnbiyv679p024ThGi/q2lbRmMhTmP5vAeE7/+5EJOqVzBJ
 RKEUhf6V0tAGV+Dj6NTNcVK+jC87RHOKvqw6hTf++D6C3csSwReT0SjCIVz2nGjj8tJ8BgfEWLB
 1dic6Jq/ks+7kWf0iikr3Pt0yGG7E3WrgXJa82QRBjWeg4zXQz9Nr4q1Ll3TdLY/1MkS1EnlSAA
 9CPJ2AxMeBx5xzzg5pcPthq5D/
X-Received: by 2002:a05:6a00:4c11:b0:847:7f65:7674 with SMTP id
 d2e1a72fcca58-847f6f5255amr7889988b3a.44.1783329338392; 
 Mon, 06 Jul 2026 02:15:38 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:15:37 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:45 +0800
MIME-Version: 1.0
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-5-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=14558;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=w51C3jUGo0plRKZPEIY2q/QIfCYShiCTzByZYsRM06A=;
 b=Nm+U2/03qdUxBPUR1JAZJhmNp7jqMUdvdDJhwsj30p6OQow9ad6tYXE6/9pbcCMp9L7tnK9XT
 K3MLyaXpUOAAJUwq2fPNUqTOZ1FxhEPiBdw0oB6wiGwZ4CkZBebWEwf
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] ARM: dts: rockchip: Add Alientek
	DLRV1126
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:Frank.Sae@motor-comm.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:grumpycat921013@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,sntech.de,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com,motor-comm.com,armlinux.org.uk];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1D6A70E82E

The board consists of a CLRV1126F core module and a DLRV1126 carrier
board. The core module contains the RV1126 SoC, eMMC and RK809 PMIC,
while the carrier board provides Ethernet, SD card, AP6212 WiFi and
Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and audio connectors.

The board has been tested with Ethernet/NFS boot, eMMC, SD card, SDIO
WiFi enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and
RK809 audio card registration.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    | 277 +++++++++++++++++++++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts | 256 +++++++++++++++++++
 3 files changed, 534 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index d0154fd7ff24..e9f9e0ac3bfd 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
 	rv1109-sonoff-ihost.dtb \
+	rv1126-alientek-dlrv1126.dtb \
 	rv1126-edgeble-neu2-io.dtb \
 	rv1126-sonoff-ihost.dtb \
 	rk3036-evb.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1126-alientek-clrv1126f.dtsi b/arch/arm/boot/dts/rockchip/rv1126-alientek-clrv1126f.dtsi
new file mode 100644
index 000000000000..9bee424b1797
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1126-alientek-clrv1126f.dtsi
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Yanan He <grumpycat921013@gmail.com>
+ */
+
+#include "rv1126.dtsi"
+
+/ {
+	compatible = "alientek,clrv1126f", "rockchip,rv1126";
+
+	aliases {
+		mmc0 = &emmc;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&emmc {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_cmd &emmc_clk &emmc_rstnout>;
+	rockchip,default-sample-phase = <90>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <1>;
+		#sound-dai-cells = <0>;
+		clock-output-names = "rk808-clkout1", "rk808-clkout2";
+		clock-names = "mclk";
+		clocks = <&cru MCLK_I2S0_TX_OUT2IO>;
+		assigned-clocks = <&cru MCLK_I2S0_TX_OUT2IO>;
+		assigned-clock-parents = <&cru MCLK_I2S0_TX>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>;
+		rockchip,system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc_buck5>;
+		vcc6-supply = <&vcc_buck5>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+
+		regulators {
+			vdd_npu_vepu: DCDC_REG1 {
+				regulator-name = "vdd_npu_vepu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_arm: DCDC_REG2 {
+				regulator-name = "vdd_arm";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc3v3_sys: DCDC_REG4 {
+				regulator-name = "vcc3v3_sys";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_buck5: DCDC_REG5 {
+				regulator-name = "vcc_buck5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2200000>;
+				};
+			};
+
+			vcc_0v8: LDO_REG1 {
+				regulator-name = "vcc_0v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc1v8_pmu: LDO_REG2 {
+				regulator-name = "vcc1v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd0v8_pmu: LDO_REG3 {
+				regulator-name = "vcc0v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <800000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG4 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_dovdd: LDO_REG5 {
+				regulator-name = "vcc_dovdd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_dvdd: LDO_REG6 {
+				regulator-name = "vcc_dvdd";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_avdd: LDO_REG7 {
+				regulator-name = "vcc_avdd";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG8 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: LDO_REG9 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_5v0: SWITCH_REG1 {
+				regulator-name = "vcc_5v0";
+			};
+
+			vcc_3v3: SWITCH_REG2 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio0-supply = <&vcc3v3_sys>;
+	pmuio1-supply = <&vcc3v3_sys>;
+	vccio1-supply = <&vcc_1v8>;
+	vccio2-supply = <&vccio_sd>;
+	vccio3-supply = <&vcc_1v8>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_3v3>;
+	vccio7-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1126-alientek-dlrv1126.dts b/arch/arm/boot/dts/rockchip/rv1126-alientek-dlrv1126.dts
new file mode 100644
index 000000000000..33c6c74d08b9
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1126-alientek-dlrv1126.dts
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Yanan He <grumpycat921013@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include "rv1126-alientek-clrv1126f.dtsi"
+
+/ {
+	model = "Alientek ATK-DLRV1126";
+	compatible = "alientek,dlrv1126", "alientek,clrv1126f", "rockchip,rv1126";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc1 = &sdio;
+		mmc2 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-esc {
+			label = "esc";
+			linux,code = <KEY_ESC>;
+			press-threshold-microvolt = <0>;
+		};
+
+		button-right {
+			label = "right";
+			linux,code = <KEY_RIGHT>;
+			press-threshold-microvolt = <400781>;
+		};
+
+		button-left {
+			label = "left";
+			linux,code = <KEY_LEFT>;
+			press-threshold-microvolt = <801562>;
+		};
+
+		button-menu {
+			label = "menu";
+			linux,code = <KEY_MENU>;
+			press-threshold-microvolt = <1198828>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "sys-led";
+			gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "user-led";
+			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "on";
+		};
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "Analog RK809";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Speaker", "Speaker",
+			"Headphone", "Headphones",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Speaker", "SPKO",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"MICL", "Mic Jack";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rk809>;
+		};
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	sdio_pwrseq: pwrseq-sdio {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		reset-gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+		power-off-delay-us = <20000>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_LOW>;
+		clock-output-names = "xin32k";
+	};
+};
+
+&gmac {
+	phy-mode = "rgmii-id";
+	clock_in_out = "input";
+	assigned-clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
+			  <&cru CLK_GMAC_ETHERNET_OUT>;
+	assigned-clock-parents = <&cru CLK_GMAC_SRC_M1>,
+				 <&cru RGMII_MODE_CLK>;
+	assigned-clock-rates = <125000000>, <0>, <25000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmiim1_miim &rgmiim1_bus2 &rgmiim1_bus4
+		     &clk_out_ethernetm1_pins>;
+	phy-handle = <&phy>;
+	status = "okay";
+};
+
+&mdio {
+	phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		clocks = <&cru CLK_GMAC_ETHERNET_OUT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&eth_phy_rst>;
+		reset-gpios = <&gpio3 RK_PA0 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+	};
+};
+
+&pinctrl {
+	ethernet {
+		eth_phy_rst: eth-phy-rst {
+			rockchip,pins = <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	bt {
+		bt_enable: bt-enable {
+			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_dev: bt-wake-dev {
+			rockchip,pins = <1 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sdio {
+	bus-width = <4>;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <25000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
+	rockchip,default-sample-phase = <90>;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_bus4 &sdmmc0_det>;
+	rockchip,default-sample-phase = <90>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_xfer &uart0_ctsn &uart0_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43430a1-bt";
+		shutdown-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpio1 RK_PD1 GPIO_ACTIVE_HIGH>;
+		clocks = <&rk809 1>;
+		clock-names = "lpo";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "host-wakeup";
+		max-speed = <115200>;
+		vbat-supply = <&vcc_3v3>;
+		vddio-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_enable>, <&bt_wake_dev>, <&bt_wake_host>;
+	};
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&i2s0 {
+	rockchip,trcm-sync-tx-only;
+	rockchip,i2s-rx-route = <3 1 2 0>;
+	rockchip,i2s-tx-route = <0 1 2 3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0m0_sclk_tx>,
+		    <&i2s0m0_mclk>,
+		    <&i2s0m0_lrck_tx>,
+		    <&i2s0m0_sdo0>,
+		    <&i2s0m0_sdo1_sdi3>;
+	status = "okay";
+};

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
