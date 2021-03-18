Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED088340FCD
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 22:30:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2083C57B7C;
	Thu, 18 Mar 2021 21:30:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF5FC57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 21:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B83964F38;
 Thu, 18 Mar 2021 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616103010;
 bh=AwsWUyeFUWfSrisNWO8iAiM8UVfX358NycK0uj3mRS0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iMB+L9kVVuajI0OoZOD3jY7j3uyPGyxMXsjesjZWerQTZYbumv94KSJVvZ5KmhOvt
 wNPBithMCs54F4Ted5LhhWjdE7t2hUFAm94wZPYPo4OuN5QhHp9eq6qxTmPOr1Wkq+
 E32L6OspwQRq6/K16xt0DLptF/q9pTf2YIs8GWpoTcc/B9nOLy4ToAZWRpsZrdDMvI
 hOMik7/2JGbvipWJlNxsaW5zpljowt2MHepSXkiRsXMnEmI7gsXn2wemOuoUKGOQag
 zX1iT5v+eDl51ocxIk8AzNx581awq420lnsEsQoG05R5BGjfoVLSocC6soMo1KBD/Y
 YFBlFaWmAEArQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7665460951;
 Thu, 18 Mar 2021 21:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161610301047.15925.7348673094676244775.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 21:30:10 +0000
References: <20210318172204.23766-1-boon.leong.ong@intel.com>
In-Reply-To: <20210318172204.23766-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] stmmac: add VLAN priority
	based RX steering
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

On Fri, 19 Mar 2021 01:22:02 +0800 you wrote:
> Hi,
> 
> The current tc flower implementation in stmmac supports both L3 and L4
> filter offloading. This patch adds the support of VLAN priority based
> RX frame steering into different Rx Queues.
> 
> The patches have been tested on both configuration test (include L3/L4)
> and traffic test (multi VLAN ping streams with RX Frame Steering) below:-
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: restructure tc implementation for RX VLAN Priority steering
    https://git.kernel.org/netdev/net-next/c/bd0f670e7931
  - [net-next,2/2] net: stmmac: add RX frame steering based on VLAN priority in tc flower
    https://git.kernel.org/netdev/net-next/c/0e039f5cf86c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
