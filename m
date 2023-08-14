Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBCC77BA76
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:45:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A19EC6B472;
	Mon, 14 Aug 2023 13:45:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEE5FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:45:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B642E615B0;
 Mon, 14 Aug 2023 13:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D8C433C8;
 Mon, 14 Aug 2023 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692020744;
 bh=3GWUGU3sn/mG21fzGuyMqh51zJlW4hGxN9JOTvBoYEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqD2U0V2tuxKZqxWonJYrqzUtF4LVqwXLZtE4B/8QCGUXmjMdi5/Vy3RG8+ny68FW
 9ZLD41a9bVbdV5626Qbkc/m8Uff5zw0x3RRPyGBxZkf5FqceOXnFOniggixG/FtXs6
 GTb8FSPkQ/TjyNtQqcbkB8/Vs87Sb3YosijuXHfP248tR4OnTyh9h+Rw6iqoHSK2Cq
 LVLf9nAXZ6pYHSUxJccABK8IUTTPy7LQ2PxZLrKJqjt8lQhVMxPWYnPt5631xOPHoH
 vnppiFo25hGzBQ89EK/NfqwgiG7yy+nKN3EVUWjBwbz9h4gWtTs1H/GF89huUiwnVw
 KHfaLNQ7ni+YQ==
Date: Mon, 14 Aug 2023 15:45:41 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZNowBaT2nLj4jEm3@shikoro>
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
 peng.fan@oss.nxp.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230811100731.108145-3-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 02/11] dt-bindings: treewide: add
 feature-domains description
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
Content-Type: multipart/mixed; boundary="===============0404973843429223287=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0404973843429223287==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W69stkuq3CQIl/r9"
Content-Disposition: inline


--W69stkuq3CQIl/r9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 12:07:22PM +0200, Gatien Chevallier wrote:
> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
>=20
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C (once the rest is accepte=
d)


--W69stkuq3CQIl/r9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaMAUACgkQFA3kzBSg
KbaUdQ//dzd+zVw4+lLQfMm5N9CAHnO3jRuJqiYQmp/rDIgsZY8CClGeuNYuiFGQ
sJAlf9Vh2aH2qFbq7TJkPelVMPe97mgjxKZDJjrpGUe6CTcLGpK4P5dx0bQmxrDV
X9wg54/VUPmf92H5LDELCgEQBUpxE2M9kMMYXubSN+gyCYDo+RZFOw+aOfRcqKkT
jyWMjSPQsNYTIn/u+DiQidjJYYW3Y1NwiUufKoBCbTUDkmUkBsIAkqq5dYf1he96
cDBjQz4aQzw8q9mITHh1GI3MX5AGpxJc8XmUwD2PwcshkDb57FJkTElHQIhKJW2R
+BPM4dGmzfvtj6G7+/7/E0CWVymbxnEkOVK46qPYw00tD2C7Khm0kRLEbwEcenS3
SlXgrYoVcGf73cxfYrShbSvV32GuQZ9onZxIbgdFMjtiCO7E2WKqPUkNt1hDecEf
WoMbKLXvmxdcRjmmkRJRBGeUwKThDjHDvfYtURQ3+31TVkqxLDLoHE8gF78pL3yw
LW4HQwfekpHvSObQssYoMM2mJrM7yidifx+OCmWywsvmYM3MlJklqapPTI+IVwdm
CxMb+ZhS+C8HJfNS/5Q7AY4N4Qav0cG8Kdk2xTS2hBurkQ87PGjXdpkKPRIG6/wD
02vyuQVUcnLNDqAwXkEORXxqaidoTN/suDmNhiHszczHfBZ/X0o=
=VsN7
-----END PGP SIGNATURE-----

--W69stkuq3CQIl/r9--

--===============0404973843429223287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0404973843429223287==--
