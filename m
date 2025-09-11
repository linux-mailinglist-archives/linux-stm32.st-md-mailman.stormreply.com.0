Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E27B52B80
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 10:23:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B281C349C1;
	Thu, 11 Sep 2025 08:23:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2371C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 08:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E5D1449CE;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C25C4CEF1;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757579009;
 bh=1NTqCYvC1K8jjPMv2VYdraK1iRDgvz7FsY1W+cOys54=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=tozocLldwSOpQgbhOhuvt904CuPrNKqz+MyiPtI+nj9sGun7ieVcxmDeSsvZdBjfE
 DLC53avdIrGgvbJ7sYRUGgMdyO5pDjfLUmKKhASmcFSxQsv4LthlyehDTGPFBOJyFE
 LWECmeFEORqBI6+cZlkendWmxSj4/qKrNl9EJ87Db8k6v49PLB2my6YBkHqNGOavIZ
 /NF0Ecd/e1bXoBZaP1lNhSBIoZtyF0KfALdU7cr7WYkNc/bpQEfZujDShE7nrw67h/
 8yQ53MOPF1dkpX+X/zg3sSrpVvWb7nNLUq9i7dqyb7Wo6CWHDHTMLXyr1rKSB1cLyV
 mBubwOsiRx0CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 43F6CCAC58D;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 11 Sep 2025 16:22:58 +0800
Message-Id: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOKGwmgC/x3KSwqAIBRG4a3IHSdo2HMr0cDqr+7ESkOCcO9Jw
 49zXgrwjEC9eMkjcuDDZehC0Lxbt0Hykk2lKivVaS2vKcqVHwRpLGqzoK2BhvJ/evwh7wM53DS
 m9AHmLbwtYAAAAA==
X-Change-ID: 20250911-qbv-fixes-4ae64de86ee7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757579008; l=729;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=1NTqCYvC1K8jjPMv2VYdraK1iRDgvz7FsY1W+cOys54=;
 b=/0L8KgDwlzFCr8RVOL5SgK/pXkurP0ELzcipg5jz0KqFqfz7OjcBHkJi9PknfxYLHM1GdYnME
 v5v0C/w9B7TBnsTcDbFxJQY0Jdl7+CyWmJD9rD5EXlB2gHxKlKOoeeO
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: Minor fixes for stmmac
 EST implementation
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
Rohan G Thomas (2):
      net: stmmac: est: Fix GCL bounds checks
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 ++--
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 1f24a240974589ce42f70502ccb3ff3f5189d69a
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
