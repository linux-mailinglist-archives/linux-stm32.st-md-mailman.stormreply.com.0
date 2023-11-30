Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A547FEC57
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 10:55:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C640DC6B475;
	Thu, 30 Nov 2023 09:55:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9575C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701338139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nL97IYI1tBJivCOQRB2PiwCmMVwRAH5/tuzpmlKeGw=;
 b=il0MZpfAQh5jsfXlznsBCt57BIzAXSsninHhG0tVnIAaFGJ/SUAug6wdDwcnGZbY3aNvob
 627qUebZX081Fvkf5StE35GmM1qA55mG213nQui5u8lEw4LYjA0K2IMQJSx4sIcVZrl4YE
 iQvwJTcBtePLe9AHLwbXHm9sE8pBKJo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-T5_4eg-sPnyhd4pOfyDxIA-1; Thu, 30 Nov 2023 04:55:38 -0500
X-MC-Unique: T5_4eg-sPnyhd4pOfyDxIA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a15ce485c27so9308266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 01:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701338137; x=1701942937;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Za4sJve0w/4uyVCmAF/v91nTDwdldnwMa4Hd6aawqsI=;
 b=sy/4LqpOM/M687HsV5AW8xjVwT0JsiJD5cz2KeNBodifhu+gN4LUz/dUFF2tVE9b78
 VrizXvbkeKP/MmeOc1/m8siKfn6GyOU4r+gTrQA5RysD6R6sr69x6iTdVM3CZjEhgoCy
 fIFD5Is3kTgFTPvJYX2HRVdI83lDp1zhSgsgdCnaA3E5WVakcCvcfW9iz/LkoH9lPgco
 YGVnKY6b9OBuIoamMamKQh1HHnOT/lIWFdIHzTQCXkm0BG9Dd1pr4eOMgcDYLfCIRfxq
 I+8voLjGvs2gFkrk2POZGHecCNLzD2KP43jDrtwU1O8RwCC5q15ovwz+BLMzknpHu4V8
 izTg==
X-Gm-Message-State: AOJu0Yy4q2Wm8FJOp4cdUeGZfPZt/3V172M9BeaKlab0fWO29LQFnnmy
 sPuzQ9uCUnATuLys1AHyX4aGC56PPhp59WhqbLRZxpZgzsH7F0zo3TRqHKUziTcVlGMro8ykjSd
 uq9IvBU68hlTxLmzt0WZSERUMdXHINKdvN3ZmGTaG
X-Received: by 2002:a17:906:3a50:b0:9e6:c282:5bd5 with SMTP id
 a16-20020a1709063a5000b009e6c2825bd5mr13208734ejf.3.1701338137068; 
 Thu, 30 Nov 2023 01:55:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhfQ/rCbsijEdqj8NNrZdyThnnKJUi1IYycp9pCcdpcBskxx8OHIbdnAZXab11CUzP0ZDViQ==
X-Received: by 2002:a17:906:3a50:b0:9e6:c282:5bd5 with SMTP id
 a16-20020a1709063a5000b009e6c2825bd5mr13208709ejf.3.1701338136699; 
 Thu, 30 Nov 2023 01:55:36 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-254-39.dyn.eolo.it.
 [146.241.254.39]) by smtp.gmail.com with ESMTPSA id
 q20-20020a170906145400b009fc927023bcsm495253ejc.34.2023.11.30.01.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 01:55:36 -0800 (PST)
Message-ID: <1716792a3881338b1a416b1f4dd85a9437746ec2.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Simon Horman <horms@kernel.org>, Andrew
 Halaney <ahalaney@redhat.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Shenwei Wang <shenwei.wang@nxp.com>,
 Johannes Zink <j.zink@pengutronix.de>, "Russell King  (Oracle"
 <rmk+kernel@armlinux.org.uk>,  Jochen Henneberg
 <jh@henneberg-systemdesign.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>,  Tan Tee Min <tee.min.tan@intel.com>
Date: Thu, 30 Nov 2023 10:55:34 +0100
In-Reply-To: <CY5PR12MB6372BF02C49FC9E628D0EC02BFBCA@CY5PR12MB6372.namprd12.prod.outlook.com>
References: <CY5PR12MB6372BF02C49FC9E628D0EC02BFBCA@CY5PR12MB6372.namprd12.prod.outlook.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 James Li <James.Li1@synopsys.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix FPE events losing
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

On Tue, 2023-11-28 at 05:56 +0000, Jianheng Zhang wrote:
> The status bits of register MAC_FPE_CTRL_STS are clear on read. Using
> 32-bit read for MAC_FPE_CTRL_STS in dwmac5_fpe_configure() and
> dwmac5_fpe_send_mpacket() clear the status bits. Then the stmmac interrupt
> handler missing FPE event status and leads to FPE handshaking failure and
> retries.
> To avoid clear status bits of MAC_FPE_CTRL_STS in dwmac5_fpe_configure()
> and dwmac5_fpe_send_mpacket(), add fpe_csr to stmmac_fpe_cfg structure to
> cache the control bits of MAC_FPE_CTRL_STS and to avoid reading
> MAC_FPE_CTRL_STS in those methods.
> 
> Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Jianheng Zhang <jianheng@synopsys.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c       | 45 +++++++++-------------
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  4 +-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  3 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  1 +
>  include/linux/stmmac.h                             |  1 +
>  7 files changed, 36 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index e95d35f..8fd1675 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> @@ -710,28 +710,22 @@ void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
>  	}
>  }
>  
> -void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			  u32 num_txq, u32 num_rxq,
>  			  bool enable)
>  {
>  	u32 value;
>  
> -	if (!enable) {
> -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -
> -		value &= ~EFPE;
> -
> -		writel(value, ioaddr + MAC_FPE_CTRL_STS);
> -		return;
> +	if (enable) {
> +		cfg->fpe_csr = EFPE;
> +		value = readl(ioaddr + GMAC_RXQ_CTRL1);
> +		value &= ~GMAC_RXQCTRL_FPRQ;
> +		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> +		writel(value, ioaddr + GMAC_RXQ_CTRL1);
> +	} else {
> +		cfg->fpe_csr = 0;
>  	}
> -
> -	value = readl(ioaddr + GMAC_RXQ_CTRL1);
> -	value &= ~GMAC_RXQCTRL_FPRQ;
> -	value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> -	writel(value, ioaddr + GMAC_RXQ_CTRL1);
> -
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -	value |= EFPE;
> -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> +	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
>  }
>  
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> @@ -741,6 +735,9 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  
>  	status = FPE_EVENT_UNKNOWN;
>  
> +	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
> +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> +	 */
>  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
>  
>  	if (value & TRSP) {
> @@ -766,19 +763,15 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  	return status;
>  }
>  
> -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type)
> +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			     enum stmmac_mpacket_type type)
>  {
> -	u32 value;
> +	u32 value = cfg->fpe_csr;
>  
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -
> -	if (type == MPACKET_VERIFY) {
> -		value &= ~SRSP;
> +	if (type == MPACKET_VERIFY)
>  		value |= SVER;
> -	} else {
> -		value &= ~SVER;
> +	else if (type == MPACKET_RESPONSE)
>  		value |= SRSP;
> -	}
>  
>  	writel(value, ioaddr + MAC_FPE_CTRL_STS);
>  }

It's unclear to me why it's not necessary to preserve the SVER/SRSP
bits across MAC_FPE_CTRL_STS writes. I guess they are not part of the
status bits? perhaps an explicit comment somewhere will help?

Thanks

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
