Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D84E417F5D7
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2020 12:12:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86483C36B0D;
	Tue, 10 Mar 2020 11:12:48 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42B21C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 11:12:45 +0000 (UTC)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id BE3D12C1EB6;
 Tue, 10 Mar 2020 12:12:44 +0100 (CET)
Date: Tue, 10 Mar 2020 12:12:44 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200310111244.GP1987@ninjato>
References: <1583148787-24236-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1583148787-24236-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCHv2 1/5] i2c: i2c-stm32f7: disable/restore
 Fast Mode Plus bits in low power modes
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
Content-Type: multipart/mixed; boundary="===============7223626255497962366=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7223626255497962366==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
Content-Disposition: inline


--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 12:33:07PM +0100, Alain Volmat wrote:
> Defer the initial enabling of the Fast Mode Plus bits after the
> stm32f7_i2c_setup_timing call in probe function in order to avoid
> enabling them if speed is downgraded.
> Clear & restore the Fast Mode Plus bits in the suspend/resume
> handlers of the driver.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
>=20

Applied to for-next, thanks!


--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ndiwACgkQFA3kzBSg
KbYEHA/+Ii6H+eSACR3Z7Q3F8CXBe8hDrrbKV/s/nJR1yi71hGOHyOhHN/H2odRe
lCVxKyWLCYhubBtWa/QvgGO9oIBtRfmiW72X6xeOeF8pI9Zwy/n0NOj+GhmrpTOI
O1rtHwvza+3t5BAf2pohXpil2X9BLhvBrzSLZ9q956N0bHKE2i6A5LWMenyVmZL5
kEmJ0ok2WJEfeSBF3eDL2hwDZzMRzRL8BRYNj7sXyG4wqbTe3HmZiAdFbMwuSuec
QbvFnKhtaQCWDGFz/W2eKyIK0H6YDuKpeGWRtW/c/pf5Nk3MXiU3xJCLkAsvmYq0
WXErJI/nbWyH1fDDV2lVUWd9qUbFdEafVoHqTPZ5HYeOvoRiRAlIT3GrYZzucvNX
OMsfShttaR5CJVS7ahRuqcJxHXTaJS11Jo6yVH7L1zB4p7DKSXfu4Rf7nvQgyk7x
zcEdlW8W7sGaPmEpSENRYsHANq3r6q3QpA5A9l14CQtQykIos4E3f9LDwheRn+Ei
/m8KW1MUqkY2PRsBT+hSlG2GezzHMTo4YXJaiTZi87urY3+LbbcWkHcCwUMfI6vq
2clES4iA9hZS8GAhUOqPHbQZc/bRM+n7zNmR9JHI1SoDdKpVgOLZv1MLofVJWOWI
q46Y8Z5LtBHYj59iyZT/qYXVGogkg1PkZIk6/UBSeV2wrKsenxI=
=J1aj
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--

--===============7223626255497962366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7223626255497962366==--
