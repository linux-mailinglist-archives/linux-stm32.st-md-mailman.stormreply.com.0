Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D2B2575B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 01:18:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A997C36B2F;
	Wed, 13 Aug 2025 23:18:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F72EC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 23:18:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 481BB45519;
 Wed, 13 Aug 2025 23:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90B1C4CEEB;
 Wed, 13 Aug 2025 23:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755127123;
 bh=lhIQxzr3DuEkga2iHGADkHZ7fFBhMHQcFKPR3xyRtN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=clM17nEV7nTHsfRaLcq+fHq8MfMT9FYqgVgmEJYTkXn0qMtkRcOgGh94JEJR8y/JX
 zOAdS9iNrVv9yfc0HNhvitIvdaNKx3bSReyDGYK+/VGYK6GW9gGX+Y059mP35h65Fu
 B0iWp5WaUcVMbHU/ryyrwCouG10Gdn3W6TGTuFurKWN5ScHsxZnu/q1OtbUAynZYqr
 +6n8W5P6UU+jDcXZvyjdaRd/0EU+nM6OwjNJL2cwBCAvIW+FPE0xob8fnErZNXwnQy
 UGOOedsZbHstbNa6qdpq4gFlmz6oqq1BIveEecNi+9K2G34uiFjbpLiMJtBDJxqcUo
 J9GeGHi4LMBhA==
Date: Wed, 13 Aug 2025 16:18:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Message-ID: <20250813161841.04f5ff73@kernel.org>
In-Reply-To: <20250812012127.197-1-kernel@airkyi.com>
References: <20250812012127.197-1-kernel@airkyi.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: ethernet: stmmac:
 dwmac-rk: Make the clk_phy could be used for external phy
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

On Tue, 12 Aug 2025 09:21:27 +0800 Chaoyi Chen wrote:
> For external phy, clk_phy should be optional, and some external phy
> need the clock input from clk_phy. This patch adds support for setting
> clk_phy for external phy.

This patch doesn't seem to apply to net-next/main, please rebase &
repost.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
