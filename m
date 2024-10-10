Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422B997AED
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 05:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E61FDC712A1;
	Thu, 10 Oct 2024 03:00:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5583FC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 03:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF8B9A41B34;
 Thu, 10 Oct 2024 03:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FE2C4CEC3;
 Thu, 10 Oct 2024 03:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728529230;
 bh=R+46kwx4752B6j5G/ApPrfa3me8Ik8AUV1Hj0sfi8TA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hq5fDOgipTPppJ4Hnv5i+mf6CBbD0v/10Kz6vL2ZnJbo46VdM5mMRZXkNA9PssanD
 4TFdydTZKMTPMS417CWApNRFfxdhaj7cpcpt+oPhJYjhuw4f5EklwGOv8GOBCmUcvR
 xlB50eL+xZ0j+nhFQAUcaabEqSCcsS0GEzrK7J/RNWUVrfONKsctq4mFMkZpv0MCKC
 kMH1H4LM/B8OGwLOeoKwGJ4PyvDEisIW51XXJODzzr18drnTzO9Ell//oIyru8VLIJ
 6KdZshIMnXnjrzrwfao2GdR3pj/EWrNjuKX9ooDIiTzZDMNZzTPAoh9MzTPEWuU99J
 Ptnmoa/gvCrRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9B7983806644; Thu, 10 Oct 2024 03:00:35 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172852923449.1548394.13199964588329484925.git-patchwork-notify@kernel.org>
Date: Thu, 10 Oct 2024 03:00:34 +0000
References: <20241008111443.81467-1-minda.chen@starfivetech.com>
In-Reply-To: <20241008111443.81467-1-minda.chen@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: Add DW QoS Eth
 v4/v5 ip payload error statistics
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

On Tue,  8 Oct 2024 19:14:43 +0800 you wrote:
> Add DW QoS Eth v4/v5 ip payload error statistics, and rename descriptor
> bit macro because v4/v5 descriptor IPCE bit claims ip checksum
> error or TCP/UDP/ICMP segment length error.
> 
> Here is bit description from DW QoS Eth data book(Part 19.6.2.2)
> 
> bit7 IPCE: IP Payload Error
> When this bit is programmed, it indicates either of the following:
> 1).The 16-bit IP payload checksum (that is, the TCP, UDP, or ICMP
>    checksum) calculated by the MAC does not match the corresponding
>    checksum field in the received segment.
> 2).The TCP, UDP, or ICMP segment length does not match the payload
>    length value in the IP  Header field.
> 3).The TCP, UDP, or ICMP segment length is less than minimum allowed
>    segment length for TCP, UDP, or ICMP.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: Add DW QoS Eth v4/v5 ip payload error statistics
    https://git.kernel.org/netdev/net-next/c/0a316b16a6c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
