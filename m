Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F821B8DA2
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Apr 2020 09:51:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC9C5C36B0B;
	Sun, 26 Apr 2020 07:51:48 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09073C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 07:51:46 +0000 (UTC)
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
 by pokefinder.org (Postfix) with ESMTPSA id 0653C2C01E8;
 Sun, 26 Apr 2020 09:51:45 +0200 (CEST)
Date: Sun, 26 Apr 2020 09:51:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200426075145.GD1262@kunai>
References: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
 <1587394677-6872-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1587394677-6872-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: i2c: i2c-stm32f7:
 allow clock-frequency range
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
Content-Type: multipart/mixed; boundary="===============8332434188579378172=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8332434188579378172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 04:57:56PM +0200, Alain Volmat wrote:
> For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
> match, the bus clock frequency can be from 1Hz to 1MHz.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPZEACgkQFA3kzBSg
KbaBtxAAmZcSVuGnytANdDwjJyW5rIZSw1STm4/hxAphX4OZ3O4zfhaQFGson4PB
+t3aWsB+pIFibUCucE17n5WIpPao0wY5FqOtBFOn99DRTDJAniCpk0GmTu4E8tXY
ekC1GXsS4gv1zkcc5urFk3anYs2xetAaxcueEh/twLoj3xrzOIM0OaGOghNB5J/+
hwc31h2RZArl2Rfb9Ek84t576Z5OkY+FAsWrWy3585qKMlSlyoUpYBlfFrIKy/Mn
YmM+xD4hF1CBOe/eF8MsOd3EUOvH2284cv1+P8uCpqdmukWn3V9g0fA9K959MQNn
o6UbTZLxngkgdxVCTEWuSd4V39yn7yId55/BOwLi9QLmXwmAOvOjRSWce6Qlhp7Y
YEuenclYMHLb7B73iBehEfeW3ClBJOm5WoNndpNB/RArIAgAbPeWgNcTq8iD9JsK
QdJ5t1i4ivB+s/Sb3EiHVfyfYfjw63qwMiyXFKvyUTwJMI8+WC8ZPqbEpOnUSPGp
jz1JfSVjjCZQCy4aVLyV8wUZkC5y+CigP7KViC1g5QRGGpP9c1Bbu7Vgu6+n9Tt7
zMKwvsZuXFoBpvUjIRfV63kwpJJay9Hw5NeIMUMBEbECyZwLPQIUA1+IAoO24o0w
rv/Lx9e3z2bpJz7WXjSXKCmBLQGiV3lxEAc2VY8Mq8rE3VGg9Ko=
=Wu/5
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--

--===============8332434188579378172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8332434188579378172==--
