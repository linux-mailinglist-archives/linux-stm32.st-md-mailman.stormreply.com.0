Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1718B8EE3
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 19:17:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CD07C71291;
	Wed,  1 May 2024 17:17:04 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFBCC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 17:16:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51bae805c56so8139170e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714583815; x=1715188615;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
 b=C34H6QQUfoxpTnEuQgcQ3/3txJ4Bc1ZB5t5z+83IrxwzBs5WBcjyVrd9Bmtj06/x7X
 djnNKwPXVcTzb9ScPFG2TYhJcLVFZrJUsiQbe2TkB7K6gFENUtps1/KCxwwPKQVO4hJ1
 J18W1ZIJlasUPmG1HmydD7AknTniLHpHWxSkiRD3Qfoj5mg+yOOIDEa9oFtDu85vNiyt
 v8g9zR5WdzTrxPwqoFovGTTB5q+Wk6q6rJORNT0KKgElNHw92MJWipJniSt3dUQ6YikC
 /mjMLekv1TLQW1IjZx4aNOpzD5hVPVFGuupGXZLIZtXI6QElI9340Ev3bJ1OYHqkcQNT
 zNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714583815; x=1715188615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
 b=FPuFcTR/wvveNdnHqpZLZJNI7zZlClfcrJOxydJv7VNeYk0yJ18U3lbDTJCcvuqGkX
 O8w7oG5QvPw6C9G0ffuQWcs4uc5NMQGD0U8dFgqCBbXkCkZ55gOjroQbSSSCV9H3Qu4H
 gVRWlur9GT9wOLnbGax8Dzbqe8evEPyoGb/ahmPX+p0iyICGKa2tgkrmMlbvMQ2QOJBE
 axMhHirvhC6+r1oWxeBsgAfehf19yH2/e4uHiO+S0DYqqM0KKNl+1qODbvIPsHtO+xzD
 FFsN1dFVqDX8dlhIlZ085PvPizzG9E2+X3Zh+8ABe9GyLkSaTK0TVirFt6zBJxZepj/X
 ZOKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZN8eFA7fZypln42p38vILZqQlPrjBxY6sxiWVeakXuG7v6Rto3tcJVqzWoxouMPJPXAQRVHU6QzjZ6mmOg0KPyAsIvNxy/Ih8027hytavwFq+Q2Ex3oDL
X-Gm-Message-State: AOJu0YzbDBCFp19YaE+VX/b7ymoQ3i/aX+BX6hx0Ks2lmQMyxHq8hfnl
 wNE38vUVFUKOxdcARpCdTO07FJsYHF16Ar1JMO8YpKUXJY4JA1+ADhRCUJRvMuo=
X-Google-Smtp-Source: AGHT+IGQV4KLhJUah5uwpDXzYUszrhPNSItjqkYS07RJilfCu8tUsg9Dz64nf2enkLVMqtqy/1k75Q==
X-Received: by 2002:a05:6512:12c7:b0:51f:196:d217 with SMTP id
 p7-20020a05651212c700b0051f0196d217mr197144lfg.63.1714583815158; 
 Wed, 01 May 2024 10:16:55 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 t10-20020a192d4a000000b0051d5616c3e1sm1524897lft.231.2024.05.01.10.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 10:16:54 -0700 (PDT)
Date: Wed, 1 May 2024 20:16:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <f6aa3a17-90d2-42e3-8c55-639dfcdbf8ca@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 10/21] pinctrl: st: Use scope based
	of_node_put() cleanups
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

On Wed, May 01, 2024 at 08:56:08PM +0800, Peng Fan (OSS) wrote:
> @@ -1224,8 +1221,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>  
>  	if (!grp->pins || !grp->pin_conf) {
> -		ret = -ENOMEM;
> -		goto out_put_node;
> +		return -ENOMEM;
>  	}

You could delete the curly braces as well.

regards,
dan carpenter


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
