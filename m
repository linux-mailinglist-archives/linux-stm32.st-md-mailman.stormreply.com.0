Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A0C909DC
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Nov 2025 03:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A67EC628D3;
	Fri, 28 Nov 2025 02:23:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57871C628D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Nov 2025 02:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D38CA443E3;
 Fri, 28 Nov 2025 02:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13C7C4CEF8;
 Fri, 28 Nov 2025 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764296608;
 bh=FUhaRxnXxUxNE/ZyHqmZ2tKNQvfpkfg9F1oOG/YoFcE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=o5xz3475Sgzsjl/Oe2COi8lhMczVWqsmUBOyO2HdzTfuQVWJDv8p0rwFzzSIiBO6i
 g099rBuB4qNiRmX529LpoP6hiSswuspBnaxMtdBrn063QYGgaaTyQsxLj0EPaqR6sA
 NL72DpR95eEW5d3NYMIJfM5P+mOx+q6kQbm52o+xZLTm6sX2jgwUb5oAfCpG7OdCxq
 NUd1zskgeQYPVyxixZaf8bFmXkrmPJ/hRrBMH2i6p3VjBkmnxU56TeUC/4z4RrHpjm
 UgXeownzuygBq5d+w5w/0kDXHkdNKXo9T05ksFZY5qkODrxTaoNhq9BQBBsLHTnhmB
 AOxgZSzXC0ycw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B7133808204; Fri, 28 Nov 2025 02:20:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176429643103.114872.3644233989627611671.git-patchwork-notify@kernel.org>
Date: Fri, 28 Nov 2025 02:20:31 +0000
References: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Cc: hayashi.kunihiko@socionext.com, vladimir.oltean@nxp.com,
 edumazet@google.com, boon.leong.ong@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, 0x1207@gmail.com, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, hawk@kernel.org, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 jh@henneberg-systemdesign.com, piotr.raczynski@intel.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix rx limit check
 in stmmac_rx_zc()
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Nov 2025 10:43:27 +0000 you wrote:
> The extra "count >= limit" check in stmmac_rx_zc() is redundant and
> has no effect because the value of "count" doesn't change after the
> while condition at this point.
> 
> However, it can change after "read_again:" label:
> 
>         while (count < limit) {
>             ...
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix rx limit check in stmmac_rx_zc()
    https://git.kernel.org/netdev/net-next/c/8048168df56e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
