Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB0C18D6C
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 09:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C703C62D3D;
	Wed, 29 Oct 2025 08:06:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35969C62D3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 08:06:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DFEBA4923B;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5BD8C4CEF7;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761725184;
 bh=lJ1JcnHdvyDKrgvkF/InxR6fht7QWyd7w3ZrjqQQ9h8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=BcRRDlLr5xYeb2Mi9o3YKmofKe4m49dtHv2WhfJJhMCgLbqSUY72233AvLmZvaUPy
 3pT52UGo4jjBvn0oK3rM71NotBEsurzBX771VrzFnLMjXvB7lPJfqCWK5rPgbO5aYK
 UbxKQAQ4NyQwlD6Sw89lrTjSXKpofVM0+T2saggVff9fDtySs0RbIB95sYPGe/CjN8
 fi58wuMaymqN5D3Dego7LDDhJncmqRcFSExrJ9m+8EC+f4v8GhulkDYShhjdfHWvs7
 t8dYGTL9FvLiMcC7Atix+vx6MATfrEohdsGsYzOvBju90ugre34WVuRpN4vs9VSMUo
 teU0BawZxWQiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A3A54CCF9EE;
 Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Wed, 29 Oct 2025 16:06:12 +0800
Message-Id: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPXKAWkC/x2MUQqAIBAFrxL7nZBCSF0lIkxftRAWKiFId0/6H
 JiZQhGBEWlsCgU8HPnyFWTbkD2M3yHYVSbVqV52ahBm5xO5X5CTsFKvTuvBOmxUiztg4/zfJvJ
 IwleL5vf9AEtpE2pnAAAA
X-Change-ID: 20251029-agilex5_ext-c17bd779cdef
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725182; l=1154;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=lJ1JcnHdvyDKrgvkF/InxR6fht7QWyd7w3ZrjqQQ9h8=;
 b=DlJCfseSUGZMDjXBw1VVh0mpCeu7xVTb3IZNFGwtIb2gtoPFVZd7U5fHRN6pO+qAd5Jjj6orE
 q/SIliAdApzAhEVmXtDQZjhmvj49K5KPSkeCRRyKCOfz2udKbhDaMSb
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: socfpga: Add
 Agilex5 platform support and enhancements
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

This patch series adds support for the Agilex5 EMAC platform to the
dwmac-socfpga driver.

The series includes:
   - Platform configuration for Agilex5 EMAC
   - Enabling Time-Based Scheduling (TBS) for Tx queues 6 and 7
   - Enabling TCP Segmentation Offload(TSO)
   - Adding hardware-supported cross timestamping using the SMTG IP,
     allowing precise synchronization between MAC and system time via
     PTP_SYS_OFFSET_PRECISE.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Rohan G Thomas (4):
      net: stmmac: socfpga: Agilex5 EMAC platform configuration
      net: stmmac: socfpga: Enable TBS support for Agilex5
      net: stmmac: socfpga: Enable TSO for Agilex5 platform
      net: stmmac: socfpga: Add hardware supported cross-timestamp

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 194 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
 2 files changed, 189 insertions(+), 10 deletions(-)
---
base-commit: a8abe8e210c175b1d5a7e53df069e107b65c13cb
change-id: 20251029-agilex5_ext-c17bd779cdef

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
