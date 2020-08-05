Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80F23CA1D
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 13:02:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC6F8C36B3C;
	Wed,  5 Aug 2020 11:02:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23EA9C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 11:02:29 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C4DF22CAD;
 Wed,  5 Aug 2020 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625347;
 bh=cmz98b4aN6klrGIsOTUwn9K0/pumDsFYeqieDUYCi30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVIFO7jxtvIz8aTDGf7shxm4OV5InZb/7jnDWISeCyJFZ4UJQtRfFtLzIm4cnB7bc
 04VZ9RTFmwFOce4ZsAgN2Sg5khJDyARPhguXwycRZ6mCSA8bnLG95y5recuPWh8wh+
 fwpV+5nUZvh2jhG5qgSWRza5gtkWletx20dKAVGE=
Date: Wed, 5 Aug 2020 12:02:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805110205.GH5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-14-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-14-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/18] spi: stm32h7: fix handling of dma
 transfer completed
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
Content-Type: multipart/mixed; boundary="===============0550825789783741085=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0550825789783741085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Content-Disposition: inline


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 09:02:08AM +0200, Alain Volmat wrote:
> From: Amelie Delaunay <amelie.delaunay@st.com>
>=20
> The rx dma is completed "after" the last data is received
> from spi. Thus, to avoid loss of rx data, it's mandatory to
> wait for the dma callback before tearing down the rx dma in
> stm32_spi_disable().

Again, please put fixes at the start of the series before new
development.

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkawACgkQJNaLcl1U
h9AC7wf/Tc9hKs/yIxoXXdFXrgFaODwz5noiIf85U1PqJmzIfy4Q0csYUwSL+p03
vZmqEmP1gK3M+JsByWO+nU3KBW40ZbfLzoEuYTjfCyg3fqlR83UW+fI2s8H9ddcc
IKjdXeSDZJzL/c+SOzHq6eMcRN/UT1K19TibNV4kuTbfOU29/uMnF87jyk7k8mzy
RPq0QgjVFnU5EL4lUXha1Vq1p7jGVhKA1iR8yqBwP+aHbgfC6M8tueHPjztMbVX3
fWF+54fHl9URy1O3f5ymycoNqXfHiKrjsIbCzpA9rcWILZNht5qf+YOasDNUJ0Ai
VYjSU+o3H9L1uJKSd2QoZlsnRNUswA==
=ARDB
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--

--===============0550825789783741085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0550825789783741085==--
