Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15A39A06B
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 13:56:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85818C57B6B;
	Thu,  3 Jun 2021 11:56:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFFFEC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 11:56:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 652D860FE4;
 Thu,  3 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622721413;
 bh=yNyMKERABSuu0uUxGjPMgn/EQtMIGsB3x1zSWqeIYm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mvr4JeHEggGsMJf2lVgTV3NIpJk0wLSyFH/pvEep7xiSRT3JNGsr/wKeYSdBOVRbu
 vKQEKj8aeRpjlc8Z3Jn6w2CVj29Sj00IUpkNAKz5G62NHF7GR/t1yIvEEssoFl3X6x
 Nfa4e5n/72UzeT/Qv61RL0rEJODVcgipZieZLBa8QY1a4uxbDqnA6bQYrgYSV1js+Z
 Z1vA/HWXKiEpoZNnpasLJwXMblSzWvL9AcObQNjd4UaeFtg0VDV0l298XyULStMYLW
 b2B8ky1OE7ZvrBm/9NG0xGrTKUhXXmA/ITMD0w+mYWTFhJubvd+SS0EjLnxlIA6p4e
 kGoibRb6R4IoQ==
Date: Thu, 3 Jun 2021 12:56:42 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20210603115642.GC4257@sirena.org.uk>
References: <20210603073421.8441-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210603073421.8441-1-patrice.chotard@foss.st.com>
X-Cookie: Where am I?  Who am I?  Am I?  I
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Always wait BUSY bit to be
 cleared in stm32_qspi_wait_cmd()
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
Content-Type: multipart/mixed; boundary="===============0391802506095074740=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0391802506095074740==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 09:34:21AM +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> In U-boot side, an issue has been encountered when QSPI source clock is
> running at low frequency (24 MHz for example), waiting for TCF bit to be
> set didn't ensure that all data has been send out the FIFO, we should also
> wait that BUSY bit is cleared.

Please remember to put the [PATCH] in your subject.

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC4w3kACgkQJNaLcl1U
h9AGvgf/c06cSrAIJt4WkAnSjIsVEZLJ6EtX2fhR1E3t7P/EQIOwLTAT5hlt3WMq
vr56vrAhKSTgbDd1LKu12o9YKuM0IaU5IpBc5EbEKCtyV0uviSywNggFWtvxuegi
CQzQRJGMlpTZ97Kbf/NR82O4wTUTgrJLWLF1xoNbLW5FqLb2oZ6PCdaZF7cP7JDu
UVy9/JYGv6SBY4q6FDnF5avWVhQBKSjRZonrL1butvMA+7fgoaZrBhioZGKfojT0
8twf8B8QHmjNMEdxeBBqbQIAMnKfgMC9Mc6spHybTm/qIoUehU6a1ZIf4yp/+RmH
oWkC6cNs0d/I2R0iecV9x4Mj8ngQpA==
=ktXv
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--

--===============0391802506095074740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0391802506095074740==--
