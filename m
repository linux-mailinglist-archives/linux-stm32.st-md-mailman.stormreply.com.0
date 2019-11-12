Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20FF9671
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2019 18:01:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C1B7C36B0B;
	Tue, 12 Nov 2019 17:01:52 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EBE4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 17:01:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 193so13754916pfc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 09:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GDojT++zYyimFKXjGTgtIMvoNwjyBW8FizODRtTHlkU=;
 b=gqdeS5lER8xfVdf3MPfzRhQWtIdYGVkfvSEfkEikV5sK+iUbNyoUDxfqd0+Gf8qRon
 qIHWABuQ6RrIuV9KP9et/nCefEYxwgv0VU6xWDH/6WigGjakxakLa/uAk/OZfK6aVs7K
 LvkNK+dcIIHQrnxcoqA/IqdlZjyzz32xgRlYjaX7VbauzkexzJ8FhEebDZqN5k6CV5bv
 1E2P4sJBj7B20dAtY+vRdNYhwg7+Crzg+hEcAIZsxPn2ZVIiajYUgAJYOPGKF8JwDcwE
 0IZzMwP9eCWaBLOLkKUPL66WfWRvEgGNsCoRadK6bSa6QAU6DElkyAo1XDy0qVlKPQZg
 tUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GDojT++zYyimFKXjGTgtIMvoNwjyBW8FizODRtTHlkU=;
 b=bNZsoJ/idqe0OEVy4V46G7XGvcONDP9O8905lPIed/CGxiXBt/gKT3pVnS+HFsgrtT
 TgXpe+yA6w3DP5ieNxlkUT2X/xyeqDdVwboFNk8EhEbj8H0Cn0RdLsj7j632TbsQHnJr
 RfKUZCvEN6z85xsNPA28DKtXO1tYLan0F5H8nr9X9Tvk8lEOutRF1pJvzavR1WhKXPKU
 vJ20a/j3gNZWBSezWd0Ft0tXkW67hPNZoFTWabfLQQ9cYEDLD50d3EoSj8Li0j5+9PE9
 H8V2SmTPPi0iAMCCP+vAzpZbDK1CXW7TgGSHGsciM790PTW6AnsyGE56T/Y/8dzDGD0D
 ZwDA==
X-Gm-Message-State: APjAAAUV//e/tkTAKTr0UUVVY/UlYU9fDIGBPZLnG3l5SVGiP7MhsnoQ
 RLAtn5ImYl93eda6aLawQdI9dg==
X-Google-Smtp-Source: APXvYqw4G8Nv44pA6Fs7EzjALZ0qCpPOe1DYkXKQWUmcJweMaKJlE6IhOyuyuFHl+85B3ZJqZHBicw==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr38064618pfn.24.1573578109877; 
 Tue, 12 Nov 2019 09:01:49 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id y138sm20294845pfb.174.2019.11.12.09.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:01:48 -0800 (PST)
Date: Tue, 12 Nov 2019 09:01:44 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20191112170144.GF3797@yoga>
References: <20191112141819.GA22076@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>,
 Eric Anholt <eric@anholt.net>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, mazziesaccount@gmail.com,
 Ray Jui <rjui@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Sean Wang <sean.wang@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
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

On Tue 12 Nov 06:18 PST 2019, Matti Vaittinen wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 763da0be10d6..8844ca1261d5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -485,8 +485,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  
>  	val = msm_readl_ctl(pctrl, g);
>  
> -	/* 0 = output, 1 = input */
> -	return val & BIT(g->oe_bit) ? 0 : 1;
> +	return val & BIT(g->oe_bit) ? GPIO_LINE_DIRECTION_OUT :
> +				      GPIO_LINE_DIRECTION_IN;
>  }
>  

For pinctrl-msm

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
