Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E91B34BC2
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 22:27:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D94C32EB5;
	Mon, 25 Aug 2025 20:27:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 792A1C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756153640; x=1787689640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FHQO1qIi2frWsYih6E50v+BhkfadCKotC8hnJWvlN0w=;
 b=dL0pBws/ReNrtiiAeDLoEnyPHq9DIvf7FOpK13wplzZEOj4BTAMnywE5
 oj9/2qz+dk/TsPjzoy1MZJIKd0D9CBJsC6AZGrOrE8DdbmBH9pnbEUTP4
 B7s6Tg22AHTG4nDgcOkllXY2lfHC6ULN4MwAjOTcAQbO+OwAgAkUUY5LV
 g5Mf9DaaPLf2ri8iSIavpAvfmqAYGL5fE6eeZDdXOyreCZCwV7BlyCMRg
 SnZ28dWbSZ/dRgSJCyY/GkJ97eS315hGT8S7+ly5nr7o0Y+XvQYcyVnmQ
 gyFkL0bfPQfMaOjpIkubYdhj0dd8pPhq0YqVYIPbmvb8u2AojVkvKigZZ g==;
X-CSE-ConnectionGUID: oeH/sxD1Sra8rYL/eQPNNw==
X-CSE-MsgGUID: dBekKAihT+aa8ttzHSAB5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69091760"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69091760"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 13:27:16 -0700
X-CSE-ConnectionGUID: iDzMD0+3RzuknIvgTvKpUw==
X-CSE-MsgGUID: a76LdALuQ12+ndxXL/Zziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200282209"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 13:27:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 2961711FB0F;
 Mon, 25 Aug 2025 23:27:09 +0300 (EEST)
Date: Mon, 25 Aug 2025 23:27:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <aKzHHZ4y-lA-b5YW@kekkonen.localdomain>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
 <20250825135401.1765847-6-sakari.ailus@linux.intel.com>
 <20250825160023.4070bbc1@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825160023.4070bbc1@jic23-huawei>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Crt Mori <cmo@melexis.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Frank Li <Frank.Li@nxp.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>, linux-iio@vger.kernel.org,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Abhash Jha <abhashkumarjha123@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 Sean Nyekjaer <sean@geanix.com>, chuguangqing <chuguangqing@inspur.com>,
 David Lechner <dlechner@baylibre.com>, Waqar Hameed <waqar.hameed@axis.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jakob Hauser <jahau@rocketmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Han Xu <han.xu@nxp.com>, Julien Stephan <jstephan@baylibre.com>,
 Alexandru Ardelean <aardelean@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Gustavo Vaz <gustavo.vaz@usp.br>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, David Laight <david.laight@aculab.com>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rayyan Ansari <rayyan@ansari.sh>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hans de Goede <hansg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Linux-stm32] [PATCH v3 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
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

Hi Jonathan,

On Mon, Aug 25, 2025 at 04:00:23PM +0100, Jonathan Cameron wrote:
> > @@ -95,18 +95,8 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >  	if (en && dac->common->hfsel)
> >  		udelay(1);
> >  
> > -	if (!enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > -		pm_runtime_put_autosuspend(dev);
> > -	}
> > -
> > -	return 0;
> > -
> > -err_put_pm:
> > -	if (enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > -		pm_runtime_put_autosuspend(dev);
> > -	}
> > +err_pm_put:
> > +	pm_runtime_put_autosuspend(dev);
> 
> now the put is here, whether or not there was ever a get as the get is
> gated on enable()

Oops. I'll fix this in v4, with just this patch as the rest are merged.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
