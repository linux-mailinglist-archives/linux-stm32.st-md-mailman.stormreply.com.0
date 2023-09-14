Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 222737A039D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:19:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C498FC65E4F;
	Thu, 14 Sep 2023 12:19:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28293C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:19:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so13351081fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694693954; x=1695298754;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MIai8kEfSJbbe1MQb/EaG0qclNnxV1ZUNxpY+1c/fgg=;
 b=UFeq8CIwNXSTq7Qlw9dSMn5GQ0qS0qdgJayMUtehgEZC2U7Ae2uU6S6h26C5p8SsM1
 SP7LTTVCVfYVt0RNcUYGMbzavypzfQ0alrMuVcIcL5C/2ABGCiMXrfxNytB1OrsEilvp
 rY6MgdqfhaEpA1IdZy1ov94GCa/TqWiX7taIBcp3yvsLeV1UF+TJiPq08iwk9LjCeWpe
 O7ki3Wr8BMmO4guQjKdNxEpOuTghjgoD1aeNN61XkazNw5wT8f5HRybXdkn6BdRrObOQ
 WIFb69Fp8UyKZVXVF+UqrEyVFWJWgJnOJj2/eo8TDTapIv9bBG2vD/Akf4SGlH3UKTFM
 XLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694693954; x=1695298754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MIai8kEfSJbbe1MQb/EaG0qclNnxV1ZUNxpY+1c/fgg=;
 b=S1JV4q24Z81qm0kyBsxlAL2llag4yUFiWFHGXng+QKPYf9eWBvMnFUlj4KFn/AMiXu
 ZTrN3CBZx/xe+FtTwus7BzUlB1Jrqc1317tZA05UYCLm5h9rvs50s+RZVKsRxIm37Azi
 ex1FDHoZR7rC/U+7B8ZcdGFeYZFyCbRVNkXn7ewQMKR0yQcTDWUyguIid9KQ4oXidjS3
 tUhRTBxRr82mYMXOvXJ87C6qckd3l16wtSjPcElDs/+J7hjjhhE21FsVPThRm05ZeKcx
 u/1EwVC27uE2zqbPQpTYT8a3l7BPAhYS9rBlLjvyI5vzVeVxNjfD+4HaKlHlvcnRNx0n
 hHXA==
X-Gm-Message-State: AOJu0YzaJU5xYcBf19w1EI40lAdRqveAP8ybhfXP05ce1Hn9zKcFiPiJ
 h8g3auCKqO51pVl4XZLuxiI=
X-Google-Smtp-Source: AGHT+IE9J7DJwE8nML/CCXVSNOTksA6PiQP2wqKee1UuUlkr5qnQ39Oe2QWwbbOyrqnQ31oguUUuxw==
X-Received: by 2002:a2e:808d:0:b0:2bd:a5e:2255 with SMTP id
 i13-20020a2e808d000000b002bd0a5e2255mr4898056ljg.28.1694693954191; 
 Thu, 14 Sep 2023 05:19:14 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a2e9bd8000000b002bce5e379a3sm261435ljj.7.2023.09.14.05.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:19:13 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:19:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <hsov2bii5wenzexplq2fbgzsls2y5yssdobqjeil2nd2haqilm@jammanegu4vd>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqi-007TPS-BZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qfiqi-007TPS-BZ@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: imx: use
 dwmac_set_tx_clk_gmii()
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

On Mon, Sep 11, 2023 at 04:29:16PM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

BTW I don't know whether it's ok to have an empty description in the
patches for the networking subsystem, but the kernel maintainers
mainly request to add at least some text with the change justification
especially seeing the submitting-patches.rst doc says the description
is mandatory.

-Serge(y)

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 27 ++++++-------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index df34e34cc14f..d2569faf7cc3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -21,6 +21,7 @@
>  #include <linux/stmmac.h>
>  
>  #include "stmmac_platform.h"
> +#include "stmmac_plat_lib.h"
>  
>  #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
>  #define GPR_ENET_QOS_INTF_SEL_MII	(0x0 << 16)
> @@ -186,7 +187,6 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
>  {
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct imx_priv_data *dwmac = priv;
> -	unsigned long rate;
>  	int err;
>  
>  	plat_dat = dwmac->plat_dat;
> @@ -196,24 +196,13 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
>  	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII))
>  		return;
>  
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -	default:
> -		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -		return;
> -	}
> -
> -	err = clk_set_rate(dwmac->clk_tx, rate);
> -	if (err < 0)
> -		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +	err = dwmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
> +	if (err == -ENOTSUPP)
> +		dev_err(dwmac->dev, "invalid speed %dMbps\n", speed);
> +	else if (err)
> +		dev_err(dwmac->dev,
> +			"failed to set tx rate for speed %dMbps: %pe\n",
> +			speed, ERR_PTR(err));
>  }
>  
>  static void imx93_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
