Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF609AAF447
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 09:08:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E5A8C7A821;
	Thu,  8 May 2025 07:08:49 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E85FC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1746688129; x=1778224129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ro+fNqHlMjS5LfEr2nfJj/uKzW54Yi1ADwyqobeaERo=;
 b=DWZvPQotILnTYPmc2wG6v9dWYHdgYXdBWXhOCYbcnbEmXLgK0pf7uX6f
 5tGznxtvbaIeNkteK66ZcZuWD/shyBIvKMZilXk8Et4L7NvzD2lPJWh59
 fKruLPf66qcibcFiVuoNi0twLvkQwWH3ikf66y4vKWfgbErpQ1nAo3Mlk
 7WtXwTnpc+NzpvaRv7WJTNXFvagHZ/6H44dMJLcRoo6bJ3kxEe57Z06HO
 C652rUILkGlJewEG3LXlI+dRUvJ9eC6Mc9XaSr5qhOYY7pWJvhe44NeFF
 yQQI8T1hC9UkRlIL5uesvLtgj9OfNeHQ6nIzw/iB8hFWlrGmjM2bDy5mR A==;
X-CSE-ConnectionGUID: Lkz06igDQsq9icAK8YbzRw==
X-CSE-MsgGUID: r697ijZUQQ20/Ff89o04IQ==
X-IronPort-AV: E=Sophos;i="6.15,271,1739862000"; d="scan'208";a="272726326"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2025 00:08:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 8 May 2025 00:08:23 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 8 May 2025 00:08:22 -0700
Date: Thu, 8 May 2025 09:07:00 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508033328.12507-5-kerneljasonxing@gmail.com>
Cc: willemb@google.com, horms@kernel.org, irusskikh@marvell.com,
 netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

The 05/08/2025 11:33, Jason Xing wrote:
> 
> From: Jason Xing <kernelxing@tencent.com>
> 
> Make sure the call of skb_tx_timestamp as close to the doorbell.
> 
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> index 502670718104..e030f23e5145 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> @@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
>                 }
>         }
> 
> -       skb_tx_timestamp(skb);

Changing this will break the PHY timestamping because the frame gets
modified in the next line, meaning that the classify function will
always return PTP_CLASS_NONE.

Nacked-by: Horatiu Vultur <horatiu.vultur@microchip.com>

>         skb_push(skb, IFH_LEN_BYTES);
>         memcpy(skb->data, ifh, IFH_LEN_BYTES);
>         skb_put(skb, 4);
> @@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
>                 next_dcb_buf->ptp = true;
> 
>         /* Start the transmission */
> +       skb_tx_timestamp(skb);
>         lan966x_fdma_tx_start(tx);
> 
>         return NETDEV_TX_OK;
> --
> 2.43.5
> 

-- 
/Horatiu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
