Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10927E6E72
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 17:17:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1253C6B47C;
	Thu,  9 Nov 2023 16:17:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE1C0C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Fupq4hlBImNT9/E31GMXTqKPrNZBcdihgav2GAlB7G8=; b=pgYZcUNj/ZO5UbgTJtXr7RxPoO
 BMmVH8QE5aDmVxhnV1ZHCpAhjNOhRHwZ8DNEXXWgLo8MK1ua74OAIc8zUp5ZB39GJxJ+BmVwoDycc
 K4UMhtqo59MrESwBIxEBXwH3Ukk/d4nwZPyOVodGtMhFSQ4ZV+8FDDiB2q5WzemblC9M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r17iU-001DWW-A6; Thu, 09 Nov 2023 17:17:14 +0100
Date: Thu, 9 Nov 2023 17:17:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <b7bd1b0c-5203-4071-95c6-ada047010687@lunn.ch>
References: <20231109053831.2572699-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109053831.2572699-1-yi.fang.gan@intel.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add support for
 HW-accelerated VLAN stripping
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

> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -198,6 +198,17 @@ static int dwmac4_get_tx_ls(struct dma_desc *p)
>  		>> TDES3_LAST_DESCRIPTOR_SHIFT;
>  }
>  
> +static inline int dwmac4_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & RDES0_VLAN_TAG_MASK);
> +}
> +
> +static inline bool dwmac4_wrback_get_rx_vlan_valid(struct dma_desc *p)
> +{
> +	return ((le32_to_cpu(p->des3) & RDES3_LAST_DESCRIPTOR) &&
> +		(le32_to_cpu(p->des3) & RDES3_RDES0_VALID));
> +}

No inline functions in C files please. Let the compiler decide.

You are submitting a number of patches for this driver. Do they all
cleanly apply independent of each other? Or are there dependencies?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
