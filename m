Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F6A6D757
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 10:30:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FF1C78F65;
	Mon, 24 Mar 2025 09:30:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B53CCC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 09:30:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2F8643B60;
 Mon, 24 Mar 2025 09:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D84C4CEDD;
 Mon, 24 Mar 2025 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742808600;
 bh=kHfo3Vih2l9KqIfcBsMDzy1nd79VOQV4cHZiOu5Oohs=;
 h=From:To:Cc:Subject:Date:From;
 b=jYyDFxs+4KJxugNp064ddqYYC75ZQBsQjnzXTd6fFhpbmsiao6QTJHteOJm1Gc0in
 GT9cQIQ2RnmCZEdXRJfGLzGH0HqdZ2LKe3l3sYWkTxIUsZaTdQkAJto7Qffz2R6UN1
 nMzf2t2kHwdZOLYN7XW76bLqPImdlsYYeYqtPdHI3yeK6Aw3GSxGJVPYWIrRszmQxm
 8vKxtdqdyQDZsShTNob3cMX6ORR7N2gFIuL0Hsg30dXjav9g2t2pZ2q2hhcM31/eAB
 PNaHGFH6iHK1hSUOlJCHy12nuR5Gg5nV9cQJ4GjbwA9fPw8Cc3ox0Mg7lDsb6yObsA
 /5WxCIMxtLuZQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Serge Semin <fancer.lancer@gmail.com>, Yinggang Gu <guyinggang@loongson.cn>
Date: Mon, 24 Mar 2025 10:29:26 +0100
Message-ID: <20250324092928.9482-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] stmmac: Several PCI-related
	improvements
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

Resend of v4, rebased onto net-next due to a merge conflict.

Changes in v4:
  - Add missing full stop. (Yanteng)
  - Move forgotten unused-variable-removes to the appropriate places.
  - Add applicable RB / TB tags

Changes in v3:
  - Several formatting nits (Paolo)
  - Split up patch into a patch series (Yanteng)

Philipp Stanner (3):
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 27 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 24 +++++------------
 2 files changed, 12 insertions(+), 39 deletions(-)

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
