Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C91D3227
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 16:08:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3924EC36B12;
	Thu, 14 May 2020 14:08:13 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57487C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 14:08:11 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a21so3621495ljj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
 b=Dj7/g773oDlRsTiNUR7xo2qlLm/wu1orsMurVYbTiR6KmugblKgadVSe7mPERK4aCL
 vEPNEYTpo0FsOvkLTFcAR67KlJyF7Lm0tYMvWEFjNfuewnDqxPfak/mLCAwyBwyRj2ir
 q0by15fYjqzhJnUNE1ONVJGr3vLUxaVTcB05C/nT5aCMA95AP0XrrQXYs66hWza3MVLf
 R+msddyOYrqaHHXoL1h2Zg7FvdZ9e0msvkVGT4lgti3NVlNIlsRBi9Wq6iHo7+nPlyp+
 J4SOOLifvlUKFSIzHAfmGa1qomnjT8z0ZSZ1URkY4VQZLOT1r8zjI6FEv5Gh00Bgxe6d
 cS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
 b=L/uvcPP/hSJb0FSZK5jtxpI7E9lSfY/gK7R4HC6NBP3pPchcQ3Hiss7/tH0b78Cg8K
 IxxkSCrR3Bcd9FVKxePoZcMIPLjz1GNSB7p5+w7KZS18IwpJhQowY/5wLVia0dnJ6Db6
 vRmrNH3XZKclKw3Zqi9vlhwes4cOhHi5znXkInoOAyrBRBVtEuz43QCs/rE3YkQKF4D8
 e6dwXyrMtg7G94+euhgI4EmqwxuCnqcIeGuOFg+soXCwaVSRNU89psNLfu2X+X510hqU
 TytZGartuOHaclHb2Xj02z/MAS5+5/lkA8pLbm4791M4bOGFHW6SNOoZij82fVoLx6Oq
 1HLw==
X-Gm-Message-State: AOAM533m+uK8zblCAssf2L43us2jgVfcFFHMQOCPpFGS/xMF+gi5Q3iN
 ndfJrB8teuqll3CmY3NMjhFv1YQFN3HfJ75fxEe4uw==
X-Google-Smtp-Source: ABdhPJx5t1yZM5yB0Se02KNKlQ3Kf5olZkwfnoQ7/EcJOQjcx6eZpQDoXhQSKSv4wdy91TSKQPnH1L4MsQ9yfH5F0tc=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr2030382ljb.168.1589465290360; 
 Thu, 14 May 2020 07:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com>
 <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
In-Reply-To: <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 16:07:57 +0200
Message-ID: <CACRpkdbcD7i+kNoJ9YP5XXTtLi12=yzW5OBNzet5oRdwPYz=dA@mail.gmail.com>
To: dillon min <dillon.minfei@gmail.com>
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

On Thu, May 14, 2020 at 12:22 PM dillon min <dillon.minfei@gmail.com> wrote:

> > > +       /* Gamma */
> > > +       mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
> > > +       mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> > > +       mipi_dbi_command(dbi, ILI9341_PGAMMA,
> > > +                        0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
> > > +                        0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
> > > +       mipi_dbi_command(dbi, ILI9341_NGAMMA,
> > > +                        0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
> > > +                        0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
> >
> > It seems to be copies of the stuff above, but why is there a different
> > gamma if you use DBI?

> for dbi interface, currently i just copy the code from tiny/ili9341.c.
> as so many boards use this driver now, like raspberry pi, etc
> i'm afraid it's will not work after modification. so, just leave the
> original code there.

OK if you move it to ili9341_config it will be clear which panels
need this gamma and which panels need another gamma.

I think there should be one ili9341_config for the new st,*
variant and one for the old DBI variant.

> anther question:
> is there any panel driver have dbi & dpi or dpi & dsi supported? which
> i mean support
> two different panel interface in one driver.
> thanks

Usually you split the driver in three files becuase a driver can
only list one initcall, and also it makes it modularized.

There is nothing in-tree but look at my branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/log/?h=ux500-skomer-v5.7-rc1

You see how I split up the s6e63m0 driver in one SPI part
and one DSI part:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=6c0e1fb5df5fa8fa857dee65f6c0f54d06d158a7
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=cfbf562cc709b53b62f5fbc7fedf176ffa17b088

The overall idea should work the same with DBI.

Yours,
Linus Walleij

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
