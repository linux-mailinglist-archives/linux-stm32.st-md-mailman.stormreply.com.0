Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC4C1E14C
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 03:00:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319B9C62D79;
	Thu, 30 Oct 2025 02:00:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76534C62D78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 02:00:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2CD7E404C7;
 Thu, 30 Oct 2025 02:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF0EC4CEFD;
 Thu, 30 Oct 2025 02:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761789634;
 bh=adIWWp6JkooxcKkGWYYawGCvhKj6QLF1nHLdmWN8kTU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DvgD0crXsz2KIHnfdi2gFAs+PUXtkzVqXmU0p99CXOjMOalyelax+Vt3tajwrE6X+
 pLi7P2vQso326M5CXCD369G0Y/kUzkwJeIq/3WmqLYV9OmVRlfqC4bcxH94Ors1RCe
 g5sACvH+KPESlK0/hcbU2jOKBJB6SW5X7Z1GWiRzfyncxOddGTimHShWe1HhHhPc3J
 TLvq89M2lJ4wXUSGW8/4Tmx44Yx0w6Fdkj+2F78x2POLBShSO3YUdkEsIf0GgpBgpq
 +2q8fzLAL8eM7lcXln+LKoQTc4cIV7C6cgv+3fydUpIDsDAdB/nS0DuRnPu1AYHL04
 EjEUP9E3qnzhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C123A55ED9; Thu, 30 Oct 2025 02:00:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178961100.3282477.1158388762703076399.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 02:00:11 +0000
References: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
In-Reply-To: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Rohan <rohan.g.thomas@altera.com>
Cc: Jose.Abreu@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, matthew.gerlach@altera.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v4 0/3] net: stmmac: Fixes for stmmac
 Tx VLAN insert and EST
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Oct 2025 11:18:42 +0800 you wrote:
> This patchset includes following fixes for stmmac Tx VLAN insert and
> EST implementations:
>    1. Disable STAG insertion offloading, as DWMAC IPs doesn't support
>       offload of STAG for double VLAN packets and CTAG for single VLAN
>       packets when using the same register configuration. The current
>       configuration in the driver is undocumented and is adding an
>       additional 802.1Q tag with VLAN ID 0 for double VLAN packets.
>    2. Consider Tx VLAN offload tag length for maxSDU estimation.
>    3. Fix GCL bounds check
> 
> [...]

Here is the summary with links:
  - [net,v4,1/3] net: stmmac: vlan: Disable 802.1AD tag insertion offload
    https://git.kernel.org/netdev/net/c/c657f86106c8
  - [net,v4,2/3] net: stmmac: Consider Tx VLAN offload tag length for maxSDU
    https://git.kernel.org/netdev/net/c/ded9813d17d3
  - [net,v4,3/3] net: stmmac: est: Fix GCL bounds checks
    https://git.kernel.org/netdev/net/c/48b2e323c018

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
