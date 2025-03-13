Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1CA5FB01
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 17:14:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EE28C78F83;
	Thu, 13 Mar 2025 16:14:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D152C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 16:14:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50AD3A474BF;
 Thu, 13 Mar 2025 16:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2510C4CEDD;
 Thu, 13 Mar 2025 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741882475;
 bh=ivXaovMXFkHRDnIc2B3mYOHIjoMxZWzDfaRmCccBPHw=;
 h=From:To:Cc:Subject:Date:From;
 b=bmdwz3DfqVK/2LgcxeGvzyz3uBN4tuCsJKdf9qsxNrO7rIBQoqqyvZRBob6XYjzai
 DhvEH9bAkd5LG45bgr2nbTPSFw5yEKEIx/pWdaLB6KjvL/LebIwyhPseaYTks9m2yz
 ktkLZ6h7wO5iGwwE5rRLCkCu1atbJm5Y1e79HY/RSSrUnZLtX0iFtSHswUPJL0w2G7
 hFwS6WYfJPizwxHYa67aNte+a+ffyFxRaY0CbVrYfW/4uKK4d4udq44eo4cv8E39bo
 Bxjb2HQHa5CxMyndA36s5221bo5r8JWMfHEcqgWJCFaIj2unMhSdjG3fPaoVpV/Doe
 S04bpru+hueSQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Serge Semin <fancer.lancer@gmail.com>,
 Philipp Stanner <pstanner@redhat.com>
Date: Thu, 13 Mar 2025 17:14:20 +0100
Message-ID: <20250313161422.97174-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/3] Clean up deprecated PCI calls
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

Spiritual successor of this older series, of which one patch has already
been merged [1]

P.

[1] https://lore.kernel.org/netdev/20250226085208.97891-1-phasta@kernel.org/

Philipp Stanner (3):
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 27 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 26 +++++-------------
 2 files changed, 13 insertions(+), 40 deletions(-)

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
