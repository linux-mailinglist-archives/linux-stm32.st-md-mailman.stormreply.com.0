Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEE9A1F9A
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 12:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D882BC78032;
	Thu, 17 Oct 2024 10:19:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9BF7C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:19:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0470E5C5DC8;
 Thu, 17 Oct 2024 10:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B19C4CEC5;
 Thu, 17 Oct 2024 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729160342;
 bh=EwYIiVN0SdU+AkH/bqOTTx9jJa66IvHYmbDVoyJuE1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldn9oUebm27rhdmUNrnOOid25bg5Cnqabl8JZE4coHOkSMDkAe0L/JXRjSxp8UR1L
 cK2rQdpLhLvXQuXRvoPWb32T8XPVjrpIVkKJLsJoehDXa5qxTrfXrEbh0AAAZ4ktBY
 iFM9sgzhMBOfM8ypLdkqQdRwIT6csH5c8/TBB7IDkcvKZrlYzsCabhf5XM+Cvi9K+9
 ZjkIxqy66D7ecL44cSqTHccZaralLQVsdC6wiKhCSzMrQlylRPRwuS9qsULCGDBR0w
 mzmK/IdZ/W5WNGYiGz3I6r17rhQGInyAww+I6Et5AkEcoSFD97NDtZ5edBhATBj4uL
 vzL+hfqAm32Vg==
Date: Thu, 17 Oct 2024 11:18:57 +0100
From: Simon Horman <horms@kernel.org>
To: 2694439648@qq.com
Message-ID: <20241017101857.GE1697@kernel.org>
References: <tencent_6BF819F333D995B4D3932826194B9B671207@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_6BF819F333D995B4D3932826194B9B671207@qq.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 hailong.fan@siengine.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: enable MAC after MTL
	configuring
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

On Mon, Oct 14, 2024 at 01:44:03PM +0800, 2694439648@qq.com wrote:
> From: "hailong.fan" <hailong.fan@siengine.com>
> 
> DMA maybe block while ETH is opening,
> Adjust the enable sequence, put the MAC enable last
> 
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>

Hi,

I think that some more explanation of this is required.
Including if a problem has been observed, and if so under what
conditions. Or, if not, some background information on why
this adjustment is correct.

I also think some explanation is required of the relationship
between the changes this patch makes to setup, and the
changes it makes to start and stop.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
