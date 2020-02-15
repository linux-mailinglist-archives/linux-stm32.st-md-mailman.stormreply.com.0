Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCED15FCEE
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Feb 2020 06:36:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FA88C36B0B;
	Sat, 15 Feb 2020 05:36:14 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 506F0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2020 05:36:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z7so6114744pgk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 21:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=umSLSqFdcTUcW15IlOni/Tuec1i7imfq7Q7J9RYYX4g=;
 b=cIxrqNRp65WCtK+fiYn9g3PVPZKXWCeUB0uFKNIzbK215QX3Al36Ke7lSPKliczQPG
 zRn7Bi6DqLKPjlqWNiNyIv1hfnOjroG9dJAo7zBVoxdcOscAu96nnIAHZ0M1KbXjm0Sl
 ZR04ZlFB/h9Rx1G6+2XpmHZ6qc00E2hKTf9RBjGMhvM/S7iYiuAY2TTttm/rFAuLs3bq
 Tl4EPCrQfsVTe0Oz0o9vN+XxWzhv+LiQ+CYz/xTgBuLMVClebtR7iuNxNAyHBtWlm0Wp
 bHYgpgS19tzczImghBSGzs7yS4YbFHy+7+42F6gNr1Xyalax7P6gX0gNY6JBKTkCYKiJ
 SqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umSLSqFdcTUcW15IlOni/Tuec1i7imfq7Q7J9RYYX4g=;
 b=VY5j+XtGIn5fvlcsWX7JNZrKh+qtdpcsJ91wLl5/Tf8ZILX9zhbpm8Wk2dfdYzbTX+
 N98zLX3jRoHXGlBuzpNwsQqtKqN0qM0WGEVdfg2VS7q5dd1SwqJFnpnKLy0KOstNxRkP
 GKrp+6ua6Q2F9IDuL+ujATWexv6jV5hHbVQW3wb6AqNC281BzUCkX7wumnxPfZ494TQB
 FtKH5pLOI3wCvLHMLtB6lAsCp7QgyzXCftpRqBxdlFDTeVYJv3NpSzdg+nGiROWXrwSg
 TyYodDsUo2t2Y2quRIYuHM/A7dNtlewncllbI+zS4j39vHkXpGfFuac3/DX8fc8vuMwd
 VbOw==
X-Gm-Message-State: APjAAAUKyMoe5+U09hS5s87nixLFOdmOa3UBaar707Fu5N2FG28hZnyw
 QBdtnq6FrnP9y1JrLiYtM+EEnQ==
X-Google-Smtp-Source: APXvYqzk4mzSWnD3eisseNOAoKEFSWYJ3iXu/MnMV3x1ieUnd9jyOy7C/UGmCSr9X/1fRkBJKg6m3w==
X-Received: by 2002:a62:6842:: with SMTP id d63mr6945184pfc.113.1581744969478; 
 Fri, 14 Feb 2020 21:36:09 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q12sm8411743pfh.158.2020.02.14.21.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 21:36:08 -0800 (PST)
Date: Fri, 14 Feb 2020 21:35:17 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20200215053517.GN955802@ripper>
References: <20191112141819.GA22076@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
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

For pinctrl-msm:
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

>  }

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
