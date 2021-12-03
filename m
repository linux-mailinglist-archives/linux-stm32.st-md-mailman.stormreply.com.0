Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A562467BD9
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 17:54:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0B2EC5F1D5;
	Fri,  3 Dec 2021 16:54:50 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84385C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 16:54:49 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id l190so3621260pge.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Dec 2021 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UA3ii36hU7CdFEgS88eAZUCDHAYVIn1jZ23qtSJM4UQ=;
 b=ooGW6c2JtcWB6Z7qX/xxQgDAgbHQXqbIOErmLKsxLC8fe3xCwRbXjvVK/NrOOMfh1p
 pitbMmaJ6twHOl/1D89GbJyC6AlFIRHfNFKFVs5rNkkfsemwclyL4NpySf3j3mnthZ4k
 IqGji4pbnlff2wdzE1EOJp0brNBZtnRWuMCD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UA3ii36hU7CdFEgS88eAZUCDHAYVIn1jZ23qtSJM4UQ=;
 b=p6Et2f72vC7wlpNPW8NfA64EwZM8/O0o94Loqu0h2Un3dLFCpS6dStFXQmImtOENnn
 styCRWh4jsJDFR2qf9k91ZAHDP/rNHMCtuPbUlVaNzdf27Q1wBNEmYzF0HVysrTS1tWG
 eEDYZBvoxdqM40HrNwTbRrYiXS9suGc5CZPVnc8Oo1atGJNfh4Pw2uI2SwcLJ4kSMxMa
 ATXrJbJYm1oo9TBAiHvM5p8/wrqA/kLcI4az5gsM6iYAfeiJgk5mRZBf1NE87ppSAJrW
 MvUHvCpK5+NhRbyJ817S5UBxAPhdnnRm7XtdGi2Fq+XAEeaFuZcYnjnVg5v2gJ6F2Ca4
 ta5w==
X-Gm-Message-State: AOAM533FohYzR0CRzAFljesvwoWa2LOrLpJZkyFxSZMNTWMoDH7GJWh3
 5tTXH3jnYz39Okr1GOHprEYNVA==
X-Google-Smtp-Source: ABdhPJxJYkiXrbYqX6lTlZURwnlCJAqFBzbUOiRcQC2IgJNCDLFsdBPBjaMtqnwewL9ZpvMXR4gBxA==
X-Received: by 2002:a63:86c7:: with SMTP id x190mr5335423pgd.230.1638550488153; 
 Fri, 03 Dec 2021 08:54:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:9d21:588c:4f26:8400])
 by smtp.gmail.com with ESMTPSA id s72sm2783693pgc.69.2021.12.03.08.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 08:54:47 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Dec 2021 22:24:33 +0530
Message-Id: <20211203165435.8042-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] ARM: dts: stm32: Enable LVDS panel on
	i.Core STM32MP1 EDIMM2.2
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

Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit has plugged with
7" LVDS panel.

Engicam i.Core STM32MP1 SoM has SN65DSI84 DSI to LVDS bridge.

This patch adds a display pipeline to connect DSI to SN65DSI84
to 7" LVDS panel.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- fix dtbs_check
Changes for v2:
- none

 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index ec9f1d1cd50f..a797eaa917b7 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -24,6 +24,91 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	panel {
+		compatible = "yes-optoelectronics,ytc700tlag-05-201c";
+		backlight = <&backlight>;
+		power-supply = <&v3v3>;
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+	phy-dsi-supply = <&reg18>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			dsi_in_ltdc: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_in_dsi>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c6_pins_a>;
+	pinctrl-1 = <&i2c6_sleep_pins_a>;
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in_dsi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+					data-lanes = <1 2>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out_panel: endpoint {
+					remote-endpoint = <&panel_out_bridge>;
+				};
+			};
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dsi_in_ltdc>;
+		};
+	};
 };
 
 &sdmmc1 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
