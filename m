Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0210966BBF
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 23:57:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A3CFC71282;
	Fri, 30 Aug 2024 21:57:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F92DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 21:57:28 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2274288D35;
 Fri, 30 Aug 2024 23:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725055048;
 bh=Kp4sunbJ6BV6TWvUBCuwZKT9yhDWSvDKaTWgWn0Po9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6EeY9Di7Hg+2HVm5dE4DXoYmd4FXPfT+fPvltLyqRcmotulod4xqN74LwJ1IXoP3
 YvA5L8z3zODzRdIASOof6qzXYGbTxPyCd+GWINqhZ2WCxTGZl8tXGfmPdcWKyFEVfZ
 5FBHz6UB8qLWiOV3SMCLzXZiRf6anc5+NO4uM2g5zLy2Ej5Q7LBy0g/UUNdkEuXpAz
 GkZ67h1IkKoV4LsYwH424iAjtZiJqSwRCZsg4a0nCfonKYF1o30glqrRH9mLoiwAi3
 YTneh54Us/Z9bPuPdev7pdEdLJDO+UEPCk7W4oNVydlwkgQFbNrHyuj3utKw3+tNIQ
 XI5+8LbGHu4Tw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Aug 2024 23:56:38 +0200
Message-ID: <20240830215701.103262-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830215701.103262-1-marex@denx.de>
References: <20240830215701.103262-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Use SAI to generate bit
	and frame clock on STM32MP15xx DHCOM PDK2
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

By default the SGTL5000 derives bit and frame clock from MCLK, which
does not produce particularly accurate results. The SGTL5000 PLL does
improve the accuracy, but also increases power consumption. Using the
SoC SAI interface as bit and frame clock source results in the best
accuracy without the power consumption increase downside. Switch the
bit and frame clock direction from SAI to SGTL5000, reduce mclk-fs to
match.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index ea933da64903c..171d7c7658fa8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -191,15 +191,11 @@ sgtl5000_port: port {
 
 			sgtl5000_tx_endpoint: endpoint@0 {
 				reg = <0>;
-				bitclock-master;
-				frame-master;
 				remote-endpoint = <&sai2a_endpoint>;
 			};
 
 			sgtl5000_rx_endpoint: endpoint@1 {
 				reg = <1>;
-				bitclock-master;
-				frame-master;
 				remote-endpoint = <&sai2b_endpoint>;
 			};
 		};
@@ -245,10 +241,12 @@ sai2a: audio-controller@4400b004 {
 		sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_tx_endpoint>;
+				bitclock-master;
 				dai-format = "i2s";
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
-				mclk-fs = <512>;
+				frame-master;
+				mclk-fs = <256>;
 			};
 		};
 	};
@@ -263,10 +261,12 @@ sai2b: audio-controller@4400b024 {
 		sai2b_port: port {
 			sai2b_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_rx_endpoint>;
+				bitclock-master;
 				dai-format = "i2s";
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
-				mclk-fs = <512>;
+				frame-master;
+				mclk-fs = <256>;
 			};
 		};
 	};
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
