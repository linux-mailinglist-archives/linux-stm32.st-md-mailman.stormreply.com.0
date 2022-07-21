Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8357CDC7
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 16:37:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E05AC03FD6;
	Thu, 21 Jul 2022 14:37:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 584FAC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:37:03 +0000 (UTC)
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlfCk-1nonCW2Nt4-00ihLh for <linux-stm32@st-md-mailman.stormreply.com>; Thu,
 21 Jul 2022 16:37:02 +0200
Received: by mail-yb1-f176.google.com with SMTP id 75so3103689ybf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 07:37:02 -0700 (PDT)
X-Gm-Message-State: AJIora+TT4dFyRPfMfgb7UeS7UlTKYTgj1RNAX2sgAnS4lMJi330PYwv
 SDuvu+/T4HhtcBR22KDTSVT5SPF3g2RDAVnP8Ew=
X-Google-Smtp-Source: AGRyM1sipmxaJDGQ/BXJ6IogC7daDCl2+j4F9uhSVcXz89KYHnAMaLqcK10XehN8TJ/WBsHB+lO9Dw0DiPklmfIK8Mk=
X-Received: by 2002:a81:493:0:b0:31e:6ab9:99a5 with SMTP id
 141-20020a810493000000b0031e6ab999a5mr8799929ywe.209.1658414210293; Thu, 21
 Jul 2022 07:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Jul 2022 16:36:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
To: Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:ahGRDpAihFyMyqBuiE2hLGVtdCseUeynPy8ebWaTnmUzSaYsP2q
 Qiz6t9CnmiwYKCVmrfo2iff6CH1RXY1CIdmKCRpeJKyA9QCu3qvvoKTXQeKko57r7ewNZUd
 U+wDVwdeCCNcTrdAG1vrGqSkOXc/CSTk/60wbcRUaCwbLwcS/P6vKnP7bCiD4QykSHhGble
 8nIMDv6vV+tKTazv2P1dg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mzgIBG6YHVM=:qN9ElWFq7xvlSyUV/Y4myP
 +Hi2/TyKuPX41r2daidpUPESIJljh8nptenwVXTJ6F1CmlTyWh66VOmRuuea1kFVeEg5rBd1N
 mOZOq4FLEwQAPSDuQZl3hXoVcl6OwGdYGCYr7ByvVMAuq/ZgSEJ6POk4VvVUOwA/dXXZPbOV6
 dgdJauFqF5XYTCt5Jx7K/Hk2ZqDN5OYRGhoENTUrkO+a6IzV+lKuGLdPtJzzVFx/Kbzl6f759
 +KROoXe+OsKIoGY54tzK5ozJn9iUy80u8/bgm4AA/twg4Mbpn3s1fU1vAnPRxT4FYYDizG8lc
 YHSpUs1QGKeLXJlAVSgZIkCEaIrs5srRJ9VzlslTcr1gxwGSMMffQeBEWSSVDudk6cL5J5a05
 nfu82Fw3uyHN33DgSkFcRnD+UD7+03Mw1zZOA3RoCSZAF3icq4bhFsgxrnTypdZ9SM+jOkKtW
 dv8xSuXK+SHBGWdYKQx1VjZfrwQlW44L2HX5eOvlKp4Mya7nGDjmTqblqnay51Z54oPid/ef7
 aiyUKrwnml9JiDGT4ZKH80ZOShnlx0u4/LtJVRJDTMcxKXmrYl1x/BGizaWaew1aOAYp4Swfi
 WOvMklbhp9x6ncIW8TCwHy45D96xioGqZbGvsmjqRqGxi4sZ+HRimRLWxmoXXeEh4AF9J+lAe
 LkCPAhjsHIuzTqtGF3iWBC4HJIJtUNqVjdQRabE/Xnt8F/695B8PeFv1lhBnsFPirMNMDy3ju
 RwWNWj07jDV8SX/Aa7+0wOQiU8Kvno4nDCNreBHIA9IATXaKB3Jaj0kqreDEREMGVKy2qoEu5
 KnJsWjCSzT2FWzWa1vaot0GyY/yqdFGuDE8rfDKMvnmusIB3VADSlGQk1016Yzajqlh1dwKNw
 e1zeyARhcOlTFqpwgznkc7P/q502+DrtjdMpEHIXw=
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
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On Thu, Jul 21, 2022 at 4:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
>
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Apparently this patch got a little large and was rejected by some of
the mailing lists, in case someone wonders what happened.
Fortunately the contents  don't actually matter here, as I'm just
reordering the lines as seen in the diffstat.

        Arnd

