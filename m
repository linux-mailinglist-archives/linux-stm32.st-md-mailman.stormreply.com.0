Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F23C6D24
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:20:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C985C57B6F;
	Tue, 13 Jul 2021 09:20:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1670FC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3U4fXEvYZQ6jKgkN4/AU7jjky/mHZ4e2qC/cN+142q0=; b=ZbjSuQFu6xUZKyZmP35KKaa7h
 oWMT3hLQ9U1A2HSPpBdszaEgUZ1/9Ac9qHhgTIMIFET76inyqnQZMbTQPGp1ookCogmz/lhU6Iijo
 EancHG/EMjM0MUzW9zmyJGKlOy3VgtfXFRr8VBW2BDrG/zpZ0f8UgXyOB4jIC+a5Vvr3Vq56vEmvB
 y1Zc8FLFWBl70qcGOTu3a5/hbbtDY9oi2MFiySCgCTwNpsEcTx887gGRqQ4gOuQzoza3e0PWGUvjt
 w4FxDaZz6plRmLauHEHixlZvZs2y/ggp17tTlk7HglTPwBXz3qRVqUYSN+02MmxecPpvzpzGOzMRK
 kygaE7KLw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46044)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m3Ea4-0005pG-7B; Tue, 13 Jul 2021 10:19:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m3Ea2-0000Am-Kx; Tue, 13 Jul 2021 10:19:54 +0100
Date: Tue, 13 Jul 2021 10:19:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210713091954.GG22278@shell.armlinux.org.uk>
References: <20210712231910.GA1831270@pc>
 <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pwm@vger.kernel.org, mcoquelin.stm32@gmail.com,
 Salah Triki <salah.triki@gmail.com>, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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

On Tue, Jul 13, 2021 at 08:30:53AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Salah,
> =

> On Tue, Jul 13, 2021 at 12:19:10AM +0100, Salah Triki wrote:
> > Divide by 3*sizeof(u32) when computing array_size, since stm32_breakinp=
ut
> > has 3 fields of type u32.
> > =

> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > ---
> >  drivers/pwm/pwm-stm32.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> > index 794ca5b02968..fb21bc2b2dd6 100644
> > --- a/drivers/pwm/pwm-stm32.c
> > +++ b/drivers/pwm/pwm-stm32.c
> > @@ -544,7 +544,7 @@ static int stm32_pwm_probe_breakinputs(struct stm32=
_pwm *priv,
> >  		return -EINVAL;
> >  =

> >  	priv->num_breakinputs =3D nb;
> > -	array_size =3D nb * sizeof(struct stm32_breakinput) / sizeof(u32);
> > +	array_size =3D nb * sizeof(struct stm32_breakinput) / (3 * sizeof(u32=
));
> >  	ret =3D of_property_read_u32_array(np, "st,breakinput",
> >  					 (u32 *)priv->breakinputs, array_size);
> >  	if (ret)
> =

> I agree with Philipp here; this looks strange and needs a better
> description.
> =

> Looking a bit more in details:
> =

>  - priv->breakinputs has type struct stm32_breakinput[MAX_BREAKINPUT]
>  - nb is in [0 .. MAX_BREAKINPUT]
>  - sizeof(struct stm32_breakinput) =3D=3D 3 * sizeof(u32)
>  - of_property_read_u32_array reads $array_size u32 quantities
> =

> so to read $nb members of type stm32_breakinput array_size must be a
> multiple of 3 which isn't given any more after your patch. This makes me
> believe your suggested change to be wrong.

I concur with your analysis. "array_size" is the number of u32 values
to read from DT. It is not the number of entries in priv->breakinputs.

I would also note that the code relies on there being no padding in
struct stm32_breakinput - it should be noted that a strict
interpretation of the C standard allows padding to be added anywhere
to a structure - at the start, end or between members.

Some further thoughts... DT is effectively an interface (we maintain
definitions of what we expect.) The way the code is structured,
"struct stm32_breakinput" defines that interface. Maybe this should
be commented, and maybe there should be a build time assert that
"sizeof(struct stm32_breakinput)" is "3 * sizeof(u32)" since the
code is relying on that property?

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
