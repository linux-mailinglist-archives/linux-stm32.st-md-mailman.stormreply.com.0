Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EDCF36CA
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:08:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B6EBC57A51;
	Mon,  5 Jan 2026 12:08:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C70C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:08:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77E4A437C8;
 Mon,  5 Jan 2026 12:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377E6C116D0;
 Mon,  5 Jan 2026 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767614925;
 bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VIKmTCtAL0IUVFWQJodtnLn+t4Zu8BYI9xmeNhu8XhLQ4Z+y+c7v+n4MBDMajRbcU
 wxpPwAbg/A97wvgN1KBF6ziopo8e/HVRXoeqTlmBGLZb5ijerm9Tazm8FsQpvTjqtN
 uFH5t8ZT3eFB2TR1AwgJLVGLQam3ArzhhZ3xd18G/f/cfmh/kBiqkDd54VxjdllZm5
 nPdD+mIzm0blK+y23m+gPuXuoAUO1oU2K4qauIFdQRkE5c8QLmOWdhyt3BPslrRhaq
 OSZH+SwKN2ygxt9FyQHgYUOeMUeaMnSMJvQgcjkPTeL2fqGPoCav+jiRM/OpC/9ZPz
 XH9Nzo9VFJyJQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:21 -0600
MIME-Version: 1.0
Message-Id: <20260105-remove_ocp-v2-2-4fa2bda09521@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
In-Reply-To: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
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
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nEWd7mbEQX7sf3uR0NJjUGW8Tiyng8CFOE8
 ZjjyH4efpCJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupxAAKCRAZlAQLgaMo
 9GjxD/9c1SPrLDQhnKon7tu1O65dvg8pnvfeRmI0oeQWVUQMiEkCmXIaWsiMHJ+9rPk69TzKs91
 kfZkzziMVUZzwfpYk6xsqxi3fF8XxT+0e2Z9u4Hlj68G/5iNOGuYxFc+LHZNtDpO5MvsJGq/W+l
 33RQFbio8aJDrJ13P8fmJxr8CYgntwBNh/IDFawkcSIAjyX5FXOk4VHDuvcWWYDjIpNwK9miAou
 08Igff5AItrGsXSnSYizElqGr37FkLYUCBOsPJ+ygszn4oKTcpn2m+XYymq/TYsIFrmvUAwy5/J
 hEXroGMuZ5Vnqh6w9btIsvQ0OZTU1rpJgYx08VpPLRN488/MSPlxcspmKlgi0W8j2q8v0jiEbzq
 ZbhrfUblLeavGuqWwIoMsqIyDVlelVxN+pydFq/XXOJvMaWS3w91NUceSbLACSFeIz0fpCgU0L1
 S2JsIsVlwGaloixM6O++rlSPham/HAA1wMmk9Lh4XwX8cjJDeDyIQ/r3Z7sIOfKYoDpiuZOm5WG
 KkyRwOOCELmY0ZdNzyl6AUWJ/S2nJr8dNd8NWS0U9cApfwaRNJfswY/Zy1a5el0IIhkfTrHcIeg
 NhiuLokskbbyCW5S11LQ3rUs8GEEwMeQQMGKtgmBi2dJrQ/ZyUjabvFGfkviJFSwgVcE5GlNhYP
 5EYo09axGhIFhVA==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] Revert "arm: dts: socfpga: use
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
