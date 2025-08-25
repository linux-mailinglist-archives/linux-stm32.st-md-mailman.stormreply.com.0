Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9522B33525
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 06:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09520C3FAD7;
	Mon, 25 Aug 2025 04:37:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C953CC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 04:37:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B39676024E;
 Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76E7AC4CEF4;
 Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756096629;
 bh=qbmrznk8y3bTUpjqPLSvWYU8OwN7QufMMM55Yj86Gkw=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=TSdhfPjaKUkCMfdZp6E1WGCCorVE09YvUlhgqThgPprHZL+GglTNpnY/9elKdcxEq
 skgve9Ww+us2OO5HJSLbCFn041VBYSjkr49jiGsqAflvZEOInxo80fkB7kciOZnbLI
 Ea1GDxhQIvWz5js7FSF2gzB4GtoZjV4yvOdlnwjYI+A9PZwNskiwzj+zcSy39ELASx
 68DXrvRC9NCp4eZxhq1J81iGiPNNeGr4BbwszzYMBsqIfsqW7nZN/s66057Dd3htrz
 lKjdmEeEvN+hvMEhrsgaD9C5pLFapiEXtti6xB0QL5KnBjb2T6GRJu03v7N7u7aol1
 RDZTK6QZaUesQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 61FACCA0FE1;
 Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 25 Aug 2025 12:36:51 +0800
Message-Id: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGPoq2gC/33NTQrDIBAF4KuEWdeikz/TVe9RuhAzJkKjRYOkh
 Ny94qYUSpdvHu+bHSIFSxEu1Q6Bko3WuxzqUwV6Vm4iZsecATm2vBcN26ZFabZY5wMzdqPIGo6
 yN4hi1AR59wxUijy7gaMV7vk427j68Cp/kijVHzIJxpmuGz6gklL1eFWPlYI6a78ULuGHkKL7R
 WAmumFoW9QmE+aLOI7jDdEnumv7AAAA
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756096627; l=1399;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=qbmrznk8y3bTUpjqPLSvWYU8OwN7QufMMM55Yj86Gkw=;
 b=wb6durDNB7EBHq2OkiLCdW7vqZM17yyaQFwyVzxklzowPsTG1zA8RPFzfe0pjDOg89l4lAE/C
 O0US6x4B5ujDW1ogpumfCPQOh67cwwuBN4pPnWn+WnqvUqBeK5LdVC5
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>, linux-kernel@vger.kernel.org,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 0/3] net: stmmac: xgmac: Minor fixes
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
Changes in v3:
- Keep variable declaration smallest to largest.
- Link to v2: https://lore.kernel.org/r/20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com

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
base-commit: b1c92cdf5af3198e8fbc1345a80e2a1dff386c02
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
