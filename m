Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512996FD8A
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 23:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D979CC78013;
	Fri,  6 Sep 2024 21:49:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DD0CC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725659344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3S1ye9K4wT6nEVtEXBj1KVlsV65nHxPTfNQ0beqpus=;
 b=LaZLHNeRcmDNgJICYmF+whQ0j/runpOGgSOj40Nzc5KNTiUWcR17zhjMzJzer5DyewTXF6
 gG3gFS14B4dguIL3CaLQm1eENaCd9rcp10Ii5x4QHw3kalnGG6YCL8eus2k/1f8UjqAYFA
 LlJ7gaHktD3jQ+JQwr6MovSEgNcD2JY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-68LUIvKiPO-KyBJIvj4mtw-1; Fri, 06 Sep 2024 17:49:03 -0400
X-MC-Unique: 68LUIvKiPO-KyBJIvj4mtw-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3df2de4c98aso3311849b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 14:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725659343; x=1726264143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3S1ye9K4wT6nEVtEXBj1KVlsV65nHxPTfNQ0beqpus=;
 b=dKP+O+DZWf40BU8MfEd8sf1NrBTzWugosKf3Kufn/MT0rCY70Ua9DANlhhQL/KJO+G
 j59iPvPw2w9W7h6hc2hc8k5eVowNbgcNKb3ZAOiEGpSrECIfZTex0N/C6VSYIvNY0UTp
 Rxhe8Kd8MfNPdBxK51wc9V7F2TTw/rnJnooLwmYh0fVDQs5iUgA4gGvuEaYjFCRZBhVD
 zoLsaXEkKCzONopNKW2KmcZeRoD0YxkQT2Ete+lzqN0Vme7uCp8wyPLDIcSgwKEi31nB
 lNepSqrQX/aI4p9ZgFXmpxWm/DLlwBMlKAMHFYiFo8x4L4ewg3G4eauA4nYEcOltnvAV
 y8jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3eK/AN0YYF/01MZEN57KhNeQMQSsbXJuMAUX4D+QKvObCI6FX6BBI1BySTfN0+BeSjkvrDjGc+LJf8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymO/ywnMoAeJNxJNzHCqZQBCGhyoC4UOpdS+EjWses5SNG5a1T
 rkxTpeHm4hZ/QDhIKkL/aRVXCoJKvr2bN6xwSIL5X3bBfhXpR3BgFXJmHk8DOQgwQyxP2f84dOv
 aEiPKvaunI6nQ1qEm0XhgCvH1aNrIRi12fEip5CLsQILQ0PZNYKi9bKugqGehnrEFWBYLGqBwhJ
 mtOw==
X-Received: by 2002:a05:6808:2e87:b0:3da:aae9:7182 with SMTP id
 5614622812f47-3e029cd2afamr6368575b6e.2.1725659342843; 
 Fri, 06 Sep 2024 14:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5efmeD2tGwhppF0F5BJUioUdGUqHxc6RT9wSI/W7CD4lhjJKWUhSBBA5JuPCwsydP2SlphQ==
X-Received: by 2002:a05:6808:2e87:b0:3da:aae9:7182 with SMTP id
 5614622812f47-3e029cd2afamr6368559b6e.2.1725659342554; 
 Fri, 06 Sep 2024 14:49:02 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45801dc378csm19559821cf.96.2024.09.06.14.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 14:49:02 -0700 (PDT)
Date: Fri, 6 Sep 2024 16:49:00 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <jfibug2d5ch6isoop3gbjkbt2kbk2bvhvschnwclyr42p2aqmn@2iigwb3jk5ew>
References: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Programming
 sequence for VLAN packets with split header
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

On Wed, Sep 04, 2024 at 04:54:56PM GMT, Abhishek Chauhan wrote:
> Currently reset state configuration of split header works fine for
> non-tagged packets and we see no corruption in payload of any size
> 
> We need additional programming sequence with reset configuration to
> handle VLAN tagged packets to avoid corruption in payload for packets
> of size greater than 256 bytes.
> 
> Without this change ping application complains about corruption
> in payload when the size of the VLAN packet exceeds 256 bytes.
> 
> With this change tagged and non-tagged packets of any size works fine
> and there is no corruption seen.

