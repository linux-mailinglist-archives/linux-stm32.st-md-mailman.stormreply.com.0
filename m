Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BCB572A5
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Sep 2025 10:17:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1485BC3F95A;
	Mon, 15 Sep 2025 08:17:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB99CC3F958
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 08:17:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 978DF444D2;
 Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B48C4CEF1;
 Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757924241;
 bh=F/X+TtZHooGZVCVdoXlX23gyuHCMQDwSSkVtX3di3Hg=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=GV9RqtAc3SB8pgtHReS7bf1ET/E5vlZUVbYsXHtspijXoI45Txf5P71bCW1PTgJV3
 ex0yceO9ZS+ovvANqgyEHfA2Qj+1iAM6DXHZrjU8MczOnLdaRHjSKBj3K0rKEz9GQf
 9krMvdrr8vcMowZZT9Xs7F9IjBlFcNkDW3gwqB4SFlOCoN9qAT5g1NjZfrSVeRdYQx
 icJL5z60ZHfKeJvQCTjkAo4G5K2VGF+x8qlXmdPuyibktjmqLtE1A3WkITAL3lOGzw
 QH/EkozVXDMET64a3VJSdExZenU+NQYYtSE6NT693CXgaTgUqea8BcXoX8GKS4+pVr
 4CPy9LxgzY7IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5E10ACAC597;
 Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 15 Sep 2025 16:17:17 +0800
Message-Id: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI7Lx2gC/22Myw7CIBQFf6W5azG9pC9c+R+mC2xPLYlCBUI0D
 f8u6drlnJmcnQK8QaBLtZNHMsE4W0CeKppWbR8QZi5MspZtrZjF+57EYj4IotHomhlDB/RU+s3
 jECW/kUWksYyrCdH57/Gf+FB/rhKLWmBgqFb108LLVT8jvD5P7kVjzvkHWuVGd6gAAAA=
X-Change-ID: 20250911-qbv-fixes-4ae64de86ee7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757924239; l=899;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=F/X+TtZHooGZVCVdoXlX23gyuHCMQDwSSkVtX3di3Hg=;
 b=bi6AtS44Cm+PAB1TLYBv/5mE8nemeFtjJHyyt2gUpKfTRwLORFKt6gXA8FrQeXWPi9muVBfYJ
 Lh5o/Pnal8SCzk2Xrv11tNs0rwrZbC5HqjijLT6SOGWlDtKX5riau4o
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 0/2] net: stmmac: Minor fixes for
 stmmac EST implementation
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

This patchset includes following minor fixes for stmmac EST
implementation:
   1. Fix GCL bounds checks
   2. Consider Tx VLAN offload tag length for maxSDU

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v2:
- Use GENMASK instead of BIT for clarity and consistency
- Link to v1: https://lore.kernel.org/r/20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com

---
Rohan G Thomas (2):
      net: stmmac: est: Fix GCL bounds checks
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 ++--
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 5b5ba63a54cc7cb050fa734dbf495ffd63f9cbf7
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
