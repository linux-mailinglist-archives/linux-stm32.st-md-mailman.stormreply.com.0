Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 070FD37306B
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 21:10:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA817C59784;
	Tue,  4 May 2021 19:10:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE99EC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 19:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2CC5061182;
 Tue,  4 May 2021 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620155410;
 bh=r2bSYkSM5y7N1co+6dpHXHQ0FQC9UWRYwRDO8hODpVI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GtmbjyJUBl/3R/+W2hipJXES4NoqnN4VlBYbbP8Tqtvq4Ynadn/CRfiirdVFLNH4O
 OyJPg88kMZIM96DPK+YxVfFUOEik36EJG6vTproyfkR4FIoPm0vQV/X1fRf8jMnT11
 /eIJkikl0vCjcaXPVJ3gnDsfxaY46vL/+WxVPJIKWP5wboOkCGQVRz+LHTazoLD0B7
 ih4OWpppyqIxDT9ZD97iGWnp3rhfLNVDC/NbVtPGfyH3V7ipcCqP+QHaLOyDsWsher
 sICY4HMsb4LybN9OYbG3MFaL71+oMlwuibakpt/XcVHrHFRey996wrPYzdVbqAZmT+
 BZT7f4PVfcQsQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1A73A609F5;
 Tue,  4 May 2021 19:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162015541010.23495.12824554221267903248.git-patchwork-notify@kernel.org>
Date: Tue, 04 May 2021 19:10:10 +0000
References: <20210504154241.1165-1-ramesh.Babu.B@intel.com>
In-Reply-To: <20210504154241.1165-1-ramesh.Babu.B@intel.com>
To: Ramesh Babu B <ramesh.babu.b@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 ramesh.Babu.B@intel.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Clear receive
 all(RA) bit when promiscuous mode is off
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

On Tue,  4 May 2021 21:12:41 +0530 you wrote:
> From: Ramesh Babu B <ramesh.babu.b@intel.com>
> 
> In promiscuous mode Receive All bit is set in GMAC packet filter register,
> but outside promiscuous mode Receive All bit is not cleared,
> which resulted in all network packets are received when toggle (ON/OFF)
> the promiscuous mode.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: Clear receive all(RA) bit when promiscuous mode is off
    https://git.kernel.org/netdev/net/c/4c7a94286ef7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