My real limited understanding from offline convos with you is that:

    1. This changes splitting from L3 mode to L2? This maybe a "dumb"
       wording, but the L2 comment you have below reinforces that.
       Sorry, I don't have a very good mental model of what SPH is doing
    2. This addresses the root issue of a few of the commits in
       stmmac that disable split header? Patches like
       47f753c1108e net: stmmac: disable Split Header (SPH) for Intel platforms
       029c1c2059e9 net: stmmac: dwc-qos: Disable split header for Tegra194
       ?

If 1 is true I suggest making trying to paint a higher level intro picture to
reviewers of what the prior programming enabled vs what you've enabled.
It would help me at least!

If 2 is true I suggest calling that out and Cc'ing the authors of those
patches in hopes that they may try and re-enable SPH. If its not true
(maybe there's an errata?) I'd be interested in knowing if there's a more
generic way to disable SPH for those platforms instead of playing
whack-a-mole per platform. That's a bit outside of the series here though,
but I imagine you may have enough information to help answer those sort of
questions and clean up the house here :)

Thanks,
Andrew


> 
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
> ---
> Changes since v0
> - The reason for posting it on net-next is to enable this new feature.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h     |  9 +++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 11 +++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> index 93a78fd0737b..4e340937dc78 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> @@ -44,6 +44,7 @@
>  #define GMAC_MDIO_DATA			0x00000204
>  #define GMAC_GPIO_STATUS		0x0000020C
>  #define GMAC_ARP_ADDR			0x00000210
> +#define GMAC_EXT_CFG1			0x00000238
>  #define GMAC_ADDR_HIGH(reg)		(0x300 + reg * 8)
>  #define GMAC_ADDR_LOW(reg)		(0x304 + reg * 8)
>  #define GMAC_L3L4_CTRL(reg)		(0x900 + (reg) * 0x30)
> @@ -235,6 +236,14 @@ enum power_event {
>  #define GMAC_CONFIG_HDSMS_SHIFT		20
>  #define GMAC_CONFIG_HDSMS_256		(0x2 << GMAC_CONFIG_HDSMS_SHIFT)
>  
> +/* MAC extended config1 */
> +#define GMAC_CONFIG1_SAVE_EN		BIT(24)
> +#define GMAC_CONFIG1_SPLM		GENMASK(9, 8)
> +#define GMAC_CONFIG1_SPLM_L2OFST_EN	BIT(0)
> +#define GMAC_CONFIG1_SPLM_SHIFT		8
> +#define GMAC_CONFIG1_SAVO		GENMASK(22, 16)
> +#define GMAC_CONFIG1_SAVO_SHIFT		16
> +
>  /* MAC HW features0 bitmap */
>  #define GMAC_HW_FEAT_SAVLANINS		BIT(27)
>  #define GMAC_HW_FEAT_ADDMAC		BIT(18)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index e0165358c4ac..dbd1be4e4a92 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -526,6 +526,17 @@ static void dwmac4_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value |= GMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + GMAC_EXT_CONFIG);
>  
> +	/* Additional configuration to handle VLAN tagged packets */
> +	value = readl(ioaddr + GMAC_EXT_CFG1);
> +	value &= ~GMAC_CONFIG1_SPLM;
> +	/* Enable Split mode for header and payload at L2  */
> +	value |= GMAC_CONFIG1_SPLM_L2OFST_EN << GMAC_CONFIG1_SPLM_SHIFT;
> +	value &= ~GMAC_CONFIG1_SAVO;
> +	/* Enables the MAC to distinguish between tagged vs untagged pkts */
> +	value |= 4 << GMAC_CONFIG1_SAVO_SHIFT;
> +	value |= GMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + GMAC_EXT_CFG1);
> +
>  	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  	if (en)
>  		value |= DMA_CONTROL_SPH;
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
