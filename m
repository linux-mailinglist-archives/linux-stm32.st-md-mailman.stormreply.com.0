Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236B58ECC0
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Aug 2022 15:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D4AC04001;
	Wed, 10 Aug 2022 13:06:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80A8AC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 13:06:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBAD2B81C11;
 Wed, 10 Aug 2022 13:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F51FC433D6;
 Wed, 10 Aug 2022 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660136811;
 bh=DFYcxkifXKeWtF6+tBZaGptaS5MZmDKyrcXwMH4vbSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cjw9igqkuWhf0iIB0dISFN8WPn2Pdqse0igBL2QaHIhBUXgORx9+YoGFSYRkWDF6U
 DeQlP5G1A7u7K/uu0KGYfWc1mca6irazbf+gDohG4kTqb0V1eqZtOz5lwmbh7nB0jJ
 bRz4BAnreazX2IpuhfcyvI5cRzZCu1sruAR3xo9pC8LNFIetGlYtiiH8yPmRdfUEz2
 jkSo1Yo7etVmb9D5kW8omuxoHXDIld2vppvSx4iLiR//DEw4dYXbcz6QNMSIfoHTj/
 /c9NvBSrowwEFe/FHTinkwPifCq5XhsEAhi7dP23IS2bbuSRcdDFBWfzMvml6MkRRn
 8URZpnbQO+xyA==
Date: Wed, 10 Aug 2022 14:06:46 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <YvOtZtrRHd4AT+j+@sirena.org.uk>
References: <20220810093215.794977-1-patrice.chotard@foss.st.com>
 <20220810093215.794977-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220810093215.794977-2-patrice.chotard@foss.st.com>
X-Cookie: First pull up, then pull down.
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] spi: stm32_qspi: Add
 transfer_one_message() spi callback
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
Content-Type: multipart/mixed; boundary="===============8874715752608108842=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8874715752608108842==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qIGcIJcaVg00Gpny"
Content-Disposition: inline


--qIGcIJcaVg00Gpny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 11:32:14AM +0200, patrice.chotard@foss.st.com wrote:

> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> v2: _ use parallel-memories property
>     _ set auto_runtime_pm to true
>     _ remove pm_runtime_*() usage in transfer_one_message() callback
> ---

The changelog should come after the --- so that it gets automatically
stripped out by tooling.  No need to resend just for this.

> +	/*
> +	 * Dual flash mode is only enable in case "parallel-memories" and
> +	 * "cs-gpios" properties are found in DT
> +	 */
> +	if (of_property_read_bool(dev->of_node, "parallel-memories") &&
> +	    of_gpio_named_count(dev->of_node, "cs-gpios")) {
> +		qspi->cr_reg =3D CR_DFM;
> +		dev_dbg(dev, "Dual flash mode enable");
> +	}

Do we need to add something to the DT bindings to indicate that
parallel-memories is valid?

--qIGcIJcaVg00Gpny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzrWUACgkQJNaLcl1U
h9AkJQf/Y+IYz/LCzWBub55CWbzvK9ruoENfm9CuX6uNA/3NAwmONWNa9ggB08wO
4TujrybikyjoRk1vZ7QNKx49cA/4npKx0vDeAplPuSSKKJYQJjIfcOBfYpVkurqX
w9mj2AptUhV9ZCc5wcasgXSz6uIvyl/RtyKjCc7o49laJq/pyEEgPPpH/hKaO+jH
lZM8oIHqlZcWxdhL5p0XDFPpZd2sbiFeY714yWVh2kX/bSx8DFNU8Y+NJ43gkgEH
5duFoaAQp9i2IfaoBT75NZgKUhiR+mmF+ujsc+7GMXbqp1ekFX3V6ynW7BavXs+X
Nh/xQwsJT6MvqILv4XCxHvVbWs48BA==
=p2wA
-----END PGP SIGNATURE-----

--qIGcIJcaVg00Gpny--

--===============8874715752608108842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8874715752608108842==--
