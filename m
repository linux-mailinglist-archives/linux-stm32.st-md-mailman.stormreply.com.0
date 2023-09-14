Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7567A07FA
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 16:54:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1E00C6A5EF;
	Thu, 14 Sep 2023 14:54:14 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDEB8C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 14:54:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2bfc2b26437so16108921fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694703253; x=1695308053;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8KTW3qG5uMAq5a27jOc33bCa0EC6zq+9SgJ+IzzJyF0=;
 b=cUr2dy0E3mZYQ25AE7PoGSenxR59vwcEO5zY/UoeZrihqD0jDERSyd6WJw2hqiPxHH
 fYLWdePW2ZK5LSVKknn7KFvorlqdn+stgssPSHejsE9AAk+Hj2zkN0VtR7ebMCWQIOxG
 BDAbM6ldI5mGkbuPzQVro3Lsdf7GdJve+uehCNuTZX2KD+w6fq9T7jjmXW2dubfail7z
 ZElhal+YAZqPYC1OxaqvcrqYxiZP1ZByvLD+w8nWruzykpBf70o+ou260TjNTQwsun3n
 vQ3hCDxkJ1w1E5ptN1zb5f/IFVkVOPrxh0T+UpVQFBJ3TvWexYE1G7YU6Sr7Z6VYHCGa
 iu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703253; x=1695308053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KTW3qG5uMAq5a27jOc33bCa0EC6zq+9SgJ+IzzJyF0=;
 b=X0H20ShB3aikrCvIH/H1oLAS4YNNp8RmW6CLsKrTh6cqx8NdoXY1ZoDCB4MsnNzgyK
 JdCooGJ5/gCRIZlrhdNzWi3urLvZl4VvQ2oPv08GEKB+TnLkbDS+Z7d9iOne3Yez6rsu
 h9FZ0XubdwaOtZjgmELGjNP2VIDOmqYjqozmNirwlEPoWCU0Q0Rvg7bUYpvXO+QBR9ho
 GgOqCfC4/hIPtz2HQCsUK9u19GMjBr/zEY/U9XlCznS9UDMfuYtgCnvYiiBN+2uWY1w0
 Qw/6BcaPFBCQ441RJLZhZmN58y9C5F7bOgrkFlE3iheBm+rKep5oe6hp2X4qSC+E6ef2
 5yxg==
X-Gm-Message-State: AOJu0Yz+5/ZOkhNWmj8rYauXHXqKc93TRUhHGHxUF06SmER3LgJXZKj1
 nYLuGPRUl5a16c8U2KLIiBU=
X-Google-Smtp-Source: AGHT+IH/W+BphXlgk/7h4VHNwpD9/Gdfw/rWl8MzEiQi8KqUD2Y75L+nBqyZJdPZn+YPUEUtBT5+MA==
X-Received: by 2002:a2e:83d0:0:b0:2b9:d7b7:36d4 with SMTP id
 s16-20020a2e83d0000000b002b9d7b736d4mr4703670ljh.16.1694703252936; 
 Thu, 14 Sep 2023 07:54:12 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e9c92000000b002b6cb25e3f1sm295903lji.108.2023.09.14.07.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:54:12 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:54:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <j64xmkplk2kkb4esteaic3hsofex3eishxxr3z6hppnm6heoz5@5fyj4x5qouc3>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmka-007Z4Z-1E@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qgmka-007Z4Z-1E@rmk-PC.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add
	stmmac_set_tx_clk_gmii()
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

On Thu, Sep 14, 2023 at 02:51:20PM +0100, Russell King (Oracle) wrote:
> Add a helper function for setting the transmit clock for GMII
> interfaces. This handles 1G, 100M and 10M using the standard clock
> rates of 125MHz, 25MHz and 2.5MHz.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 25 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 0f28795e581c..f7635ed2b255 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -700,6 +700,31 @@ EXPORT_SYMBOL_GPL(stmmac_probe_config_dt);
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>  EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
>  

> +int stmmac_set_tx_clk_gmii(struct clk *tx_clk, unsigned int speed)
> +{
> +	unsigned long rate;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +		break;
> +
> +	case SPEED_100:
> +		rate = 25000000;
> +		break;
> +
> +	case SPEED_10:
> +		rate = 2500000;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return clk_set_rate(tx_clk, rate);
> +}
> +EXPORT_SYMBOL_GPL(stmmac_set_tx_clk_gmii);

As I already noted in v1 normally the switch-case operations are
defined with no additional line separating the cases. I would have
dropped them here too especially seeing the stmmac core driver mainly
follow that implicit convention.

Additionally I suggest to move the method to being defined at the head
of the file. Thus a more natural order normally utilized in the kernel
drivers would be preserved: all functional implementations go first,
the platform-specific things are placed below like probe()/remove()
and their sub-functions, suspend()/resume() and PM descriptors,
(device IDs table, driver descriptor, etc). stmmac_set_tx_clk_gmii()
looks as a functional helper which is normally utilized on the network
device open() stage in the framework of the fix_mac_speed() callback.
Moreover my suggestion gets to be even more justified seeing you
placed the method prototype at the head of the prototypes list in the
stmmac_platform.h file.

Irrespective to the nitpicks above the change looks good:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> +
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> index c5565b2a70ac..8dc2287c6724 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> @@ -11,6 +11,7 @@
>  
>  #include "stmmac.h"
>  
> +int stmmac_set_tx_clk_gmii(struct clk *tx_clk, unsigned int speed);
>  struct plat_stmmacenet_data *
>  stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
>  struct plat_stmmacenet_data *
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
