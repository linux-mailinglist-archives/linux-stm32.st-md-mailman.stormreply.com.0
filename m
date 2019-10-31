Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D0EB785
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2019 19:47:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C7EAC36B0B;
	Thu, 31 Oct 2019 18:47:35 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D5AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 18:47:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 245B814FC76C7;
 Thu, 31 Oct 2019 11:47:32 -0700 (PDT)
Date: Thu, 31 Oct 2019 11:47:31 -0700 (PDT)
Message-Id: <20191031.114731.1020357883148278664.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <e2f11aad32bb264a31074877b5a568f1dd1383ee.1572519070.git.Jose.Abreu@synopsys.com>
References: <cover.1572519070.git.Jose.Abreu@synopsys.com>
 <cover.1572519070.git.Jose.Abreu@synopsys.com>
 <e2f11aad32bb264a31074877b5a568f1dd1383ee.1572519070.git.Jose.Abreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 31 Oct 2019 11:47:32 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 01/10] net: stmmac: Fix sparse
	warning
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Thu, 31 Oct 2019 12:00:39 +0100

> The VID is converted to le16 so the variable must be __le16 type.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

This doesn't even come close to applying to my 'net' tree.

[davem@localhost net]$ git am --signoff bundle-19989-stmmac-fixes.mbox 
Applying: net: stmmac: Fix sparse warning
error: patch failed: drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:733
error: drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c: patch does not apply
error: patch failed: drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:555
error: drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c: patch does not apply
error: patch failed: drivers/net/ethernet/stmicro/stmmac/hwif.h:357
error: drivers/net/ethernet/stmicro/stmmac/hwif.h: patch does not apply
error: patch failed: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4207
error: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: patch does not apply
Patch failed at 0001 net: stmmac: Fix sparse warning
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
[davem@localhost net]$ patch -p1 <.git/rebase-apply/patch 
patching file drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
Hunk #1 FAILED at 733.
1 out of 1 hunk FAILED -- saving rejects to file drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c.rej
patching file drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
Hunk #1 FAILED at 555.
1 out of 1 hunk FAILED -- saving rejects to file drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c.rej
patching file drivers/net/ethernet/stmicro/stmmac/hwif.h
Hunk #1 FAILED at 357.
1 out of 1 hunk FAILED -- saving rejects to file drivers/net/ethernet/stmicro/stmmac/hwif.h.rej
patching file drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
Hunk #1 FAILED at 4207.
Hunk #2 FAILED at 4221.
2 out of 2 hunks FAILED -- saving rejects to file drivers/net/ethernet/stmicro/stmmac/stmmac_main.c.rej
[davem@localhost net]$ 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
