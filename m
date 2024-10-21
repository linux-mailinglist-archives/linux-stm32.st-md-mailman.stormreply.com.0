Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF19A59A2
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 07:06:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B55C78033;
	Mon, 21 Oct 2024 05:06:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D7B8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 05:06:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20c803787abso30510865ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 22:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729487165; x=1730091965;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia8mDRf0t3XivCUQZ/+4vX8Trnl04korBJf9mPFCzns=;
 b=ku6r2sM+9WvQ2gvkammLXUu5XnO8j5oDcOjGYu3e2gdH355uU69VsC3/hozwK0/FgK
 VLF0xYsfm70CNeebLbCj/9eXRUvq/MnKQ4Jm0ZcNKGPYfJHxz7a4EUTBoOeaKEO5h1tT
 UaW+G82uqfk8zi1PA5lJGMbAYY/pOO9rCxzoyFbp/yt6dTfFywuJcEcBGpxDLXv3DBan
 3XX2Tc+htZVCCK01eOMfPasbMxRZcP24ue7PkyFJtztUAnA3X58XdSqH5kbWPrH+qBWU
 zwjIFUKCnauXZ3LzFrGO3R03/TeoglZHuBknWbcsytV2bk1ZyLUinTOm5qIHdOf5UaYx
 JYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729487165; x=1730091965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia8mDRf0t3XivCUQZ/+4vX8Trnl04korBJf9mPFCzns=;
 b=TwiYzGEv7KCPh/UdtWJ8kj/75TH5QcoATPli7mUua/xN0ZUDPX2voXfUclm6s4MT+7
 4wjW+kyRbdeXHAfWshuhwfbg/P/sv1SD2f29VBeOXpmXF1oZv4deLcBrSuSSbt0QEqef
 RGQYiem3mb/ChQFnhFnaVQpIElkqVs/OMk/QqPkwrMK9LIyPbUwLkG7XiSED3qYD31B8
 DiEHPXjbPqv4V2V5K5zo41isQqU/thanGzU+mANcGvBen+KOgrKL0J9DAGAVwPOJbumZ
 /tKba++IuVMr5DT/Rcnc07nUf9NMEM2veoToCjC2vicScxjaqohfeBT8K3T3Sgio5V/+
 YvJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWHsnE2edTKonc44HpqatIeANVXbx26ZcTwQt9i6PJYuZuIZ7xJKghSGOJZioUgl4PaFQjm3FAkr1/Ag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyPjKCqZ754vlld5G7Oe7BVyWVEd9v4QJ+jbXfTqZDrDqevgzs/
 YZE+TXxT+ALzhQMzUfuO46XQc4wQOLXC5dPlOrlCPTlzluL/AcDD
X-Google-Smtp-Source: AGHT+IFduHHYOeGnIjHKPhqSRTid9Q8opnKcs7z5l4h7HwBhUORtSS/HEc6X+MCCWiyS/K7HSNxigA==
X-Received: by 2002:a17:903:244c:b0:20c:f39e:4c04 with SMTP id
 d9443c01a7336-20d471ec6ddmr224478475ad.2.1729487164568; 
 Sun, 20 Oct 2024 22:06:04 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f0e1ba7sm17686565ad.238.2024.10.20.22.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 22:06:04 -0700 (PDT)
Date: Mon, 21 Oct 2024 13:05:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: 2694439648@qq.com
Message-ID: <20241021130554.00005cf5@gmail.com>
In-Reply-To: <tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com>
References: <tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 hailong.fan@siengine.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] net: stmmac: enable MAC after MTL
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

On Mon, 21 Oct 2024 09:03:05 +0800, 2694439648@qq.com wrote:

> From: "hailong.fan" <hailong.fan@siengine.com>
> 
> DMA maybe block while ETH is opening,
> Adjust the enable sequence, put the MAC enable last
> 
> For example, ETH is directly connected to the switch,
> which never power down and sends broadcast packets at regular intervals.
> During the process of opening ETH, data may flow into the MTL FIFO,
> once MAC RX is enabled. and then, MTL will be set, such as FIFO size.
> Once enable DMA, There is a certain probability that DMA will read
> incorrect data from MTL FIFO, causing DMA to hang up.
> By read DMA_Debug_Status, you can be observed that the RPS remains at
> a certain value forever. The correct process should be to configure
> MAC/MTL/DMA before enabling DMA/MAC
> 
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> 

A Fixes: tag should be added.

>  static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e21404822..c19ca62a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3437,9 +3437,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  
> @@ -3523,6 +3520,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  	/* Start the ball rolling... */
>  	stmmac_start_all_dma(priv);
>  
> +	/* Enable the MAC Rx/Tx */
> +	stmmac_mac_set(priv, priv->ioaddr, true);
> +

This sequence fix should be applied to stmmac_xdp_open() too.

>  	stmmac_set_hw_vlan_mode(priv, priv->hw);
>  
>  	return 0;

It is better to split this patch into individual patches, since you are
trying to fix an issue related to several previous commits:
dwmac4, dwxgmac2, stmmac_hw_setup() and stmmac_xdp_open()
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