> ---
>  arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>  arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>  arch/arm/configs/aspeed_g5_defconfig      |  16 +--
>  arch/arm/configs/assabet_defconfig        |   8 +-
>  arch/arm/configs/at91_dt_defconfig        |  10 +-
>  arch/arm/configs/axm55xx_defconfig        |  22 ++--
>  arch/arm/configs/badge4_defconfig         |   8 +-
>  arch/arm/configs/bcm2835_defconfig        |  36 +++----
>  arch/arm/configs/cerfcube_defconfig       |  16 +--
>  arch/arm/configs/clps711x_defconfig       |   2 +-
>  arch/arm/configs/cm_x300_defconfig        |  26 ++---
>  arch/arm/configs/cns3420vb_defconfig      |  18 ++--
>  arch/arm/configs/colibri_pxa270_defconfig |  32 +++---
>  arch/arm/configs/colibri_pxa300_defconfig |  10 +-
>  arch/arm/configs/collie_defconfig         |  20 ++--
>  arch/arm/configs/corgi_defconfig          |  44 ++++----
>  arch/arm/configs/davinci_all_defconfig    |  26 ++---
>  arch/arm/configs/dove_defconfig           |  28 ++---
>  arch/arm/configs/ep93xx_defconfig         |  16 +--
>  arch/arm/configs/eseries_pxa_defconfig    |  26 ++---
>  arch/arm/configs/exynos_defconfig         |  20 ++--
>  arch/arm/configs/ezx_defconfig            |  72 ++++++-------
>  arch/arm/configs/footbridge_defconfig     |  14 +--
>  arch/arm/configs/h3600_defconfig          |  10 +-
>  arch/arm/configs/h5000_defconfig          |  18 ++--
>  arch/arm/configs/hackkit_defconfig        |   4 +-
>  arch/arm/configs/hisi_defconfig           |  24 ++---
>  arch/arm/configs/imx_v4_v5_defconfig      |   8 +-
>  arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>  arch/arm/configs/integrator_defconfig     |   2 +-
>  arch/arm/configs/iop32x_defconfig         |  20 ++--
>  arch/arm/configs/jornada720_defconfig     |  10 +-
>  arch/arm/configs/keystone_defconfig       |  62 +++++------
>  arch/arm/configs/lart_defconfig           |   6 +-
>  arch/arm/configs/lpc18xx_defconfig        |  12 +--
>  arch/arm/configs/lpc32xx_defconfig        |   8 +-
>  arch/arm/configs/lpd270_defconfig         |   6 +-
>  arch/arm/configs/lubbock_defconfig        |  10 +-
>  arch/arm/configs/magician_defconfig       |  30 +++---
>  arch/arm/configs/mainstone_defconfig      |   4 +-
>  arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>  arch/arm/configs/mini2440_defconfig       |   6 +-
>  arch/arm/configs/mmp2_defconfig           |  28 ++---
>  arch/arm/configs/moxart_defconfig         |  18 ++--
>  arch/arm/configs/mps2_defconfig           |  14 +--
>  arch/arm/configs/multi_v4t_defconfig      |   4 +-
>  arch/arm/configs/multi_v5_defconfig       |  12 +--
>  arch/arm/configs/multi_v7_defconfig       |  62 +++++------
>  arch/arm/configs/mv78xx0_defconfig        |  32 +++---
>  arch/arm/configs/mvebu_v5_defconfig       |  28 ++---
>  arch/arm/configs/mvebu_v7_defconfig       |   2 +-
>  arch/arm/configs/mxs_defconfig            |   4 +-
>  arch/arm/configs/neponset_defconfig       |  24 ++---
>  arch/arm/configs/netwinder_defconfig      |  10 +-
>  arch/arm/configs/nhk8815_defconfig        |   6 +-
>  arch/arm/configs/omap1_defconfig          |  74 ++++++-------
>  arch/arm/configs/omap2plus_defconfig      |  16 +--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
