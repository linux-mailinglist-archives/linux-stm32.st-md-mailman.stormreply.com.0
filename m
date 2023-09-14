Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A357A0355
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B26C65E4F;
	Thu, 14 Sep 2023 12:05:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53A6DC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:05:26 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2bfc2b26437so12951381fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694693125; x=1695297925;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VIhmQ15T3b/u053vTxiBdsl4QAns5+D876ddW2tjWDI=;
 b=nExXDnU7HLlpW1dftjyC2Cp0a9fl469bbFoIUxmJMTPJg79i4IRVeZw2TpKTMAbtsM
 Am76sV7n9iXeBxgzENdu5BfouAJGOdF0AV6DVygRYJGIlWxZr6F8kw8f9Ajqdm3m1Br5
 qxa8FjTHozIr2QtU3skps0qdL+djFq+MGxtrOl608YWaq3NRNd8aFe6BZLS5Q8ANrPVD
 /cyn/W+YeymZscWWiw1u6YY+9suu0bsv8jfGQvPPVxaZ3KwqTrk6L4Z8CoosDpESkJF2
 mPDOgq6tqqeDqdy0Sch5esoYPi8DIkm0oM27QhZDeStdoUpOWKpBkEUVSPIGuvagpQrr
 rieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694693125; x=1695297925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIhmQ15T3b/u053vTxiBdsl4QAns5+D876ddW2tjWDI=;
 b=ipCbxrKTvZjDpaRYbP3m/fP7/BvI9cGVomnifGA/pBnb1tEExwOHuf2rpWF6kozJiX
 oXFDBvHW/9L/7p0C9wMvI+Jiy0HOZ8dCdSl6g61sLE5rwzTjAcvjPOZtHQ77xJwL1vk8
 9nvk0jJvEh0DRK+YonUJBdI/jcjGY//GcXprQegqNVIqSq1XZ9kl4/pPFQBeb5KsuDCh
 2uHF6nKp+P41Tuk+iuqfuAFmTFiqKrloU6MT/FMMgP52yby/vRTRPUVbjyHCR9e5KY9N
 OsAkz47fQokd/62zIgA/1wEQdEjzv5NXYwGLZN1Fzz7JeaB6Ax9wpK55r43yyIQ1HERO
 9HGQ==
X-Gm-Message-State: AOJu0Yw4LelylJsLEKjzjPk4OfWSp0FvIIKS9KNTxLFT/qtx4IRFXJvo
 T5M/7/IsjJSoRPJi6TqOvog=
X-Google-Smtp-Source: AGHT+IGDbk38rbC2y+cC0mEf9VcbOdWV/oMrh4l2frVj1YvUOFWx4En/oNi1hX7qnStPR5GI0m4sQQ==
X-Received: by 2002:a2e:9c48:0:b0:2bc:c846:aa17 with SMTP id
 t8-20020a2e9c48000000b002bcc846aa17mr4248097ljj.41.1694693125137; 
 Thu, 14 Sep 2023 05:05:25 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a2e9886000000b002bcc4d64758sm246090ljj.103.2023.09.14.05.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:05:24 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:05:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <fidihp5peqnwzse6jb7i56jlqbnam4z3gdpinnf3gpenmrm5dy@gpay6xwztt2v>
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

The 'speed' variable is of the unsigned int type so the type qualifier is
supposed to be "%u" here.

> +	else if (err)
> +		dev_err(dwmac->dev,

> +			"failed to set tx rate for speed %dMbps: %pe\n",

ditto

-Serge(y)

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
