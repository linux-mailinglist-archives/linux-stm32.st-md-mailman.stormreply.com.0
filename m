Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85629A0AEF6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 06:56:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44CD1C7801F;
	Mon, 13 Jan 2025 05:56:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A27E1C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 05:56:23 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2efded08c79so5222901a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 21:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736747782; x=1737352582;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
 b=IQeOLe2sTYyfqAnA1TY4NvtOjRsQa4fumX+ENH/2y38yZhRGg6KwvBATdeqYs8vB5w
 DPEdLRsQcVTtJ9pcIeWgaK4l/FrKIjnkiuw1Y2u1j54zlq32udxRoSSxZHoIz9r1xxAO
 IQsaEPxYRX+wm/5BP2BJ0lP2omkDdYsd1yMKGLK9l3HodNLyboOSTWhqrXfIrrQEKhmr
 pXLC6ZdUu1A2dH1O5PEPjm5uQ/dt8pzem/gigMNXvtLEK0yN4kIr1akUlLqz0Jt1XPgo
 +HvG6VbLVisbh7V+t75IEVnjZxE9+gblxE2hEWSKloovVWvXuuVxEXWx4U8QpDMT8qld
 3TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736747782; x=1737352582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
 b=h117c5qwhc9zQ7hEPok9jINROOp3ueE2SCcKu5CtXW2buP1X+pwL5eOFvvb8bS4C1v
 k8yXboGBF51i3QW9OfW6Ek+6j2W3yy2o51fJoKD/EoxTQAJaqOUATaeruyYsJkpKhAEL
 49hk2pBOBlDXTdn+T4jbhuTs/bwQi7pjxqhay2dbXz4/eFJ01IIL5mLa1ZFaQ8gDKWT5
 JRlN1RHcLr4fVoPwBYoMK7Xwykelf+uPiNUNtDg4b6ZYVLj/JgpV9zCsAJ263/Tepz75
 Bajs6Dk22LXL89ypLcmB0zhlypfKU+Jw4h2QsP6BQQYRXbuFz3YNU9YeS5bFGzYQA5QX
 pclw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb/SvxXQRuBQnXQaCGdG/xhDnxlCIG7UOukqrmjAJK7A4uBk8aY3aXsO82bbbB3/Lu7SRxkcAbv8iiLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytUWocaqyKVuPfHJNvck4nT1CzqeAnWcKigDGpTS23fib7tgvz
 5j0srgQeijJpbC4tGYs/EMUwUWgrfpCA0rqdGCbTJ8HXNFA+FfYU
X-Gm-Gg: ASbGncu6WRyqGDBQ8t4AyPWm9UB00W0+G6LHaC9zLBoTB3wz6+xpVbFp2Jwp4PR5Ww7
 0uSrb5Rqz9o2FXmYo+4vUh8OSk9lDuULKYdaBBzMz8ZEFcv4NVeUMTt/C/dxM8wzBF3na7nP3ve
 NJ+cr0806mtDUgEC4a6fB1tgKy+2f/z9H8ID7zCgXkfxbn9WGJyCeCkWIzlmL9RTIevl5/uWLX4
 6UuQEKwip6O75jwjZF5MkC6LNjUkRfLLc+g7L9r38vM66APpZwpM2sKJ+wzzJz44yBaDhjvX2J2
 E4z4CpDCRTKUqeCAU8GjsQ==
X-Google-Smtp-Source: AGHT+IGK0pCUlGTYvHgXQyXKxRtr0riStVYSpTVlyPsCu8rNr3XTWRKoYOATBlijrdcahHUK+OCu1w==
X-Received: by 2002:a17:90b:224a:b0:2ee:49c4:4a7c with SMTP id
 98e67ed59e1d1-2f548ec8a4emr31105280a91.18.1736747782317; 
 Sun, 12 Jan 2025 21:56:22 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 21:56:21 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 13 Jan 2025 13:54:33 +0800
Message-Id: <20250113055434.3377508-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113055434.3377508-1-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 2/3] arm64: dts: nuvoton: Add
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
two RGMII interfaces for SOM board, and one RGMII and one RMII interface for IoT board.

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
