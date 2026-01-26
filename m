Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD7+LpNAd2mMdQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:23:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333786C99
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:23:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E426DC87EDC;
	Mon, 26 Jan 2026 10:23:14 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9B09C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 10:23:13 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso2923770a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 02:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769422992; x=1770027792;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
 b=MGrxb2Fbk/VJGJIAMM0A4eRZMLeADDjEqRktVCetSmgPhZlZt4P4SMLTKP88i4AAev
 nXig/YTXdelFl2YDHFGD0p5t89cd3sHNb8ex2Kv9vmAoN4UB5LdQw85lRloOjD2wWQ9d
 rt5z5lRyzQq0Bm2gGbc7ZqpKqhzE9IjQy08TBEoO/f0Vclj0lFvMIyjWvP0sxqnE+o7F
 dXqkHLCvoPUSkLxgF+7Ox2nu7GtY3Vmi0Tat2RXDglV3YyYEMlfU5PqahNCWuL1Z56Up
 xOuu+eXkWclVvwHl8yBRDIfHNsCkEUpsg7ZBTx8/BMW//bM6ukyua2WtTLuuaW8X5cdt
 HDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422992; x=1770027792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
 b=ePmzw2Wl8Eq91dqODSgex4DVW2UTmniw/2E3D1R3ZkOq6JTEIDnnlxZItWJQwGp5VS
 jXfWwZ9s69+wwAdEJkPmYKQQ6q0nMJ3l8jUvhsRWEVs6CBruRJedp5zqgw2U0o23Iffo
 LWDxc7t5j8zDk1XRCyvvL+DPJwuo1Jtjv0uYd+9vwDpJQ+83tuD4RMeaMxxjzpaDwgn3
 IiHqnQi9tJrphPk4JpvwufyCh9AVtHlH1c6qouIJuacTeSlS2l6UoQfi5iJh9P8HsUnT
 9Sr5EAQ5tBF+BJvvMAafJkA/MJmCXxZM55dJ2DQrHbtpBaAvMbuOz6YRuKjlfKiJz/Xh
 liLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKdDntfy49fKmmyifDa4aFNST+qZX9P9QscF430aXG10diUTtFkZ1EjOdDev1bNQVMAJEsHC0gw0BlNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxh18BAXQ/3o/nOt71ZeLpu0A1HE9QI3WGWHCL3G+Gq+Xcgy47u
 9Fh49ytxCmukolS2NxgJSz0UR/TK8s+4j1GstcoRstwrkvVaUU8AIFXB
X-Gm-Gg: AZuq6aJEeKwA23pPoyyguTI9LChH8UDs5ECfRyLfSRoAEpBQyp+Szk4bgCV862jBPt3
 M5UbHta8d3lur793rhj7YUIe1X8lJRkzfB2FxtbsASaj6Atov2x8U38u3Ubvc5RF+SwEI7we7vZ
 TxKhDi7/gQO1tLw8yCH1Pexui738fSmYXjYbZkFqxnwQHSUmikNHqBie1mB4UtrUiz9vJCnuEZm
 /9SqsKSlLzSEN4Pf0hWpak5iwk7hTfQd8thTj/14qn81R5QdIE9rEJPzYqxaYHgiNMT5GnwyfDo
 S6UyC4ndzBuJ2QJVojzd/G6ZH1cnDy4cO1gCipNyV/d8ls0OA49FDfZ0WrV/Bi+g700nm18aBEb
 UxD8ohbqq7R/rrDZUb0XJU0+R02Ww7G+B7Zvc+kiz8Jxy3CyHL3HYn3QBl2EWut+vLKeX/606bM
 NCU/YMBkY6ystOfGsVDd0VoPCgHIwzd9qNoc/7BWETFYUefZjRmBWHMrCpAzghGTDZFG2n2nsZ
X-Received: by 2002:a17:902:e5d0:b0:295:425a:350e with SMTP id
 d9443c01a7336-2a845240123mr34633815ad.8.1769422992175; 
 Mon, 26 Jan 2026 02:23:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 02:23:11 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 26 Jan 2026 18:22:56 +0800
Message-ID: <20260126102257.2619862-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102257.2619862-1-a0987203069@gmail.com>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add
	Ethernet nodes
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:devicetree@vger.kernel.org,m:ychuang3@nuvoton.com,m:a0987203069@gmail.com,m:netdev@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joabreu@synopsys.com,m:schung@nuvoton.com,m:peppe.cavallaro@st.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,nuvoton.com,gmail.com,lists.ozlabs.org,synopsys.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,0.0.0.1:email,2.100.46.192:email,2.111.199.128:email,2.100.85.208:email]
X-Rspamd-Queue-Id: 3333786C99
X-Rspamd-Action: no action

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..ee32cedf3d9b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,34 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..b1b3e45280d5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,33 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..477515ba9a80 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,37 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
