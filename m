Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC48B8B3D
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 15:32:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78EC6C71291;
	Wed,  1 May 2024 13:32:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C8D7C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 13:32:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34dc9065606so334685f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714570370; x=1715175170;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
 b=stiCl83NVmEDmj+tD/cBNR6HfVoCcEosK2mylsnZlHYUxe+4LwtZawJvgk2Hu83sg5
 ZUok0Pk0UIVbKsnBfnlgkIWvKk6HguCElYQl53ReOPFES80Db1l3c7LKbpw+kd/DXwMj
 DYGy+Lt2RMqDcUfm+y2rWQBgK6CrwtE3j5oYYvFISzuuz/K9BEDcFrxVJvWgzPmXDOKm
 gNW6N64FiUf8EBSs9p57lNhJOe+b5YMnjS8RLKXNtL45dIV3+/amm9HOIlaKQwaJC5mc
 ShtV+jz9L02z+YrcbFZ9aPdJdG5uqhJWkWI8VTjrONXP/8xGlvsKtCv2hpT7Rsyjq1s7
 qA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714570370; x=1715175170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
 b=sTSRmVM1ry6h8ZvYA4sz44+DnHYZ2sfVepBMy5GnrAC7j93ZeoXntcLmrG1fxJPXjx
 SHDGWFYxHqFakKpMpR7AW389Rkz3aJMKGqaJtfhDjHZ6GwyrUXbIUgeIWtvv/FITE037
 Fnl28Cao+5HhRFPfhEtIZib3vW+DuqkZLk0neYb6LrjEB10xumkSedlVkSHL7GiBtczo
 7/mnUul5+F5mV0lWYvxqNkcX7SPcku4SGPRfJdoWm+nt1TWqM8jH1BH6cC9IMlc+7fAw
 na4f4H6J08YUmIJz5O61QjI34ghfjjfEIakCM9QFvGsvjqTyQ2Y5cRJOFu2DFoRDeSt8
 /FjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ivGg7GXIaatuaFaoiGJ6C7Hiq0sLiiMKuB1VADzo9ESgpaD+uD5T57d4vs+Ho+x+FZXAag0/465xF5mctt0i9V5hXQdXST4U1JWgxQhU+VVBorMTdduh
X-Gm-Message-State: AOJu0YzBnYjF4csTVMAIjuokjcgv7CEMxU7gh7TWsvxI3BleT16be/5s
 9NYhS+04Vx8mxuU98xt4BQiChZDc14avJMkbhls+CqpoqvyGkqJIWzZraBmFM3k=
X-Google-Smtp-Source: AGHT+IHuNu3c35RsAkvpJAfWqKVWQhv6Z4Ac0yjTjDmpBKt12bv5Zna3drXEkGYfHrENBoZl/SwOjw==
X-Received: by 2002:a05:6000:24f:b0:34c:bf22:73f9 with SMTP id
 m15-20020a056000024f00b0034cbf2273f9mr2265612wrz.28.1714570369370; 
 Wed, 01 May 2024 06:32:49 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 d4-20020adfe2c4000000b0034a3a0a753asm32876234wrj.100.2024.05.01.06.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 06:32:49 -0700 (PDT)
Date: Wed, 1 May 2024 16:32:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
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
Subject: Re: [Linux-stm32] [PATCH 01/21] pinctrl: ti: iodelay: Use scope
 based of_node_put() cleanups
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

On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
>  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
>  	if (ret) {
>  		dev_err(dev, "Failed to register pinctrl\n");
> -		goto exit_out;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, iod);
>  
>  	return pinctrl_enable(iod->pctl);
> -
> -exit_out:
> -	of_node_put(np);
> -	return ret;
>  }

This will call of_node_put() on the success path so it's a behavior
change.  The original code is buggy, it's supposed to call of_node_put()
on the success path here or in ti_iodelay_remove().

If it's supposed to call of_node_put() here, then fine, this is bugfix
but if it's supposed to call it in ti_iodelay_remove() then we need to
save the pointer somewhere using no_free_ptr().  Probably saving ->np
is the safest choice?

The original code is already a little bit buggy because it doesn't
check for pinctrl_enable() errors and cleanup.


diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..f40a1476e4ff 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -156,6 +156,7 @@ struct ti_iodelay_device {
 
 	const struct ti_iodelay_reg_data *reg_data;
 	struct ti_iodelay_reg_values reg_init_conf_values;
+	struct device_node *np;
 };
 
 /**
@@ -884,7 +885,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iod);
 
-	return pinctrl_enable(iod->pctl);
+	ret = pinctrl_enable(iod->pctl);
+	if (ret)
+		goto exit_out;
+
+	iod->np = no_free_ptr(np);
+	return 0;
 
 exit_out:
 	of_node_put(np);
@@ -903,6 +909,7 @@ static void ti_iodelay_remove(struct platform_device *pdev)
 		pinctrl_unregister(iod->pctl);
 
 	ti_iodelay_pinconf_deinit_dev(iod);
+	of_node_put(iod->np);
 
 	/* Expect other allocations to be freed by devm */
 }




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
