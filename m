Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3704DB176
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 14:29:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72445C5F1F2;
	Wed, 16 Mar 2022 13:29:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46C75C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 13:29:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E9D60BC9;
 Wed, 16 Mar 2022 13:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF15C340EC;
 Wed, 16 Mar 2022 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647437338;
 bh=po9w0srExdqxBbA5Y1GuLMoSzHmbiTZqW8Nx4369bGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BAaTUiggp7hg19mVJSoejDR0l1MjKoB6c3LlQyGu5G31B9ickEMhr1YrfEKW91tbN
 1q1IUGyg8kgPY/hnzt26WZrfX3FZKJzMr91C64gwOH+Aw/2TjYJ+9kZBiR2OhVLkMp
 iAxVUMytQMIp+M4QtMZ8E/7Xm713K25FwALTykwlEbgWOwL2cyIdcvH76oubsmF0yP
 qQxuOLGxxRpA29g5P8G0S4zsW1GIwpcv6Paon/iSRm+iRIOHYRAom/wDxUN9pK8GNT
 X4B0COuovvmOyF8YkW37iylFjgxqg8Ec1C6lzCvsDgJ5XvzVYXD0sk7L73DMuIiMSy
 rSvS5safB70PQ==
Date: Wed, 16 Mar 2022 14:28:50 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <20220316142850.6005b09c@coco.lan>
In-Reply-To: <8a4782f3-53d0-7af7-2034-e31879efbc45@foss.st.com>
References: <cover.1647167750.git.mchehab@kernel.org>
 <dc5be62a56ac19c6f49f4c8432558fd7b0efe7e6.1647167750.git.mchehab@kernel.org>
 <20220314083942.GA526468@gnbcxd0016.gnb.st.com>
 <20220314121454.7432e231@coco.lan>
 <1122a956-0650-f948-512b-d3447e34df30@foss.st.com>
 <20220314141008.13e32acd@coco.lan>
 <8a4782f3-53d0-7af7-2034-e31879efbc45@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Leon Romanovsky <leon@kernel.org>,
 Dmitriy Ulitin <ulitin@ispras.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?UTF-8?B?U8O2ZGVybHVu?= =?UTF-8?B?ZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH 17/24] media: platform: rename stm32/ to
	sti/stm32/
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

Em Tue, 15 Mar 2022 10:02:53 +0100
Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com> escreveu:

> Hi Mauro,
> 
> sti and stm32 architectures don't have the same maintainers nor same 
> mailing list as you can see below:
> 
> ARM/STM32 ARCHITECTURE
> M:    Maxime Coquelin <mcoquelin.stm32@gmail.com>
> M:    Alexandre Torgue <alexandre.torgue@foss.st.com>
> L:    linux-stm32@st-md-mailman.stormreply.com (moderated for 
> non-subscribers)
> L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> S:    Maintained
> T:    git 
> git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
> F:    arch/arm/boot/dts/stm32*
> F:    arch/arm/mach-stm32/
> F:    drivers/clocksource/armv7m_systick.c
> N:    stm32
> N:    stm
> 
> ARM/STI ARCHITECTURE
> M:    Patrice Chotard <patrice.chotard@foss.st.com>
> L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> S:    Maintained
> W:    http://www.stlinux.com
> F:    Documentation/devicetree/bindings/i2c/i2c-st.txt
> F:    arch/arm/boot/dts/sti*
> F:    arch/arm/mach-sti/
> F:    drivers/ata/ahci_st.c
> F:    drivers/char/hw_random/st-rng.c
> F:    drivers/clocksource/arm_global_timer.c
> F:    drivers/clocksource/clksrc_st_lpc.c
> F:    drivers/cpufreq/sti-cpufreq.c
> F:    drivers/dma/st_fdma*
> F:    drivers/i2c/busses/i2c-st.c
> F:    drivers/media/platform/sti/c8sectpfe/
> F:    drivers/media/rc/st_rc.c
> F:    drivers/mmc/host/sdhci-st.c
> F:    drivers/phy/st/phy-miphy28lp.c
> F:    drivers/phy/st/phy-stih407-usb.c
> F:    drivers/pinctrl/pinctrl-st.c
> F:    drivers/remoteproc/st_remoteproc.c
> F:    drivers/remoteproc/st_slim_rproc.c
> F:    drivers/reset/sti/
> F:    drivers/rtc/rtc-st-lpc.c
> F:    drivers/tty/serial/st-asc.c
> F:    drivers/usb/dwc3/dwc3-st.c
> F:    drivers/usb/host/ehci-st.c
> F:    drivers/usb/host/ohci-st.c
> F:    drivers/watchdog/st_lpc_wdt.c
> F:    include/linux/remoteproc/st_slim_rproc.h

Ok.
	
> but anyway, if this is really important for you to have a top folder to 
> group all ST stuff, we prefer to have "st" prefix than "stm":
>  > 	./drivers/media/platform/st/sti/
>  > 	./drivers/media/platform/st/stm32/

Works for me. Yeah, it is important to have them at the same dir. 
After this series, there's a comment on each platform subdir that
tells what vendor is there. That is meant to help selecting the right
drivers with make menuconfig/gconfig/xconfig, and it is reflected at
the .config file. I'm considering to actually add a submenu per vendor. 
Ether way, if there's more than one directory per vendor, the "comment"
and/or "menuconfig/if/endif" entries would needed to be moved back to the
drivers/media/platform, making in messier again.

Thanks,
Mauro
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
