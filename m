Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7CA86367
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 18:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 798E3C78006;
	Fri, 11 Apr 2025 16:36:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02191C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 16:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC6BF44040;
 Fri, 11 Apr 2025 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABFAC4CEE2;
 Fri, 11 Apr 2025 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744389368;
 bh=57EeinT2kFyZ3eosPEp0yhJlIy364+wh69p+Prj2EKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FDmjxAYm5b0bmRinJ1+KmL15n0Aam/EUskqODzz2KdMFYiIuv0uVDY5Mu2t9noqE9
 Oz/0e5o4SdRpqsDjyGz0uZ9ncVaF5qQQ0PcZkVGvnVO/UFtVJTdfGTe6+pNof/ALH1
 vFA1+tNU+0Okw+44X1B/4ZEkpQnhJ/w2s68uW0ilKH/wcuXO5Zzoq6zxhkDzVddFSm
 MFLNuKGgYkIk3WzvYTVq+pfdW7GTW383TmwrMFG82Lty99Durco3wZsF2W42lT2K4+
 y46BsEwtef8lwu3gCyXR9+MWwa4UNMZWYZpXazsDBp1z97rGGSWgKaTPji/uk3/ag9
 x3+U+4W3giOhQ==
Date: Fri, 11 Apr 2025 17:36:02 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Message-ID: <20250411163602.GM395307@horms.kernel.org>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408081354.25881-2-boon.khai.ng@altera.com>
Cc: Tien Sung Ang <tien.sung.ang@altera.com>,
 Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Mun Yew Tham <mun.yew.tham@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: Refactor
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

On Tue, Apr 08, 2025 at 04:13:53PM +0800, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c

...

> @@ -965,45 +807,6 @@ static void dwmac4_set_mac_loopback(void __iomem *ioaddr, bool enable)
>  	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
> -static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				    u16 perfect_match, bool is_double)

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

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

...

> +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> +			     __le16 perfect_match, bool is_double)

...

Hi,

The signature of this new function does not appear to match that of the
functions it replaces. And it appears to regress the endian annotation of
perfect_match which was corrected in commit e9dbebae2e3c ("net: stmmac:
Correct byte order of perfect_match")

Flagged by Sparse.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
