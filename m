Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FA4AD54A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Feb 2022 11:07:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D11C5E2CC;
	Tue,  8 Feb 2022 10:07:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6537C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Feb 2022 10:07:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 938AB61543;
 Tue,  8 Feb 2022 10:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55214C340EF;
 Tue,  8 Feb 2022 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644314827;
 bh=OikrdX8FMNiMLuMVEJTQbFg4yac0GkRiulyJsMntNGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jiP1EPaq3l/aJLJwYUcK5NMYqW2KzAtVaLuE9HOb9vDiTt92PUE12lcvGYU6E6zqt
 XcPHv5v36KfoKOmKMk4R3I/1iVdMxdBG53W5NftkumO7AlhhmCtBDucZk4S+gPHloK
 ss7Xe7jZpLAI2h8sTcfxDRByeIUNzXrPHSohN2ps=
Date: Tue, 8 Feb 2022 11:07:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <YgJAyAZFJBFXQGvf@kroah.com>
References: <20220203171644.12231-1-erwan.leray@foss.st.com>
 <20220203171644.12231-2-erwan.leray@foss.st.com>
 <CAHp75VfxGj=3mKvjcRpQjyXBCM0szsidHVuJGdAL8yP5SmdBzw@mail.gmail.com>
 <cb09a49a-37f8-9e3f-168c-4c5dd62e2c07@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb09a49a-37f8-9e3f-168c-4c5dd62e2c07@foss.st.com>
Cc: "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Jiri Slaby <jirislaby@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] serial: mctrl_gpio: add a new API to
 enable / disable wake_irq
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Feb 04, 2022 at 04:41:58PM +0100, Erwan LE RAY wrote:
> Hi Andy,
> =

> On 2/4/22 10:07 AM, Andy Shevchenko wrote:
> > =

> > =

> > On Thursday, February 3, 2022, Erwan Le Ray <erwan.leray@foss.st.com
> > <mailto:erwan.leray@foss.st.com>> wrote:
> > =

> >     Add a new API to enable / disable wake_irq in order to enable gpio
> >     irqs as
> >     wakeup irqs for the uart port.
> > =

> >     Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com
> >     <mailto:erwan.leray@foss.st.com>>
> > =

> >     diff --git a/drivers/tty/serial/serial_mctrl_gpio.c
> >     b/drivers/tty/serial/serial_mctrl_gpio.c
> >     index c41d8911ce95..1663b3afc3a0 100644
> >     --- a/drivers/tty/serial/serial_mctrl_gpio.c
> >     +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> >     @@ -299,4 +299,42 @@ void mctrl_gpio_disable_ms(struct mctrl_gpios
> >     *gpios)
> >      =A0}
> >      =A0EXPORT_SYMBOL_GPL(mctrl_gpio_disable_ms);
> > =

> >     +void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios)
> >     +{
> >     +=A0 =A0 =A0 =A0enum mctrl_gpio_idx i;
> >     +
> >     +=A0 =A0 =A0 =A0if (!gpios)
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> >     +
> >     +=A0 =A0 =A0 =A0if (!gpios->mctrl_on)
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> >     +
> >     +=A0 =A0 =A0 =A0for (i =3D 0; i < UART_GPIO_MAX; ++i) {
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!gpios->irq[i])
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> > =

> > =

> > =

> > Why not simply
> > =

> >  =A0 if (gpios[])
> >  =A0 =A0 enable_irq_...
> > =

> > ?
> > =

> > And same for disabling.
> > =

> >     +
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enable_irq_wake(gpios->irq[i]);
> >     +=A0 =A0 =A0 =A0}
> >     +}
> >     +EXPORT_SYMBOL_GPL(mctrl_gpio_enable_irq_wake);
> >     +
> >     +void mctrl_gpio_disable_irq_wake(struct mctrl_gpios *gpios)
> >     +{
> >     +=A0 =A0 =A0 =A0enum mctrl_gpio_idx i;
> >     +
> >     +=A0 =A0 =A0 =A0if (!gpios)
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> >     +
> >     +=A0 =A0 =A0 =A0if (!gpios->mctrl_on)
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> >     +
> >     +=A0 =A0 =A0 =A0for (i =3D 0; i < UART_GPIO_MAX; ++i) {
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!gpios->irq[i])
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> >     +
> >     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0disable_irq_wake(gpios->irq[i]);
> >     +=A0 =A0 =A0 =A0}
> >     +}
> >     +EXPORT_SYMBOL_GPL(mctrl_gpio_disable_irq_wake);
> >     +
> >      =A0MODULE_LICENSE("GPL");
> >     diff --git a/drivers/tty/serial/serial_mctrl_gpio.h
> >     b/drivers/tty/serial/serial_mctrl_gpio.h
> >     index b134a0ffc894..fc76910fb105 100644
> >     --- a/drivers/tty/serial/serial_mctrl_gpio.h
> >     +++ b/drivers/tty/serial/serial_mctrl_gpio.h
> >     @@ -91,6 +91,16 @@ void mctrl_gpio_enable_ms(struct mctrl_gpios *gp=
ios);
> >      =A0 */
> >      =A0void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios);
> > =

> >     +/*
> >     + * Enable gpio wakeup interrupts to enable wake up source.
> >     + */
> >     +void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios);
> >     +
> >     +/*
> >     + * Disable gpio wakeup interrupts to enable wake up source.
> >     + */
> >     +void mctrl_gpio_disable_irq_wake(struct mctrl_gpios *gpios);
> >     +
> >      =A0#else /* GPIOLIB */
> > =

> >      =A0static inline
> >     @@ -142,6 +152,14 @@ static inline void mctrl_gpio_disable_ms(struct
> >     mctrl_gpios *gpios)
> >      =A0{
> >      =A0}
> > =

> >     +static inline void mctrl_gpio_enable_irq_wake(struct mctrl_gpios
> >     *gpios)
> >     +{
> >     +}
> >     +
> >     +static inline void mctrl_gpio_disable_irq_wake(struct mctrl_gpios
> >     *gpios)
> >     +{
> >     +}
> >     +
> >      =A0#endif /* GPIOLIB */
> > =

> >      =A0#endif
> >     --     2.17.1
> > =

> > =

> > =

> > -- =

> > With Best Regards,
> > Andy Shevchenko
> > =

> > =

> =

> Thanks for your review.
> I fully agree with your comment, but I wrote this code like it is to keep
> the same structure than all the other ops of serial_mcrtrl_gpio driver. I
> preferred keeping an homogeneous code in the driver rather than breaking =
the
> driver homogeneity with the addition of an optimized code.
> =

> Greg, can you please indicate which solution you recommend ?

Sadly, this is the format in this file, so I'll take this as-is.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
