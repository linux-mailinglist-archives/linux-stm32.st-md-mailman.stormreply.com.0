Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0A184915
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 15:18:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C668C36B0E;
	Fri, 13 Mar 2020 14:18:20 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69727C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 14:18:19 +0000 (UTC)
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
 by pokefinder.org (Postfix) with ESMTPSA id 046C02C1ED4;
 Fri, 13 Mar 2020 15:18:18 +0100 (CET)
Date: Fri, 13 Mar 2020 15:18:18 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200313141818.GB1852@ninjato>
References: <1583841521-27897-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1583841521-27897-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: do not backup read-only
	PECR register
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
Content-Type: multipart/mixed; boundary="===============5826486176002883998=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5826486176002883998==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 12:58:41PM +0100, Alain Volmat wrote:
> The PECR register provides received packet computed PEC value.=C2=A0
> It makes no sense restoring its value after a reset, and anyway,
> as read-only register it cannot be restored.
>=20
> Fixes: ea6dd25deeb5 ("i2c: stm32f7: add PM_SLEEP suspend/resume support")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Applied to for-next, thanks!


--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rlioACgkQFA3kzBSg
KbYrNg/+Ky++rxg6iPtXKX60q2EcDj4GouQCSEoXN0o6ROumzKEVs5unYfRuWk4Y
P2x4bw3MJxRNySfua/yY3ikdhrxbuRn3wIdsAFDQoWIP/bndenYB4sw524bGhz+y
7W3R8MvCV5LIaI2Cf11X1R6MXf6eFR62HMFT/7VI/b5yq5N26+gfyhSBEgoBNiDI
AI6av7tmDawPTDaN3U7x6RBycEy2LDTsUGE3Ys2p+F8QyRvvlBuwKt2CJIRBskH5
xeASbGRbySf4PM7Q/SKq9YtfHRVZqbF6r0OCZ85sM9npGSNIc5juakehBwlcj5Qa
a/hhL6mK46uKCEFG1/vvanzDB897rxjYYpIOnyqb5dRu7zjocm+AwGH6rxnWXVBW
hofMRS6I0u68oYjngddT0dtfZT1DtAoFM0/wFZbheRR+8XzOO3hciFTo/7L31ZFL
YidMKqk4FK7wAL6dnbYGImudUv5/Q+Nko/KIx9enLA9ojcsiPrbFgn1czR3/BxCU
3EdrYw6h1qQHAk1nh9urkcjroURMpHYcI3CEurM3MaRVXMIKlHLl/Gy+Z6EigVAr
EfcPavGIwNvO71TvoiOcZAkDz89JYUBf8qBjGtjpS+RYYFlUX8gQfCAHKuuJiOs7
q+FNCibSo7yMqO2bU70LzIbL9BdAZXeogMMpWpJxCNGIjz4U3rI=
=DECc
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

--===============5826486176002883998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5826486176002883998==--
