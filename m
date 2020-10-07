Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22435285C48
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 12:03:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE9F9C32EA8;
	Wed,  7 Oct 2020 10:03:20 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6E4FC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:03:18 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id E31CE1C0BAA; Wed,  7 Oct 2020 12:03:17 +0200 (CEST)
Date: Wed, 7 Oct 2020 12:03:17 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201007100317.GB12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-2-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Denis Osterland-Heim <denis.osterland@diehl.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 01/12] leds: pwm: Remove platform_data
	support
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
Content-Type: multipart/mixed; boundary="===============6890072111678850566=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6890072111678850566==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 22:34:40, Alexander Dahl wrote:
> Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
> interface is not usable from outside and there seems to be no in tree
> user anymore.  All in-tree users of the leds-pwm driver seem to use DT
> currently.  Getting rid of the old platform interface allows the
> leds-pwm driver to switch over from 'devm_led_classdev_register()' to
> 'devm_led_classdev_register_ext()'.
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
> Reviewed-by: Marek Beh=FAn <marek.behun@nic.cz>

Thanks, applied.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SZQAKCRAw5/Bqldv6
8mQ3AJ46WIxuzaEV6SZFdJADbrrWIacz1ACgqTcjyUBA1BTFDmThLaIOxfLcv8Q=
=UNVv
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--

--===============6890072111678850566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6890072111678850566==--
