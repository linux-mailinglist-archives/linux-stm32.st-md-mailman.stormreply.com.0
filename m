Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE707EAF8F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 13:00:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E663C6B44B;
	Tue, 14 Nov 2023 12:00:02 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DD9CC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 12:00:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2c83d37a492so36119191fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 04:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699963200; x=1700568000;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+6KJAeM0fgwzrataiQJvaJXR0VKO4m2xUhSp/qxzWEU=;
 b=cTTmg8S0rCNj1PfDD/S55o4JT5tJBCQN9f/snsNvBwsYv96aGtdCzUzV9nR4n02594
 cSaxLZBrhkdjGRlf7Z5WNX6wwOiZ8NxkAhTwF6d7mW7Vyaawh903OcrP6i7/nhK3IEgA
 F5Yz8pxYMAVYRGV3uedZnrSwm+SteYgMwafIlEycwywQKnQLCraKu3M2ZAgM/0vHC2ye
 Vnd9LO96qlNU7364vmVxZtZPMP5fs4vareWy6IlOaP5pYh3eg8/AK9GSgYRwj+bE6zly
 mZu2x0+sJa3yUtdDyiSJpQIawAbZtX+KvcKRhS9muCzW5vXW4uiQkUzjlmz6fKAuGQYb
 tnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699963200; x=1700568000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6KJAeM0fgwzrataiQJvaJXR0VKO4m2xUhSp/qxzWEU=;
 b=ZHN0sP72h71hhhbe8cG8P0t3W1Ps4BLI+X4YQoAirTy/BHk06nNrNJzOf5zCnz9LZ1
 trQNhtRs+Fb5Qy0AG3mhCkWTSwBtULtdOYQ+IdguYIyuWzvUuMDJnvG1F2MfJ1TsiKFF
 wB/NnE0q3PyQuvuw3RcGtzR9qAqsyaz254qPniYNWZJaoYOtx04v5Ax23LVpOwf2uvKL
 85Si0/Wi9Hp2Akc5oSS0LEOVmjJHXFtAGo3+I7j5aSnEL+Ja7rHQPuDWyS6iCEDzz18s
 xbXGYFJ72pK5rQ+omG43Kq7qhZWORi7zbTCAprIhVOt8tE7IhhJ4YZMo9eTgvJ98iByT
 ksZw==
X-Gm-Message-State: AOJu0YwqYjBQwt76qchqTxYk89yK0LWTD4kYdC2ucc5roLyiCr0ffmd7
 kRY3hd9dOjnWwvSJ4HNLNJg=
X-Google-Smtp-Source: AGHT+IGkg/dZ2j3ZhRtPnnWF3nQd6Z1yanz+Og6hQVCouER01/X1PxmY2rEi6+qInKZZQyQytLevyw==
X-Received: by 2002:a05:651c:1055:b0:2c5:3139:2d04 with SMTP id
 x21-20020a05651c105500b002c531392d04mr1494405ljm.47.1699963200069; 
 Tue, 14 Nov 2023 04:00:00 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a05651c119500b002c847782e14sm590774ljo.95.2023.11.14.03.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 03:59:59 -0800 (PST)
Date: Tue, 14 Nov 2023 14:59:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <xo4cbvc35zewabg4ite73trijy6fvbsaxsy6hag5qsr3dyharm@predjydxblsf>
References: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Voon Weifeng <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix FPE events losing
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

On Tue, Nov 14, 2023 at 11:07:34AM +0000, Jianheng Zhang wrote:
> The 32-bit access of register MAC_FPE_CTRL_STS may clear the FPE status
> bits unexpectedly. Use 8-bit access for MAC_FPE_CTRL_STS control bits to
> avoid unexpected access of MAC_FPE_CTRL_STS status bits that can reduce
> the FPE handshake retries.
> 
> The bit[19:17] of register MAC_FPE_CTRL_STS are status register bits.
> Those bits are clear on read (or write of 1 when RCWE bit in
> MAC_CSR_SW_Ctrl register is set). Using 32-bit access for
> MAC_FPE_CTRL_STS control bits makes side effects that clear the status
> bits. Then the stmmac interrupt handler missing FPE event status and
> leads to FPE handshake failure and retries.
> 
> The bit[7:0] of register MAC_FPE_CTRL_STS are control bits or reserved
> that have no access side effects, so can use 8-bit access for
> MAC_FPE_CTRL_STS control bits.
> 
> Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> Signed-off-by: jianheng <jianheng@synopsys.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index e95d35f..7333995 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> @@ -716,11 +716,11 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
>  	u32 value;
>  
>  	if (!enable) {

> -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +		value = readb(ioaddr + MAC_FPE_CTRL_STS);

Note this may break the platforms which don't support non-32 MMIOs for
some devices. None of the currently supported glue-drivers explicitly
state they have such peculiarity, but at the same time the STMMAC-core
driver at the present state uses the dword IO ops only. For instance
the PCIe subsystem has the special accessors for such cases:
pci_generic_config_read32()
pci_generic_config_write32()
which at the very least are utilized on the Tegra and Loongson
platforms to access the host CSR spaces. These platforms are also
equipped with the DW MACs. The problem might be irrelevant for all the
currently supported DW MAC controllers implementations though, but
still it worth to draw an attention to the problem possibility and in
order to prevent it before ahead it would be better to just avoid
using the byte-/word- IOs if it's possible.

-Serge(y)

>  
>  		value &= ~EFPE;
>  
> -		writel(value, ioaddr + MAC_FPE_CTRL_STS);
> +		writeb(value, ioaddr + MAC_FPE_CTRL_STS);
>  		return;
>  	}
>  
> @@ -729,9 +729,9 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
>  	value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
>  	writel(value, ioaddr + GMAC_RXQ_CTRL1);
>  
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +	value = readb(ioaddr + MAC_FPE_CTRL_STS);
>  	value |= EFPE;
> -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> +	writeb(value, ioaddr + MAC_FPE_CTRL_STS);
>  }
>  
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> @@ -770,7 +770,7 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type
>  {
>  	u32 value;
>  
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +	value = readb(ioaddr + MAC_FPE_CTRL_STS);
>  
>  	if (type == MPACKET_VERIFY) {
>  		value &= ~SRSP;
> @@ -780,5 +780,5 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type
>  		value |= SRSP;
>  	}
>  
> -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> +	writeb(value, ioaddr + MAC_FPE_CTRL_STS);
>  }
> -- 
> 1.8.3.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
