Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D19C18D72
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 09:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D471C62D43;
	Wed, 29 Oct 2025 08:06:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3786FC62D3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 08:06:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11F2C49258;
 Wed, 29 Oct 2025 08:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E36C116C6;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761725185;
 bh=EILhiXwSG8mnsP3WGsVKBzN2WcZ7wKbqmXj+1wrNFzc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HIlPSwP91NTIR8DUNPxOnv/QWitRD5UCo3NK/LPNUYywq319bFSleyjDrASLyZOET
 EyIg0r/E+LHUX9/Hq+kfNL+Bos3HAlc31jpPtpI8ebdy1KmvlWbpeevQy/Ea0m+MsE
 CZxtVAHJ/EZkb4P+nKtVgKgkFcVUPxK8S7u3BT4icP5l9DzyGjLdGSKdp93YlfQpxM
 A7gXBhn4zDD0LE6oqsKQVGXdxN1R/kNNxiO48BnxfFr9jKfR/pla2chJzOGgRZwPjX
 q2cO7hiXVFPHEOKIR6bAtvg3xGjatE25cb+zcJGNTO3LMtqDlcnP6GoljUjd61a2N9
 knbmbYWBeMLEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D9E74CCF9F3;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Wed, 29 Oct 2025 16:06:15 +0800
MIME-Version: 1.0
Message-Id: <20251029-agilex5_ext-v1-3-1931132d77d6@altera.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725182; l=898;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=p2uWSKKuLwxCOpiNDSbfDTRN7HWTGIFC7QoK3weEpGc=;
 b=zvAEVmt+YCzpgZzoyQtINmkYcMh3/hMOKUNLU/c2tHXcq3h/po36vCnYfNbJL7FRIrYsYIqLa
 yFsbzkbCYp7Bbvx1f8salXZIKI48J2OoZKGS74Dg5MPOSyLxdweez8P
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 3/4] net: stmmac: socfpga: Enable TSO
 for Agilex5 platform
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

Agilex5 supports TCP Segmentation Offload(TSO). This commit enables
TSO for Agilex5 socfpga platforms.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c02e6fa715bbea2f703bcdeee9d7a41be51ce91c..37fcf272a46920d1d97a4b651a469767609373b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -474,6 +474,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 
 	plat_dat->core_type = DWMAC_CORE_XGMAC;
 
+	/* Enable TSO */
+	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
