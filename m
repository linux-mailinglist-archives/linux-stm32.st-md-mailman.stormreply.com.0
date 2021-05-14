Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDC3813C4
	for <lists+linux-stm32@lfdr.de>; Sat, 15 May 2021 00:30:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D72B6C57B53;
	Fri, 14 May 2021 22:30:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC96C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 22:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 864A561453;
 Fri, 14 May 2021 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621031410;
 bh=qrJLP/r3A3y/0MyfEURktG+DB4zmp3lLFDGbBMOKB8A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P0zgoaprDJvd98bH2YsY9oRsUbNpX6X8rgv/5veHPFVbyZwKiayQ+lnPqhh61onti
 /qgzqCR38fonvkdjL5sUGDu2+AaxoIKOXMHXvG+q91G5ZwsLOu9QuvS8gOKseqEoa3
 z+j6b7QjwOBdcIG9bzVNluyZQdJux6OLi8vkxm4MLMCTm9UIzH1AAdtgAvaBTo4nSv
 hQ+1vvNZrSlA75KQ7SJ39pc3U2qCIIWPc2M+mHWXdka1QFkfvnRxKEGL4xqNVJVFfy
 ysPhyEIXgQa/RHfOIy2Bzug07IMfmVNyvc6h8nsBhO0+MK64/mbSpbRNFHk76WQPnt
 CNBQlmO82/NXg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 788F260A02;
 Fri, 14 May 2021 22:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162103141048.10202.7043185141593053010.git-patchwork-notify@kernel.org>
Date: Fri, 14 May 2021 22:30:10 +0000
References: <20210514183954.7129-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210514183954.7129-1-mcroce@linux.microsoft.com>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: kvm@vger.kernel.org, davem@davemloft.net, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, peppe.cavallaro@st.com, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 jesse.brandeburg@intel.com, intel-wired-lan@lists.osuosl.org, kuba@kernel.org,
 anthony.l.nguyen@intel.com, bpf@vger.kernel.org, jasowang@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: use XDP helpers
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Fri, 14 May 2021 20:39:51 +0200 you wrote:
> From: Matteo Croce <mcroce@microsoft.com>
> 
> The commit 43b5169d8355 ("net, xdp: Introduce xdp_init_buff utility
> routine") and commit be9df4aff65f ("net, xdp: Introduce xdp_prepare_buff
> utility routine") introduces two useful helpers to populate xdp_buff.
> Use it in drivers which still open codes that routines.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] stmmac: use XDP helpers
    https://git.kernel.org/netdev/net-next/c/d172268f93cf
  - [net-next,2/3] igc: use XDP helpers
    https://git.kernel.org/netdev/net-next/c/082294f294f6
  - [net-next,3/3] vhost_net: use XDP helpers
    https://git.kernel.org/netdev/net-next/c/224bf7db5518

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
