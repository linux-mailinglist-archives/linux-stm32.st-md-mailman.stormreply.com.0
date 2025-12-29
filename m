Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA89CE8076
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Dec 2025 20:17:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAD35C58D7C;
	Mon, 29 Dec 2025 19:17:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76ABBC58D7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 19:17:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 678E4443AD;
 Mon, 29 Dec 2025 19:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F1C4CEF7;
 Mon, 29 Dec 2025 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767035873;
 bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hbAzqKEZmOT4OAvGjay6ZbKxfEn89vFk6+M+/mrBS95qYTDFYK6teKSpepbtbDVhB
 zVXaWcqu8M/VicJWW81BU0DhomB4O89rfl91yekn8Sd4aHeZLh1lAqdIXm3W4czws6
 bKs11DMTutMn5CWlVIk2rYic1zabSCi4UVuhtROByqkED1kK9jdCYbjbgflZTKzeRE
 5REfAeRWGXVrAriI6asDhF59r/DM1zwjOyAbOEtqtWEsmKkivYmBW2eLrSMSvT+GTM
 W1IlAnfSamIwk9sqANNok68HO6uzO/lVgGLgLPKspXX7NCfsu752o5Q/tP4l62R66y
 F8+j0fB+S84Ng==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 29 Dec 2025 13:17:19 -0600
MIME-Version: 1.0
Message-Id: <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
References: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
In-Reply-To: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPcHIcFizytq0dGZkNW22rpAEY2qpU74OH1O
 vbi6hJ2X7eJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT3AAKCRAZlAQLgaMo
 9FG2D/9jgiEwhyxfOr5Mo/+NnTLWSreSDld5RyR7AHNijUW/gR6BWUBKC1AHObHTYPrGVx4EIFf
 CJUPAZAzCSbL7Q9WViMlHQH4JQcyHA6kEOdiPMlFbqjuppjhr449jsqofenGJFm/gC3JT30vYPy
 8LyhPX1b7P4mMX7ySrXDVJx4B5RGB9Sy7Cv2175rjrgLV1CRpvzxdTVE+bU9/IpFa6sBMhBf0sB
 7qDwsSmc2vYHBWecOjM1CfQ0RGTecYFrnXzleh8jrZM3xJqDkr5o3wqG1SmYadsiukMQX6tRfTG
 eagGt829RmEzvNIO1mu2CQdsx34EdwcAclUW+h+AUUShShSlpbtlotxxjziaikFRHeQ/szfeLlW
 Z3d9IFkMSOcy3Yom13452NSZajaL1gV85ijQk+3yu7dznepFMvyso4iIkYB/zj9lq9dH1S3KK3x
 MURAtDLL+o1zvT/gwOusDI49QcziwRWaxjkabzuNxMujPGVHi9slExTjdOhL58gmBiPrGvk7Vmj
 yxzo7dmotSivdQ0KQnFKRlEFMBN8N+Gs1ASuYmFwTFSwpC6I/jzxxTy6JvXj/zvSP7pXb8pzxvp
 cZ3Ej7YqYzzecHH+lBIHAuS3+No+VvQP7UpBXdV4V7paWM4XpTMODhqmYppkELZVWfqatiIG9GU
 MWd8Sx8Kg4lRuHQ==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] Revert "arm: dts: socfpga: use reset-name
 "stmmaceth-ocp" instead of "ahb""
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
index b108265e9bde..6b6e77596ffa 100644
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
