Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A638C96D78
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 12:13:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 386D8C628B7;
	Mon,  1 Dec 2025 11:13:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13267C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 11:13:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2234260121;
 Mon,  1 Dec 2025 11:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD66C113D0;
 Mon,  1 Dec 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764587586;
 bh=fYMUbue3Ka37fHtYbiOTRTL0VUjzqr8ncwExp4fw1FE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pn4Nvlb4RGM/2J1Djw/JQddi/rPHy2L2SrgU5wUXUnhXZ3erHzGf44qJlxd7ZqHwA
 yJN7Vle/JIEZF0TQeGO1vFt8693jeI7pr/V94TDEHSF8mfHH0xSgIjXAmPAXXim7Bm
 Yjz5RGABeUJ3Ze/bYIsjU/vtpQ8W1S6Mz2gS/YxxxbhDhf6Twvo6DG2FSyOTT4fGUh
 jMZEpDLyHunt9uxqS8oFWE7G72LSqK3a0jK/eKFABDtWYJxZynlB45SneYduYroF+G
 S9LGtt+fxGQLHTHgGi/TrM9Lp6yVGuNTtYDNuve6IUXFkmmMgMoW1dq6xMTQaIHEE6
 /89T5rQuMh1KQ==
Date: Mon, 1 Dec 2025 11:13:02 +0000
From: Simon Horman <horms@kernel.org>
To: 2694439648@qq.com
Message-ID: <aS14PnwjbFcD_J70@horms.kernel.org>
References: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
Cc: hailong.fan@siengine.com, inux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Modify the judgment
 condition of "tx_avail" from 1 to 2
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

On Mon, Dec 01, 2025 at 10:57:01AM +0800, 2694439648@qq.com wrote:
> From: "hailong.fan" <hailong.fan@siengine.com>
> 
>     Under certain conditions, a WARN_ON will be triggered
>     if avail equals 1.
> 
>     For example, when a VLAN packet is to send,
>     stmmac_vlan_insert consumes one unit of space,
>     and the data itself consumes another.
>     actually requiring 2 units of space in total.

Hi,

I am wondering if there are other cases where an extra
descriptor is needed. And if so, can multiple such conditions
occur at the same time?

I am also wondering if the VLAN condition can be detected,
so a descriptor is only reserved for VLAN use if it will
actually be used for a VLAN.

And I think it would be worth noting how this problem was discovered
e.g. by inspection, using tooling (static analysis, AI, ...).
And how it has been tested e.g. On real HW, compile tested only.


As this is a fix for Networking code present in the net tree
it should be based on that tree. And targeted at that tree like this:

Subject: [PATCH net] ...

Also, as a fix for net, it should have a fixes tag.
Generally, this should denote the first patch where the problem would
manifest. In this case this seems to be a likely candidate:

Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")

The tag should go immediately above other tags, in this case your
Signed-off-by line, without any blank lines in between. And, like other
tags, it should not be line-wrapped.

For more information on the workflow for Networking changes please see:
https://docs.kernel.org/process/maintainer-netdev.html

> 
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
