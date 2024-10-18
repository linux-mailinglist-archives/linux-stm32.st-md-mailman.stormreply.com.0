Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAE9A4439
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 18:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E74E9C78023;
	Fri, 18 Oct 2024 16:59:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2068DC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=uaT3G6vBHHY2C2lq2x0O3457k17SuI2+GsVm0BVYviw=; b=QFSVkek/L6Gbg75YKelgPY4MKO
 cHOB4Xf0IuLmLa41cb9wlFEiuD3Bmoak723HgtwMiqNoDgzWJaKmvbug3sW+e4co6+gFL59k0iIQg
 ld0nASZqsYSNeWxESGCNngxqOUnwtBvk5EgNGuDcdBPxPV7HU3qtuto4D8SUS+S2qchA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t1qK2-00AYFn-Fb; Fri, 18 Oct 2024 18:59:30 +0200
Date: Fri, 18 Oct 2024 18:59:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <a9eefb9a-8ab7-4131-a9f0-cae2bb0a126f@lunn.ch>
References: <cover.1729233020.git.0x1207@gmail.com>
 <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
 <20241018091321.gfsdx7qzl4yoixgb@skbuf>
 <20241018180023.000045d8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018180023.000045d8@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 7/8] net: stmmac: xgmac:
	Complete FPE support
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

> In fact, I can drop the stmmac_fpe_ops at all, avoid the antipattern of
> calling a function pointer for good.
> Since this is a new module, we can try something new ;)

This sounds like a self change-request.

So:

pw-bot: cr

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
