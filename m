Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A350258397
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 15:34:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E45FC06E8C;
	Thu, 27 Jun 2019 13:34:42 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8103EC06E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 13:34:41 +0000 (UTC)
Received: from localhost (p54B33130.dip0.t-ipconnect.de [84.179.49.48])
 by pokefinder.org (Postfix) with ESMTPSA id 230072C3112;
 Thu, 27 Jun 2019 15:34:41 +0200 (CEST)
Date: Thu, 27 Jun 2019 15:34:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Eugen.Hristev@microchip.com
Message-ID: <20190627133440.GA7158@ninjato>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net> <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
 <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
MIME-Version: 1.0
In-Reply-To: <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas.Ferre@microchip.com, pierre-yves.mordret@st.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, peda@axentia.se,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] I2C filtering (was Re: [PATCH v2 6/9]
 dt-bindings: i2c: at91: add binding for enable-ana-filt)
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
Content-Type: multipart/mixed; boundary="===============4047365554422215406=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4047365554422215406==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Apart from enabling the filter there is indeed one configuration
> > setting, the maximum pulse width of spikes to be suppressed by the input
> > filter.

Yup, this is what I anticipated.

> This is a number 0 to 7 (3 bits) that represents the width of the spike=
=20
> in periph clock cycles.

For a generic binding, we would need some time-value as a parameter and
convert it to clock cycles in the driver then, I'd think.

> I am looking to see what is PADFCFG , as it's related to the PAD analog=
=20
> filter configuration. It may be unused by the filter.

Thanks!


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0UxewACgkQFA3kzBSg
KbbBxw/+PKlsndFyCPTuBvbsZv6QYFNcJSE6IMOwxnfLjInOoY8cAl/2uc55yh8K
uVXgbOdp9bQEtjjgva8oMOZdT+8N6EOqm+Bjqu2Nw44UsQ6HQXUM+LJU9J35Me4T
USjBCsZL+3rf9SUBq4xDSUa05wBuKN0ZC1Mss55kkBD/R4ULrd9VoVx0rpSe6oAF
/XQeBDsWhqDG15zoZysXgQ/he7kLCGgtPf+dz0vA80JefsflXEyrr3Al9rggVP/F
gK3+4UqBE8YLn0Iepd0HKsk7z3Qs7uLfjZex7fbd9Ul81JCN2yHn4PFIuV+NJf86
C7Nh7zYojp41vxBF1llxMvm+2E4z23KkQ/SKmTqOshOxxEcYH2OdfvuWPyLBctHr
Ex3IKFo/wESvBs12NPz1AAC/EadHG6elpaHNkdNaGjWMA4eIchDF+vaVXVsr34gT
FYSfwVLHx4WZEKBzF+jWds5EBUbNWhSF0+e5vBOkL6BsGJpU5PTgxuvbO3L6jqCj
nbCIkxFFM+pJCcwnb1eaDG9I9IUb1962hciz4tjFWMLog+QJdtWrwSk+az1237Jc
0okdeuwS1ztxn84GLBuELSkDizc0GlYEJbz0+ICd2ZLXXFRwytpC/b3Sj/QgGOWM
GNZtPtRGoadH2jxHySVRG+j9veFm1US51dR4b25SHUzlWyAR62A=
=tCqi
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============4047365554422215406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4047365554422215406==--
