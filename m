Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81AA00460
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 07:33:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 139FCC78F69;
	Fri,  3 Jan 2025 06:33:18 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 909A4C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 06:33:16 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so16520721a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jan 2025 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735885995; x=1736490795;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
 b=FoLjnaZnZOZaRMawunAkySBXBQ5juV5tMzdMJfthSKD2/n+M/d/MXfQcilixEY1bVF
 L3gD0aNj+46z5bOn/0850zVuigzrbxsl9tyg/WCBe8gOvuQlB1eJ5X3WIYoKmntiYA48
 f9E75wKxZUCi12GljcwT9X27mWeU+ozjmM+FMny4uJhe1tWJGNEkDu2BX7YkWtzBiWlU
 rk9M4kOxOKDJcfGOVWZa3yHFL66rlp351tW1phKk/EgiuBe5y0CsUyJ/hHJPlmLnGqtr
 /+ikCPBcg/+WNFK3/xnmCk189Dkm1bfTWS1px9M8fqvouk7PqYy2dCVI6Mu6cC5HqS3I
 Z7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735885995; x=1736490795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
 b=rOLuCUltFMihpJbIEzOeKO3x02ZVJzQmzoK54KzX0t+liWAc+E2fBsNIFJVLWFR3nB
 kYoZ27mQwqtr57XHQz/jsEh//I5BjCaiP2bJX8fHvPX9Ys0hgXtlWiGEZYnyXAkege1y
 KHlkH604wI6VKh7lsDnyMp/vRJa1wANfDQXBn8bDUxEyOMeqHfLIAVR0+QW+0d1WOUxg
 JMkK/WVp+7fD/lk2M8mpu+rJjmE5jQ9GKx7zR+xvnrBrwGPXpJ+5fVpL62Zl3K9erq4k
 fAkfx5B+yIiSRx3q7Bq9bzMwrMK9I6UjgTOLukMcKnANuQmBgM9Y2chdI3oHTdUejc0y
 i+yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTn8I6+WZ4ldUsdomHRn3ikV/rLeoEUUMCjswUgbPFDl27nw5goJ54hvJFaqyPggtiB5yNJJSVUdI3Lw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygqJ3irZUiIfydqAeA4Ag+5FLM4Sn7j2czUzJSzuTj4dxj51hU
 eqsbtm9Ll1wes8dzIiWOo/nzLICz/VPFHuN3KnOZMOb+2e/0VI/y
X-Gm-Gg: ASbGnct6y1JfGYUJnlatnCkkY5x/BmsTPpRDVLemy1OkOMD6M3iXBykswqHgrhwvjnJ
 uNkgrcw7rC48FO9Lm7F3io1wtxgK2Tohsbr6DBty5K2nY/+T5QPfxM8NqvyR+C7yJptoLGZ2+ZG
 uK+sBu2owY/d19WMCUkid9oDys7iEODJNwCyYX+1V0y9CMPp3vCxVcauA7sNs0dKiqtuOfJfpFl
 WjQhxZas4AhWWkzBkzzHUjjz5ujlud0HZ9TLLJi4PWdGSjF+hwQeTMgBwBFAKF3PrVcV4R5paWw
 gZc6oVSOeotHY7yXofgfNw==
X-Google-Smtp-Source: AGHT+IG23kmj6DK+vlZPS0EcCMKK+e9+4Q3xk8hUGRJ9aeWgvaZ8mRigTjEz+v5buodrd7CiMiIrMw==
X-Received: by 2002:a17:90b:520e:b0:2ee:c9b6:c266 with SMTP id
 98e67ed59e1d1-2f452e22592mr69746730a91.13.1735885995130; 
 Thu, 02 Jan 2025 22:33:15 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 22:33:14 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri,  3 Jan 2025 14:32:40 +0800
Message-Id: <20250103063241.2306312-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/3] arm64: dts: nuvoton: Add
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
two RGMII interfaces for SOM board, and one RGMII and one RMII
interface for IoT board.

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
