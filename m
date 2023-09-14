Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E07A035A
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:07:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D36DCC65E4F;
	Thu, 14 Sep 2023 12:07:04 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34538C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:07:03 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bf8b9c5ca0so13513501fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694693222; x=1695298022;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2NXzSAm5YSMRzqDeFqPNEy2xH7BTeCdCrqM2TbPOLBA=;
 b=mHtRR6hg1pG5VsE8Vis4At+/7cYXLXIZEDmQY83ukqS6kD4vs+4rzt0SlSmWKtGpX+
 NVinVzBNIyKy/pWfJe+QWdAxWN6Ws2OXn1fG4Ih4aHQKQWjSWJ6lqG58mj+V/ZnNcSmi
 //IDSYfztPX/qntfZVLYx8v9CQNO4hXd+62jtZsDgawtpBBfir4JzT6IJ7Snq/6a7a+Y
 OEY2lTKMpmXt7w7WsnthrddQpVhV3J5BaYcwFYgzsl8pd4F7/h1Mjx05nbfL2chJmJ+5
 3JxZkoXMyXTSIPAk1dU2FT7Wc3n/ARU/h0StqzXgTF3j3P091sF2wrmdnWroHHn10Adw
 NlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694693222; x=1695298022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NXzSAm5YSMRzqDeFqPNEy2xH7BTeCdCrqM2TbPOLBA=;
 b=hY/K5Mk5VGxw+YU0er9ThI7hUTrJUSagcfaERsXmednprVK4dSBxanCTg7WeFr6JBE
 gYFCLg3AbCaKRRElaJhj+45rQMsuDuyNffXnweKziYPX3tJUOmUCY1wMny27Mxsomo/X
 QZmDjPY2W4jYQuIYU4xKne5MQ4J85lYAAUgPUNi9o2V5hxH7nLmZ1N5nLIgU4ww/sUxR
 T6OdPvh36+bOyYoR7FEp/I9nLR6rj8SlI9L2PjEvkDunGDkrjzlvxiOL4WSdwKfAnsi4
 s3vCbQ/rO6nn8lqHtl2DQ12l+kBWHNQlQ2LPzmmgKgkgfTgqdTVv/RTT0cvAh98PKI6d
 yYOg==
X-Gm-Message-State: AOJu0Yx3K1su51A09oTPZv+7XfHlF2louZVWozxDV5ULoBOmmVP/S0Yh
 nFnGs1DTuUr5M5Rx5kHVHV8=
X-Google-Smtp-Source: AGHT+IGFgKEpqUy/YZpBSgsqGeCUXiZOo5fp3bjEscrEJII75vSUKVI4btweIypwZx5yEnXluRY73g==
X-Received: by 2002:a2e:99cf:0:b0:2be:54b4:ff90 with SMTP id
 l15-20020a2e99cf000000b002be54b4ff90mr4504691ljj.53.1694693222127; 
 Thu, 14 Sep 2023 05:07:02 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a2e8190000000b002bfbd489019sm247523ljg.62.2023.09.14.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:07:01 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:06:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <7bg6suzboq6jocyf6ozrfcjpbehm3j3ttkag3few5hgeziliu6@abyv2qpucy2w>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqn-007TPY-Gn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qfiqn-007TPY-Gn@rmk-PC.armlinux.org.uk>
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

On Mon, Sep 11, 2023 at 04:29:21PM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 35 +++++--------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d352a14f9d48..8cc22f11072e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -14,6 +14,7 @@
>  #include "dwmac4.h"
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
> +#include "stmmac_plat_lib.h"
>  
>  struct intel_dwmac {
>  	struct device *dev;
> @@ -31,32 +32,14 @@ struct intel_dwmac_data {
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
> +	err = dwmac_set_tx_clk_gmii(dwmac->tx_clk, speed);
> +	if (err == -ENOTSUPP)

> +		dev_err(dwmac->dev, "invalid speed %dMbps\n", speed);

'%u'?

> +	else if (err)

> +		dev_err(dwmac->dev, "failed to set tx rate for speed %dMbps: %pe\n",

ditto

-Serge(y)

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
