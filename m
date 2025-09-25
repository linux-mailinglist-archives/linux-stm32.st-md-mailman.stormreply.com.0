Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D6B9FCF7
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 16:06:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26EE4C3F95B;
	Thu, 25 Sep 2025 14:06:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34347C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 14:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4FFC44AA3;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B97C8C4CEF0;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758809187;
 bh=JZaRkLJomBSdsRDEvpNByeOgtyybOCR1lGmXJvP8BFY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=UWuWl3JO3I1hyQnyCuRFoMUj1Qt8daxDMicwUYK9zZCern+4HLS9pUwbsfmRVCf4n
 GjCaYCks8GPJgvmd6J/+r9b/xwQ3Pdm5ik8Vj0lWbax/1ffxb/0DbR/AUWu2izkGzK
 qztRMiBw0wJasoBpeN1Trc3sHxB7dCSa2pKDqGYcV1NwtS9PJuG+sMCtZE40ZmJpoF
 JQMpAQ5uQSYjT5gAJCjt+HVqn6OTTcGloysWtzlR886x1zl/hbazGZtLFoF/JiYAqr
 SEjPJ0uJt/HQ8JMHXmWI5+0UBbhWj2aophDg3QgaZTV8zsDmI2kpi9sPzTTB1f6H86
 baxi76HXACwhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AFAABCAC5B1;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 25 Sep 2025 22:06:12 +0800
Message-Id: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFRM1WgC/12OQQ6CMBBFr0JmbQ0dLFBW3sMY08IgTbCYtmkwh
 LvbdGHU5c+f9/5s4MkZ8tAVGziKxpvFplAdCugnZe/EzJAyYImilJyzadb+hkyMwyDo1FZjiZC
 On45Gs2bRBSwFZmkNcE3NZHxY3CsvRJ77f1nkjLNe10JQK6XQzVnNgZw69ssjOyJ+c+LDYeKww
 brWqNJD8ofb9/0NjG7N9t8AAAA=
X-Change-ID: 20250911-hlbs_2-5fdd5e483f02
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758809186; l=1247;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=JZaRkLJomBSdsRDEvpNByeOgtyybOCR1lGmXJvP8BFY=;
 b=cjIvuKTzoFGnXBwe3ISNMpVhnpZwew0JHYG4Cg3JIILuwsqz/31E73x5REcfTS+HOiIBAxP40
 5LpEvSW8hGRBsW89XRb0Ndgdh0Hd8lnVPVPYxTf5ljE4KsOiQFCMIH5
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: Drop frames
 causing HLBS error
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

This patchset consists of following patchset to avoid netdev watchdog
reset due to Head-of-Line Blocking due to EST scheduling error.
 1. Drop those frames causing HLBS error
 2. Add HLBS frame drops to taprio stats

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v3:
- Split commit into 2 and add this cover letter
- Updated the commit messages with expansion for HLBS and DFBS
- Link to v2: https://lore.kernel.org/r/20250915-hlbs_2-v2-1-27266b2afdd9@altera.com

Changes in v2:
- Removed unnecessary parantheses
- Link to v1: https://lore.kernel.org/r/20250911-hlbs_2-v1-1-cb655e8995b7@altera.com

---
Rohan G Thomas (2):
      net: stmmac: est: Drop frames causing HLBS error
      net: stmmac: tc: Add HLBS drop count to taprio stats

 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 7 +++++--
 4 files changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 12de5f0f6c2d7aad7e60aada650fcfb374c28a5e
change-id: 20250911-hlbs_2-5fdd5e483f02

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
