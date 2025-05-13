Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7AAB5944
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 18:03:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32897C7A837;
	Tue, 13 May 2025 16:03:30 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C403C7A834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 16:03:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D862AA4D9D2;
 Tue, 13 May 2025 16:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CE6C4CEE4;
 Tue, 13 May 2025 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747152207;
 bh=13mKWnaxT5MXOzb611tnGX4qcvA1eYL6YYsoXT+cCMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QAt/MNrTxn0iThyD5AdDAea/tfvEikzi7gLLDWNg+JTnRnYZv9BL8rnTb4Rb+BXIg
 hOD6S/ILAkSW+iVMOcn5vD+dr416w/erglIQ6cWTHBPIzFobTUM5iho+39yV+bxjn0
 hE+gy92whnf4qQoYbsmXpCDJDzShjiyeNqlOu3rZqSVP84MHHjhUKmy7SfCfWbdH5k
 dRXxRNIh8/D0VBDHDezRgX7z1k0JBiDPe6PURk9FNiYmADV3Qr3+68cPIPL4Cc7zLh
 P3YWAJKG67QJfnHhZBpidVKLDh43rQURIx4J1iSn5R9ObjA8DgoscyEEwBGcPe1baU
 pcPsSpGyYXXZg==
Date: Tue, 13 May 2025 18:03:21 +0200
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <aCNtSVldu1yEO5rE@finisterre.sirena.org.uk>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
 <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
 <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
X-Cookie: Well begun is half done.
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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
Content-Type: multipart/mixed; boundary="===============0593460773788202892=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0593460773788202892==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F0dhLWNHSbTNzAtS"
Content-Disposition: inline


--F0dhLWNHSbTNzAtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 11:47:16AM +0200, Patrice CHOTARD wrote:
> On 5/12/25 14:11, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> This patch has been submitted on top of reset tag reset-for-v6.16
> due to dependency with new reset API devm_reset_control_array_get_exclusive_released().

> How do you want to proceed ? Philipp can take it on its reset tree ?

There was no mention about the dependency in the patch, please resend
with information about this tag included.

--F0dhLWNHSbTNzAtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjbUYACgkQJNaLcl1U
h9Cw0Af9GroN6ci/01CzKHevwNZB5THla+r860LWr9mzjOxwBHeDUf3Juey+6Pny
iDYe0dNqRLZ1xyoUqEjs1z/4ATnwJuWPLwju6P77kc/OGmTCL9rV1Fr1W6vVixBl
Fxqd0hwYGI42GoMREKv4F7bkFn2zDKy0/MKkch5/ZHORnVduiT3RAjeKmMJSbNsN
37wzzu+RQ8Dhhabqi4RxMwZz8mwvP+WuzVhFKTcTJoN0zUOPs+DZLuVECQoTprzk
28lFBw+xOzUUKKHKB3nu0c9yogV4a10VyaLUAkjFUqikHYz4sqn/ZP/5j1xqpreI
DQKwo74c3UZRaWjJ0sCEX4f4eGIVcQ==
=D6uF
-----END PGP SIGNATURE-----

--F0dhLWNHSbTNzAtS--

--===============0593460773788202892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0593460773788202892==--
