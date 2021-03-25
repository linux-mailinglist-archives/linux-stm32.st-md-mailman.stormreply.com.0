Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E780348638
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 02:10:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07A15C57B5E;
	Thu, 25 Mar 2021 01:10:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37FF3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 01:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5632E619EC;
 Thu, 25 Mar 2021 01:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616634608;
 bh=3hq3HKCR3UEK8qbeL++VtdcwpmVIAMm/F7SWAqVNZks=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Lzewn07A5tpSFqV647jvkMc3HL2vEVjKtwRWHn9IDgBlsiEB1DQry9CX/eX26c/l/
 4JlKHelAEeSnXDMoaILTd0ulA2yn8xEdcDDfNXigEGsEOk5Po6vB5ktiTbbCA5AXI0
 mejinX0lG+E/Jgmr5JoiLIOUnnqerbXqEat29JoO64XG/XgZm+C0IcUZ7uSOaLSbxN
 //fIj017CJHQH7dovn52FeKAcRAzqAiGf+n/j4GEc9Z2cfd02CwAXckHt2KjdQh19L
 RFpZQ6A1c3ec9MQwEp1aFwEDtvQr6lJ+WBRf4+XhQC3LQ0qAkdI9wnmephtucE1xxd
 8B9Iu+DZsyKbg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 42C4460A6A;
 Thu, 25 Mar 2021 01:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161663460826.25289.6625842442117364224.git-patchwork-notify@kernel.org>
Date: Thu, 25 Mar 2021 01:10:08 +0000
References: <20210324090742.3413-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20210324090742.3413-1-mohammad.athari.ismail@intel.com>
To: Ismail@ci.codeaurora.org,
 Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: kim.tatt.chuah@intel.com, fugang.duan@nxp.com, alexandre.torgue@st.com,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chuah@vger.kernel.org,
 linux@armlinux.org.uk, qiangqing.zhang@nxp.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: support FPE link
 partner hand-shaking procedure
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 24 Mar 2021 17:07:42 +0800 you wrote:
> From: Ong Boon Leong <boon.leong.ong@intel.com>
> 
> In order to discover whether remote station supports frame preemption,
> local station sends verify mPacket and expects response mPacket in
> return from the remote station.
> 
> So, we add the functions to send and handle event when verify mPacket
> and response mPacket are exchanged between the networked stations.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: support FPE link partner hand-shaking procedure
    https://git.kernel.org/netdev/net-next/c/5a5586112b92

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
