Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97AB28460
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Aug 2025 18:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD478C3F930;
	Fri, 15 Aug 2025 16:55:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54048C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Aug 2025 16:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA1B841A5A;
 Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF2B4C4CEF1;
 Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276925;
 bh=zl87QclcDa3DKTevz342RWsdUkmKZ3kWOu2bPgZotaQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=d+DXsfzwZz/1607mPnylsjSqtFkdljLyHXb1M+0KtScK3u3fJozABnYjf/4A3v1dF
 /KPUafe1k1W61UwDtCQfnE5wiGCr3A+l9Ybnr+dqfTSmwFfmCV2e5xFUe7Lm73HaRu
 TyWnrpEwdjBWkoRwatOzNR9m7qSTFV3YdiXTQ65CX8wDPk62E5/jdutbvOEGzM/MAz
 vugEwC/22T+7oWvoqexFFvFGQajpA6+vMs+2ArxZ8aJxn7SkYj8wmIxoTNwIg6YdRN
 hNkXmV+a4CNEuBjX0sB14Rfyd9B+dTcVWcrcUwghHkYuLhZS++QczJ3H30abbYPhKi
 GG/a29Q1cf4NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B349CCA0EE6;
 Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 16 Aug 2025 00:55:22 +0800
Message-Id: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHpmn2gC/32NQQqDMBBFryKz7pRkatF25T2KixBHHahJSYKki
 HdvyAG6fDze/wdEDsIRns0BgXeJ4l0BujRgV+MWRpkKAym6q063mJfNWNzE+YCzZI7YKuq7mUh
 PlqF0n8BVlOwFjhM6zgnGYlaJyYdvPdt19X92d40K7a1VDzJ9bzoazDtxMFfrNxjP8/wBtwHLZ
 70AAAA=
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755276924; l=1234;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=zl87QclcDa3DKTevz342RWsdUkmKZ3kWOu2bPgZotaQ=;
 b=e07IJKlqLpRHehRFXDj41qKkESxMxzz5NMzfNCTXpgPDuowY+O4sUC/gPBXEZ9NWseGEfNinm
 rkO9woTy9UxBhgwURhP+g6fPGdtebSJAlvhGr6DwzbJJ1lwj9/FqhuN
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>, linux-kernel@vger.kernel.org,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor
	fixes
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
Changes in v2:
- Added Fixes: tags to relevant commits.
- Added a check for synopsys version to enable 10Mbps, 100Mbps support.
- Link to v1: https://lore.kernel.org/r/20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com

---
Rohan G Thomas (3):
      net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
      net: stmmac: xgmac: Correct supported speed modes
      net: stmmac: Set CIC bit only for TX queues with COE

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  6 ++++--
 3 files changed, 20 insertions(+), 8 deletions(-)
---
base-commit: 88250d40ed59d2b3c2dff788e9065caa7eb4dba0
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
