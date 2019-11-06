Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD67F18E7
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 15:40:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A07CC36B0B;
	Wed,  6 Nov 2019 14:40:05 +0000 (UTC)
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65C1EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 14:40:03 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id z67so510307ywb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Nov 2019 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BVrTVz8ui5Yp2HVcAdLi7rCx+++bQxsOlRhu0XjCdeM=;
 b=cuDum2cbx52NXdaDRZT0ieXihdO/5T2jtmSnDfsL0Mb1dBV+gPEZWE9lh5soiuJnet
 kGtI1/WLWkq3/cbSiBoQBYh6lF7B039WrABEFiM8HUcecIDO0zEHsSM8OcpejoIAjrqk
 Jtc9inj8ruXwB/yuQrGrneghTT1lUH2Zi6g0aVsI3XaALTO3YLa0gkq5b+aAoyTXKw6V
 C+E/1I4XbruPAgDdS7wAdmu/6I4Btz8ErUSqjJrsCJ1AT1v5dBif9DRG6TeUPEbukijF
 ApAFiWiH7OZ6xLADVOTR4xCfYA0GhkPiqUW99Sao2tVlGt3qFlUVd0vvA36ntMHvlSwS
 82XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BVrTVz8ui5Yp2HVcAdLi7rCx+++bQxsOlRhu0XjCdeM=;
 b=B38uIl2krkM2I4ZidPXmcCZzBhelAGI8xkcjyA8H2y6F24dK8WueLBuymfzNN++qQk
 sVimzrWQkbzo4YOByFGNRc52sc2EoXnScAoShbndH9YY6TmAyyFLbsuF92JTGxhSLaCG
 x84IMsf7mJ4zFvS7jlPApldoEyzh5twViXVVagfU1+zZGDyIS6xxTiyM7puK/JgGycc9
 YB80lgJG86iv2IHUS3cbM/wi0eyGXzFxgsH2WZfM0bFzhq6vscvC6RTFUo7UiU23zWjs
 Tw3IB8LXSqTRaBHpUkSbCUQ6z12vm1LWv+ZpLKN/Zp32qUJF0xoNd/a6f+J40NJt6vfQ
 jhcg==
X-Gm-Message-State: APjAAAVzwYPgooUQCOEIODRkexYBqS5QYrz0SRMKB9hV4A9vQNWO2g/F
 HPDHXq5hmnIlZTK2DrGBzvs=
X-Google-Smtp-Source: APXvYqxRUPEr6QgHY++cmspAGCQjmvK0JdJGvaYm4sCFJmqo6EO5dj0fS8aHhdWeWgO5dcya5jh3Bg==
X-Received: by 2002:a81:784b:: with SMTP id t72mr1838127ywc.118.1573051201835; 
 Wed, 06 Nov 2019 06:40:01 -0800 (PST)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id b199sm9542385ywh.23.2019.11.06.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:40:00 -0800 (PST)
Date: Wed, 6 Nov 2019 09:39:38 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20191106143938.GA3176@icarus>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 mazziesaccount@gmail.com, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add definition for GPIO direction
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

On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> The patch series adds definitions for GPIO line directions.
> 
> For occasional GPIO contributor like me it is always a pain to remember
> whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
> fact that I removed few comments like:
> 
> /* Return 0 if output, 1 if input */
> /* This means "out" */
> return 1; /* input */
> return 0; /* output */
> 
> it seems at least some others may find it hard to remember too. Adding
> defines for these values helps us who really have good - but short
> duration - memory :]
> 
> This idea comes from RFC series for ROHM BD71828 PMIC and was initially
> discussed with Linus Walleij here:
> https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> but as this has no dependencies to BD71828 work (which probably takes a
> while) I decided to make it independent series.
> 
> Patches are compile-tested only. I have no HW to really test them. Thus I'd
> appreciate carefull review. This work is mainly about converting zeros
> and ones to the new defines but it wouldn't be first time I get it
> wrong.
> 
> Changelog v2:
>  - squashed patches 2-61 into patch 2.
>  - dropped patch 62 (can be applied later)
>  - rebased (cherry-picked) changes on top of GPIO devel branch.
> 
> Patch 1:
>  - adds the defines
> Patch 2:
>  - convert drivers to use new defines
> 
> This patch series is based on GPIO tree devel branch.

Just a tip for future patchsets in case you didn't know, you case
specify the base of your patchset by using the "--base" option:
https://git-scm.com/docs/git-format-patch#_base_tree_information

This will append a "base-commit" line with the commit hash at the end of
the first message so that it's unabiguous which base you're using
(useful in case the branch changes before your patch is reviewed).

William Breathitt Gray

