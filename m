Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4333257DA8B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 09:02:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0BF7C04005;
	Fri, 22 Jul 2022 07:02:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E65A8C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 07:02:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD13B62163
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 07:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C2CC341D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658473361;
 bh=iotqH2KQue2AiSu+Cjadhr0GvbjJVQjBtGSTWOoab/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=csPHM7UUPMgnnpmrq0eP44ROWe289Uv5gBIMKr5JRPFWBo/Nlr8ILbmJ4f36eKG6r
 v8AVC73hwjVUIPp9uj1mz1As8NUsg744UdB6qUex0JzEz06jgX7LpYrfL9rvkq4+A5
 naNl6uOSzXDwWQEHvDIQQsOyei+sqoIzDGi9Opl8UjIrf9oDgJcC/3NTv/vRQ6cfM+
 Z/PzFJlnsjWMgQLbf4qLR5eTZftn+1VsBoC9wo3UicxwRa/yOI8wgGXeA2ENwq/fGm
 Xn2J/7pJUVPlPf9P7tWmVKyESIZzZLmOArA7Pe3goLljTMT38XkANiwZMf2RCJ0dnk
 e8b8nBE6pnVWQ==
Received: by mail-yb1-f178.google.com with SMTP id f73so6577217yba.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 00:02:41 -0700 (PDT)
X-Gm-Message-State: AJIora8nHIH65JD97NbObr906lV06zYctWSkuqMowCDX7+gkh7Cah+8d
 vOwbaWxhqiE1a11aFlhQlQv/BNVFVoSB3Bm+P8s=
X-Google-Smtp-Source: AGRyM1tWrEXcUTSnTrmZZLEQML12zznS5gM3uAMpW8cF4DVN1GJxIS8qAIorEs3cjMnhQmpiC3ITqi37eiY9KARJUac=
X-Received: by 2002:a25:3841:0:b0:670:a1b9:f18e with SMTP id
 f62-20020a253841000000b00670a1b9f18emr1789926yba.480.1658473349878; Fri, 22
 Jul 2022 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
 <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com>
 <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
In-Reply-To: <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jul 2022 09:02:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jF=7atLkWKwrvgYLcZuEObbMF79cbj0XaFEiVw40Piw@mail.gmail.com>
Message-ID: <CAK8P3a3jF=7atLkWKwrvgYLcZuEObbMF79cbj0XaFEiVw40Piw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Scott Branden <scott.branden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] ARM: refresh defconfig files
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

On Thu, Jul 21, 2022 at 5:36 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/07/2022 17:33, Scott Branden wrote:
> > Hi Arnd,
> >
> > On 2022-07-21 07:13, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> A lot of Kconfig options have changed over the years, and we tend
> >> to not do a blind 'make defconfig' to refresh the files, to ensure
> >> we catch options that should not have gone away.
> >>
> >> I used some a bit of scripting to only rework the bits where an
> >> option moved around in any of the defconfig files, without also
> >> dropping any of the other lines, to make it clearer which options
> >> we no longer have.
> > Resync is fine.  But, it would be great if the defconfig files were kept
> > in sync. Almost every kernel version kconfig options change which affect
> > these files. Could we put in place a defconfig refresh per kernel
> > version to keep them all in sync going forward?
> >
>
> Not entirely, because some Kconfig changes are causing symbols to
> disappear. Also defconfig is expected to include user-visible options,
> even if savedefconfig would drop them.
>
> This is why blind savedefconfig is not acceptable.

Right. I mostly scripted the changes to move the options around, but
had to do a few files manually so I can't fully automate this, and
the removed options always need manual inspection. There are still
around 400 lines in the defconfig files that go away after a
savedefconfig, and it's a lot of work to go through those.

I might do a few more of these, but if anyone wants to help, these
are the most common lines that get dropped, sorted by frequency:

     34 -# CONFIG_VGA_CONSOLE is not set
     32 -CONFIG_NET_ETHERNET=y
     26 -CONFIG_NFS_V3=y
     22 -# CONFIG_CRYPTO_ANSI_CPRNG is not set
     20 -CONFIG_PM=y
     18 -CONFIG_FPE_NWFPE=y
     18 -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
     18 -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
     18 -# CONFIG_INET_XFRM_MODE_BEET is not set
     15 -CONFIG_SYSFS_DEPRECATED_V2=y
     15 -CONFIG_DEBUG_KERNEL=y
     15 -# CONFIG_BLK_DEV_BSG is not set
     14 -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
     14 -# CONFIG_INPUT_MOUSEDEV is not set
     12 -CONFIG_LEDS=y
     12 -CONFIG_AEABI=y
     11 -CONFIG_NET_PCMCIA=y
     11 -CONFIG_GPIO_SYSFS=y
     10 -# CONFIG_ENABLE_MUST_CHECK is not set
      9 -CONFIG_LEDS_CPU=y
      9 -# CONFIG_EXT3_FS_XATTR is not set
      8 -CONFIG_CRYPTO_SHA512=m
      8 -CONFIG_BINFMT_AOUT=y
      8 -# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
      7 -CONFIG_SND_PCM_OSS=m
      7 -CONFIG_SND_MIXER_OSS=m
      7 -CONFIG_SMB_FS=m
      7 -CONFIG_MTD_M25P80=y
      6 -CONFIG_NET_PCI=y
      6 -CONFIG_CRYPTO_ECB=m
      5 -CONFIG_SECCOMP=y
      5 -CONFIG_MEDIA_CAMERA_SUPPORT=y
      5 -CONFIG_IPV6=y
      5 -CONFIG_CRYPTO_TEA=m
      5 -CONFIG_CRYPTO_SHA256=m
      5 -CONFIG_CRYPTO_KHAZAD=m
      5 -CONFIG_CRYPTO_ARC4=m
      5 -CONFIG_BACKLIGHT_PWM=y
      5 -# CONFIG_NET_CADENCE is not set

The majority of these lines are options that no longer exist and are
not needed, or things that dropped off because they get selected by
something else.

The interesting ones we need to catch are the ones that should be
enabled but are either renamed to something else or gained a
dependency that now also needs to be turned on.

           Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
