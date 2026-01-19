Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89BD39FF5
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 08:34:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C4F5C87ED3;
	Mon, 19 Jan 2026 07:34:00 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552B8C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 07:33:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so24557845ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768808037; x=1769412837;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
 b=I2dRmxMdFXI7tn2YVANdyPFGUx8Omj03yZXlF54dF7TewVbFF+PDDIknuyLar7OKFm
 K2/RNNFSV5WeYwZF850jR4AA5ng9eBgfjgJPu5puomi60v8DHWo9/x2ps5HDYfJnKHG0
 7SleW1BtPJLE3LgaaivP+R0STCcOgw4FMPcT+qZXMYtZWk8UPAtpMzamwx0gOLte/pLS
 erbhwsORNe+ASoA8JSSZxGGkOaE3WdNYaSNEJoTA/tKaxBQ81xF17gkLjp1QFVxMMD48
 o87EOV4DIksj8YniT7jSelOLtcmDFKrvV8Fnu6xUC0qDJ6eaT24EfA7YdpdNUA4lN/VX
 /epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768808037; x=1769412837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
 b=cFXe/2R0ea7QLLfTdDCGC73Urj0WbbCi55kZWRYAyFxZmKvJqpZOngR6SkXLhNzLn5
 tqKK/skXkcCkJUxSCKtAJsh1JniVWoa1VA8eAVQ8kLH33v/dtO3jc32k/5imPrfznGkj
 2YcPJXr7dGB9rTGxGkKuK/tRl8+f7+w7FiIr2C1Jv5yBsJGXlJzYyyK0Sz5RiffIKyWg
 tHcFYvreq5n3MfRtlKvVp4K1X8+iSEChL9pLhectl959pWuhH4UmG+suj2VQAePBsHk/
 9ptUjLrYuDqvo4InSkEsHnhJLVg1mO5cMK4AHEL4abkuPVXfkqGWzH0wC/V2GmakIxnY
 N7lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWltKR9PlRNYHOMspDiMbWW5mgJrNgFdtgW/x/otw5mY68cxyYjN1uNHaSSXa8/3gUXtnCAlCSV8zkNgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHqJbqoSiwWGJEMtSkPP0JUcQulkx1bOpqq1BxSnO5zFqj8UQI
 +cp56YKQ8vAf+BWIygogzclqFQU/SxMXvt/7MVF7D20/Ed7l+3U5MvSw
X-Gm-Gg: AZuq6aJ13tzlBH6q78CIfCLNgF4cOj+XYIpXLItkEvsIGpgf2/YecFHdIAz1sA1tZKg
 rb4YALFOpxChvgMkK4cUBlfn+QrQQhy667CvfDypxbKaeSCj/x3bpo7Hxp4f+XnplbF7S5whgZq
 rvF2Tenb2lpcelUbV4XWwAaib1797tT0kOpShJB6wPsEdSbJ+rrDSCV61ihWUBJJ81ouD0tp0hC
 cQgJz8zmZQMBBTfRs8mQeKgnPDXV8DwGBBeKU5PrePBFNJzFW8ZKxevBg2uyPAENXvpW8Xt7poJ
 xfoKtYVJ6ZO7t7S6qKQTepID0TmfAAhP9FEk+Yt5K/saIFiP7rUkQZwSU4mbSEsazynfsgH3yqC
 NXPqIbaVxkK3spTA7R3DX34QVyNov5PLwUSyc9BEt6c5D8YQ1leg0Nbcqrl43KSfNPw5tj7uvQQ
 VaedEgW9yn9UzhqsCPVAoBpSG17eYpwQo9Sv3H1zQj0MKUQVs7twrETNxdOBXDj+wmTIPP2Fu+
X-Received: by 2002:a17:903:3b87:b0:29e:93be:fe50 with SMTP id
 d9443c01a7336-2a71891ace9mr83664425ad.42.1768808036852; 
 Sun, 18 Jan 2026 23:33:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 23:33:56 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 19 Jan 2026 15:33:40 +0800
Message-ID: <20260119073342.3132502-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
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
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
old mode 100644
new mode 100755
index 9482bec1aa57..5cc712ae92d8
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
old mode 100644
new mode 100755
index f6f20a17e501..1d9ac350a1f1
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
old mode 100644
new mode 100755
index e51b98f5bdce..89712e262ee6
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
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
