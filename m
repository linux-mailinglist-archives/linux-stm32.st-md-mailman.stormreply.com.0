Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD4B2E7BFA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Dec 2020 19:54:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CEFAC5718A;
	Wed, 30 Dec 2020 18:54:44 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E44C4C56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Dec 2020 18:54:42 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1838D1C0B79; Wed, 30 Dec 2020 19:54:40 +0100 (CET)
Date: Wed, 30 Dec 2020 19:54:39 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201230185439.GC25903@duo.ucw.cz>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201228163217.32520-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: multipart/mixed; boundary="===============5710958280331141381=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5710958280331141381==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>=20
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.examp=
le.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9=
a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/b=
indings/leds/leds-pwm.yaml
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Acked-by: Jeff LaBundy <jeff@labundy.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zM7wAKCRAw5/Bqldv6
8sT8AJ4sSbkyvZGGUOSissG3vFkVRFGtRQCff5oybsiqQBdqq0XQhBEAK+ofAG8=
=bqv7
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

--===============5710958280331141381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5710958280331141381==--
