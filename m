Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E255FB4B6
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 16:40:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 594D7C640F3;
	Tue, 11 Oct 2022 14:40:01 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AB57C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 14:40:00 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id l19so9055201qvu.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 07:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sKcP+GTT+SWbU28Mvg7qTSCnoQqhpg8QoNv8i57vas=;
 b=e6a2MMlPKelwCkeCLYtxm/nwxhpqV/55hp/fsr3IUPI269YPRwJov16YU4VAzgRRpu
 49J10iOXkjutO9bZ8UISI099lp/v3y8bEcReG4nGLtTiBZCLAZgF3/9qQWklQmZFRiyW
 lj/Xowsje4BSWl+tL7SGdGC+gXvinyYePvEPZLpR11iY8a2AG9EbQTRp/Ps6O/tEbDX0
 9JglCrDIYdwND2Zz5hC9Yt59qTgHJDvb7d1oVgtnD0jInVNshsWTL/+zRncED5hgs/M1
 pCx2ws3JbV+JOxT64tW7/wKmAf1fCNgzF7qIsjFeX2AfxXtTGi5FvkyazbSmt1Jrs2J3
 xA/Q==
X-Gm-Message-State: ACrzQf2Aa5EFhS15Eb9s4/xwAp/bk+M6Jhrd5POcnFL2zcpdWtIbl9lN
 68YJpOuMYo+tipvPjcTYcXR7klQ3gyHEcg==
X-Google-Smtp-Source: AMsMyM5+3BSS1rqKxjLyWG8uH23umx4ZVnrn9bFObEcZgDB4CCN32WMNZsNpRtwnPmVKYGlgaA/p5A==
X-Received: by 2002:a0c:a90d:0:b0:4b3:f322:1280 with SMTP id
 y13-20020a0ca90d000000b004b3f3221280mr10461588qva.83.1665499199301; 
 Tue, 11 Oct 2022 07:39:59 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 bk19-20020a05620a1a1300b006ec771d8f89sm6599392qkb.112.2022.10.11.07.39.58
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e62so16702454yba.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr21857240ybb.604.1665499197788; Tue, 11
 Oct 2022 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
In-Reply-To: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 16:39:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/36] gpiolib: cdev: Add missed
	header(s)
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

Hi Andy,

On Tue, Oct 11, 2022 at 4:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> > On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > > > > > -#include <linux/gpio.h>
> > > > > >  #include <linux/gpio/driver.h>
> > > > > > +#include <linux/gpio.h>
> > > > > > +#include <linux/hte.h>
> > > > >
> > > > > Ok with the hte re-order.
> > > > >
> > > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > > to me the way it was.
> > > >
> > > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > > follow the locale settings...
> > >
> > > I have checked, the shell and vim sort gave the same result as in this patch.
> > >
> >
> > The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> > and that still returns the same result.  That matches what I would
> > expect to see given the content of the text.
> >
> > And for me vim also gives the original order.
> >
> > Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?
>
> $ LC_COLLATE=C sort test1.txt
> #include <linux/gpio.h>
> #include <linux/gpio/driver.h>
>
> $ LC_COLLATE= sort test1.txt
> #include <linux/gpio/driver.h>
> #include <linux/gpio.h>
>
> I guess this explains the difference. Currently I have en_US.UTF-8.

Throwing my can of paint into the mix...

I think it is more logical to first include the general <linux/gpio.h>,
followed by whatever <linux/gpio-foo.h> and <linux/gpio/bar.h>,
irrespective of (language-specific or phonebook) sort order.

Yeah, it sucks that this requires some manual work after running sort...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
