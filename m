Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38DE1C97
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2019 15:29:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3286C36B0B;
	Wed, 23 Oct 2019 13:29:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B1EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:29:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5wTr-1iLszu0pUB-007Sgo for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 15:29:57 +0200
Received: by mail-qk1-f174.google.com with SMTP id y81so15833506qkb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 06:29:57 -0700 (PDT)
X-Gm-Message-State: APjAAAUihPuyg6Dtza8aThZd1w+kp2HZ9USrTTKLk+7s/4KGPkX2UfhW
 w9K8rjlZC1WuprpUSO81aqYFJZhSTAiknj5saLc=
X-Google-Smtp-Source: APXvYqzGCvORTP+HJikmS9n+sLPhWUfQgJCCEYKmJ03DZvSC0gT0L7hZhZ7lqgzmTpFpBJ2WhE68gjxgaObVawX07k4=
X-Received: by 2002:a37:a50f:: with SMTP id o15mr7091533qke.3.1571837396079;
 Wed, 23 Oct 2019 06:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-21-arnd@arndb.de> <20191023125053.GF11048@pi3>
In-Reply-To: <20191023125053.GF11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:29:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3x1_eB4GT7qvhgVnq-sU8a=wkSf4FP18p7pVHmtrfWFA@mail.gmail.com>
Message-ID: <CAK8P3a3x1_eB4GT7qvhgVnq-sU8a=wkSf4FP18p7pVHmtrfWFA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:DPoNkGZDGGtdzPtv0esP1LoCkIPN4aWJrpYyEMvPs6Eu01dqtO3
 DuZLSYmHkFc82HGGxxQL8g2c/V8XCZRHABETWatFQ+onaPLy6Thms48BUeFlVNszawMq6zK
 efkGvnePuNH3AuU4FP4KxQooWKvm2Zi6HwJ/LCCqCfq7uwE8qexlKI7W7/kGdkZYQhKBPHn
 0txJ6zZoPRcTBvsI8yNVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n7OI2MIENqs=:nxy8lzU0fQ2KTnYldeXQIx
 Et/zmAZ+BxV4pnFeV8KOouV09sDYdupjItkLIAygWmOMTrS2ZEHgGarMNPqsX9MkN+1qfNvCQ
 t9kYxjhgn/B/c4ItZfWRk66Um843WhUijP+FYa8VChtttLOrgn+beW2CTqaXkKeG3zeJJ7Nfx
 I11B0pV36BU9J5rjWWkhi0+QmzdJPW0tqIOxy86io4gQwYyOAuD/2uOetgGMQA27I/UV+K7cZ
 WlD/aCzvhXPm2MiTwjJujJdSVvwoBaCkQE3YF2ZbtMAKTSVWKDGkHzx3Tt3jJNFL9SogPophY
 18YdTpkHdop+KPfjPNruH/9PdOcxzh28HAnmwEVdmQ+kumKpNXNNg9PHBTWVmHYd6P3Y8RnoP
 0AZzG/xARA1Qq9YFZ/jdLKOcZMs9OIZShHnO3Rd+6s4z8Z5g9bzHQPeLG4Hf/jsqtV8C1H8JU
 TJSal2YWs+3cMhSVPK44LzC5ZpCCOutIetUSwO2s+a2WVsVvZDeQpdZDGRCrYvUenFFRa/ct6
 76MetXgPR7xJDuVqkbkuRsEcRCqUIz5K5/UAqCZYCHvAZZA9icOYL1f+I6zvNdGbZY+zkmSRt
 azzMxTtFXgmD0IOFo/sjM/UaR1ZvJ0Pwv3XcOra2pqfJ2tXohlyS+cnSgcu66OjJc6bDSMp+s
 pUz4r09+hMlwG2zX6pnYSOu9/4WssQgWOoQtaCwdirNgyGSz5sBsZSAwVxo30NXWYA0sIELAl
 9AOGeBCNSJdjXIFbtqx06VAgwfDgkaQTInEIcz/iePsOgzuc29q4XoXdJu6ZZPcVi8oV5eXL7
 IQMKPS528u+XmEH20ZyipxjlNNjO1nGFGDFmYlvXalsRLC/q/vuhkGAhLwsusJPER05rzwW+X
 FJ97KSohpuVQ1hBmw8rA==
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 21/36] ARM: s3c: move iis pinctrl config
	into boards
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

On Wed, Oct 23, 2019 at 2:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Oct 10, 2019 at 10:30:05PM +0200, Arnd Bergmann wrote:
> > The s3c_gpio_cfgall_range() function is an internal interface of
> > the samsung gpio driver and should not be called directly by drivers,
> > so move the iis pin initialization into the boards.
> >
> > Note that the s3c2412-i2s driver has no boards using it in
> > mainline linux, the driver gets selected for the jive machine
> > but is never instantiated.

> This is not entirely equivalent move as before this was probe (so being
> executed also on rebinds) and now it is init. I guess it should not make
> any difference so let it be.

Right, I've added an explanation in the changelog text now:

 The s3c_gpio_cfgall_range() function is an internal interface of the
 samsung gpio driver and should not be called directly by drivers, so
 move the iis pin initialization into the boards.

+This means the pin configuration is only run once at early boot, rather
+than each time the driver binds, but the effect should be the same.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
