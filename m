Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224E3F72B3
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 12:10:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14213C58D58;
	Wed, 25 Aug 2021 10:10:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6785BC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 10:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 70E7861183;
 Wed, 25 Aug 2021 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886206;
 bh=65p/TIA87p7eJYjLp0QTn1JuyKk95BTYSGbqHgZY5Qw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=k7iDOMivV62EC7EAlkOReOOg+q9yvXot4CH2A7q3TTMptJ+bq63IYHWTmnWcQ3E96
 AgJnrzIdrXwvx1mVxOPiJ0iScY4sK2egYotLzkLp6IwhC/+BzCy9KAqDxK3hEUSfhE
 5QOLCu0TK9pxF4/RFTxb5lDAQeB3k0ikabURBLxAlr9AN4HRIde6CWe0S5JPtOiUaJ
 CDIDQNYml/+nC8JInsBee7hXJsf7FrQFpwXRqps6TBe7+QqtRj74kdW8pXkk6ihKIU
 B/JlBPr+1+GQy4ukz/UvgbmZO0r/0iLvjNNu2WlMkO/Cg0nFZXDyWNb4AqpcDnuTUB
 0lpK6X+uob/eQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 671C360A0C;
 Wed, 25 Aug 2021 10:10:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162988620641.3256.15807737014421094725.git-patchwork-notify@kernel.org>
Date: Wed, 25 Aug 2021 10:10:06 +0000
References: <20210825005529.980109-1-yoong.siang.song@intel.com>
In-Reply-To: <20210825005529.980109-1-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: linux-kernel@vger.kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 boon.leong.ong@intel.com, kuba@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix kernel panic
 due to NULL pointer dereference of xsk_pool
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

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 25 Aug 2021 08:55:29 +0800 you wrote:
> After free xsk_pool, there is possibility that napi polling is still
> running in the middle, thus causes a kernel crash due to kernel NULL
> pointer dereference of rx_q->xsk_pool and tx_q->xsk_pool.
> 
> Fix this by changing the XDP pool setup sequence to:
>  1. disable napi before free xsk_pool
>  2. enable napi after init xsk_pool
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: fix kernel panic due to NULL pointer dereference of xsk_pool
    https://git.kernel.org/netdev/net/c/a6451192da26

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
