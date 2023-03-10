Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B36B3766
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 08:32:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06BF5C6A60D;
	Fri, 10 Mar 2023 07:32:25 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398ACC6A609
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 07:32:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1paXEX-0002G3-W2; Fri, 10 Mar 2023 08:32:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1paXES-0037ox-Nl; Fri, 10 Mar 2023 08:32:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1paXES-003jf4-1H; Fri, 10 Mar 2023 08:32:04 +0100
Date: Fri, 10 Mar 2023 08:32:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20230310073203.2mpd24pxe5rvm4e7@pengutronix.de>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me-FMZ3e=EaUA1kimEonz=HVHBp7coxCz53bJK9NYBuFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=Me-FMZ3e=EaUA1kimEonz=HVHBp7coxCz53bJK9NYBuFg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>, Schspa Shi <schspa@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Semi Malinen <semi.malinen@ge.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 00/16] gpio: Use string_choices.h
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
Content-Type: multipart/mixed; boundary="===============7715591060121809197=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7715591060121809197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vlcr3xdkx227as3g"
Content-Disposition: inline


--vlcr3xdkx227as3g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart, hi Andy,

On Thu, Mar 09, 2023 at 04:22:19PM +0100, Bartosz Golaszewski wrote:
> I've been thinking about this and I must say it doesn't make much
> sense to me. Not only does it NOT reduce the code size (even if we
> assume the unlikely case where we'd build all those modules that use
> the helpers) but also decreases the readability for anyone not
> familiar with the new interfaces (meaning time spent looking up the
> new function). The "%s", x ? "if" : "else" statement is concise and
> clear already, I don't see much improvement with this series. And I'm
> saying it from the position of someone who loves factoring out common
> code. :)
>=20
> I'll wait to hear what others have to say but if it were up to me, I'd
> politely say no.

Interpreting this as request to share my view: I'm having the same
doubts. While I'm not a big fan of the ?: operator, it's semantic is
more obvious here.

What I find most difficult about

	str_high_low(plr & BIT(j))

(from patch #6) is: Does this give me "high" or "low" if the argument is
zero? You could tell me, and judging from the patch I'd hope that it
would give me "low". But if I stumble over this code in two weeks I
have probably forgotten and have to look it up again.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vlcr3xdkx227as3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQK3PAACgkQwfwUeK3K
7AmKrQgAi8eFePklYAe1Wkc5DrOA8FgxUuMACZnge32N4GuJ70WGZLkl0kmPTU1b
ljClqGfUibetO51uLK9T73BwZNJYXSjcEQ70XwdyiSIronRbhlzw13m6+/JdGD6y
b//gxazdUU3qw70JoLbKZwfBHea/9CPDEJdcb6OvqkrVbH6GMjg5Lsyf3SW4dfRe
Td4CSACc7My0VurOCjOPWw0Ui3gUws20Zs5/dKgZCHzjYlykGC9rS2mmn5CZP2oB
L5AriYmEQodEt6FLgbkYhp1gDE2ONqYwm64RsHUJcWcBKZahBDFuXAoGZLVjgeXo
YMvSCemK36RkwM5w3AHNzK63ETBAIA==
=s9xY
-----END PGP SIGNATURE-----

--vlcr3xdkx227as3g--

--===============7715591060121809197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7715591060121809197==--
