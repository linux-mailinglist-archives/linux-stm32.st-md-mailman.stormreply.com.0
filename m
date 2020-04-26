Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 016621B8D9F
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Apr 2020 09:47:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DD06C36B0B;
	Sun, 26 Apr 2020 07:47:11 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C30FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 07:47:09 +0000 (UTC)
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
 by pokefinder.org (Postfix) with ESMTPSA id 982322C01E8;
 Sun, 26 Apr 2020 09:47:08 +0200 (CEST)
Date: Sun, 26 Apr 2020 09:47:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200426074708.GC1262@kunai>
References: <1587395826-17541-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1587395826-17541-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32: don't print an error on
	probe deferral
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
Content-Type: multipart/mixed; boundary="===============8468338365005661618=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8468338365005661618==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:17:06PM +0200, Alain Volmat wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
>=20
> Do not print an error trace when deferring probe for some resource.
> Fix as well the error message in case of tx dma_request_chan failure.
>=20
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Applied to for-next, thanks!


--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPHwACgkQFA3kzBSg
KbZqCg//Th0HgzDJWiYiEqK4xlVz2HKw6oqfYM+z5t09khlnmxL09D75I8FjU4sx
DzKZe+ATTWw6MNROZyyUtDby3lvZgxxiFCiKcju4LscgmgOKwkNu+PxxbKHkUrQR
1bvQJ8DuMlIVHe2fXPH65f/7EV0Th7AjltoLLSZDSFu34tIa+rOe6liQVJOSjgFS
tMA11Cm9Eb4hlbKQbtTrPB7OVpVAoQT/Tg5P5nEmAa/DbTZhyNYNbmQJKq8I8HN1
L2FO/19K0e2h/wqB15OSrjNY6gi/VMlCjCww7IIYjZTZAT1k6lohCQEAb0USRQ03
fFvCrf5PrBBA6Df2OYwNQBe44fH/BW9xUfj7qjm1DB7DdSEkFmMoO4OQZ7AJ1f/U
DaT0PkU8tFHvIkvTve2oR9WpizWbC9yGkuOPG6/C/ABMcOCU9du0fAexfOBkYqxN
57+xI21/U5Km80Kz4JNK2tx6yWoegetGoE50r+nsWtqT1gHT5sA1r9auccrHbZ6P
byyBbw8MXX7r2P9sMXkUzkN9eg2xIar3WaBOCrq5Py6cmY1z9VanJC5dOWs3Brke
+BY43Lx6e3r73zjPQPQt0siDrfffumnR8RY6OKaiCwM+R4RLt0jmDlXJd4Pk7uwH
4Fs9CeYgaq7ZKiBhrhwACUax6hxqgxep5OZR3GJhncsUCwBAqR8=
=TgHS
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--

--===============8468338365005661618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8468338365005661618==--
