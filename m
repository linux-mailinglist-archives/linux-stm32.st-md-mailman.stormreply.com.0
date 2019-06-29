Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BFF5AA6F
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2019 13:32:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C24ABC35E02
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2019 11:32:38 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B7AEC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2019 11:32:36 +0000 (UTC)
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
 by pokefinder.org (Postfix) with ESMTPSA id D849B3E43C6;
 Sat, 29 Jun 2019 13:32:35 +0200 (CEST)
Date: Sat, 29 Jun 2019 13:32:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190629113235.GG1685@kunai>
References: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c-stm32: document optional
	dmas
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
Content-Type: multipart/mixed; boundary="===============5202216579059435564=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5202216579059435564==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline


--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:34:13PM +0200, Fabrice Gasnier wrote:
> Add missing documentation for "dmas" and "dma-names" properties that can =
be
> used on i2c-stm32.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-next, thanks!


--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XTFMACgkQFA3kzBSg
Kba1Uw//Z9FKUMwchGR8MkpSsz1F6e5FkOb3MsnEAyXHrXNW9muX2GEbkEWYgYEl
ArkjPGXaoCeOaf5zKRi1enmAa/XU8wYDZ5lRFG1onmzneFlRdHe2tEHWob6Z208n
xaizWUyhE/mmMWMMsGMB7g/VCYuAjomn0/j4qUxUoRMiPf2W/xSzn3eIgDerCBuR
wm+5rVPqN/O1C7JXKsUg35bqBioEhZSqWHAuz3MNnThc3YEgEqEGnWJPm3hPfOnn
mHfb3Q6dpuzVcuQFQbf8fmwcSW2fJyNLV220Qk8z7t6LkAv1e67BghnAWL9DUv9l
0kypkamIy45XbZoZ5ga4rCoPBmwmW7flpy6sjTre3vgrwDHUgf5F85EH3uJ8ahe0
gLWv9YBrxngDLIEzzeHKCURXJI0KQaRHXCYpIEQLF0iIKHmpsV4szxzk8yw1YsvR
p6yD6AwnOG2f5qc87+xd01SJVnSKU2/dwKbG9tI8IooTtnWt6kMaeBks6oUxl8/u
494OXDL341x/blvNxOzVsuySL3bz3NCTEw25iSpX0pe0nd/LgMOjVW4sUZYim+MD
uFcLiKLSbTDr2jkH0edVIbQmElJgIzd7HTkWe6GMzsgesJ/XK/eLU555j3luuuKi
6v1KOb3rE+vKsc2QPfADJkp+tGiVeeF81u+bx0hbqmyDSzvbu/A=
=QtOX
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--

--===============5202216579059435564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5202216579059435564==--
