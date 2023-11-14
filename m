Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B475F7EB885
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 22:20:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6148AC6B47B;
	Tue, 14 Nov 2023 21:20:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7628C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 21:20:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r30pP-0006ix-N2; Tue, 14 Nov 2023 22:20:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r30pO-00952I-B8; Tue, 14 Nov 2023 22:20:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r30pO-001XcQ-1h; Tue, 14 Nov 2023 22:20:10 +0100
Date: Tue, 14 Nov 2023 22:20:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20231114212009.44r742f3xqosswod@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
 <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk
	in .probe()
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
Content-Type: multipart/mixed; boundary="===============0664977083332028074=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0664977083332028074==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6ihegeeobhhwcex"
Content-Disposition: inline


--r6ihegeeobhhwcex
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 02:35:19PM +0100, Fabrice Gasnier wrote:
> On 10/19/23 22:07, Uwe Kleine-K=F6nig wrote:
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> >=20
> > Make the driver take over hardware state without disabling in .probe()
> > and enable the clock for each enabled channel.
> >=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > [ukleinek: split off from a patch that also implemented .get_state()]
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/pwm/pwm-stm32.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
>=20
> Hi Uwe,
>=20
> I'd only have a suggestion on the commit title:
> pwm: stm32: Fix enable count for clk in .probe()
>             ^
> On first sight, the "Fix" may suggest that this fixes something older in
> the tree. This would suggest a Fixes tag which isn't the case in this
> series, as this is a split of the .get_state() patch.
> Is it possible to rephrase ?

IMHO it is a fix, the hw state wasn't properly taken over before.
If you want a Fixes line, that's:

Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")

> something like: set clk enable count when probing channels ?
>=20
> Apart from that, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>=20
> ---
> I've additional questions, unrelated to this patch. I had a look at
> pwm-stm32-lp.c, the clock enabling is done directly in the .get_state()
> routine. I think this should be moved to the .probe() routine as done
> here. There's likely a risk, that clk enable count gets increased
> artificially, at least since commit cfc4c189bc70 "pwm: Read initial
> hardware state at request time".
> Shall I send a patch for pwm-stm32-lp.c, similar as this patch ? Or has
> it been spotted already ?

I'm not aware of someone working on stm32-lp, so feel free to prepare a
patch!

Best regards and thanks for your review,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r6ihegeeobhhwcex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVT5IkACgkQj4D7WH0S
/k4Z3Qf/Vr6JnoMYrONs6bAbOBdMIAZ8oN2F/CpUkGvejr9MGcC1kyaHZ2hUbDNx
jOtmumD86vMrNjFBH3DGqOKMbM6JMwKq3l9Tlt8155/jgsZ1+nsXmd7I9l1VcVoo
D1JbcZtrNIW8ocfuN8Dr42ZLhHNI7W2tkn1CdsM7aLKJpiFNSICfLzHoT47Ep5oJ
4nWkjny0dnHvExs6bLjXg4f7giMAFfTmSV9OCMP006AnmrnDfhpeEl9E6zIEoye9
j7OnOGgVrjHO/Rp62qAOtreuks+vsXD8EAU4lXqGZm99nFiXfVUd+QXT9Qfjhqrv
6RRcFi3mpnXTbNN6a6sfyXjFUIM7gA==
=PEx/
-----END PGP SIGNATURE-----

--r6ihegeeobhhwcex--

--===============0664977083332028074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0664977083332028074==--
