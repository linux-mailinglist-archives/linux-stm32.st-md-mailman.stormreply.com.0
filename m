Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9AC38E3B
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 03:40:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB213C62D94;
	Thu,  6 Nov 2025 02:40:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 990B8C57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 02:40:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2701B44946;
 Thu,  6 Nov 2025 02:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037F8C4CEF8;
 Thu,  6 Nov 2025 02:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762396838;
 bh=GxAFBY0FuzXylt3WKOzyYIHU0Sz+s/MVF/ONHT3Sg0o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UHNircHWcHy3PSqdTQHRBGrQqufuaIO7vo9bAJHYDavrkSDS6yd5KUQWNWgxTGwug
 ce5X2nKkdAstgwgC8PrTSBfOWA0OsfZHrPD7Q8EcVs/0HDhe3qJicv7h0LKF9mbYPd
 trKNLNtgaGMIeMRM+DpX8KdBIeM7TliSUDBCXFZID8JSYEaLXrei5t9PJHlZh1QfGe
 0BBOBaMPALeSeAR0D+oBJ70s27Yly4HDNijFHkFnT0d7oNT53Ec6a7aaDcNIWUZocr
 DS5yLFR9608fokkKIj6gCWZX2ETBeX8BJ7IrN+Kyd0TJtqin22QDAOzFz8xsPWv8/4
 Tg5FQ/wedVDlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CFC380AAF9; Thu,  6 Nov 2025 02:40:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176239681110.3843222.1196366168534081089.git-patchwork-notify@kernel.org>
Date: Thu, 06 Nov 2025 02:40:11 +0000
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: s.trumtrar@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: socfpga: Add
 Agilex5 platform support and enhancements
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

On Sat, 01 Nov 2025 01:27:06 +0800 you wrote:
> This patch series adds support for the Agilex5 EMAC platform to the
> dwmac-socfpga driver.
> 
> The series includes:
>    - Platform configuration for Agilex5 EMAC
>    - Enabling Time-Based Scheduling (TBS) for Tx queues 6 and 7
>    - Enabling TCP Segmentation Offload(TSO)
>    - Adding hardware-supported cross timestamping using the SMTG IP,
>      allowing precise synchronization between MAC and system time via
>      PTP_SYS_OFFSET_PRECISE.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: stmmac: socfpga: Agilex5 EMAC platform configuration
    https://git.kernel.org/netdev/net-next/c/93d46ea3e984
  - [net-next,v2,2/4] net: stmmac: socfpga: Enable TBS support for Agilex5
    https://git.kernel.org/netdev/net-next/c/4c00476d4480
  - [net-next,v2,3/4] net: stmmac: socfpga: Enable TSO for Agilex5 platform
    https://git.kernel.org/netdev/net-next/c/e28988aef70f
  - [net-next,v2,4/4] net: stmmac: socfpga: Add hardware supported cross-timestamp
    https://git.kernel.org/netdev/net-next/c/fd8c4f645496

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
