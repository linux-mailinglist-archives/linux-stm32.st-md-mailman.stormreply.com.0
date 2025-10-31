Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E5C26553
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 18:27:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEE6DC62ECD;
	Fri, 31 Oct 2025 17:27:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC22C62EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 17:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F108432CE;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6458C4CEE7;
 Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761931636;
 bh=t4zIx4Z11X9zS02u+s0yDHEllOpDAKEqSMdLm4SCIRU=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=YezzmReoBglXbbwmuX7vtp2Yo5fWl1KttjMuHVlFK4VMneRMnUbGJrpjNwcAAJWAv
 wBBNW2CT8fXIxeK1SdB3sV/vmSNuC1LZ7O04Mk86aAGJHpEQ/jrqWDNUxj5oE4QiWs
 exT7DjIq2vEm1+p3quxHp7VZRNfl7+VX+/h/ZOiinzitSJDqSeAjcggvv11zdcJiTn
 xv6YMeUrySBTqXgwi892Ivh7Dvv/m0b4+v08+8AoHjzafHbhyId+B6+XsoZGyRj+ri
 LC77rKbh7ewjJkAEmFCj6al2UmFsQl2V8TDo1mbaiQsv7d5CH/zBN6NdDmu9UI9AjB
 xjNbYqGXrC5Og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D1D82CCFA02;
 Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 01 Nov 2025 01:27:06 +0800
Message-Id: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrxBGkC/22NwQqDMBBEf0X23JRsxEp66n8UKWmy6oKNkgRJk
 fx7g+cehzfz5oBIgSnCvTkg0M6RV1+DujRgZ+MnEuxqBiVVh1JpYSZeKHcvyklY7N+u77V1NEJ
 dbIFGzqftCZ6S8LUFQyUzx7SG73mz48n/GncUUqBuEVtVze72MEuiYK52/cBQSvkBxwC0UbEAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=1421;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=t4zIx4Z11X9zS02u+s0yDHEllOpDAKEqSMdLm4SCIRU=;
 b=8tiYGEzN7w19aqajaofQRjkGf2F3m3eiOWWkDj28bjUqjQj6UIaO4zBm5kbVZIxDz1VNq8w2i
 dSp1UujxJ92AuHoJwtCC4A5HU1kp3nuDde1lw7H3PS28n7NfeQi3Q6x
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: socfpga: Add
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
Changes in v2:
- Fixed reduntant leftover tsis irq and use_ns changes from smtg_crosststamp
- Keep common platform config for socfpga platforms in socfpga_dwmac_probe
- Link to v1: https://lore.kernel.org/r/20251029-agilex5_ext-v1-0-1931132d77d6@altera.com

---
Rohan G Thomas (4):
      net: stmmac: socfpga: Agilex5 EMAC platform configuration
      net: stmmac: socfpga: Enable TBS support for Agilex5
      net: stmmac: socfpga: Enable TSO for Agilex5 platform
      net: stmmac: socfpga: Add hardware supported cross-timestamp

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 166 ++++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
 2 files changed, 168 insertions(+), 3 deletions(-)
---
base-commit: 0d0eb186421d0886ac466008235f6d9eedaf918e
change-id: 20251029-agilex5_ext-c17bd779cdef

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
