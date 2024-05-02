Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D81128B9503
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 09:05:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D270C71291;
	Thu,  2 May 2024 07:05:47 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FD43C71286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 07:05:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so47334001fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2024 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714633540; x=1715238340;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
 b=ueS8yHSZLXsPAESdu4AWanaEqweZDu2vecOFhZGLZ9WAYjweMttSYtvXpHOdLncXKo
 p3OdyUN/Y/9QfkcBu4oQJadoMkni+1udNAe6cD9KGCcCMQ7+fiEXeiNfYSJHcdWnmd/H
 Jz7L4/hpoFM/bEYA5ayj27kjlHzxuFIJfn3fcG7aw1RnGuzpWhc33u/K47NVnDSHcfBw
 NWLCAXxId8OYGkLkQsffsGALcZDQ39MRxenyB3Uy3M73c2W7yvImblRdgXM+4AZGwCSA
 /KZ/zlJMU9/DMPM5Y6UFczYCqHZAeqg+jmEYcadIW4nG/hLY2yHG0Mx8Z7Xa14hYMd9M
 F+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714633540; x=1715238340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
 b=irh3TMW70u8IT4aCQyJTpxLOkC9rKY0kKhElFkc64KYI0jkyK4+mfX50NmuP1PLrfW
 DSN1M8Vzwc35znnzZrfdSnmVMvHd8bP8Qkxc24DicXL9RUI/r9mlxa3V83VzGhcX5yYQ
 3VhhBpIkHJ9wqfKKlKmpI3J/RKcqUucjUfUjZe3oFv7dJHONLpYEaf4wjSkie9EiBkhv
 JG4dwdpIEv3vEA5YYd4jUFRdrF/tanR4Fp8ZmNOcFbfzzwLQCzQakiRfkaPQs6R4u5mZ
 BWbgEoAhgo5POXOZifFvgTdrTsf7ewbje8tXsYZWwfn4kgWqUxTKuTvHgaDVHYepSSMx
 6WcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPIQNipZhoLXoj8l7If5rDwnFhN0atdK76aM/RYJflVmkirz77bWZGqCGa90WlPkZ/BNty5fBxpygKFS2gmDut2B9hAgQY6VTAyTYy8bFSrU84X/ZvWLsx
X-Gm-Message-State: AOJu0Yz5jniAt0CwZ26m4ziLcx1NQ97tyr3jPCuGTz009qfjZvGuWLwG
 0mZQ3K29BKxt9NTPgN314oLBpyPYKD0+q1Gty2u8IrTqEiezBotop2y0/l9XbLc=
X-Google-Smtp-Source: AGHT+IGHVWuyebZDGCsij4vuuCGXUnlNacdJhnGzP0jhAixWhDpzQ1nmi4t3DPfRBlZrMwTir+WhcA==
X-Received: by 2002:a2e:a58e:0:b0:2d9:fb60:9afa with SMTP id
 m14-20020a2ea58e000000b002d9fb609afamr1096872ljp.40.1714633540084; 
 Thu, 02 May 2024 00:05:40 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 q26-20020a2e969a000000b002d860a40f9dsm69420lji.136.2024.05.02.00.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:05:39 -0700 (PDT)
Date: Thu, 2 May 2024 10:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Message-ID: <26aab31b-8085-49e0-862d-24c26ff4d02c@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
 <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
 <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
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

On Thu, May 02, 2024 at 12:28:42AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
> > cleanups
> > 
> > On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> > > @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct
> > platform_device *pdev)
> > >  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to register pinctrl\n");
> > > -		goto exit_out;
> > > +		return ret;
> > >  	}
> > >
> > >  	platform_set_drvdata(pdev, iod);
> > >
> > >  	return pinctrl_enable(iod->pctl);
> > > -
> > > -exit_out:
> > > -	of_node_put(np);
> > > -	return ret;
> > >  }
> > 
> > This will call of_node_put() on the success path so it's a behavior change.  The
> > original code is buggy, it's supposed to call of_node_put() on the success path
> > here or in ti_iodelay_remove().
> > 
> > If it's supposed to call of_node_put() here, then fine, this is bugfix but if it's
> > supposed to call it in ti_iodelay_remove() then we need to save the pointer
> > somewhere using no_free_ptr().  Probably saving ->np is the safest choice?
> > 
> > The original code is already a little bit buggy because it doesn't check for
> > pinctrl_enable() errors and cleanup.
> 
> It was introduced by 
> commit 6118714275f0a313ecc296a87ed1af32d9691bed (tag: pinctrl-v4.11-4)
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Thu Mar 30 09:16:39 2017 -0700
> 
>     pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
> 
> of_node_put is expected in probe, not in remove.
> 

Ah, right.  You'll add that for the Fixes tag obviously...

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
