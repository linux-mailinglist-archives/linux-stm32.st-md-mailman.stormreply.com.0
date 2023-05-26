Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66312711EA6
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 06:10:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F620C6905A;
	Fri, 26 May 2023 04:10:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C975C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 04:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1ABD464CB0;
 Fri, 26 May 2023 04:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D1A0C433A7;
 Fri, 26 May 2023 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685074221;
 bh=JQyCrb/AS2AU8eNQv+rZMtDQP68aB0ijNJNGaDOoPzg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FIl7fGndcDdMNTUUBjQ/lxk9ckLrCRUIBlDx3quOHau9ufxJApcUj8W88eIZFB7ow
 NPV4ejdISGmoGjkF9LzOSCCTD1DNzvOlNLaGPJHAgv22iI5Eu+153JBshgoDraOwj+
 26yIfSIWsmdNoblJnu+D4wyEOyUBKpQDXYPMXboptdow27omZLy4+TcuKJtobn8EAO
 31bcAsT+EDqcob6emXWeyzLwkrdjSGfxbcG8PlGWfZELjdd8OIszgA4N9DbwSURSjn
 PHD3cfMoyzWS4u65abuCoxAtadl/sspFPWIR9Qe+rGa3utWna40RTLLUBctKwYOD9C
 2ErQTwwp9jODQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E10A5E4F138; Fri, 26 May 2023 04:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168507422091.22221.15153316764967144660.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 04:10:20 +0000
References: <20230524125714.357337-1-wei.fang@nxp.com>
In-Reply-To: <20230524125714.357337-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: linux-kernel@vger.kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 simon.horman@corigine.com, linux-stm32@st-md-mailman.stormreply.com,
 bpf@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, sdf@google.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 gerhard@engleder-embedded.com, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix call trace when
 stmmac_xdp_xmit() is invoked
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 May 2023 20:57:14 +0800 you wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> We encountered a kernel call trace issue which was related to
> ndo_xdp_xmit callback on our i.MX8MP platform. The reproduce
> steps show as follows.
> 1. The FEC port (eth0) connects to a PC port, and the PC uses
> pktgen_sample03_burst_single_flow.sh to generate packets and
> send these packets to the FEC port. Notice that the script must
> be executed before step 2.
> 2. Run the "./xdp_redirect eth0 eth1" command on i.MX8MP, the
> eth1 interface is the dwmac. Then there will be a call trace
> issue soon. Please see the log for more details.
> The root cause is that the NETDEV_XDP_ACT_NDO_XMIT feature is
> enabled by default, so when the step 2 command is exexcuted
> and packets have already been sent to eth0, the stmmac_xdp_xmit()
> starts running before the stmmac_xdp_set_prog() finishes. To
> resolve this issue, we disable the NETDEV_XDP_ACT_NDO_XMIT
> feature by default and turn on/off this feature when the bpf
> program is installed/uninstalled which just like the other
> ethernet drivers.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix call trace when stmmac_xdp_xmit() is invoked
    https://git.kernel.org/netdev/net/c/ffb3322181d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
