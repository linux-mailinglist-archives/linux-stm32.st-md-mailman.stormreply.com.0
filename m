Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CEB42E3A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 02:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4CAEC36B3D;
	Thu,  4 Sep 2025 00:30:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 130DFC36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 00:30:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6C4B4365C;
 Thu,  4 Sep 2025 00:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D84C4CEE7;
 Thu,  4 Sep 2025 00:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756945813;
 bh=8YlLKo7oKMWe8nMTgXzhGD4l4zeBWdl4jzzaNRcv3tI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=odTFl1GKsc0uOzFyuMlYWir6XzVmSovsSYkA/xcaWKNQtdYQlS9T3uBVU9o2PoHWA
 7Z1fpfd8zoBxEgMigj3OdlYdg+E7uhhRRqQwRbGpSoukVwTIjsi35J6SvPeuHxXtel
 r32A6otZXFewij2nw6qwkycC5XSa3m1gyVykv3RVLkQdoYEh5rzB78+XNHtHz29kbo
 3ADAomyrMukrTo2wGOeW6kGpBYnyhlEXTgl9LgGLzyfprTmgtLw36C3To/zkyB2UiY
 QQKe/+5l/3KHjBwxcc1vv0xXv4o4kV0DwW38s1xJUJs6e7IYiJINqnrlgjt1V+X1ew
 7LME9mPlprWdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF72383C259; Thu,  4 Sep 2025 00:30:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694581848.1248581.9473792758575091904.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 00:30:18 +0000
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
In-Reply-To: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
 devicetree@vger.kernel.org, sboyd@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, jstultz@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/3] net: stmmac: allow
 generation of flexible PPS relative to MAC time
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 1 Sep 2025 11:16:26 +0200 you wrote:
> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
> the command previously used with a MACv4 for genering a PPS signal:
> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
> did not work.
> 
> This is because the arguments passed through this command must contain
> the start time at which the PPS should be generated, relative to the
> MAC system time. For some reason, a time set in the past seems to work
> with a MACv4.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/3] time: export timespec64_add_safe() symbol
    https://git.kernel.org/netdev/net-next/c/96c88268b79b
  - [net-next,v4,2/3] drivers: net: stmmac: handle start time set in the past for flexible PPS
    https://git.kernel.org/netdev/net-next/c/adbe2cfd8a93
  - [net-next,v4,3/3] ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
