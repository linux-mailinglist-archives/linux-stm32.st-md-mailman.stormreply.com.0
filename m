Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE268996878
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 13:20:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BF9CC7128F;
	Wed,  9 Oct 2024 11:20:43 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0608C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 11:20:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4DC05A43DE2;
 Wed,  9 Oct 2024 11:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7782AC4CECD;
 Wed,  9 Oct 2024 11:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728472834;
 bh=xaSEJ3dD1rU6zIl94O2EI/NrZsUS7PivY49japQdM6k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=E1aPEKLPrraWDfdq78spXaxl/+bFzdtXSd+vGgTcOY3MGJe2gOIcwzFFoOj3lc2qR
 FBF+7gZGLK5cwOqeakq6v5YDEE388UGcP2cW86pDZ7ki1Ps789PgFX5XK3PVICbtRn
 2ziy+O+rTQjoL7eFmU3S4uvsfzvHlW5fUtks0WZzbFu9QRi8d8fHJgX8pldEO3bev1
 27IgjH08w1OKmAX9MRx6svik7ZzckL/Tq7hFtN7zphUjprkbi4lY18Mb0KH+edmPuw
 llpGeO5fGSJDiX5cWKXpd/ZJN/A9yDLB3gtEzekawnaoLR+Srb0HKRp5TchhkqHvnB
 uoDo/06vv9Yhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EACD63806644; Wed,  9 Oct 2024 11:20:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172847283848.1228916.5224777219371155033.git-patchwork-notify@kernel.org>
Date: Wed, 09 Oct 2024 11:20:38 +0000
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, pabeni@redhat.com, netdev@vger.kernel.org,
 joabreu@synopsys.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, jiawenwu@trustnetic.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, mengyuanlou@net-swift.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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
by David S. Miller <davem@davemloft.net>:

On Fri, 4 Oct 2024 11:19:57 +0100 you wrote:
> This is the second cleanup series for XPCS.
> 
> Patch 1 removes the enum indexing the dw_xpcs_compat array. The index is
> never used except to place entries in the array and to size the array.
> 
> Patch 2 removes the interface arrays - each of which only contain one
> interface.
> 
> [...]

Here is the summary with links:
  - [net-next,01/13] net: pcs: xpcs: remove dw_xpcs_compat enum
    https://git.kernel.org/netdev/net-next/c/e30993a9ab00
  - [net-next,02/13] net: pcs: xpcs: don't use array for interface
    https://git.kernel.org/netdev/net-next/c/0397212f9306
  - [net-next,03/13] net: pcs: xpcs: pass xpcs instead of xpcs->id to xpcs_find_compat()
    https://git.kernel.org/netdev/net-next/c/4490f5669b06
  - [net-next,04/13] net: pcs: xpcs: provide a helper to get the phylink pcs given xpcs
    https://git.kernel.org/netdev/net-next/c/f042365a26b0
  - [net-next,05/13] net: pcs: xpcs: move definition of struct dw_xpcs to private header
    https://git.kernel.org/netdev/net-next/c/accd5f5cd2e1
  - [net-next,06/13] net: pcs: xpcs: rename xpcs_get_id()
    https://git.kernel.org/netdev/net-next/c/135d118bfd01
  - [net-next,07/13] net: pcs: xpcs: move searching ID list out of line
    https://git.kernel.org/netdev/net-next/c/7921d3e602fc
  - [net-next,08/13] net: pcs: xpcs: use FIELD_PREP() and FIELD_GET()
    https://git.kernel.org/netdev/net-next/c/f68189181061
  - [net-next,09/13] net: pcs: xpcs: add _modify() accessors
    https://git.kernel.org/netdev/net-next/c/ce8d6081fcf4
  - [net-next,10/13] net: pcs: xpcs: convert to use read_poll_timeout()
    https://git.kernel.org/netdev/net-next/c/d69908faf132
  - [net-next,11/13] net: pcs: xpcs: use dev_*() to print messages
    https://git.kernel.org/netdev/net-next/c/acb5fb5a42cf
  - [net-next,12/13] net: pcs: xpcs: correctly place DW_VR_MII_DIG_CTRL1_2G5_EN
    https://git.kernel.org/netdev/net-next/c/5ba561930390
  - [net-next,13/13] net: pcs: xpcs: move Wangxun VR_XS_PCS_DIG_CTRL1 configuration
    https://git.kernel.org/netdev/net-next/c/bb0b8aeca636

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
