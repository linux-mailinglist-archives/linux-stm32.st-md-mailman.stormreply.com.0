Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7511505A9
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 12:53:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB657C36B0C;
	Mon,  3 Feb 2020 11:53:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF33FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 11:53:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A468B21D7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580730779;
 bh=7xf6l0x9f3yqiOhlxlprQWM2OQY9DYvJlDJWXMnII54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZwVsVUHORi7AEaxQxLj+Nu8jbcVykEXvdfGL7vkRLhB0mTQiMThf7Ta5VFtb6XrYx
 LPGAsl/3oQd1MhfnblwPdlunyVn0WwjNlRReE3L/H07XxgtqJldOTdNAek7kl5ArP0
 hwuQWOheegxknp2fpCWWvgtUl8pzQM8yNraeDgzY=
Received: by mail-lj1-f178.google.com with SMTP id o15so8742900ljg.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 03:52:58 -0800 (PST)
X-Gm-Message-State: APjAAAX5alFDbc28RSCjbLQfzNqXDARbEBPxYIK3DX4Rq4TR1Pnt/Oqy
 jluFwMouKOL6CnhBSCwFyG0urkR73PkLezzleUk=
X-Google-Smtp-Source: APXvYqzr5wd/VbPIliYCYFMvvcM1qcze60h66l8h6hCiB4vZZDzfTGLOeSa9EfTbYebXVLxdN/na3R/Ef6tYAfxaBEQ=
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr13176749lji.256.1580730776602; 
 Mon, 03 Feb 2020 03:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
In-Reply-To: <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 3 Feb 2020 12:52:45 +0100
X-Gmail-Original-Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Nancy Yuen <yuenn@google.com>,
 arm@kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>,
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

On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > Delete bounce buffer Kconfig option").
> >
> > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > CONFIG_LBDAF").
> >
> > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> >
> > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > now enabled by default (along with MQ_IOSCHED_KYBER).
> >
> > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > previously choosing the latter.
> >
> > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > CONFIG_CROSS_COMPILE support").
>
> Hi Krzysztof.
>
> There seems there are a lot more of these unused CONFIG_<foo>
> symbols in various defconfigs. (just for arm and treewide below)
>
> ARM defconfigs:

Hi Joe,

Nice finding! The trickier point is to nicely remove them because:
1. The easiest is 'savedefconfig' but then some valuable options might
disappear (like recently happened with DEBUG_FS),
2. They could be removed in automated way with a script. However in
such case what about replacements? If some symbol was replaced with
other (or just renamed), maybe we should enable the other one to
restore the desired functionality?
3. Or maybe let's don't care about keeping defconfigs stable and just
clean them up automatically.

Best regards,
Krzysztof

> --------------------------------------------------------------------
>
> # find all defined config symbols in Kconfig files
>
> $ git grep -P -oh '^\s*(?:menu)?config\s+\w+' -- '*/Kconfig*' | \
>   sed -r -e 's/\s*config\s+//' -e 's/\s*menuconfig\s+//' | \
>   sort | uniq > config_symbols
>
> # find CONFIG_ symbols in arm defconfigs
>
> $ git grep -w -oh -P 'CONFIG_\w+' 'arch/arm*/*defconfig*' | \
>   sort | uniq > used_in_arm_defconfigs
>
> # find all the unused symbols
>
> $ cat used_in_arm_defconfigs | \
>   while read line ; do \
>     echo -n "$line " ; grep -w -c ${line/CONFIG_/} config_symbols ; \
>   done | \
>   grep " 0" | \
>   sed 's/ 0//'

(...)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
