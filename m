Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF1513FDB
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 02:56:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E37BC6047D;
	Fri, 29 Apr 2022 00:56:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86CC5C60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 00:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NDXFJRM7G+3xMHDd/nLJHZ8nkgsa89rne//SVuZyCYw=; b=n3yQheLliCunMagcTCQKTn1N/Q
 7GFgv+RtxaFd3YXqdZqpmmiEGCJQVgu8UQoCdnCTKz3/jWNiAJTMML6sS40ZyckLIaovXw5ZqOaFh
 3FuFSCziyZtxnwXhC3VsplJ7nNdEaZbIZD2yp0ILc7WsAZmvsmDjke4nckGHClTOFy9Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nkEw6-000Owc-G4; Fri, 29 Apr 2022 02:56:42 +0200
Date: Fri, 29 Apr 2022 02:56:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jianqun Xu <jay.xu@rock-chips.com>
Message-ID: <Yms3ynT8RGmldAkm@lunn.ch>
References: <20220428010927.526310-1-jay.xu@rock-chips.com>
 <20220429004605.1010751-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429004605.1010751-1-jay.xu@rock-chips.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, joabreu@synopsys.com,
 peppe.cavallaro@st.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2] ethernet: stmmac: support driver work
 for DTs without child queue node
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

On Fri, Apr 29, 2022 at 08:46:05AM +0800, Jianqun Xu wrote:
> The driver use the value of property 'snps,rx-queues-to-use' to loop
> same numbers child nodes as queues, such as:
> 
>     gmac {
>         rx-queues-config {
>             snps,rx-queues-to-use = <1>;
>             queue0 {
>                 // nothing need here.
> 	    };
> 	};
>     };
> 
> Since a patch for dtc from rockchip will delete all node without any
> properties or child node, the queue0 node will be deleted, that caused
> the driver fail to probe:

Is this the in tree dtc? Do you have a commit hash for it? That should
probably be used as a Fixes: tag. Or that change to dtc needs
reverting because it breaks stuff.

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
