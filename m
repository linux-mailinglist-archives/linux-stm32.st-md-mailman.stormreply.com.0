Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E67A086B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 17:04:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C68C6A5EF;
	Thu, 14 Sep 2023 15:04:13 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE230C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 15:04:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso17533061fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694703852; x=1695308652;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QhtIFD2lNPWWdkb9OegF+hUPlFQpOn+UoE47HAzxS60=;
 b=J4ekqv3SVOUjLPZQwl+G7y8wCor2su0f66CTPJEULwjEJS1+Q9UR4UC7tARKt18jNr
 NFuCHBTJBXG9azCwwYMrAoPyuFxnoZPOvtnGK83g6pvdvgy36pg7nzM3hhnfc6B/sjSa
 HllLNw5pjSYwIzVjW9LtitDWM2sYcQCd7l5EhmBQRcF8CiB5/u9hvhSXhmGzRjuk/45i
 wedJGGQO3I4Z5vXZITK1J5n3GluqEbcBzz5nCmbCp6Jkkj96e9Vst5hWcjx128LNWiQr
 OybWIWkJFYI5gsEA0G9Z6IBfccTRne45qIZiGFTjWYVmOXkI2OuIUBmYS4k4g4OS9Sac
 8dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703852; x=1695308652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhtIFD2lNPWWdkb9OegF+hUPlFQpOn+UoE47HAzxS60=;
 b=TygQSRXSeg1HNFzcAARpD2SiTaaqODb6v2K7rN4p2lYHvqqb3Qs3q//JiyG02T1LDG
 pIta9x7dBTR9Cykgy9wxbRHpiwHoe/m6zDJniZZuI0EKwm9Fmphz4NdWFSsXy0MtZbP5
 mey0KLL0LFjVishW2FL9l2HYkWMkc73dM6GOZ6hi9tU09tEVObnYPKqfXQVKiAyLvOHl
 qSmBqdildhhHJeEj4XDCLQK70CF7oCBTPS1F1J34DI/K3MyRb7/T7mF8SiAsvcjxVGSH
 nbkV1EQEBEQzR29rqAWIilnF5+oNvlq9/rQCS05AOUiW2gjeZU9AlGhrJqCZzV+PAxe9
 2RUw==
X-Gm-Message-State: AOJu0YzPHRtPjTg89bfUHnix6dV72AzL4ttQgMJdAeTW+L9lSMn38r6y
 tlWRShGVgaaYs0IhWrD/tzE=
X-Google-Smtp-Source: AGHT+IGAFYLg8GoHiSXscjrTPJtTnwzSs2lMPv68Q4agvyRTpiU+bnlotU7NkkXmS3OhDnarpKxEcA==
X-Received: by 2002:a2e:84ce:0:b0:2b9:4413:864e with SMTP id
 q14-20020a2e84ce000000b002b94413864emr4463875ljh.53.1694703851940; 
 Thu, 14 Sep 2023 08:04:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a2e9802000000b002bfb71c076asm319397ljj.43.2023.09.14.08.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 08:04:11 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:04:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ad2oatdtyjr3d65daxl3haciywxjl4s57i6lnnzgqpwpwkcgc2@c4inrmr55uca>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmku-007Z4y-KM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qgmku-007Z4y-KM@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: starfive: use
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

On Thu, Sep 14, 2023 at 02:51:40PM +0100, Russell King (Oracle) wrote:
> Use stmmac_set_tx_clk_gmii().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 28 +++++--------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 9289bb87c3e3..c2931464e977 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -27,29 +27,15 @@ struct starfive_dwmac {
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct starfive_dwmac *dwmac = priv;
> -	unsigned long rate;
>  	int err;
>  
> -	rate = clk_get_rate(dwmac->clk_tx);
> -
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
> -		break;
> -	}
> -
> -	err = clk_set_rate(dwmac->clk_tx, rate);
> -	if (err)
> -		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +	err = stmmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
> +	if (err == -ENOTSUPP)
> +		dev_err(dwmac->dev, "invalid speed %uMbps\n", speed);
> +	else if (err)
> +		dev_err(dwmac->dev,
> +			"failed to set tx rate for speed %uMbps: %pe\n",
> +			speed, ERR_PTR(err));
>  }
>  
>  static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
