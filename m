Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 150485AA6B
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2019 13:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7112C35E02
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2019 11:32:32 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 614DCC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2019 11:32:30 +0000 (UTC)
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
 by pokefinder.org (Postfix) with ESMTPSA id 0A6B92C047A;
 Sat, 29 Jun 2019 13:32:30 +0200 (CEST)
Date: Sat, 29 Jun 2019 13:32:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190629113229.GF1685@kunai>
References: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: Add
	I2C_SMBUS_I2C_BLOCK_DATA support
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
Content-Type: multipart/mixed; boundary="===============1855965096377503204=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1855965096377503204==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:20:51PM +0200, Fabrice Gasnier wrote:
> This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
> for the stm32f7 SMBUS Controller.
> Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
> hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
> Emulated transfer will fall back calling i2c transfer method where there's
> already support for DMAs for example.
> So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
> emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
> for such a case.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-next, thanks!


--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XTE0ACgkQFA3kzBSg
KbYQPBAAnI6LSZiadL1Afn6Q3hTlf1gK/ZLwpBe9FuKUWv6nQzI/qdghchXuaaWl
Q2LMTuSWroSxSXQ/1vNwAJ8HcOx5vYsP+spOHkSuftyUJLqukklSbfRLtgeo+3kL
fXfTbNIYsVkIEmR5rg9VmLUS80c4eBq7owL9bfUVsD960Qr+tCbnfqHVJPN33TiE
7qW+mI/wvm8R7ToZU5W1J/bvKl0bN53g0qQi4Eu7XGFM3zRvtGS+0jyZ7EhDCQ00
xjnF4tjLCpL6gV5rPMoHW42qqnlc+sAKGwfD6GBAJXJO9Om3FQ2QC6CHmUmg1w0Z
nnSlLXVmTn7rutt7C/5j3cJPMoPhGKNOA7BIPM8S48fvlBBIlkvbC0n9EbzOT2Ww
L4AK0akwhzXa/zbbf8F44+PfYSoMpLz9uRnfzmBax5w2RfwypdKx+y75At5HM6Wl
elqhbmi7DPP20aTpwytaV9BdLW6En5MbHOAkxOJYWszAAXtqQdckQjZtfCZ9Gwzp
14k4Ll6MybldqBi0+efaAsm6ezESOSby98hPDqqqhLEydKCxfMaZ4/2YunF63UTt
EHhyI3pWjSwALJwO6e5Z9PH5mT0c6K/gXLJAlpNA2ap/6ThrUE+/HWL0EK4m6MPB
4ma+27a/n5zV94RlQFgxKbG9m72aKOmFOGOHQRuUs6yLfymGpow=
=grZh
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--

--===============1855965096377503204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1855965096377503204==--
