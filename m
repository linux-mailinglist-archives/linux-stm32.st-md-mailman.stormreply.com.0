Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CFC340FF5
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 22:40:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C3A7C57B7C;
	Thu, 18 Mar 2021 21:40:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFB75C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 21:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E291064F30;
 Thu, 18 Mar 2021 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616103607;
 bh=uLLbTUg6nb9xUvK3A7lED3ce04bTq7tFYnoahf2uRpo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=czZoXUzhaezL1xZhOsYOdIUbG5sr+YHU/TcTTNNJeuyRgIbC70eddI+6+bRSWs5wP
 Q7eW6tjDCujcpp36WKZJSJS7+AnfvbpTKPUQvEzfAfrrnFcAv0EaOaxue7SGR3Snws
 8DlnL6pdpALyvbVaM6eAkeJi74a7YBqtzG6jXVpKwrMqAWi6FPY2/8Yt8SU1DCuVRP
 rpRin2OeZzlSxP9Jps15UOoa7U+CkYgpLGPUaQ3Rsm1Jhhy7S0BHozI/aOf0kiheU9
 dj2KFHkDPD5AHwARPWji1AvlDIkAh31/NwXbS1/cfNCFdoichhlvbVO/rPo4Wey5BL
 0Ij201Ni1wSCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D134E600E8;
 Thu, 18 Mar 2021 21:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161610360785.19574.3330766596706160519.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 21:40:07 +0000
References: <20210318005053.31400-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20210318005053.31400-1-mohammad.athari.ismail@intel.com>
To: Ismail@ci.codeaurora.org,
 Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: EST interrupts
	and ethtool
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

On Thu, 18 Mar 2021 08:50:51 +0800 you wrote:
> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> 
> This patchset adds support for handling EST interrupts and reporting EST
> errors. Additionally, the errors are added into ethtool statistic.
> 
> Ong Boon Leong (1):
>   net: stmmac: Add EST errors into ethtool statistic
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: EST interrupts handling and error reporting
    https://git.kernel.org/netdev/net-next/c/e49aa315cb01
  - [net-next,2/2] net: stmmac: Add EST errors into ethtool statistic
    https://git.kernel.org/netdev/net-next/c/9f298959191b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
