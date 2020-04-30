Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B931BFC97
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 16:07:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D94C36B0E;
	Thu, 30 Apr 2020 14:07:16 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69915C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 14:07:15 +0000 (UTC)
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
 by pokefinder.org (Postfix) with ESMTPSA id 089F62C08FC;
 Thu, 30 Apr 2020 16:07:14 +0200 (CEST)
Date: Thu, 30 Apr 2020 16:07:12 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200430140712.GA3355@ninjato>
References: <20200429132323.GB815283@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200429132323.GB815283@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-janitors@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: prevent array underflow in
 stm32f7_get_lower_rate()
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
Content-Type: multipart/mixed; boundary="===============8806286597471457836=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8806286597471457836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 04:23:23PM +0300, Dan Carpenter wrote:
> We want to break with "i" set to zero whether we find the rate we want
> or not.  In the current code, if we don't find the rate we want then it
> exits the loop with "i" set to -1 and results in an array underflow.
>=20
> Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-next, thanks!


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q24wACgkQFA3kzBSg
KbY5gA/6AzWyIXBatskD8xK+ZAovWjUjVQp5YTU97M1XZE2JP583MJkhqUjhd9Yg
o/qYLs0VwUfk+Beir3RwwWmO6Kk0LoSs1ppxFcc0FKM69w7hQyU73T5sTWZTrEvH
7m2wuhrTfLOHEIMCIrOzET+WXJF53PAJmyBpBtcO1kVLRT2lW7KILYc3pgRlgoI3
WhOvgt8VhHmII4+qE7lZ/UhYdtwrIu0I9lcAPcfBndqCUKWLL8kKX1H5/AqSE2De
+R6Pce6v478wDnJ7FrSlgerJ+Kv/54NipuYzRyEm3tgEXJm5uQApMXulxi7Bhese
E0ebjkvsLdfA842MS/+fIdxRSoyyZGgqS7zq6pOhubjsxdOo5evRDI3NdTcQhznZ
XHvPUs9Cu0PBuyCanUPsfI7yxe/zLHY8wWCiLoZcSepLwp7ApU7aJSXqRTE/oCBZ
1iorrv/gfPxLUA+KwhpeYE4pL+lX1p6l6zsSA1GItZzJrWUF9bnwXAHaw9eeJMIQ
Srtbra0sUqqrVq3OkQvwC8erJ2GXbxe/NCVuU4OFAOtwq7zousxfVmI6l6N/+Ido
Vs1wgDnBqvE57pl+LswFfVC25PR5MQ5C3Rxv6Lqi2N7o1lXFIAoXuON1tw/ymzB1
Z3VZEApncCTQ4Mt5pXopoWGP8O8FAKAgzudUrjLsJfMUVVF+U6Y=
=XwWa
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============8806286597471457836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8806286597471457836==--
