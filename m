Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54F1D2C7D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 12:22:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D91BC36B12;
	Thu, 14 May 2020 10:22:44 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9134C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 10:22:42 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so925378iol.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xf8xZfCQkg2LX+UGX2pErkunT3kzFVgUMzef0Ov7X8U=;
 b=Ggcu6svRnfvNn9Dsd8MwVKxUpU+EtC/sdV/wX64b84Wf/BolKHyXwvu1WcAgSycmo9
 g6zPSumtiqkSeg/QcGT+3q4t78VLeVlwl6HKyh0KVqIqjLxX9yHiHiNON3YGciyWSWQd
 14IfBehKyCyDuRwAhd/VzyyI1AhdUMeVd71fprDrTnkKhlpptgiHQSzWV3FEOHDk8iYI
 6aYpNBaPF2de9HV+vW7A9rtyXE8KjxOjSMU8ayWbhT6HWBb+T/BQ+rVuMVAEJSEEhQG4
 fVsFK/jFbOjhOS46sttdZAMR0QWUWFNTxnFd3SlWG7nPg6GPegi8f6EWzz78dCL2i21L
 KGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xf8xZfCQkg2LX+UGX2pErkunT3kzFVgUMzef0Ov7X8U=;
 b=WVqIj8oKxF4+FEBrsY4ILoI6zKpIUO2LP+UjlUIi/HIQSWmNRFqCjG5Z4z1V4+VrUF
 AoJzdfuk5htQxxRAkwR48VnzbfNPxTbUGdyK2xYbslf1fYqcXW/p2yxgBZq4wjgB7rtI
 L2/MSC3nFA7KTVMsuwI61lWv/sIjQytqQlDFDOVYCUNrk/hgANtgUsCf7hhXLsPk8zvb
 H422UFnzeYvf2WH1iQhp2v4KCR+NTNSBUaQCHS2H520xCNel762kIO/8kOpEdQ4xhDap
 0uDbJog1z9xCox1jphpSJM+fliXXpScBcuuAOjn7R1m7McAlwSTzn3t1sbFO1AKKln+F
 m0aQ==
X-Gm-Message-State: AOAM532jdGHoQKvpqErwT4+4kEOw1k6GEzw6EdA4K4V8fQ7dTQwOMn1a
 MBHd0W3moPKjqTO/euObyScGrpXH7/ZLkfTV8vI=
X-Google-Smtp-Source: ABdhPJzLEl/PjziUjet7dMbd/2CbLJOcw5zJWiYxYZkGfaovRzeKZG7aVXM98VUw+JMNfNfgJzzoNSJMrMDnaE2xHXw=
X-Received: by 2002:a5e:a80e:: with SMTP id c14mr3426158ioa.3.1589451761445;
 Thu, 14 May 2020 03:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com>
In-Reply-To: <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 18:22:03 +0800
Message-ID: <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 5/5] drm/panel: Add ilitek ili9341
	driver
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

Hi Linus,

Thanks for reviewing.

On Thu, May 14, 2020 at 4:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Dillon,
>
> thanks for your patch! Overall this looks like a good start.
>
> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
>
> > #define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */
>
> This is not a register, also just use MIPI_DCS_EXIT_SLEEP_MODE
> in the code.
>
Yes, i will try to reuse MIPI_DCS_xxx.

> > +#define ILI9341_DFC                  0xb6   /* Display Function Control
> > +                                            * register
> > +                                            */
>
> This commenting style doesn't work, either just put it after /* the define */
> and don't care if the line gets a bit long and checkpatch complains,
> or
>
> /*
>  * Put it above the define like this
>  */
> #define FOO 0x00
>
Ok, will change this comments.

