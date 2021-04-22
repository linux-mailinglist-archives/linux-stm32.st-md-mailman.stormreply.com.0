Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB23688DF
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Apr 2021 00:10:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F9FCC5719E;
	Thu, 22 Apr 2021 22:10:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78D91C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 22:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 791F46143B;
 Thu, 22 Apr 2021 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619129410;
 bh=j5/03LAUos2Czq6mNAYoi+CmTfpJcF+6c8XNEkPXF7c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BzbgH8vao/nDq5jOjXXnHBPtUX72W8dU6dWZ7ICnfr4zpU/wt+K7qnFTSioIzlQup
 ea0GLzKCz8b/Kg7xPcn9C0jbOlFKpA7/zAePwAHwhkdwD8DkVKl63GE48QQ5WPoKGX
 Ha31bEaGCPY3Fe6azZGS13pxZbqmzsdgf2Dss4NF7rcLpSgMD31k4MlEzHS5sN3pRX
 Nel8WpE6D5Hw1gJ9nYglL2tsVfU4b5VxHjE8YfEwvf1DDuG6SEJEHbgB8FA4hrQ5uA
 N+Dz8u4UTd+mHYFOeSM5pnMvHmvXhC4Rce4KRcaA5Sqv1KjI5g5UlRXbTpL6a2MvtN
 GiT2nK0n83y1A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7199660A53;
 Thu, 22 Apr 2021 22:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161912941046.2979.7304318952227636688.git-patchwork-notify@kernel.org>
Date: Thu, 22 Apr 2021 22:10:10 +0000
References: <20210422075501.20207-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20210422075501.20207-1-mohammad.athari.ismail@intel.com>
To: Ismail@ci.codeaurora.org,
 Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: kim.tatt.chuah@intel.com, alexandre.torgue@st.com, weifeng.voon@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Chuah@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] Enable DWMAC HW descriptor
	prefetch
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

On Thu, 22 Apr 2021 15:54:59 +0800 you wrote:
> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> 
> This patch series to add setting for HW descriptor prefetch for DWMAC version 5.20 onwards. For Intel platform, enable the capability by default.
> 
> Mohammad Athari Bin Ismail (2):
>   net: stmmac: Add HW descriptor prefetch setting for DWMAC Core 5.20
>     onwards
>   stmmac: intel: Enable HW descriptor prefetch by default
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: Add HW descriptor prefetch setting for DWMAC Core 5.20 onwards
    https://git.kernel.org/netdev/net-next/c/96874c619c20
  - [net-next,2/2] stmmac: intel: Enable HW descriptor prefetch by default
    https://git.kernel.org/netdev/net-next/c/676b7ec67d79

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
