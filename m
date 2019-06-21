Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88664F04D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 23:14:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B51FCC586F8
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 21:14:04 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B17E2C586F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 21:14:03 +0000 (UTC)
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
 by pokefinder.org (Postfix) with ESMTPSA id 583FB2C077A;
 Fri, 21 Jun 2019 23:14:03 +0200 (CEST)
Date: Fri, 21 Jun 2019 23:14:02 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190621211402.GB950@kunai>
References: <1560757981-10532-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1560757981-10532-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: marc.w.gonzalez@free.fr, linux-kernel@vger.kernel.org,
 pierre-yves.mordret@st.com, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, fabien.dessenne@st.com
Subject: Re: [Linux-stm32] [PATCH v3] i2c: i2c-stm32f7: fix the get_irq
	error cases
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
Content-Type: multipart/mixed; boundary="===============5635219351392712387=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5635219351392712387==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 09:53:01AM +0200, Fabrice Gasnier wrote:
> During probe, return the "get_irq" error value instead of -EINVAL which
> allows the driver to be deferred probed if needed.
> Fix also the case where of_irq_get() returns a negative value.
> Note :
> On failure of_irq_get() returns 0 or a negative value while
> platform_get_irq() returns a negative value.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-next, thanks!


--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NSJoACgkQFA3kzBSg
KbaKLg/+IDVBZI+FWBpYna0/CpvmO5Uyzx0xj2RFArNr4l7IySOTfA79vSKuZ+cx
VB+ap4ihOQ5gta95Jt7ZFgHj1h81yy/5ER2C8yCbn9NNkv5NjF3HvVSNaolQuU4q
LIDq5JjlKMOExTBuRFfDvDC4jnTAPZcIv9KfxsC98tK4u47jzh2GIAnrX/BjIydl
khpnpg1KwbS52qFfm6OxxKtZBZrIJg42kEt7IH7AYG3IqpE52zO0Xg92e5HVdRJV
KP/E13T5YZXONCzT8ZB4vYiPC0lpl3QFCEO1VpwVCTM/AqxTA573L9GOmoFurPra
6vkNeUgZdfBXvTvIQo1Qteuuim8NfpZMy/Q44WZUDNVG5VEGzlDFli3j3z5GON9r
c0N1SbA9ev+U+4Lrw+6N+RLG3VKNiEAKLILKWzP3Kc4KOlRZDa6mxgTdHL3E9i86
stVEayxqkOZPiTtmb8AaJz513cWFMIlnqolWZqgl5hXL80JHE7lmebA7xC0GzN6z
o8V33npjYNMPH8vaS4Fm+2Huo3q95A1DccuN3xqhx6WClG3vrpkImyBOKEla15NT
Ox70qsmBi2q+rXdqcM/g5gaedc/568Le2FT/whNDxr3mJ8o6lGfwRDupZFKGN8Vm
8LJRUVAA5fokwSR9C1IJfHHJgGi47RA8dBJy3pLJWV4BbjrbGtg=
=etZv
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============5635219351392712387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5635219351392712387==--
