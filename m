Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5DBE68DC
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 08:11:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00FAFC57B70;
	Fri, 17 Oct 2025 06:11:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0053EC57B6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 06:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8B294332E;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D742C4CEF9;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760681492;
 bh=cErZl+Aef5mADFNSRF/CqGvdSUgsvsLw4QmBcD8g+xk=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=MT6cKJFYzJ3pBJEuKuESMxdf7EH9u5wfrYkkU+lKVz8703gzHd+LUzyk5lM7+NmNt
 f0i1MO+wMJNzdPas6FAmlNm1rPHsYmJxjJpKhz7kOcl/8NHhQtjQbvzyXJZh3sDql1
 C8gtV7BMUIyjV8suK0sw0PoxdxWFJhmxn6EY+l5JOWgXc1mnbahErLXgOnc2NYqOxi
 7QuxMVknIysqBGwqOVB0Jaks4is7of1j7INOjcgMv32PvsSXXHFBnm0B9PsX982MkT
 HvXic2raDBD8IYHdoLEYcNW/5BqMP/s/V+vY8jEgAhSUjgKGjiRcpWFnZVcvsfwpuM
 FAAusoxikX8ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 70F4DCCD195;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Fri, 17 Oct 2025 14:11:18 +0800
Message-Id: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAbe8WgC/22MSw7CIBRFt2LeWAzQD8WR+zAOKL21JNoqNETTd
 O8io5o4vJ9zFgrwDoGOu4U8ogtuGlMo9juygxmvYK5LmSSXFddCsGcbWe9eCKw0qMsOTQ0oSv+
 HRx7S/UwjZrqkcnBhnvw7+6PI0x9VFIwzNAK60sr2oj+Z2wxvDna6Z02UW7TaovKLWs1rVbSt6
 sofdF3XD9HhEPXjAAAA
X-Change-ID: 20250911-qbv-fixes-4ae64de86ee7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760681491; l=1667;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=cErZl+Aef5mADFNSRF/CqGvdSUgsvsLw4QmBcD8g+xk=;
 b=tRc0k49q8CDclLGLO8HNDIxA1auXJjd1G977SPRKTM0FDT3tlempIlYU7PezAgMqrysJSBVVv
 sqfIJaS6wkUDmvWgknuvKjgJnkl44nHVL3pEswrkq2bEt3YogBF5+rW
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 0/3] net: stmmac: Fixes for stmmac Tx
 VLAN insert and EST
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

This patchset includes following fixes for stmmac Tx VLAN insert and
EST implementations:
   1. Disable STAG insertion offloading, as DWMAC IPs doesn't support
      offload of STAG for double VLAN packets and CTAG for single VLAN
      packets when using the same register configuration. The current
      configuration in the driver is undocumented and is adding an
      additional 802.1Q tag with VLAN ID 0 for double VLAN packets.
   2. Consider Tx VLAN offload tag length for maxSDU estimation.
   3. Fix GCL bounds check

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v3:
- Commit for disabling 802.1AD tag insertion offload is introduced in
  to this patchset
- Add just VLAN_HLEN to sdu_len when 802.1Q tag offload is requested
- Link to v2: https://lore.kernel.org/r/20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com

Changes in v2:
- Use GENMASK instead of BIT for clarity and consistency
- Link to v1: https://lore.kernel.org/r/20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com

---
Rohan G Thomas (3):
      net: stmmac: vlan: Disable 802.1AD tag insertion offload
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU
      net: stmmac: est: Fix GCL bounds checks

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 37 ++++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c |  2 +-
 3 files changed, 19 insertions(+), 24 deletions(-)
---
base-commit: cb85ca4c0a349e246cd35161088aa3689ae5c580
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
