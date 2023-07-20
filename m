Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499775A4ED
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jul 2023 06:00:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC90C6B44D;
	Thu, 20 Jul 2023 04:00:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C2E1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 04:00:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC3CF615B6;
 Thu, 20 Jul 2023 04:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 285EFC433C8;
 Thu, 20 Jul 2023 04:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689825622;
 bh=WW61fEJn5ley9K1VeZE4qAk6gC7/D9WN6n2QMTISo2g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KTGTYZoyh9kkafvx22Qw427otTcIOaectoEDbiZ2/mYm0sPOlXxJG5vANVMpoqr8s
 Z/UjtLwfkJskzJy6gy1OWJzgRZmdp4PT+hVkkuRAja1HAxiuc1Tm0BNNYKU3WVzHOo
 aNf4MalOznHSDao2pNIYBCUuXHOseG5YvbFPiHH7ADowczq3U1UyzmLdTdNSWTV45G
 ZKybTABsCKsYcSLjE5M25ra3D+tLZHmCKXT+8GJdHvZpxyb1/blb7ZS4/5uNNJwj5Z
 JkAOmG62hmAwhQDGhLw0qUIa7CKB94kJR8/eIn7dlvK/spCDJMj2ZL8HRTO77IfvKE
 4ncWc1uPV2LIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 025C2E22AE2; Thu, 20 Jul 2023 04:00:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168982562200.4243.13225573648147427598.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jul 2023 04:00:22 +0000
References: <20230717160630.1892-1-jszhang@kernel.org>
In-Reply-To: <20230717160630.1892-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, samuel@sholland.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jernej.skrabec@gmail.com,
 wens@csie.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/2] net: stmmac: improve
	driver statistics
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

On Tue, 18 Jul 2023 00:06:28 +0800 you wrote:
> improve the stmmac driver statistics:
> 
> 1. don't clear network driver statistics in .ndo_close() and
> .ndo_open() cycle
> 2. avoid some network driver statistics overflow on 32 bit platforms
> 3. use per-queue statistics where necessary to remove frequent
> cacheline ping pongs.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/2] net: stmmac: don't clear network statistics in .ndo_open()
    https://git.kernel.org/netdev/net-next/c/2eb85b750512
  - [net-next,v5,2/2] net: stmmac: use per-queue 64 bit statistics where necessary
    https://git.kernel.org/netdev/net-next/c/133466c3bbe1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
