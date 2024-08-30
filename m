Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AF966BBE
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 23:57:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32663C6C841;
	Fri, 30 Aug 2024 21:57:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4156DC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 21:57:28 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3EAEF88D27;
 Fri, 30 Aug 2024 23:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725055047;
 bh=BqIroqOm2GBvKoRexE68+wxWF9ucHmKK5SXsq/H2Vsw=;
 h=From:To:Cc:Subject:Date:From;
 b=XvipLIwyryi6u8M7wbVaECWXulLpN4Ei1/c8ba1bsAj5jsT2hGEv7s/EhBMhuz/76
 JhDF78dwHBumSKTzK1uggsywzbhPXh6EHUoR1+y9ti/p3IbF8pn/tdgrciYFtrOzRm
 xKhhdFOYhwLARWPCpJk5nnZDztMJUmmm9m3hlFiOiLm4e9mBJ9L7DwixfQ9hjquMRF
 crwsNi5X4RGXZ7l1vMGKuH575ke72A2jYP7/jtVKB2BdHZP6oaEJp6e1mGGLMr7KWo
 1SS3rjkQqKZVEJz8FyeaQ4fJCXfxCJdxqammlI86t06f+ZSaSdJFunndwfQNTwoWXW
 crZXIKMdnvP+w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Aug 2024 23:56:36 +0200
Message-ID: <20240830215701.103262-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: Sort properties in audio
	endpoints on STM32MP15xx DHCOM PDK2
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

Sort properties alphabetically in audio endpoints of STM32MP15xx
DHCOM PDK2 DT. No functional change.

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
index 466d9701add0f..22a2a204433b5 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -191,16 +191,16 @@ sgtl5000_port: port {
 
 			sgtl5000_tx_endpoint: endpoint@0 {
 				reg = <0>;
-				remote-endpoint = <&sai2a_endpoint>;
-				frame-master = <&sgtl5000_tx_endpoint>;
 				bitclock-master = <&sgtl5000_tx_endpoint>;
+				frame-master = <&sgtl5000_tx_endpoint>;
+				remote-endpoint = <&sai2a_endpoint>;
 			};
 
 			sgtl5000_rx_endpoint: endpoint@1 {
 				reg = <1>;
-				remote-endpoint = <&sai2b_endpoint>;
-				frame-master = <&sgtl5000_rx_endpoint>;
 				bitclock-master = <&sgtl5000_rx_endpoint>;
+				frame-master = <&sgtl5000_rx_endpoint>;
+				remote-endpoint = <&sai2b_endpoint>;
 			};
 		};
 
@@ -246,9 +246,9 @@ sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_tx_endpoint>;
 				dai-format = "i2s";
-				mclk-fs = <512>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
+				mclk-fs = <512>;
 			};
 		};
 	};
@@ -264,9 +264,9 @@ sai2b_port: port {
 			sai2b_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_rx_endpoint>;
 				dai-format = "i2s";
-				mclk-fs = <512>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
+				mclk-fs = <512>;
 			};
 		};
 	};
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
