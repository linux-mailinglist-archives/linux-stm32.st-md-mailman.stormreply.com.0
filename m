Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421D14D7D9
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2020 09:39:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C2D8C36B0B;
	Thu, 30 Jan 2020 08:39:31 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1B33C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 08:39:27 +0000 (UTC)
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
 by pokefinder.org (Postfix) with ESMTPSA id 943C62C0697;
 Thu, 30 Jan 2020 09:39:27 +0100 (CET)
Date: Thu, 30 Jan 2020 09:39:27 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200130083927.GH2208@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-6-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1578317314-17197-6-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/6] i2c: i2c-stm32f7: allow controller to
 be wakeup-source
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
Content-Type: multipart/mixed; boundary="===============7463239346463559094=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7463239346463559094==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 02:28:33PM +0100, Alain Volmat wrote:
> Allow the i2c-stm32f7 controller to become a wakeup-source
> of the system. In such case, when a slave is registered to the
> I2C controller, receiving a I2C message targeting that registered
> slave address wakes up the suspended system.
>=20
> In order to be able to wake-up, the I2C controller DT node
> must have the property wakeup-source defined and a slave
> must be registered.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!

> +static void stm32f7_i2c_enable_wakeup(struct stm32f7_i2c_dev *i2c_dev,
> +				      bool enable)
> +{
> +	void __iomem *base =3D i2c_dev->base;
> +	u32 mask =3D STM32F7_I2C_CR1_WUPEN;

=2E..

I wondered why we can't move this more up to avoid the forward
declaration?


--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4ylj8ACgkQFA3kzBSg
Kbb0+Q//eaBISWaovu0/fjF7dgoFWHYguEvUxYTzaNb1jIXCpTrU12BTSrrZOLFc
h6iAjfi0aCQYqlbLomSoHp1n3PgcbdB+tTTbdZ5wjNllQmnsHnDrSh8ybp+mejOp
kG/vpYXrWE130JwFsY/iYAsJ5BSHMb2MoYv/5KYvV8iRlmI+s2tg3GU4fy2QUlpQ
CfOB5AcHT7IYm014VVqkhjrChUVVNbmmxque4UXs2YZnB8UU1TJ1kQfkoTtvfCkc
iK/11FS5XmPzls6f5910QqmaYiT8zEAky9SFXCxWw62D41/1cYO/TkN7gOMC4mOl
X0uWutwDU3OCOdFyj0BRXwuWTB61CZ0zF//j6Fhq2cCdgw6PDjU18XHXIj8OHZtj
RfWic1AJREBjlNTrfQhzEC2gmdT6OTjTxSVJKF3+w++zf2kDDFAGO0YF4QuP1JLV
EcggXX5rFHxDJlMSL9Xn4n0GPg0YhJj6tGmfEbWZGx++TZ2C2cNs98sdtXHcoyCY
l8PNu4GqYkcFyEwtl2WN3WGR4aIH9Wg5UaHt8PU+AILcg2lG0hX6aROuAhOsackv
h71zxFIm4QQ/mZKc5TQ11l5+GUIGhhdhKHv9jNwVA//fI2VNzH/SQIm+i8RRofle
qpoIdShu+NtY4n3OPkLb40egkG1SbD9yUpz09ua13Gj4xYwFU60=
=G8QU
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--

--===============7463239346463559094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7463239346463559094==--
