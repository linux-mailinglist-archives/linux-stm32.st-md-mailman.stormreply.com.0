Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1AA99E7C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 03:50:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E858BC7802C;
	Thu, 24 Apr 2025 01:50:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 260EDC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:50:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 087A64A313;
 Thu, 24 Apr 2025 01:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B52C4CEE2;
 Thu, 24 Apr 2025 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745459410;
 bh=r8x30VuoJOYhodsigVM6Ux1MiJ1evECurEW8hJ8Qqu0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=B7aulUTmFiI7vI3fViJXFOPtN1evrtUsUOFHDvwYzrrB4kKepsqL6rIy15Q8WholK
 4PMQsVL8Wy7qNWcwBHi/rcvt/vkU1D4cLCB895U4mtI4npXZKATUrIpg6hYMIlHP+t
 JOFnqa3QFtUTHuVjJAxSbPwhlu3CjH4FIohYlUgJ19m+9kNq3zYJllAZm5RSUEu6Co
 59LyORrmh6u2hkcXbbA5yetS4qfGQwMJpz8sDlKZKBYbpY9B5GA7mWCxYwS5lBqPO1
 IBdcoLg8FshAqvlkC4Wa8lYLXVtF4d7tlfS9KrMlOEfzXLqTQKjQ4yPST4OWRMj1kA
 aOng2+lPepk2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D53380CED9; Thu, 24 Apr 2025 01:50:50 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545944873.2829412.16224274758028926959.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 01:50:48 +0000
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: quic_jsuraj@quicinc.com, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, ast@kernel.org, linux@armlinux.org.uk,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com, hawk@kernel.org,
 chwee.lin.choong@intel.com, jesper.nilsson@axis.com, daniel@iogearbox.net,
 vinicius.gomes@intel.com, przemyslaw.kitszel@intel.com, gal@nvidia.com,
 john.fastabend@gmail.com, faizal.abdul.rahim@linux.intel.com, 0x1207@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, kory.maincent@bootlin.com,
 xiaolei.wang@windriver.com, netdev@vger.kernel.org, fancer.lancer@gmail.com,
 andrew+netdev@lunn.ch, hkelam@marvell.com, mcoquelin.stm32@gmail.com,
 vitaly.lifshits@intel.com, bpf@vger.kernel.org, dima.ruinskiy@intel.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 00/14][pull request] igc: Add
 support for Frame Preemption
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

This series was applied to netdev/net-next.git (main)
by Tony Nguyen <anthony.l.nguyen@intel.com>:

On Fri, 18 Apr 2025 09:38:06 -0700 you wrote:
> Faizal Rahim says:
> 
> Introduce support for the FPE feature in the IGC driver.
> 
> The patches aligns with the upstream FPE API:
> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: move frag_size handling out of spin_lock
    https://git.kernel.org/netdev/net-next/c/b375984f0df0
  - [net-next,02/14] net: ethtool: mm: extract stmmac verification logic into common library
    https://git.kernel.org/netdev/net-next/c/9ff2aa4206ef
  - [net-next,03/14] net: ethtool: mm: reset verification status when link is down
    https://git.kernel.org/netdev/net-next/c/dda666343cc8
  - [net-next,04/14] igc: rename xdp_get_tx_ring() for non-xdp usage
    https://git.kernel.org/netdev/net-next/c/19d629079c0e
  - [net-next,05/14] igc: rename I225_RXPBSIZE_DEFAULT and I225_TXPBSIZE_DEFAULT
    https://git.kernel.org/netdev/net-next/c/67287d67bebd
  - [net-next,06/14] igc: use FIELD_PREP and GENMASK for existing TX packet buffer size
    https://git.kernel.org/netdev/net-next/c/425d8d9cb092
  - [net-next,07/14] igc: optimize TX packet buffer utilization for TSN mode
    https://git.kernel.org/netdev/net-next/c/0d58cdc902da
  - [net-next,08/14] igc: use FIELD_PREP and GENMASK for existing RX packet buffer size
    https://git.kernel.org/netdev/net-next/c/9cd87aafc7a8
  - [net-next,09/14] igc: set the RX packet buffer size for TSN mode
    https://git.kernel.org/netdev/net-next/c/7663370e32b3
  - [net-next,10/14] igc: add support for frame preemption verification
    https://git.kernel.org/netdev/net-next/c/5422570c0010
  - [net-next,11/14] igc: add support to set tx-min-frag-size
    https://git.kernel.org/netdev/net-next/c/55ececab9885
  - [net-next,12/14] igc: block setting preemptible traffic class in taprio
    https://git.kernel.org/netdev/net-next/c/e9074d7f3768
  - [net-next,13/14] igc: add support to get MAC Merge data via ethtool
    https://git.kernel.org/netdev/net-next/c/10e2ffe10e43
  - [net-next,14/14] igc: add support to get frame preemption statistics via ethtool
    https://git.kernel.org/netdev/net-next/c/f05ce73cc3b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
