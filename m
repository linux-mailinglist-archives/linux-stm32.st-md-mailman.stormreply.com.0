Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A9A25215
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 06:43:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 878EFC78F7C;
	Mon,  3 Feb 2025 05:43:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC185C78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 05:43:53 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ee74291415so5020854a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Feb 2025 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738561432; x=1739166232;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
 b=ayH25uXtsOabglt3BkBQM9v4ps8ENb610XUipZa0s+/a8x1L1yabAEf2y18lwbc15j
 +VHzPUneltm9IYOMIuw4gfhttYZb6nrYOn5bGeWrHc94myeWlmWvwGKCzHyZmlcmeA1w
 SOWFICdn1ytGmT77oEvc92WgxYYSWWdYHjHiouwOKXNP5CjVThnp4axTYKX8gMZef1zq
 ANkSqrn+9fuc/+ftNf+gtSprscx8L35IfikhdWlFX16QLNaygLn6BwDQYiEP5teeW6v9
 uj7ou1Tf56E1n1tdg8pDlLllZvo03zOYzfofyzcoGgmyTqdKwoAvrzl9pTS/ws6qgBxM
 Wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738561432; x=1739166232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
 b=EJ7vPBLAaC7hucXQBr1ZSrFjel0OQgiB5BQoI9OKLwgwgVC5j1KtUauBYe9BsV/otz
 c4dbOL435YTZzaVbuYGfH5Tojm5N/qHl/cIKJcZYhzcbXH2y/bY+gff/IesLX0QE5kVX
 qqEKWgPf00U+1X+YjcQEMu/K6xnGn4D1N//BLtA32Zc4LCerdmjP9aXa1tNZloa7UGyO
 938v3zy5s2/IzL7eQXdpT20Wk4svSFyweMaNDagzs4eJ1Nv1n5Qm2amyEWLKhgqy4pIV
 xvAvY06/SxMNfH5qIjiHdDps36uG2BV+GmRkD3jIcmzQ3PrYfDAxON7X90wClJleZNbq
 0fkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtGsFj84TCcjCVcfeAV5YMaWD4MA74xb2MItsx9YMK0FtCAxwhg3yx3+piduw8YYvU9KCjpuliRzHBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywr6oIDQrms/Jm6URfCMLa/BCsBeqIgpiGV1DQA5yzoKtuUQ030
 g1LZCoXCifVlv015ieU4CGwoT9NTG09aUGpSvOgIsUqMK4ORvMJeuSX6kA==
X-Gm-Gg: ASbGncuMWSJk3L9JNuwMNg9pgOq9R69jFnFBy+l0KBsueS/i+4aKoa7h1NSJX9croQO
 jWTUlHW5rbCx2TkEOeg0FhpcBP+WmDd+KX7VOBVL4LEYNChxwTlOlZCnpcv+tWIIdEsQnhUotRJ
 rLBzxGjaNi1JoCDE3G6LAi79BO0T9OZ016cqkLRaE3HwA1P0GcmowQQKuoyJmADdpYGMCxVymfF
 8L9gsSVx7HXR3pq3839N7+8xjT3zeGF7BBfh74LSOrEss3/VaNBT/7WLOjsLvfwFLdhgKFU7A2a
 1AwOwA7DDguO8DqmQEDwQ+nhZTgEdsoNMukXlTLPXsJvejGB8WCyQr07
X-Google-Smtp-Source: AGHT+IEebl6qnAhUV7DcuC2+Gaci6mLgBlvTtBDmEY8dNeLsOpTRgjxFkU8HCj/XYZqe5f2xfVUW6w==
X-Received: by 2002:a17:90b:3a4b:b0:2ee:bbd8:2b9d with SMTP id
 98e67ed59e1d1-2f83ac87b59mr25632915a91.34.1738561432261; 
 Sun, 02 Feb 2025 21:43:52 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 21:43:52 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon,  3 Feb 2025 13:41:59 +0800
Message-Id: <20250203054200.21977-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add
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

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..5cc712ae92d8 100644
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
@@ -126,3 +128,13 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..1d9ac350a1f1 100644
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
@@ -129,3 +131,11 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..89712e262ee6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,59 @@ uart16: serial@40880000 {
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
+			phy-handle = <&eth_phy0>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
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
+			phy-handle = <&eth_phy1>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
