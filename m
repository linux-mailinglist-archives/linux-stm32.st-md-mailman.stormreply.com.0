Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D215061D
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 13:25:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC8DC36B0C;
	Mon,  3 Feb 2020 12:25:47 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA948C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 12:25:45 +0000 (UTC)
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N1feo-1jedhh00eu-011zIv for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 13:25:45 +0100
Received: by mail-qk1-f180.google.com with SMTP id g3so5363863qka.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 04:25:44 -0800 (PST)
X-Gm-Message-State: APjAAAUu387zGDV60ratKnrFWxakhMhCxr7a8fKkfGh1U1EF3WJmohJb
 pExErrBYBt/tB4Q3Du9ddccLTfHaGCYCY7UcPYQ=
X-Google-Smtp-Source: APXvYqx0ocLgdidrznoQ8Enyx2eLL3hOdlL2MjBSkguYuLYfdkmdQylLrutBTZG2BNKne5lK1uCb3UnyrUHgc1yB+DQ=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr10712027qkv.138.1580732743857; 
 Mon, 03 Feb 2020 04:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
 <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 Feb 2020 13:25:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:hCUJC2CtwP7UansCBWf5NPnlln9X7G1UUj4Yi/17udCjoxQ8zMT
 WAyHCy/+4RfAFvNbj1vL2uIa6N7+G1YQDnRQ7J5X48stmJojTcQSDq60ggrac5KTHN3cquz
 QVQthVFM2rlfCaQcoOveTlbzfzLQ9S4LR98xi3teNnoKr/0CATztP9S26Iqq7W9bGtwlHXU
 9IUUnHYSY3BbIFFprkfQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ntE8p2bNOTM=:/nm01emLnDfjXF4QMoTS6p
 o2hEIFgktLu0nEymtDmuFpx1Yx7lZJ24bbKJNBREIn6CdXG91NVr8AgZqbOXITkUQklldHvQz
 VbHUtPbLAqTsMvfnL1uQUrIO5/3TFSaBn2J3tA/g1vDvSjxsEKnYoOB9lrQctw9QMz6dwEGzo
 TFA23E7ztVJzwqaa0tr4fRpXVA93lrPQOzzP15TERvATaj6f9Zazb/s/CNK99KT+xaAnq10LO
 lAWPW64eBzAErQEoKNW56QE9vT41iIPaBhsmN1970VxwzpO1vRmwzpzIu6IiBdTjC7dZFVEpr
 XhY+tCu7eMH63AumirX8yrfDxwcJhQrYFuw5aKd5pqLhTak3u2eK/h3LrZrTBuGuPOhJGuRdZ
 6oppwOKVUgtPiHkGOb9U8zOKjHWHtVBvRvz9jsqPaahH6TFL+GwARjIBe2AbJ9Nk3t9NJVe+4
 Gm46uE/3VygAGU6vh006QG8q9tt3Q36RL/d8MmUjD0gAjhVf0iYz9YcWnxPIft5oGcsI3JTjz
 VSFwUTB9QivTMXqikGflKK7d5Z17/pzqI49ikXJRIARjE5smD+6znbe5BybXxX2cAY5+7mQcD
 eO14jZzY9AM8WngQDEnlV78Ami09kTSMkkN3jRB7P/mJgKWjodHrmZLoLLJkoX+WsEEAqIP6S
 QIlUhl8E1RCQx5z/ev48VDT0nphKeshVXD5m7q8gaWtteqHLborZUZQCsy9BCnKxGskCjBEvR
 5zL68GUMFyMD/JFvJo7Jp1pf0UfFdT9a+3cAXRwbmLGKbbf1PktFK00wnkAQe8jURAipiPkX4
 EbPxR4eVAWAuRCbZ1oI/3iu+REfnqKW64a+Htz3RyxfdRv3Z14=
Cc: Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Nancy Yuen <yuenn@google.com>,
 arm-soc <arm@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: configs: Cleanup old Kconfig
	options
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

On Mon, Feb 3, 2020 at 12:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
> >
> > On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > > Delete bounce buffer Kconfig option").
> > >
> > > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > > CONFIG_LBDAF").
> > >
> > > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> > >
> > > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > > now enabled by default (along with MQ_IOSCHED_KYBER).
> > >
> > > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > > previously choosing the latter.
> > >
> > > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > > CONFIG_CROSS_COMPILE support").

Acked-by: Arnd Bergmann <arnd@arndb.de>

> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)

Feel free to pick any of these symbols and send patches for those.
No need to do it one symbol at a time, but please group them like
Krzysztof has done.

> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),
> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

I don't see a good way to do it automatically. It would be good to check
that we don't remove Kconfig symbols that are still used in defconfig
files without changing those files as well. Cleaning up afterwards also
works, but this always requires manual inspection for each symbol.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
