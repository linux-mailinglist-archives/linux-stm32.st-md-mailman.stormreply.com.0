Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29DA1AC14
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 22:48:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6130DC78F89;
	Thu, 23 Jan 2025 21:48:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBF1CC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 21:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4wRX6nt5upARGmRL+6GBeqGf+Xia6h78Ps4/imq7qz8=; b=sxrVu2A3hyTix1INO9hsYSTRlw
 3hsdB0UGVaKHFe93i6+mJgUzYMrDBIOg332lYW/kr30ecXdNoGnmmoX3TNPN5fdI7r0xhC002+N38
 4CJs4giDq2cneX+Hg8Ks49wT14J3KHNDViOGzQgOKhTxJ49wBh3J8gPKDOvEcuQMGMLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tb546-007Njj-4d; Thu, 23 Jan 2025 22:48:42 +0100
Date: Thu, 23 Jan 2025 22:48:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Brad Griffis <bgriffis@nvidia.com>
Message-ID: <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 netdev@vger.kernel.org, Joe Damato <jdamato@fastly.com>,
 linux-kernel@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

> Just to clarify, the patch that you had us try was not intended as an actual
> fix, correct? It was only for diagnostic purposes, i.e. to see if there is
> some kind of cache coherence issue, which seems to be the case?  So perhaps
> the only fix needed is to add dma-coherent to our device tree?

That sounds quite error prone. How many other DT blobs are missing the
property? If the memory should be coherent, i would expect the driver
to allocate coherent memory. Or the driver needs to handle
non-coherent memory and add the necessary flush/invalidates etc.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
