Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A15CE806E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Dec 2025 20:17:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB861C58D77;
	Mon, 29 Dec 2025 19:17:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AD62C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 19:17:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E2846001D;
 Mon, 29 Dec 2025 19:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C83C19423;
 Mon, 29 Dec 2025 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767035871;
 bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CkLAQgp8JVSDw+levfEh/+99v/n5tBInf8dxR1N1QqBnNaydcPDsXEJBfHxcYBqb/
 Gea9WKt0+bKw4JLmSUIw7VgvGawkg5SkpgBIr1xR+FZn2zKdz9Bq2Obq5ZAfk02pac
 Qau/Kfzr65vdkKVjkz+M3tu35gaTAY9nMH9g7klWinh9P1fzyAOj40KaTiB7QT5wTM
 o3B8xjcKNL2BUXzLMiR/+mgrTvqJ8+Ysccntso6IzbwLKuZv8rz9gAPxyJtu/mHPGT
 2cpPDUl5p0xEpmcA3lF3qjninqMZ6j+tPoGaj2yE/0I26X8jgE72KDTawCj1qNEMAP
 7dIb08vj/JXtA==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 29 Dec 2025 13:17:18 -0600
MIME-Version: 1.0
Message-Id: <20251229-remove_ocp-v1-1-594294e04bd4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPbqXk/Yw9UdSOyLmXm8ZWv+eUnK6pQDTyNC
 YUmv9imar+JAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT2wAKCRAZlAQLgaMo
 9KK8D/4hqNU4cTNOQyotM99zfD/zz6svCjL5f6T681rTo5pnz3KekYAqQ03O4Gqku+Nm1bm22S+
 U3IeyArqIgmpIX78aVOAoX9Bju4JDAoqYjDraM+TGOl+6SOK6GcJK3hvo61kqO1RIPaNjcYr4WU
 6B4LgkKsnv6uUTDkUopFo5O0NTyEFU+V7Gy5/Ip8rEj+PjD4EK4GCIyBz9GiHJr60smcjgxwIoD
 nChCAWPNLC8RFPDRIEBx7dC6soR2P8CcQ0VRQIO/EcbIfXXSAn0VIOSyPRQZB0xxktqJmrwJqW3
 UT10/+2qabmUdFwtkfWfNXyB3tAfevCTReMxe2Y5u1BrAWBMVEQ4ookLfZAaWV0X5HgNHxq5B3B
 ixORAJvYFo37xOMeD1LPe6RQHWAcmddoL+K8ATLyNswy3a/YqTIupgbQPjjM44SjSbQJOde1dqq
 dVYF/k822pbL508qO49HzfcSjRwky7MIJIRoVVRroWXF1RJ8BpbpJ1ZUvdJStsNltCPi/Rne8N/
 BfVDuJ8LVIp9Un2s2IcIGTEzYnCNh/i8aqnibK5PTtENys6Qsx+Mkd1krDdfvUFuGlnpHBwX6gs
 AwqCF5cUDhsUZanfiaYa2dxS66CW2bDNVqTFnWq2VNNiJms5TSfw7DipX+lmLoZccBecNogITvu
 K/QLZmcl69LU0Gw==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
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

The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
platform is essentially the "ahb" reset on the standard stmmac
controller. But since stmmaceth-ocp has already been introduced into
the wild, we cannot just remove support for it. But what we can do is
to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
will be using "ahb", but in order to not break ABI, we will be call reset
assert/de-assert both ahb and stmmaceth-ocp.

The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
ahb reset to be asserted every time before changing the phy mode, then
de-asserted when the phy mode has been set.

With this change, we should be able to revert patch:
commit 62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp"
instead of "ahb"")

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index a2b52d2c4eb6..79df55515c71 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -407,6 +407,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -436,6 +437,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);
@@ -463,6 +465,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -489,6 +492,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);

-- 
2.42.0.411.g813d9a9188

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
