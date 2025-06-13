Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E097AD804A
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 03:30:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40C8C36B2E;
	Fri, 13 Jun 2025 01:30:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD150C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 01:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C99844E35;
 Fri, 13 Jun 2025 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E631C4AF09;
 Fri, 13 Jun 2025 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749778217;
 bh=dnyl7xXadJ+gA1RxRmxVvePT5MX69p9ijLGsLv2UfoM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tEP83ZxKtH4Oa/RdEF7t93/9tX0SHhxr+r6AddkoboSWu6IFS9Yh9914P6vehPG4+
 ap5hDtDUAi2dWROQrfv/6bCEDCXHIh9xUF8an/uv/SHLyqKvtJ4U+Zk2fFrfxD1X1t
 9b2XOiii0OJNq3j15VR7xQ0dJDSX/FXBAZsHsipsB33Tq03Nyf1oSbhycYqBPtbhZT
 AVvuaWSYTV0uPOTMoqVez4sCHUCjCD5mLJJ8t10zpxNWPadkmSoE8UcHxW658+P3HA
 HlSnOu0eN9As8S7hzdlBuyXJsCnkW5iy7/7j7QVn5aoh11A60CaGRszwF5Jc+KUS1i
 fcpYUQrzd/Dww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70B8639EFFCF; Fri, 13 Jun 2025 01:30:48 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174977824699.179245.5669593462581793038.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jun 2025 01:30:46 +0000
References: <20250610200411.3751943-1-nikunj.kela@sima.ai>
In-Reply-To: <20250610200411.3751943-1-nikunj.kela@sima.ai>
To: Nikunj Kela <nikunj.kela@sima.ai>
Cc: linux-kernel@vger.kernel.org, romain.gantois@bootlin.com,
 inochiama@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 edumazet@google.com, netdev@vger.kernel.org, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, quentin.schulz@cherry.de, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: extend use of snps,
 multicast-filter-bins property to xgmac
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

On Tue, 10 Jun 2025 13:04:11 -0700 you wrote:
> Hash based multicast filtering is an optional feature. Currently,
> driver overrides the value of multicast_filter_bins based on the hash
> table size. If the feature is not supported, hash table size reads 0
> however the value of multicast_filter_bins remains set to default
> HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
> snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
> to indicate multicast filtering is not supported.
> 
> [...]

Here is the summary with links:
  - net: stmmac: extend use of snps,multicast-filter-bins property to xgmac
    https://git.kernel.org/netdev/net-next/c/94a8e4a8185f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
