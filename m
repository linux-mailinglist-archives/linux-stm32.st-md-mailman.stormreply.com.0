Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A49600BB3
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 11:58:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1BCC63325;
	Mon, 17 Oct 2022 09:58:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FA54C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 09:58:15 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id d26so23625684eje.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
 b=MUHWuYJag6UdIGNJWiJWxn8WAAZ42CXEFTnECn+6skOIqg/uauJYEVg974vMd9sMEk
 zE6zI7z18arTxzgN6sTudVQN0HH06/PzZJ+4X18m75Vy/bF7X3X+fEqiRAyn7cwpLeMe
 1S3Gkx8o3vO463r4qBmru/5P+HeV+QtYD7XFaMKTFQkBKEINKik6GSXOIGd4TakIzo/y
 22NV5ZvkVpf1kqoQWmMXugwEs+G3K/F00qz0J2gsZD0tyQrxzJVUb1Rv0OE2tl8BfDdT
 1Thx86QUb3Eo9BPHEOAqRcLadLrkm9xIrIOP9q0Nx+T+iVZxfi/eZSxmcD7GZQwM5l3C
 f6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
 b=5J2sFgOUxuxwyqk/CIhaKXoBlSZ1cidiOKFZ6fO8Yuhqs7f4+M3lv1Hr7XqrleusgS
 SFiJShZFXDrb3czeqhmOjDLf56RKJkQkCSWnJAnk+C+Zlw/j/bbNB3xkrtDu+nebkxPv
 K0jbrR1jQlnTI1xKcgSbzD26jmBAx+r1gyV0IeMalkcpRg1gGrzHymWhk63chU59M8Oj
 u0btiqW/4G1fovf+Mz6DbkdjJP/tsVUIqVzpJ7/c2fozfJrKPz6n0ipM3dkMIb8wxXd+
 lzKWb0zrZhbSghwPgstnoQvSxhlH3cmIs68vzkM0WIiXcxFooJ0etAgcA6zU3SRIxx8/
 r6eA==
X-Gm-Message-State: ACrzQf1AhBfwPLODobLw6Hej+2qbVioJZIhJ3gfKqN3T6WuwEbU9h4Ll
 hNZWr9hGTbuKKaFzvm/toJF8PeHXqvvT05ov4l96/A==
X-Google-Smtp-Source: AMsMyM4L0M6bcj2Wvh4KRdD8EKd7M4z6+eLVjZHPl1MFPGYp6JqekMO0KaAEpqZ8kDbWIS4EMUIR8qxcTy8qHdB2D/8=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7556783ejc.690.1666000695069; Mon, 17
 Oct 2022 02:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
 <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
In-Reply-To: <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:58:03 +0200
Message-ID: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [rft,
	PATCH v2 00/36] pinctrl: Clean up and add missed headers
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

On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> >
> > Aha I see you want to send a pull request so I backed out the applied patches
> > from the series for now.
>
> Can I consider all that you answered to as Rb tag?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I haven't reviewed in detail but I fully trust you to do the right thing
and fix any fallout so will happily pull this.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
