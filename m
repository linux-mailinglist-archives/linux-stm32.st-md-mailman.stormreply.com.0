Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8CC18D6E
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 09:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8B9C62D40;
	Wed, 29 Oct 2025 08:06:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3378DC62D3B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 08:06:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CB0A49255;
 Wed, 29 Oct 2025 08:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D52D7C4CEFB;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761725184;
 bh=nWVHnfvQBRA6ZVCql74XqpzDCs6ZKXaKNS1r6cUtQN8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=BF8kseVCLTniC7aKmiJggehl13MTS9buvUEBi1IODDz8i9x7mkb/2pAUrQ6JWJ5Fp
 ccyrw+Xi1eYUAzCdNP71AW6juFGzIHkGmTN67J4yqiatF9D3IEUrjsZa0uGZrvBhGu
 FBfD83EApJvp1ovk2ovM3/0oLc9LfY/ak16lVliSEIfQA8Gllj6/hP0m3q803oQbBr
 f+zpd1ciAP54xOFMfYOsjpd1LrmPLEOLOSANJZDhhRPI6Dc6/EGWm4Ir42hI34MX3o
 z0nmOgBE4e83z2CdPtanvXAXWERQLc6D+itE4bJAXyKDdDNcXtlkpE1v7SX4q8/4lg
 Aw8rCdo7WgNiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C8FDBCCF9F2;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Wed, 29 Oct 2025 16:06:14 +0800
MIME-Version: 1.0
Message-Id: <20251029-agilex5_ext-v1-2-1931132d77d6@altera.com>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
In-Reply-To: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725182; l=1189;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=xSJKSpzgBUj6X7SaRiqPgyeJfwi6PIzrINgCzQeog7s=;
 b=8SDkbxGig66XtJrELUxq38wXz640VIOzsR/gO+kkHJvQzQZVfXdl5J7m1gsIdbdgDYQZiKbl0
 cKATRITmZzNDbB6AewGNQndYuQwl85NB0G5Y9LEWVUbJ0LywdZ8FRxM
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: socfpga: Enable TBS
 support for Agilex5
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Agilex5 supports Time-Based Scheduling(TBS) for Tx queue 6 and Tx
queue 7. This commit enables TBS support for these queues.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 3dae4f3c103802ed1c2cd390634bd5473192d4ee..c02e6fa715bbea2f703bcdeee9d7a41be51ce91c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -473,6 +473,19 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	socfpga_common_plat_dat(dwmac);
 
 	plat_dat->core_type = DWMAC_CORE_XGMAC;
+
+	/* Enable TBS */
+	switch (plat_dat->tx_queues_to_use) {
+	case 8:
+		plat_dat->tx_queues_cfg[7].tbs_en = true;
+		fallthrough;
+	case 7:
+		plat_dat->tx_queues_cfg[6].tbs_en = true;
+		break;
+	default:
+		/* Tx Queues 0 - 5 doesn't support TBS on Agilex5 */
+		break;
+	}
 }
 
 static int socfpga_dwmac_probe(struct platform_device *pdev)

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
