Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3A8488C7
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 21:47:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B0F9C6DD9F;
	Sat,  3 Feb 2024 20:47:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E7DC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 20:47:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6310BCE0946;
 Sat,  3 Feb 2024 20:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2F8C433F1;
 Sat,  3 Feb 2024 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706993263;
 bh=f2I8gWEzkwSZbGGlhrQHuwLADXjkshYxOtnScKHw11s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GN/4T/RqtAM5pPUfQihjK3Wa8sAV3pUsmPhYvA/cg2Mt2nro2ZyjanWbrJsFNV3X0
 z5BUbR+pQSMZAeHOP3sXKHIURcwPfLXvK10KTL7JVV6BMqAtJcWeBZZaUNH8BgEZwr
 WzCvc/4pSyEOOKjimaGiYIRPvzhm5cFZkClqVzDoxmb/PXTafnKB5XS5SvdpzINgmK
 q/IJVnPabe73UT5UmIzBjjFDfb7yi95qtdPjsD2ng69sNJ9Ox97m8liHEvjdKMoKE0
 QcQjfDe1BO9oUeMuwNyLPZn3s3kiyHosGSbJT7/8lpjlfsPnQ91fjVkcMwRyGM/tUl
 QPqwMl+qAzuzA==
Date: Sat, 3 Feb 2024 21:47:39 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <Zb6ma9lHMu3SAe0U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 jic23@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
 fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
 ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
 richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
 peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
 wg@grandegger.com, mkl@pengutronix.de, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231212152356.345703-3-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, lars@metafoo.de, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, mkl@pengutronix.de, linux-serial@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 rcsekar@samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 02/13] dt-bindings: treewide: add
 access-controllers description
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
Content-Type: multipart/mixed; boundary="===============6529337732017526374=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6529337732017526374==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VPm+VxExOC+V7OZ+"
Content-Disposition: inline


--VPm+VxExOC+V7OZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:23:45PM +0100, Gatien Chevallier wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
>=20
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controller. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to a firewall bus. The firewall can then check the peripheral accesses
> before allowing its device to probe.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--VPm+VxExOC+V7OZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pmsACgkQFA3kzBSg
KbY64RAAof4Gx7h4jhXu9UFvGgxDMB7nucJwU2vnrWAQqslpX78IIuHnDzQGSdx4
YeqQnv3x5PquSqBz8x/rnE1ptR0LqnAgeJdEOQB0AAicQ+VFy75kPngr9dtiCJuf
SrCwaIYQ13qIhhC6pa7HTEUSQN/KX6DVSffmeJmOJoHIqGa1L1ldEH5tujF71Plb
q5ugpGi2Jkmb+UU5/EaXadNKZ5b3BSp/xWur8Eemy9Z4DqqoipzJRzSJHufFNZDR
pRdNn14JQlzQ948vT+YdpGqPE6jrVpd48rygAjaXsPx3cVQx7ouU6tKPnFLjtgyp
tb0R2ZIQNXVaQV36XLwhvv0qFqHEiY36q+GjYSEbMHbO1b0+zneKgmZXNSwCclEp
WQ8DrD3UEKTXcDHmoRV5GVgzZyk7wmK8zq3jofTemYyfKhSvsmAiufzZCQLV/9GI
ScuNib34aJrsiIXiD40DsFNcutPh2v+aBXQmtfpkA++3ZvY9aBQa5KeEqzrKPaa0
AVXFtXPN4hnNkUzTogCTHEvL7dYtbi0h7W5fun3D5kOLdZuewR8vFAotIaDRG7tB
S7AWJDu+x2RT2xAs2yJEfSHMwoBZRdq3nJVugmRDb+VELZmIDBdN4vwBRXfi+cHr
ouzPgt76DcQhfF6JGRUhloWtVuWW3QRQ1uYMpWUrKztG+3WiqBU=
=nMRV
-----END PGP SIGNATURE-----

--VPm+VxExOC+V7OZ+--

--===============6529337732017526374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6529337732017526374==--
