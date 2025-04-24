Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB14A9AD04
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 14:16:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2DAAC7802F;
	Thu, 24 Apr 2025 12:16:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48287C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 12:16:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C3E85C6394;
 Thu, 24 Apr 2025 12:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC87C4CEE3;
 Thu, 24 Apr 2025 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745496971;
 bh=Sf0ybRK9DYsCxZ5Je/2MG9IakhbW6jd2lRTZlZQzniw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oe51ROCqK35W//I58nfZjw9T19a9u3WVnBJB0SkIp3x39DQ7ql8iB0byUcTix9qCE
 kZcy0a7XB+8uEXdqyJEA5ZXVFElPivKUlHovhEnK6Xrq4cXaAY0AQg5s4mQoaYJlDK
 Pz8JmgYFrFGRSuf04xqzh3mZr2pcmqaNxzxK/Thnrcf3UQ4v8XT/0JUcy+C3UBTUzS
 sfZTv9+jSh9WJTAKEVMPUsKU8AvLRMaAdxVo3n8DxEduUqvdHw6Z3G2zHhUK0UHqCh
 OBrRynyn5GyXNZbV/uEfFTIvdekG9eVkwHEIW7xSRx0WchZ089/QSS/LQuqiDYN23P
 zjAwyzQoD4VYA==
Date: Thu, 24 Apr 2025 13:16:04 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Message-ID: <20250424121604.GE3042781@horms.kernel.org>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421162930.10237-2-boon.khai.ng@altera.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 G Thomas Rohan <rohan.g.thomas@altera.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/2] net: stmmac: Refactor
	VLAN implementation
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

On Tue, Apr 22, 2025 at 12:29:29AM +0800, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> The descriptor format for VLAN is not moved to the common code due
> to hardware-specific differences between DWMAC4 and DWXGMAC.
> 
> For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> formatted as follows:
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> For the DWXGMAC IP, the RDES0 format varies based on the
> Tunneled Frame bit (TNP):
> 
> a) For Non-Tunneled Frame (TNP=0)
> 
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> b) For Tunneled Frame (TNP=1)
> 
>      31                   8 7                3 2      0
>       --------------------- ------------------ -------
> RDES0| VNID/VSID           | Reserved         | OL2L3 |
>       --------------------- ------------------ ------
> 
> The logic for handling tunneled frames is not yet implemented
> in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> it is prudent to maintain separate functions within their
> respective descriptor driver files
> (dwxgmac2_descs.c and dwmac4_descs.c).
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index a6d395c6bacd..d9f41c047e5e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -614,76 +614,6 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
>  	return 0;
>  }
>  
> -static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				      u16 perfect_match, bool is_double)
> -{
> -	void __iomem *ioaddr = hw->pcsr;
> -
> -	writel(hash, ioaddr + XGMAC_VLAN_HASH_TABLE);
> -
> -	if (hash) {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value |= XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);

Here the XGMAC_FILTER_VTFE bit of XGMAC_PACKET_FILTER is set.
However, this logic does not appear in vlan_update_hash()

> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value |= XGMAC_VLAN_VTHM | XGMAC_VLAN_ETV;
> -		if (is_double) {
> -			value |= XGMAC_VLAN_EDVLP;
> -			value |= XGMAC_VLAN_ESVL;
> -			value |= XGMAC_VLAN_DOVLTC;
> -		} else {
> -			value &= ~XGMAC_VLAN_EDVLP;
> -			value &= ~XGMAC_VLAN_ESVL;
> -			value &= ~XGMAC_VLAN_DOVLTC;
> -		}

And likewise, here value is based on reading from XGMAC_VLAN_TAG.
Whereas in vlan_update_hash is constructed without reading from
XGMAC_VLAN_TAG.

Can I clarify that this is intentional and that vlan_update_hash(),
which is based on the DWMAC4 implementation, will also work for DWXGMAC IP?

> -
> -		value &= ~XGMAC_VLAN_VID;
> -		writel(value, ioaddr + XGMAC_VLAN_TAG);
> -	} else if (perfect_match) {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value |= XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value &= ~XGMAC_VLAN_VTHM;
> -		value |= XGMAC_VLAN_ETV;
> -		if (is_double) {
> -			value |= XGMAC_VLAN_EDVLP;
> -			value |= XGMAC_VLAN_ESVL;
> -			value |= XGMAC_VLAN_DOVLTC;
> -		} else {
> -			value &= ~XGMAC_VLAN_EDVLP;
> -			value &= ~XGMAC_VLAN_ESVL;
> -			value &= ~XGMAC_VLAN_DOVLTC;
> -		}
> -
> -		value &= ~XGMAC_VLAN_VID;
> -		writel(value | perfect_match, ioaddr + XGMAC_VLAN_TAG);
> -	} else {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value &= ~XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value &= ~(XGMAC_VLAN_VTHM | XGMAC_VLAN_ETV);
> -		value &= ~(XGMAC_VLAN_EDVLP | XGMAC_VLAN_ESVL);
> -		value &= ~XGMAC_VLAN_DOVLTC;
> -		value &= ~XGMAC_VLAN_VID;
> -
> -		writel(value, ioaddr + XGMAC_VLAN_TAG);
> -	}
> -}

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

...

> +static int vlan_write_filter(struct net_device *dev,
> +			     struct mac_device_info *hw,
> +			     u8 index, u32 data)
> +{
> +	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> +	int i, timeout = 10;
> +	u32 val;
> +
> +	if (index >= hw->num_vlan)
> +		return -EINVAL;
> +
> +	writel(data, ioaddr + VLAN_TAG_DATA);
> +
> +	val = readl(ioaddr + VLAN_TAG);
> +	val &= ~(VLAN_TAG_CTRL_OFS_MASK |
> +		VLAN_TAG_CTRL_CT |
> +		VLAN_TAG_CTRL_OB);
> +	val |= (index << VLAN_TAG_CTRL_OFS_SHIFT) | VLAN_TAG_CTRL_OB;
> +
> +	writel(val, ioaddr + VLAN_TAG);
> +
> +	for (i = 0; i < timeout; i++) {
> +		val = readl(ioaddr + VLAN_TAG);
> +		if (!(val & VLAN_TAG_CTRL_OB))
> +			return 0;
> +		udelay(1);
> +	}

I am curious to know why readl_poll_timeout() isn't used here
as was the case in dwmac4_write_vlan_filter().

> +
> +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +
> +	return -EBUSY;
> +}

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
