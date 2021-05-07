Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D92375EE9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 May 2021 04:55:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BC05C58D78;
	Fri,  7 May 2021 02:55:26 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1D3BC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 02:55:24 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j20so6511453ilo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 May 2021 19:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cTSVQulBeITLa2/m1dmitAiZk9XtTtJnEzh3hUGeoU=;
 b=cT2ueQbZYQ5FJAitvJOWcefEXBE/+kkX/R4/Kq67RZRWnT/5Uww8mZr34d6Tp9V7oR
 IZtosX+BEeg7jtZg8NZUeSj13AoRPf9hZZjreEJ2q3niNvpcjOQ9HYP8xvf87w6dynH+
 1tgraxqqCO8fZSn8m2y7m1mHoWWTurzSyvUJuWftsFrnIckGyWw4wAY1/DppiCOGnT2s
 P4s1EJgQIoYUCpxIZSB5QuU0rpv7xCfl/+916ySp9TcPw3Uy61U7fUA6Cw3pAy34FYOV
 DN2PgcGtJTQrQmi3V0IL7MVr9QuZJ1ZyhetBAScR2IC8FeSPc9m3j1RR2FS7ZOKm6yTQ
 HMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cTSVQulBeITLa2/m1dmitAiZk9XtTtJnEzh3hUGeoU=;
 b=Fmk+VssbUjy8eQp36HVeELToWA35NpBwasMSv5wOpwd6DbX9b0geN9VzzCiODm6/aR
 dS/SRumfETZ5XAnf8r9bWwXZ/G1YjwL0/SPy2iTkEqBfSHexmOUY6p3Ejwj9gDDy6hln
 sjxNqzeEskXkvJAoeSmr2tf+pPVXeS/oVE9OWmcaraJE/VsBh6JYV/j/HmR3NYYOp3I8
 P0JWGr7uOqxiPfOtQyqiYH5FxDL6Fki/H9gMic7Q5qr6whRHbmTvlhAyWGXOd+lFqEqb
 T5m2pF4cjBvItLcNK5if8ru0G0VdrtRs6CMBFm9Hq1UhZ18Ovw9iLOwcp1CF52bM8mxh
 oxww==
X-Gm-Message-State: AOAM530xpPbs3J6kW4zLzMnQJNX/3hoOj5TM9gOccJjfEqNfyINzzhNe
 48/pCw1YpZHYPW/V/S9tbwJCAb1S39WmJQEbakE=
X-Google-Smtp-Source: ABdhPJw2RBOr2b1dAal8DBdHKDFJPjaMT1E1faSTNgTk5hI83mVNs5XiUZDhlNQbktQ/l4JJRdV37hjRqUN1IaKqYAU=
X-Received: by 2002:a05:6e02:e0d:: with SMTP id
 a13mr7322226ilk.270.1620356123603; 
 Thu, 06 May 2021 19:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
 <20210315130050.GD1182@ninjato>
In-Reply-To: <20210315130050.GD1182@ninjato>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 7 May 2021 10:54:47 +0800
Message-ID: <CAL9mu0LnHAUSMXmQpZK78QAccqrc58cyFC2GD4cBkTNW41rvKA@mail.gmail.com>
To: Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@foss.st.com, 
 alain.volmat@foss.st.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>, pierre-yves.mordret@st.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 p.zabel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz
	data timeout issue
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

Hi Pierre-Yves, Alain

Could you help to take a look?
i really appreciate it.

Thanks,

Best Regards
Dillon

On Mon, Mar 15, 2021 at 9:00 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Mar 15, 2021 at 08:43:54PM +0800, dillon min wrote:
> > Hi All,
> >
> > Just a gentle ping.
>
> Pierre-Yves?
>
> >
> > Regards.
> >
> > On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
> > >
> > > From: dillon min <dillon.minfei@gmail.com>
> > >
> > > as stm32f429's internal flash is 2Mbytes and compiled kernel
> > > image bigger than 2Mbytes, so we have to load kernel image
> > > to sdram on stm32f429-disco board which has 8Mbytes sdram space.
> > >
> > > based on above context, as you knows kernel running on external
> > > sdram is more slower than internal flash. besides, we need read 4
> > > bytes to get touch screen xyz(x, y, pressure) coordinate data in
> > > stmpe811 interrupt.
> > >
> > > so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> > > in xip mode, have to adjust 'STOP/START bit set position' from last
> > > two bytes to last one bytes. else, will get i2c timeout in reading
> > > touch screen coordinate.
> > >
> > > to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
> > > kernel or has mmu platform.
> > >
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > > ---
> > >
> > > V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> > >
> > >  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> > > index d6a69dfcac3f..97cf42ae7fa0 100644
> > > --- a/drivers/i2c/busses/i2c-stm32f4.c
> > > +++ b/drivers/i2c/busses/i2c-stm32f4.c
> > > @@ -93,6 +93,12 @@
> > >  #define STM32F4_I2C_MAX_FREQ           46U
> > >  #define HZ_TO_MHZ                      1000000
> > >
> > > +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> > > +#define IIC_LAST_BYTE_POS 1
> > > +#else
> > > +#define IIC_LAST_BYTE_POS 2
> > > +#endif
> > > +
> > >  /**
> > >   * struct stm32f4_i2c_msg - client specific data
> > >   * @addr: 8-bit slave addr, including r/w bit
> > > @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >         int i;
> > >
> > >         switch (msg->count) {
> > > -       case 2:
> > > +       case IIC_LAST_BYTE_POS:
> > >                 /*
> > >                  * In order to correctly send the Stop or Repeated Start
> > >                  * condition on the I2C bus, the STOP/START bit has to be set
> > > @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >                 else
> > >                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
> > >
> > > -               for (i = 2; i > 0; i--)
> > > +               for (i = IIC_LAST_BYTE_POS; i > 0; i--)
> > >                         stm32f4_i2c_read_msg(i2c_dev);
> > >
> > >                 reg = i2c_dev->base + STM32F4_I2C_CR2;
> > > @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >
> > >                 complete(&i2c_dev->complete);
> > >                 break;
> > > -       case 3:
> > > +       case (IIC_LAST_BYTE_POS+1):
> > >                 /*
> > >                  * In order to correctly generate the NACK pulse after the last
> > >                  * received data byte, we have to enable NACK before reading N-2
> > > --
> > > 2.7.4
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
