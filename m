Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCA5A5F7C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 11:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED6CCC5EC6B;
	Tue, 30 Aug 2022 09:33:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF3A0C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 09:33:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF0C3604F5;
 Tue, 30 Aug 2022 09:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC2FC433D7;
 Tue, 30 Aug 2022 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661852034;
 bh=RtTBoBmIFnTDD6x72hBHnoVvBe1GpBrLQzVhYk4MgBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rCWxQH8FcNcRmBJklBuDvw/CdqD37yq141CRU2jMGMPcbFVnqwXbg6PHxDMp2T0dq
 mKGSYSwq/CtUnQeBi0xTaTxIu4lvHNvglmfL0MzJUnJa8yep5+8StTjKTxYdLVp/42
 z01SenxMYwyJSwzbD9ylNbvgOVTM5g4d8DrsUnNM=
Date: Tue, 30 Aug 2022 11:33:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <Yw3Zf5cwJIlBAV2z@kroah.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
 <Yw3Pw9kwDDKXuqC+@kroah.com>
 <58d6748-ebd-e637-c1b2-b8e469e6d86d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58d6748-ebd-e637-c1b2-b8e469e6d86d@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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

On Tue, Aug 30, 2022 at 12:26:29PM +0300, Ilpo J=E4rvinen wrote:
> On Tue, 30 Aug 2022, Greg Kroah-Hartman wrote:
> =

> > On Tue, Aug 30, 2022 at 10:29:56AM +0300, Ilpo J=E4rvinen wrote:
> > > -static int serial_rs485_from_user(struct serial_rs485 *rs485,
> > > +static int serial_rs485_from_user(struct kserial_rs485 *rs485,
> > >  				  const struct serial_rs485 __user *rs485_user)
> > >  {
> > > -	if (copy_from_user(rs485, rs485_user, sizeof(*rs485)))
> > > +	struct serial_rs485 rs485_uapi;
> > > +
> > > +	if (copy_from_user(&rs485_uapi, rs485_user, sizeof(*rs485)))
> > >  		return -EFAULT;
> > >  =

> > > +	*rs485 =3D *((struct kserial_rs485 *)&rs485_uapi);
> > =

> > Ah, you are mapping this on top of the existing structure, so there was
> > no padding in the original one, why say that?
> =

> While I'm not exactly sure what you tried to say with this, I'll try to =

> answer regardless.
> =

> It's the opposite, there's padding in rs485_user, and therefore also in =

> rs485_uapi. Struct serial_rs485 has padding and is part of uapi so it =

> cannot be changed to remove the extra padding.
> =

> I cannot directly copy_from_user into *rs485 because it lacks the padding=
. =

> Thus, the immediate rs485_uapi and then assign to rs485.

Padding could be in the middle of the structure, it's not obvious that
it is not there.  You are just trying to drop the trailing "unused
space", while all of the fields are identical otherwise.

So be specific about that, as padding is often in the middle of a
structure.

> > > +/*
> > > + * Compile-time asserts for struct kserial_rs485 and struct serial_r=
s485 equality
> > > + * (except padding).
> > =

> > This does not take into account any padding, in fact it's the opposite
> > as all of this:
> =

> ?? I said: "(except padding)" which I thought implies that padding is =

> intentionally excluded (it doesn't exist in kserial_rs485).
> =

> > > + */
> > > +static_assert(offsetof(struct kserial_rs485, flags) =3D=3D
> > > +	      offsetof(struct serial_rs485, flags));
> > > +static_assert(offsetof(struct kserial_rs485, delay_rts_before_send) =
=3D=3D
> > > +	      offsetof(struct serial_rs485, delay_rts_before_send));
> > > +static_assert(offsetof(struct kserial_rs485, delay_rts_after_send) =
=3D=3D
> > > +	      offsetof(struct serial_rs485, delay_rts_after_send));
> > > +static_assert(offsetof(struct kserial_rs485, addr_recv) =3D=3D
> > > +	      offsetof(struct serial_rs485, addr_recv));
> > > +static_assert(offsetof(struct kserial_rs485, addr_dest) =3D=3D
> > > +	      offsetof(struct serial_rs485, addr_dest));
> > > +static_assert(sizeof(struct kserial_rs485) <=3D sizeof(struct serial=
_rs485));
> > =

> > Is there to ensure that the offsets are exactly the same, no padding
> > involved anywhere.
> =

> That's because for kernel padding "doesn't matter", it doesn't want it,
> it would be just wasted space. After this series, padding is used only fo=
r =

> uapi, no longer for the in-kernel structs.

Again, you are talking about padding at the end, not in the middle,
hence my confusion.

> > So I don't understand the problem you are trying to solve here,
> =

> struct serial_rs485 has padding that is ~16B long currently. serial_rs485 =

> is currently used for a few things:
> - Keep track of rs485 state (per port)
> - Record what rs485 options the port supports (per port)
> - Record rs485 options a driver supports (per driver with rs485 support)
> - Exchange rs485 config/state information with userspace
> =

> Only the last of those requires the padding (because it has been part of =

> uapi since day 1). With kserial_rs485, the padding can eliminated for the =

> first 3 cases.
> =

> If you feel ~32B per uart_port too little to be useful (and a little =

> more per driver), I can just drop this patch.

I think 32 bytes per serial port is totally lost in the noise and would
not even be able to be measured at all due to how slabs are aligned
(meaning you are not actually saving any memory at all.)

Can you notice any measurable savings on your systems?

And what is the code increase overall with this patch series?  :)

I'm all for making things const, to prevent errors, but that could
probably be done without this type of change, right?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
