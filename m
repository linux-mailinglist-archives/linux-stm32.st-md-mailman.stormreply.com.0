Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F845CF36C7
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:08:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F5DDC56612;
	Mon,  5 Jan 2026 12:08:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AF95C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D9596013B;
 Mon,  5 Jan 2026 12:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80B3C19423;
 Mon,  5 Jan 2026 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767614922;
 bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iQ+8nHQ2wrJ02GrUTDILvYq5BNdR9ALMiDIvib4zw2wPjGuTQIVJLjK5el+EPMgyX
 qLRjMCjJE4Xc+Xux8wXCSn+L4oHHIc0Y+m1xANzZovXVNwGkkwrrg/iubV0p0PWM9o
 mNCBqh4MVbH6/7AAwAtfcJ0aNXucjXAiOJoP7bvYDyav2zCdsVtC8z0B5DoBMydOkt
 q5NeduHbrQqDHJD2c6nfu6PjvM4pn8N6e/cOQFEj3iF2PDWPVNkDRSwQR8pVe5IehB
 GY86EU0TBUDl17CkrUCo38RwVwLdaTkK8ZaivHFgeOHHFaRmCdbSuIp8oIF3Iq3beP
 PfULfuu+rkiKQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:20 -0600
MIME-Version: 1.0
Message-Id: <20260105-remove_ocp-v2-1-4fa2bda09521@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nEkHwBUX1Fi3QuvGkVgapLLXU6emvOtPKFr
 eljJE0/ogiJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupxAAKCRAZlAQLgaMo
 9ObQEACMkYtt9G/PbVDY2AQe9ZvZU/5Dyv8Ahhyts72NOKkfe+fvYLBuJDLKEqiGVjThIxxqL76
 NEs36K5a8vCpnXkKF8wvYYMuslrMXn8Gfqx4fJ/Qi6C/avA9A4zeVGGV0D8ABNCQL7aGHVcM1Vo
 +Cqpdqtbczui618srTtXkGIORNWsXJEcpf7CA19zDK7mAVVwA8kbLa/qe5F3KjGxvdidrchHs1i
 +vlq8tOlw4Drsud29XHun6IStAgRrCbOWg151dv+Iq+R0DrbwHDCNJriSHn/cuDuS3IrcjwR3zw
 ZBQqo0KlLAS5py39t+66DMFea3W57ZDmOSGpjoO4WD0sfzbvmIIcL5kjk5YGE//9t1Hvj29iWwp
 J/B3QmJojaIOIyIVwxrd9O59ejwHl1Js6JHnKf8ZyDV/HDen1bRGn7s46ulkT661nDsR0yEPOG/
 GZIrQov6xmJX3zAOsCXhaKyw9VGy4l9QBdThZLFkMWF+pb2qCIyI9A1rwqy+6ZVbstmXbBpyZlN
 At6ryWMh4zpd8DDq2Est4A7iRzsYl+QU7Q4JjP39N2ogBj5/MU99Y9v1emQwTCD5pBPByJVX3YA
 BK1mHPcAwfHkpxDPxB+iIgIzjK3qt0xrlEcW9pc51MvUxh/GnjniGjrUqpExVX6u4hdTi4K7qrR
 vg/tKOz0L0LvIxA==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] net: stmmac: socfpga: add call to
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
