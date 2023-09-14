Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A357A0844
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 17:00:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A331C6A5EF;
	Thu, 14 Sep 2023 15:00:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E5D6C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 15:00:16 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-501bef6e0d3so1788182e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694703615; x=1695308415;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ost934mXsFAdMAZL0F6K6qliA7AblkstZWyU0HrIN0s=;
 b=WdtwqW3rBE8/SKnSsQb2bmGKwnTcIKF4jRxC8jiAsNRnUam7l5t7uEaFpf4OgqSVE4
 JzRmLX9X2QcI8d/6Gcw0KandXXJStP7/v/S8FpNcpQDLogHJ2K2X8sM0QG+f3FbSRTPW
 OML3A3/15HM1lb08BuavMcmEAxp3UT8x5i1i3HCr376C88xKd/kT/ez6lGq4/ZtTx+99
 tD07SlHqtK4dqXNcNLCQNHbfKNDuGuniMe3sZxSIPrYCY2w3VV2kz991jlbkY5aTvHNR
 RTzsf7f3WK03dJ6g2jfjn3hhkmHyWDYFYkqlz5z8zJBfadNCK3CAQRWC79mG9ofo25pt
 MsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703615; x=1695308415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ost934mXsFAdMAZL0F6K6qliA7AblkstZWyU0HrIN0s=;
 b=IbrtQXLEeJCEzIyGXeqe/JrB2O/o9+vNezQgMZj/vDTtK9acT0n0arnwv9nIDa0deG
 eSAHRLezCIJv+KnegoJTP6nYWflQToLShzQ2FULmuM54rY1lIXURYnFWk1fPs90/U4mD
 lyxDGvg/lR0DN36/F2A6DhS+KG7phHdQ5eBBzB/Ohn0SRU/JTY+9hw9TQwbwh0GwIM8k
 VBIjqQr0LAsVsBxxkm4CWCmBMn6CmEG4eTj0o9iWa/UQPbTglLqKzBxdpcRLyaIF8yZo
 3ZzmYjbxAs32E8Ir9he3iKOW9TzXhfvPadzQtf07d2hW35QS/6frKKAg0n1itXZg6HmI
 cCPw==
X-Gm-Message-State: AOJu0YwFs6KdsHu/lZAo3E4bFDr0v/BwqfFbHsa9zXzVTD+gK9rRG+i3
 kFBStNy0D3RrecYT0nA77ro=
X-Google-Smtp-Source: AGHT+IEyuQasdt2T0VDWeN/DaQrMM3CCucu0MV6lzspojZuxz3D9lCseE6UrznxpRfcOfZwYMqK2hw==
X-Received: by 2002:a19:6918:0:b0:4fb:9f93:365f with SMTP id
 e24-20020a196918000000b004fb9f93365fmr4161961lfc.38.1694703615403; 
 Thu, 14 Sep 2023 08:00:15 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a056512020d00b005008b5191aesm302321lfo.284.2023.09.14.08.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 08:00:15 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:00:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <vbljmrosykldu3jutfqyxtp22ivbcfyn2luu3cg55saeyi2uqp@tayl2qsbmovg>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkk-007Z4l-BK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qgmkk-007Z4l-BK@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: intel-plat: use
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

On Thu, Sep 14, 2023 at 02:51:30PM +0100, Russell King (Oracle) wrote:
> Use stmmac_set_tx_clk_gmii().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 34 +++++--------------
>  1 file changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d352a14f9d48..c6ebd1d91f38 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -31,32 +31,14 @@ struct intel_dwmac_data {
>  static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct intel_dwmac *dwmac = priv;
> -	unsigned long rate;
> -	int ret;
> -
> -	rate = clk_get_rate(dwmac->tx_clk);
> -
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -
> -	default:
> -		dev_err(dwmac->dev, "Invalid speed\n");
> -		break;
> -	}
> -
> -	ret = clk_set_rate(dwmac->tx_clk, rate);
> -	if (ret)
> -		dev_err(dwmac->dev, "Failed to configure tx clock rate\n");
> +	int err;
> +
> +	err = stmmac_set_tx_clk_gmii(dwmac->tx_clk, speed);
> +	if (err == -ENOTSUPP)
> +		dev_err(dwmac->dev, "invalid speed %uMbps\n", speed);
> +	else if (err)
> +		dev_err(dwmac->dev, "failed to set tx rate for speed %uMbps: %pe\n",
> +			speed, ERR_PTR(err));
>  }
>  
>  static const struct intel_dwmac_data kmb_data = {
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