> 
> ---
> 
> Matti Vaittinen (2):
>   gpio: Add definition for GPIO direction
>   gpio: Use new GPIO_LINE_DIRECTION
> 
>  drivers/gpio/gpio-104-dio-48e.c     |  5 ++++-
>  drivers/gpio/gpio-104-idi-48.c      |  2 +-
>  drivers/gpio/gpio-104-idio-16.c     |  4 ++--
>  drivers/gpio/gpio-74xx-mmio.c       |  5 ++++-
>  drivers/gpio/gpio-amd-fch.c         |  2 +-
>  drivers/gpio/gpio-aspeed.c          |  7 +++----
>  drivers/gpio/gpio-bcm-kona.c        |  6 +++---
>  drivers/gpio/gpio-bd70528.c         |  8 +++++---
>  drivers/gpio/gpio-bd9571mwv.c       |  4 +++-
>  drivers/gpio/gpio-dln2.c            |  6 +++---
>  drivers/gpio/gpio-exar.c            |  5 ++++-
>  drivers/gpio/gpio-f7188x.c          |  5 ++++-
>  drivers/gpio/gpio-gpio-mm.c         |  5 ++++-
>  drivers/gpio/gpio-htc-egpio.c       |  5 ++++-
>  drivers/gpio/gpio-ich.c             |  5 ++++-
>  drivers/gpio/gpio-kempld.c          |  5 ++++-
>  drivers/gpio/gpio-lp873x.c          |  2 +-
>  drivers/gpio/gpio-lp87565.c         |  5 ++++-
>  drivers/gpio/gpio-madera.c          |  5 ++++-
>  drivers/gpio/gpio-max3191x.c        |  2 +-
>  drivers/gpio/gpio-merrifield.c      |  5 ++++-
>  drivers/gpio/gpio-mmio.c            | 21 +++++++++++++++------
>  drivers/gpio/gpio-mockup.c          | 11 +++--------
>  drivers/gpio/gpio-moxtet.c          |  4 ++--
>  drivers/gpio/gpio-mvebu.c           |  5 ++++-
>  drivers/gpio/gpio-mxs.c             |  5 ++++-
>  drivers/gpio/gpio-omap.c            |  6 ++++--
>  drivers/gpio/gpio-pca953x.c         |  5 ++++-
>  drivers/gpio/gpio-pci-idio-16.c     |  4 ++--
>  drivers/gpio/gpio-pcie-idio-24.c    |  9 ++++++---
>  drivers/gpio/gpio-pisosr.c          |  2 +-
>  drivers/gpio/gpio-pl061.c           |  5 ++++-
>  drivers/gpio/gpio-raspberrypi-exp.c |  5 ++++-
>  drivers/gpio/gpio-rcar.c            |  5 ++++-
>  drivers/gpio/gpio-reg.c             |  3 ++-
>  drivers/gpio/gpio-sa1100.c          |  5 ++++-
>  drivers/gpio/gpio-sama5d2-piobu.c   |  7 ++++---
>  drivers/gpio/gpio-sch.c             |  5 ++++-
>  drivers/gpio/gpio-sch311x.c         |  5 ++++-
>  drivers/gpio/gpio-siox.c            |  4 ++--
>  drivers/gpio/gpio-stmpe.c           |  5 ++++-
>  drivers/gpio/gpio-tc3589x.c         |  5 ++++-
>  drivers/gpio/gpio-tegra.c           |  5 ++++-
>  drivers/gpio/gpio-tegra186.c        |  4 ++--
>  drivers/gpio/gpio-thunderx.c        |  5 ++++-
>  drivers/gpio/gpio-tpic2810.c        |  2 +-
>  drivers/gpio/gpio-tps65086.c        |  2 +-
>  drivers/gpio/gpio-tps65912.c        |  4 ++--
>  drivers/gpio/gpio-tps68470.c        |  6 +++---
>  drivers/gpio/gpio-tqmx86.c          |  5 ++++-
>  drivers/gpio/gpio-ts4900.c          |  5 ++++-
>  drivers/gpio/gpio-twl4030.c         | 10 +++++-----
>  drivers/gpio/gpio-twl6040.c         |  3 +--
>  drivers/gpio/gpio-uniphier.c        |  5 ++++-
>  drivers/gpio/gpio-wcove.c           |  7 +++++--
>  drivers/gpio/gpio-ws16c48.c         |  5 ++++-
>  drivers/gpio/gpio-xgene.c           |  5 ++++-
>  drivers/gpio/gpio-xra1403.c         |  5 ++++-
>  drivers/gpio/gpio-xtensa.c          |  4 ++--
>  drivers/gpio/gpio-zynq.c            |  7 +++++--
>  include/linux/gpio/driver.h         |  3 +++
>  61 files changed, 214 insertions(+), 102 deletions(-)
> 
> -- 
> 2.21.0
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
