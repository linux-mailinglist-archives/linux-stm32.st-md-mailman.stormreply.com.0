Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4C156A00
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Feb 2020 12:51:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E11C36B0B;
	Sun,  9 Feb 2020 11:51:59 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 522D8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Feb 2020 11:51:57 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y6so4004905lji.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Feb 2020 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
 b=NptrmHtYTiL5YgJrYH1ti+K078fPaTfnbfGukV1wYirmvtVfyLHmk1Y4G+sPJKzhtO
 VgRFHCDnWWN+XuVsDUc/DNV0NsDAuA2QOU06s5e1+fW6D8mS1IQM1mZXo/5tOruAXnEz
 4MjqiZlt4kB0G3I7w9ipN+dGcniokuXyuNBVVhpbVKp4hPGH1jz37zk8Iba/rzzbc43S
 IUejSY2mrWWstTFatbHDPiv2stxA0cAwteuFIXbqAZFLIlyD+iRgkFrkzU9rs6XzYD42
 8VCyfkaKdOZCtqpix7QOOcXbC0dgvoPIxPEVz8rICA+iBFfrWxPSl/cJVJaN4lxXkrIm
 sAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
 b=S5UEthn7/D7n0lQnJZMXmn8/c7HBmd7v4UWSS8Po+wpJibYoz6NNypUtRtrX5miPn3
 c998k4XCn8XJNqWG4zjxkaC3hbhsVswJ66OSKGemILF/RCpeK0SCcfnPKb4wKv83VzOZ
 JyDULZe5OXjK1ycqcoF4sGjnXJeLLFPt667VXMgsB2adkg8zR0sFKOxw51Ygk+21Z+hR
 dLujaMZFcH+ingwHYJ2RhYQ+KdrzXD30OLnfF0q8bLVwx6/Cu8K3KcDYkL1ytA7jC+xw
 lEaOYKTwNOPS+qUDbsxMwaMzpvUFordlxzZQkSoUq6dBm0nCU+u7XGfWHfAW7RiQCfhC
 KICA==
X-Gm-Message-State: APjAAAVrDsFwuFIZcnRF8Ngg5IZ0ffnNbtbz6wVyUGakI0i8H9jTsYMc
 yL/JgeZLxKXnsAIWjSE7H61wwQ==
X-Google-Smtp-Source: APXvYqyBJcdgJJntrsixcqZPfIHwYwrfiSxVX8Hkh88iVLuNcb42dKupf9X+gL/jDnv0ncXLtXIzSg==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr4960192ljc.279.1581249116367; 
 Sun, 09 Feb 2020 03:51:56 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id 14sm3752313lfz.47.2020.02.09.03.51.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 09 Feb 2020 03:51:55 -0800 (PST)
Date: Sun, 9 Feb 2020 03:44:22 -0800
From: Olof Johansson <olof@lixom.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200209114422.as5xpytakhaa3vur@localhost>
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
 <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Nancy Yuen <yuenn@google.com>,
 arm@kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
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

On Mon, Feb 03, 2020 at 12:52:45PM +0100, Krzysztof Kozlowski wrote:
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
> >
> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)
> >
> > ARM defconfigs:
> 
> Hi Joe,
> 
> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),

Note that while they disappear from the defconfig, they were already not part
of the build. So kernels have been built without them for a while. It's a good
way to surface the problem, but it's pretty clear that trees fall in the forest
here all the time and nobody is noticing.

> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

Churning defconfigs is just noise, and a source of annoying needless
conflicts when people do it at the same time. If an option is no longer
in-tree, it doesn't do any harm. But it makes sense to clean up every
now and then like the original patch here.


-Olof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