> > +/**
> > + * struct ili9341_config - the system specific ILI9341 configuration
>
> Nice with this per-system config, it makes the driver easy to maintain
> for new users.
>
Yes, will try to move more system related configurations to this part,
instead of hard code.

> > +static int ili9341_dpi_init(struct ili9341 *ili)
> > +{
> > +       ili9341_command(ili, 0xca, 0xc3, 0x08, 0x50);
>
> This stuff is a bit hard to understand, don't you think?
>
> But given that register 0xCA seems undocumented I don't
> know if there is anything more you can do, so it is OK
> I suppose.
>
> > +       ili9341_command(ili, ILI9341_POWERB, 0x00, 0xc1, 0x30);
>
> This command is described in the manual  page 196.
> Version: V1.11
> Document No.: ILI9341_DS_V1.11.pdf
> https://dflund.se/~triad/ILI9341_v1.11.pdf
>
Yes, "ili9341_command(ili, 0xca, 0xc3, 0x08, 0x50);" i ported from st's sdk.
will use ILI9341_XXX to replace these magic numbers

> And this goes for all the below commands. Please add some more defines
> from the datasheet and have less magic numbers in the driver.
>
> > +       ili9341_command(ili, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
> > +       ili9341_command(ili, ILI9341_DTCA, 0x85, 0x00, 0x78);
> > +       ili9341_command(ili, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
> > +       ili9341_command(ili, ILI9341_PRC, 0x20);
> > +       ili9341_command(ili, ILI9341_DTCB, 0x00, 0x00);
> > +       ili9341_command(ili, ILI9341_FRC, 0x00, 0x1b);
> > +       ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa2);
> > +       ili9341_command(ili, ILI9341_POWER1, 0x10);
> > +       ili9341_command(ili, ILI9341_POWER2, 0x10);
> > +       ili9341_command(ili, ILI9341_VCOM1, 0x45, 0x15);
> > +       ili9341_command(ili, ILI9341_VCOM2, 0x90);
> > +       ili9341_command(ili, ILI9341_MAC, 0xc8);
> > +       ili9341_command(ili, ILI9341_3GAMMA_EN, 0x00);
> > +       ili9341_command(ili, ILI9341_RGB_INTERFACE, 0xc2);
> > +       ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa7, 0x27, 0x04);
> > +       ili9341_command(ili, ILI9341_COLUMN_ADDR, 0x00, 0x00, 0x00, 0xef);
> > +       ili9341_command(ili, ILI9341_PAGE_ADDR, 0x00, 0x00, 0x01, 0x3f);
> > +       ili9341_command(ili, ILI9341_INTERFACE, 0x01, 0x00, 0x06);
> > +       if (ili->input == ILI9341_INPUT_PRGB_18_BITS)
> > +               ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x66);
> > +       else
> > +               ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x56);
> > +       ili9341_command(ili, ILI9341_GRAM);
> > +       msleep(200);
>
> I think some of the above should not be hard coded but should instead
> be stored in fields in struct ili9341_config. I know it can be a bit
> tedious but it makes things much more clear.
>
Ok, will go deeper to find out some register configuration move to
system config like rgb bus 16/18 bits

> > +       ili9341_command(ili, ILI9341_GAMMA, 0x01);
> > +       ili9341_command(ili, ILI9341_PGAMMA, 0x0f, 0x29, 0x24, 0x0c, 0x0e,
> > +                                               0x09, 0x4e, 0x78, 0x3c, 0x09,
> > +                                               0x13, 0x05, 0x17, 0x11, 0x00);
> > +       ili9341_command(ili, ILI9341_NGAMMA, 0x00, 0x16, 0x1b, 0x04, 0x11,
> > +                                               0x07, 0x31, 0x33, 0x42, 0x05,
> > +                                               0x0c, 0x0a, 0x28, 0x2f, 0x0f);
>
> This should definately be in ili9341_config, as it is a screen property.
>
> In the long run I would like these panels to support setting gamma
> from userspace etc but it is a big tedious work to get that right
> so hard-coding a default per-variant is fine.
>
ok, will refer to panel-ilitek-ili9322 and panel-novatek-nt35510 driver.

> You can check in e.g. panel-novatek-nt35510.c how I encoded
> such sequences in per-variant data.
>
> > +static int ili9341_dpi_power_off(struct ili9341 *ili)
> > +{
> > +       /* Disable power */
> > +       if (!IS_ERR(ili->vcc))
> > +               return regulator_disable(ili->vcc);
> > +
> > +       return 0;
> > +}
>
> Usually you should also assert RESET when disabling
> power.
>
ok

> > +/* This is the only mode listed for parallel RGB in the datasheet */
> > +static const struct drm_display_mode rgb_240x320_mode = {
> > +       .clock = 6100,
> > +       .hdisplay = 240,
> > +       .hsync_start = 240 + 10,
> > +       .hsync_end = 240 + 10 + 10,
> > +       .htotal = 240 + 10 + 10 + 20,
> > +       .vdisplay = 320,
> > +       .vsync_start = 320 + 4,
> > +       .vsync_end = 320 + 4 + 2,
> > +       .vtotal = 320 + 4 + 2 + 2,
> > +       .vrefresh = 60,
> > +       .flags = 0,
> > +       .width_mm = 65,
> > +       .height_mm = 50,
>
> The width and height should certainly be om the ili9341_config
> as it is a per-panel property. You can just fill in in in
> the below .get_modes() function. Or assign the whole
> mode as part of the ili9341_config if that is easier.
>
ok, lcd timing part will move to ili9341 config

> > +       return drm_panel_add(&ili->panel);
> > +}
> > +
> > +
> > +
>
> Surplus whitespace here.
ok, will delete it.

