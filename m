Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2623CA17
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 12:59:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0F68C36B3A;
	Wed,  5 Aug 2020 10:59:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1C25C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 10:59:09 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8C252250E;
 Wed,  5 Aug 2020 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625148;
 bh=+2lw8wUwUPwm/XzVJd+nqaX1hg96uRr12C5gCcpfKoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBcAbW+zXAbPlvfbb65l+Ab9q749VR8RuVLj2MsKc0s+uEm+R9CzZjOj9g527C4n3
 ilv2g40RzksDSXh/2LIjhDot6mAMbIjU34SXet9LDLpXL/lasFnC8nnJZLUrQri9so
 xlMG4udt6aSgU2+BOzqaCnIoXAxLdQiNM0ITOyGc=
Date: Wed, 5 Aug 2020 11:58:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805105845.GE5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-11-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-11-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/18] spi: stm32: wait for completion in
	transfer_one()
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
Content-Type: multipart/mixed; boundary="===============1450086162053442025=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1450086162053442025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2020 at 09:02:05AM +0200, Alain Volmat wrote:

> We could make transfer_one() blocking till the end of the transfer
> and bypass the wait/timeout mechanism in spi_transfer_one_message().
> But if for some reason, we never get either an error (OVR, SUSP) event
> or end of transfer (EOT) event, xfer_completion will never "complete".
> That's why a timeout is useful here to avoid a hang. Timeout delay is
> deducted from the transfer length, the real speed and the optional delay
> we can add between each data frames. Timeout delay is doubled compared to
> the theorical transfer duration.

> While doing it to address irq mode only, take benefit of the new
> code structure and wait also in dma mode so an eventual error can be
> returned to the framework.

I can't tell from this changelog what this change is intended to do
which makes it very difficult to review.  If the timeout is too short
for some systems under extreme load it would be better to provide a
generic way of configuring it rather than open coding timeouts, or
otherwise improve the generic code.

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkOQACgkQJNaLcl1U
h9AT+gf/aYEfYx3HrSnttobpG07/UmGe0VbGFm0wNeUPlZjHOsiUR0/yYb1gUUlj
TnvCzi1lkQ/K4B0+Xv/SlNbozVhxJgjxcTZ2pYdPLtK/N3mlwk+TtvrRdfRfrhfp
uP0o6kFcWaLObk6NacJRpO7eTLgxLs/mA9yO/Q9fMGwD3vuYmtnfsC2Fq2D8CiLX
ryKPQ7Vj1qrQMKZIbyhNUThsUeX10IGbbk7Ogb+yN7tovA5yDPWlRI28VRGFVBF1
fG3vKTH505EfwHcztddZJyTL9fveYtt76RsQ30uDfJF9NOAleRiRbNdhM9gHqAXf
14Yy/ZXfSKkgz9WHGRPyOgJSgeeM+A==
=ikJv
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--

--===============1450086162053442025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1450086162053442025==--
