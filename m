Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C46DA95A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 09:22:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F184AC6B44E;
	Fri,  7 Apr 2023 07:22:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B331C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 17:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A87264A78;
 Thu,  6 Apr 2023 17:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C469FC433EF;
 Thu,  6 Apr 2023 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680802216;
 bh=hCCX2cA3QYGfj6QxeCyQVv6uXMkVZB5gXlYoQklEu+A=;
 h=From:Subject:Date:To:Cc:From;
 b=EOGTPMH6ZXuqE4xz3Nrf2FvN3yCGnO7fkPr8WQQwmh7WLzK32NhjVfgBSvAmWQTTg
 xGOTv5I13I/A9BiAqFu0ybxlZaT8IBC0W07XRecaEojLs/kxzUtnea6S+9RWAiaqws
 fm/p9xOq6wv/hZr87U90U6KNFNmpMjPXDM8JisV54uzsBBI6epBxpcslfqLGSPlJ9f
 73kF69CVGl4JqtCtvHWf0dgkOmxGHoOUuFRuOJ2yGcNEqZnTgn3AGitl0A1pDGqlDi
 WbukwAZXs8N9sgw/YJM9sgjDIihr1EgjUYKUMO4uqgG81Q49IeJBKC43CwORFe8ZQX
 mbicwgJqxyeww==
From: Simon Horman <horms@kernel.org>
Date: Thu, 06 Apr 2023 19:30:08 +0200
Message-Id: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKABL2QC/x2NQQrCQAxFr1KyNjDtWKleRVxkZqIdqLEkVQuld
 ze4fI//+BsYa2WDS7OB8qdafYlDe2ggjyQPxlqcoQtdDMdwwvJ9UkYSUl+izaTG2PZDjGFIfeE
 zeJrIZVKSPHos72lyOSvf6/r/uoLwgsLrArd9/wEEpRZOhQAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Fri, 07 Apr 2023 07:22:33 +0000
Cc: netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: dwmac-anarion:
 address issues flagged by sparse
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Two minor enhancements to dwmac-anarion to address issues flagged by
sparse.

1. Always return struct anarion_gmac * from anarion_config_dt()
2. Add __iomem annotation to register base

No functional change intended.
Compile tested only.

---
Simon Horman (2):
      net: stmmac: dwmac-anarion: Use annotation __iomem for register base
      net: stmmac: dwmac-anarion: Always return struct anarion_gmac * from anarion_config_dt()

 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

base-commit: 0ebd4fd6b9064764a3af3d671463b1350abffb6c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
