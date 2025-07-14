Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE32B14873
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40005C32EB0;
	Tue, 29 Jul 2025 06:48:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29EEEC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 08:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0186245C91;
 Mon, 14 Jul 2025 08:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB46C4CEED;
 Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752480027;
 bh=x7tBS5TJxVqQ22cB02A2Vi0xzr6SLrJTnF6VPCHBuUc=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=WUUqJAx/sxPwfUHZBKTN/pEBNRu+2xugoe5P+8CKGVR9znodPsnWpP8n8QTKaP39h
 kB/vr5SfJSW6bbAb8jt45oga+JRojaoB/ZziIDudTu8z0+ZDHDX3gVuAWxPKtP4lZZ
 1v7qz4k4K6dL14tDN6S0ru2GXlQW37t41BQlHS9hN3V5kgVhniHvKSO9WfsmEjatvL
 2Q7kbCF370XwJFdD6XpGxfnxb148k6Vc9qZt9e1SmEGxIXWs9jy7cazCYVsjVUwi68
 NqXFTJLpYZPm6yLKSduqCnqVIZaDhTTwn75lVwe80WStfd/uxZVm4L0s9wLAevHtMr
 Ie12TrVwJdsig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BD7A9C83F1A;
 Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 14 Jul 2025 15:59:16 +0800
Message-Id: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANS4dGgC/x3LQQqDMBBG4auEWTuQDBZLr1K6CPHXzsKxJCIBy
 d0NXX483kUFWVHo5S7KOLXobh1hcJS+0Vawzt0kXh5+CiPXdYuJN7U986IVhUcvz2kRCXMC9e+
 X8Q99e5PhYEM96NPaDauDp35tAAAA
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752480026; l=990;
 i=rohan.g.thomas@altera.com; s=20250415; h=from:subject:message-id;
 bh=x7tBS5TJxVqQ22cB02A2Vi0xzr6SLrJTnF6VPCHBuUc=;
 b=eOyvh3AjlRrzHzO8kmZyoZOWk31VG+/F2coZiafOWwdLSJAK9xzmHqHbMMCpIaCjoQYXDcbwX
 o0FxciB5jAlCR/+aFZH/hv6+9wY3JRJfY2tV2ejIrqE2psmZwydwODO
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=TLFM1xzY5sPOABaIaXHDNxCAiDwRegVWoy1tP842z5E=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250415
 with auth_id=460
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: xgmac: Minor fixes
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

This patch series includes following minor fixes for stmmac
dwxgmac driver:

    1. Disable Rx FIFO overflow interrupt for dwxgmac
    2. Correct supported speed modes for dwxgmac
    3. Check for coe-unsupported flag before setting CIC bit of
       Tx Desc3 in the AF_XDP flow

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Rohan G Thomas (3):
      net: stmmac: xgmac: Disable RX FIFO Overflow interrupts
      net: stmmac: xgmac: Correct supported speed modes
      net: stmmac: Set CIC bit only for TX queues with COE

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 14 ++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  5 +----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  6 ++++--
 3 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: b06c4311711c57c5e558bd29824b08f0a6e2a155
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
