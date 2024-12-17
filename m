Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F689F5125
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 17:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7D89C78012;
	Tue, 17 Dec 2024 16:35:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4E1DC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 16:35:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59EE75C5FE9;
 Tue, 17 Dec 2024 16:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79154C4CED3;
 Tue, 17 Dec 2024 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734453343;
 bh=/dZtUTdnhLYhG2L/43KFiQTEBTs+21tdyBzFD6hhoH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P/HJ9a1xQl8pF07zs+jiCgA6Ufn65F22qQK2hTSdMKozssSiT1/9snJXgjLg6HMg4
 IWS2JUmyPB0Rq0waxl552ll3jjafAXmFEeXgfUZrT3sdkzDpLfSEMbVNy1F+TVr3e3
 NqzfanoZS0C8SS9IHKCwlFdJ8w11F+5xfX+tKWhyZRxs6l9rQixJrbU5oEugFTPUHK
 n90ZUuKrGQLZVs1eqjts+B5w1WY97NEG6hoTf5vL3u4JLLv29nQfQbg+Df/wnKcsg4
 B8NUl8T6kkv1TSH58s6VgEzaetgMO89x6TTzuKhFwfuGW0S3SCbSuUzE7gaP1XTCev
 MtYElsT79HriA==
Date: Tue, 17 Dec 2024 16:35:38 +0000
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241217163538.GU780307@kernel.org>
References: <20241217091712.383911-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217091712.383911-1-0x1207@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Drop useless code
 related to ethtool rx-copybreak
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

On Tue, Dec 17, 2024 at 05:17:12PM +0800, Furong Xu wrote:
> After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
> Pool"), these code turned to be useless and users of ethtool may get
> confused about the unhandled rx-copybreak parameter.

Hi Furong Xu,

I think it would be useful to explain why the change cited above
renders the copybreak implementation unnecessary.

> 
> This patch mostly reverts
> commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")
> 
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")

Based on your description this feels more like an enhancement
for net-next, without a Fixes tag, than a fix for net.

> Signed-off-by: Furong Xu <0x1207@gmail.com>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
