Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6FF33D9C5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 17:49:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0671C57B78;
	Tue, 16 Mar 2021 16:49:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E5DC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:49:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB41A650D9;
 Tue, 16 Mar 2021 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615913339;
 bh=x0al1JEAyEx4XIh3lzQ9DJ/av9JZwgNE5rjGsw4HlB8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k/jXAFhw/fMonA6+647puTN/B/zyNKGgwIcxU7YkDrHietup2N5/NxFCLRjNBuv2y
 bRqS94TMxzaCYSTJS4ifKah2+LhGLrbZ/gSWy+rxjbx5PnFKMaD3ep1F1KP1XAmm+s
 gXhbrok19owEHqqC2pMbVcRK28h2NiQVkCTBJuvxMB0WVOUJ8FdgxUUYOOjmxmZqz3
 XAEH8l7UQC2cK/CTMHZFLUqy51N6i+GvxVJrzwqO7AfajAoI5il9HbneEm4I2AIisB
 KMbv3TWo7sOoWL5EgmRZqmF8Ljag7DKOo5MrALNk1Zu3yuj8kAjh4qEQSZ+rRC7gjr
 aSmRHLQJ8htDA==
Date: Tue, 16 Mar 2021 09:48:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Message-ID: <20210316094858.6c7121cb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <DM6PR11MB2780933A34D80D27920DB977CA6B9@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <20210315064448.16391-1-boon.leong.ong@intel.com>
 <20210315064448.16391-2-boon.leong.ong@intel.com>
 <20210315125059.32fde79a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <DM6PR11MB2780933A34D80D27920DB977CA6B9@DM6PR11MB2780.namprd11.prod.outlook.com>
MIME-Version: 1.0
Cc: "          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"David S .  Miller" <davem@davemloft.net>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add per-queue
 TX & RX coalesce ethtool support
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

On Tue, 16 Mar 2021 04:44:17 +0000 Ong, Boon Leong wrote:
> >> +	if (queue < tx_cnt) {
> >> +		ec->tx_coalesce_usecs = priv->tx_coal_timer[queue];
> >> +		ec->tx_max_coalesced_frames = priv->tx_coal_frames[queue];
> >> +	} else {
> >> +		ec->tx_coalesce_usecs = -1;
> >> +		ec->tx_max_coalesced_frames = -1;
> >> +	}
> >> +
> >> +	if (priv->use_riwt && queue < rx_cnt) {
> >> +		ec->rx_max_coalesced_frames = priv->rx_coal_frames[queue];
> >> +		ec->rx_coalesce_usecs = stmmac_riwt2usec(priv-
> >>rx_riwt[queue],
> >> +							 priv);
> >> +	} else {
> >> +		ec->rx_max_coalesced_frames = -1;
> >> +		ec->rx_coalesce_usecs = -1;  
> >
> >Why the use of negative values? why not leave them as 0?  
> The initial logic was to return negative value to unsupported TXQ & RXQ
> since they are invalid. No preference here. So, we can leave it as all zeros.

I believe most drivers would leave it as 0, -1 seems unusual, have you
seen others doing this?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
