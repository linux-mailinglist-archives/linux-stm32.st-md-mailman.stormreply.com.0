Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00490D02DC8
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 14:08:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C53E5C8F282;
	Thu,  8 Jan 2026 13:08:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96E37C8F284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 13:08:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B032E60136;
 Thu,  8 Jan 2026 13:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07276C116C6;
 Thu,  8 Jan 2026 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767877708;
 bh=zzfKZcs3JKUANgBbQm5V67WGSuiqbzhNyOZ+JkUeHv0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EFqj2r7h+3BQhj13CjsMQez9jQX02SF95uG1X5t7ID2LqMEwrzqJB1aZrx4fqu061
 W458UVJC1WDgkijW+H4/sMqKwZ2ic9TWZa3IWxrgftf3JQlGct+oHtK42buxuq/7ZR
 V19pJqvXovETaDE5T21+oSC9RAIDMIec5UPMQLo3ZN90fT534LY5xsIcGz8K24hObn
 iBGjyJCgMqATD6kSsD1Q15FWTQMnBQZEyJs6eVrY8Rr8eg4CbqZCOpsWPQ+vSBcLpg
 +1mF6GdGPxbf0dOjCFC3X427fXbzXX+Qzkx1GSKMDSnL50friBb/IhNCFLi0YNCIFp
 ARVUuDhfV3lIQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Thu, 08 Jan 2026 07:08:10 -0600
MIME-Version: 1.0
Message-Id: <20260108-remove_ocp-v3-2-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
In-Reply-To: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=zzfKZcs3JKUANgBbQm5V67WGSuiqbzhNyOZ+JkUeHv0=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpX6xGGWdQPpVq8qYm9OlaaTePBrJYKVLBxsdwv
 083GmzhNlyJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaV+sRgAKCRAZlAQLgaMo
 9OuZD/0cEohrZMBiJ9+Hr8v+FNP4SWi2PDnbdjjrrH1XtMNbDYBr4nQRJXrlqGCvRsbj3HI+jBp
 WP2HQkHGaHYmsHXnVt16KNOgqxFsxWKcT6oQt81RvsCDmQ+NUl9iHEqYAWDSaPsKY5fFxqy3gFc
 s1oXUvptc8oac7b1x1nevpzFMpdt/zV/pnJSwiKaDeRvhF219Kh5oihYBOO7xYYCaAmkRbL2FG1
 2KWGHhNSPJ9rxCk+MUVDFMaJX2ILjyfmKoM/suoLKzh4/jo+Om/9H2irhbLXQXekurU7S1FFzkP
 fZ+86SFc7wkSJ8NrpHVBs7PWqzIH0TBkMvqqNv8L2z7y5oIYM4QmNQhnyhoIwrI1uhPK7bQHdx7
 0fokdMs7SGRpAPBwLOsdavcWN+1ndBWfU+P2LzkTWaqYFLr/EL+JQO12K9qqytngujojC2dBbd6
 xVVsaA7vmfu5yjAF7Crn+hVVWFUqajOKqZttrbk+8s3ZgRT7SGXivTP5CsaPGXVwvxtVRxxXlEY
 WJi/ykJYVOFqE5EfkG6GMyBG3vNIK0/noa7g3phua5fzvCfeFsWIkGsbFhLsPr+7tg5wq4PcrV4
 6KCIVkhrFzWpnMZhUOMZ7kTPm4OxyJYNUAJHTvklgfPbPX0eiNtzKNZRim2aGgbzTMNW22j4SUy
 2NFHASTH1iB1sdw==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/3] Revert "arm: dts: socfpga: use
 reset-name "stmmaceth-ocp" instead of "ahb""
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

This reverts commit 62a40a0d5634834790f7166ab592be247390d857.

With the patch "add call to assert/deassert ahb reset line" in place, we can
safely remove the "stmmaceth-ocp" reset name and just use the standard
"ahb" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index b108265e9bde4..6b6e77596ffa8 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -440,7 +440,7 @@ gmac0: ethernet@ff800000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -460,7 +460,7 @@ gmac1: ethernet@ff802000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -480,7 +480,7 @@ gmac2: ethernet@ff804000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};

-- 
2.42.0.411.g813d9a9188

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