>
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> > +
> > +       mipi_dbi_command(dbi, ILI9341_POWERB, 0x00, 0xc1, 0x30);
> > +       mipi_dbi_command(dbi, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
>
> Some of these are just copies of the above init sequence, so it makes
> even more sense to just have these settings stored in
> ili9341_config.
ok.

>
> > +       mipi_dbi_command(dbi, ILI9341_DTCA, 0x85, 0x00, 0x78);
> > +       mipi_dbi_command(dbi, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
> > +       mipi_dbi_command(dbi, ILI9341_PRC, 0x20);
> > +       mipi_dbi_command(dbi, ILI9341_DTCB, 0x00, 0x00);
> > +
> > +       /* Power Control */
> > +       mipi_dbi_command(dbi, ILI9341_POWER1, 0x23);
> > +       mipi_dbi_command(dbi, ILI9341_POWER2, 0x10);
> > +       /* VCOM */
> > +       mipi_dbi_command(dbi, ILI9341_VCOM1, 0x3e, 0x28);
> > +       mipi_dbi_command(dbi, ILI9341_VCOM2, 0x86);
> > +
> > +       /* Memory Access Control */
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
> > +                               MIPI_DCS_PIXEL_FMT_16BIT);
> > +
> > +       /* Frame Rate */
> > +       mipi_dbi_command(dbi, ILI9341_FRC, 0x00, 0x1b);
> > +
> > +       /* Gamma */
> > +       mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> > +       mipi_dbi_command(dbi, ILI9341_PGAMMA,
> > +                        0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
> > +                        0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
> > +       mipi_dbi_command(dbi, ILI9341_NGAMMA,
> > +                        0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
> > +                        0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
>
> It seems to be copies of the stuff above, but why is there a different
> gamma if you use DBI?
for dbi interface, currently i just copy the code from tiny/ili9341.c.
as so many boards use this driver now, like raspberry pi, etc
i'm afraid it's will not work after modification. so, just leave the
original code there.

>
> I suspect only one of them is really needed and it is not even
> necessary to set if up in two places.
>
as i know, dbi interface use spi to transfer video data and register
set to panel.
but dpi use rgb bus transfer video data, spi set register, they are
two different type for drm.
i can't register two different interface into drm at the same time.
so, i use two path.

for code management, they have some common part, like register init.
power on/off process. i will try to reuse most common functions. to make code
easier to be understand.

anther question:
is there any panel driver have dbi & dpi or dpi & dsi supported? which
i mean support
two different panel interface in one driver.
thanks

> > +out_enable:
> > +       switch (dbidev->rotation) {
> > +       default:
> > +               addr_mode = ILI9341_MADCTL_MX;
> > +               break;> +out_enable:
> > +       switch (dbidev->rotation) {
> > +       default:
> > +               addr_mode = ILI9341_MADCTL_MX;
> > +               break;
> > +       case 90:
> > +               addr_mode = ILI9341_MADCTL_MV;
> > +               break;
> > +       case 180:
> > +               addr_mode = ILI9341_MADCTL_MY;
> > +               break;
> > +       case 270:
> > +               addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
> > +                           ILI9341_MADCTL_MX;
> > +               break;
> > +       }
> > +       addr_mode |= ILI9341_MADCTL_BGR;
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> > +       mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> > +       DRM_DEBUG_KMS("initialized display serial interface\n");
> > +out_exit:
> > +       drm_dev_exit(idx);
> > +}
> > +
>
> > +       case 90:
> > +               addr_mode = ILI9341_MADCTL_MV;
> > +               break;
> > +       case 180:
> > +               addr_mode = ILI9341_MADCTL_MY;
> > +               break;
> > +       case 270:
> > +               addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
> > +                           ILI9341_MADCTL_MX;
> > +               break;
> > +       }
> > +       addr_mode |= ILI9341_MADCTL_BGR;
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
>
> Since you use MIPI_DCS_* define here, check if this applies
> to more of the commands above so you don't need custom
> defines for them. e.g.
> ILI9341_SLEEP_OUT 0x11 = MIPI_DCS_EXIT_SLEEP_MODE
> and that isn't even a register right, it is just a command?
> (Noted in the beginning.)
>
ok, will try to reuse MIPI_DCS_xxx

> Yours,
> Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
