Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 241BB86E6A9
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Mar 2024 18:04:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0A05C6C855;
	Fri,  1 Mar 2024 17:04:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30008C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Mar 2024 17:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CA6BCE25AF;
 Fri,  1 Mar 2024 17:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2511BC433F1;
 Fri,  1 Mar 2024 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709312647;
 bh=ntg/h3YfMrrAKoiaoTzr/bTGfYlC6A2aWaV4uP698gA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPkuACmru647DNGcDYTvby0hD3mN1wmRsWZsuvF8/L24NV4AIc50qHFycSlqIJ++F
 MTEjePdla18Rn5y2FXtyixeN64j4wWumnsx2bQI2EIus+SX9hDsdbhIHF0kjhLlqjv
 EZzuN2m8qUB3HK8Zxss8V4pCN4xa9tcDYvtBwp1Hju7ZqIDAat7qcBRPzAHIWDnbpY
 e24cW7kgkuz3PSY1kb0LvMS7hhYsElZNuvfUGLIk8GAcEVNq0rU8R7gAS+FbVif9cL
 6ullVxlWmmM37ocQkvuhOvnMPmIb1VdFOLPCIuj/MKp+oTKDY++KIOMCvTR59P5RVV
 uMxCnBnae8piw==
Date: Fri, 1 Mar 2024 17:04:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <6d687bc2-3613-452d-b757-73b2a5eaf903@sirena.org.uk>
References: <4807FD7F-FEB5-4460-B1EB-3E2330864C8B@geanix.com>
MIME-Version: 1.0
In-Reply-To: <4807FD7F-FEB5-4460-B1EB-3E2330864C8B@geanix.com>
X-Cookie: Schizophrenia beats being alone.
Cc: kishon@kernel.org, marex@denx.de, m.grzeschik@pengutronix.de,
 Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, lgirdwood@gmail.com,
 p.paillet@st.com, vkoul@kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, u.kleine-koenig@pengutronix.de,
 linux-phy@lists.infradead.org, l.goehrs@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] stm32mp1xx: use of reg11, reg18 and vdd_usb rails
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
Content-Type: multipart/mixed; boundary="===============3021402895254849901=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3021402895254849901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6pjuoBPH3/xbL9Jn"
Content-Disposition: inline


--6pjuoBPH3/xbL9Jn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2024 at 03:41:08PM +0100, Sean Nyekjaer wrote:

> With this device tree[1]. We have noticed during boot the reg18 is toggle=
d on and off
> without vdd_usb being turned off before reg18 as required in the data she=
et[2], section 3.8.1:
> VDD3V3_USBHS must not be present unless VDDA1V8_REG is present, otherwise=
 permanent=20
> STM32MP157C/F damage could occur. Must be ensured by PMIC ranking order o=
r with
> external component in case of discrete component power supply implementat=
ion.

The most expedient way of dealing with this might be to mark the 1.8V
supply as always on.  That's not ideal if you've got low power use cases
though.

We don't actually have a facility for forcing one supply to be on
whenever another is on - it's something I was expecting someone to have
a need for but it never came up as a runtime issue before, there is
support for keeping the voltage different between two supplies within a
limit which I'd expect would look similar.

> I can fix it by removing the vdd_usb from the usb33 supply[3]:
> The stm32-pwr.c is (to me) rather weird, as it exposes the usb33 as a reg=
ulator when in fact it=E2=80=99s a detection pin.
> Is that done on purpose?

If this is not a regulator then it quite simply should not be exposed
via the regulator API.  People keep abusing it rather than implement
reference counting....

> I would like introduce a error in the stm32-pwr.c if something is trying =
to power off reg18 with usb33 present?
> Would it be okay to return -EBUSY? Or even -ESMOKE? :)

You'd also need to consider what's going to happen with the error but
yes, if the driver knows it's unsafe in all circumstances it's probably
a good idea to prevent the operation.

--6pjuoBPH3/xbL9Jn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXiCoAACgkQJNaLcl1U
h9AnHwf+I2SFGN+DHwqmpZxH0sp1k8d8KyKebq+O3IaQC9ReJGz7ZTgNFItcmdvz
n317vumMt98o+gEzSNavRAMPF6hClFvLEERMA/87RZYu0wOz0HFOWRDaCCgqHpqi
IaMmIztm/UPETw7pXjI0B+7g2fDV1E0b/FO67TZbGImzqAyR9V8Yls+JvwLtsFpq
bDFKfr+v5Z9iMe/1lXtvtQc/Q2cVBVr6sgt6RhdvZqen1bqPjRR0S1MFy7PewLCu
JW8lLiSIpfD0OO/6RqZe2vNjUgQp7SUlCKur9PCn1Gw7sIzHKO1se83HXPQa0Tr0
uB5YiaVB7NGDzjs0nJdMDt6cirZ75A==
=H4E/
-----END PGP SIGNATURE-----

--6pjuoBPH3/xbL9Jn--

--===============3021402895254849901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3021402895254849901==--
