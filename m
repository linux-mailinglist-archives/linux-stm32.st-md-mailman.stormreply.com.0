Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5032F516
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 22:10:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1BF0C57B7C;
	Fri,  5 Mar 2021 21:10:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1D83C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 21:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 25C1E6509B;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614978609;
 bh=tfYUmsXc+cYJmMT4lfQnI5zjXJDKfH7cTJiFLPkrU5g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uf2VRjGwjoay2V7SkPiABDzdEtcFOMNCCMuvpJELf/WRu5t8EgZ8+QEUuGw+cYR98
 2kHuVrmpo+CHTV1K+U2iAq300SdCo788eztwPYoeo0ztDIDHCGU2o9Wvau75C5OlAX
 UXNvFo4lF1Q2rjS7iksZNsWA2Fhw46k17q4WteGEzZkj1CQEBfq6HLS0rIdLS9hLMT
 sZWngUX5lZVC5OPaGMbp534Tq2gmt2VT4WTy4sryHsXm6rmuUb5Emb/QrxhPyewWcE
 8MyuK0yFm0blf9RApay+rV3Gz15eTHIEUO2gFcgXqj9iGnqcYhU0pPrpzkTNK4PBxq
 b98i1Ge69UWXQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C57B609D4;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161497860911.24588.15607170379509206328.git-patchwork-notify@kernel.org>
Date: Fri, 05 Mar 2021 21:10:09 +0000
References: <20210305054930.7434-1-boon.leong.ong@intel.com>
In-Reply-To: <20210305054930.7434-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix VLAN filter
 delete timeout issue in Intel mGBE SGMII
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  5 Mar 2021 13:49:30 +0800 you wrote:
> For Intel mGbE controller, MAC VLAN filter delete operation will time-out
> if serdes power-down sequence happened first during driver remove() with
> below message.
> 
> [82294.764958] intel-eth-pci 0000:00:1e.4 eth2: stmmac_dvr_remove: removing driver
> [82294.778677] intel-eth-pci 0000:00:1e.4 eth2: Timeout accessing MAC_VLAN_Tag_Filter
> [82294.779997] intel-eth-pci 0000:00:1e.4 eth2: failed to kill vid 0081/0
> [82294.947053] intel-eth-pci 0000:00:1d.2 eth1: stmmac_dvr_remove: removing driver
> [82295.002091] intel-eth-pci 0000:00:1d.1 eth0: stmmac_dvr_remove: removing driver
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: Fix VLAN filter delete timeout issue in Intel mGBE SGMII
    https://git.kernel.org/netdev/net/c/9a7b3950c7e1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
