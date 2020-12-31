Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F0E2E7F06
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Dec 2020 10:39:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D258C57188;
	Thu, 31 Dec 2020 09:39:51 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D24AC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 09:39:48 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 9BFEC1C0B77; Thu, 31 Dec 2020 10:39:46 +0100 (CET)
Date: Thu, 31 Dec 2020 10:39:45 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20201231093945.GA22962@amd>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz> <20201231083317.GB4413@dell>
MIME-Version: 1.0
In-Reply-To: <20201231083317.GB4413@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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
Content-Type: multipart/mixed; boundary="===============0122033264595091828=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0122033264595091828==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommend=
ed
> > > by DT project.
> > >=20
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.e=
xample.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-=
[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > >         From schema: /home/alex/src/linux/leds/Documentation/devicetr=
ee/bindings/leds/leds-pwm.yaml
> > >=20
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >=20
> > Thanks, applied.
>=20
> Sorry, what?
>=20
> Applied to what tree?

I took it to (local copy) of leds-next tree on. But now I realised it
is mfd, not a LED patch, so I undone that. Sorry for the confusion.

Anyway, patch still looks good to me:

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/tnGEACgkQMOfwapXb+vL2VgCgjU5/nc2bmfwpIcF1pD2ZODxv
cMgAnR+qCehDZ4rG7JzcCf8qqHL+x3Wu
=uRXv
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============0122033264595091828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0122033264595091828==--
