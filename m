Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0561DED41
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 18:29:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1917CC36B25;
	Fri, 22 May 2020 16:29:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 966F8C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 16:29:06 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADB3720723;
 Fri, 22 May 2020 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590164944;
 bh=AZ6aR48aUG//ESbctyBmG+YOjGowh1YxgZdIw6aq6bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s4FsV2uAqu/tX3pg7NewFoApyD7oEoZMnhAmmnKcl+3LRNhjjTs3275VGylctu3f1
 VIIKKiPn2SeIxaQfZeSKskq4enff164K3HACIxgju7ARsCEVTOOkAQ6sTcTGMSy5FX
 F6WMIvtZwCuLj5fXUKnSYt3O04BwosCqqhf4twPs=
Date: Fri, 22 May 2020 17:29:01 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <20200522162901.GP5801@sirena.org.uk>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
 <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, p.zabel@pengutronix.de,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX',
 'SPI_3WIRE_RX' support for stm32f4
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
Content-Type: multipart/mixed; boundary="===============6314046386582917530=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6314046386582917530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WZLuFERxa6Y0cbOt"
Content-Disposition: inline


--WZLuFERxa6Y0cbOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 11:59:25PM +0800, dillon min wrote:

> but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
> the correct spi_3wire direction.
> actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
> for SPI_SIMPLE_RX mode,
> simulate SPI_FULL_DUMPLEX

Oh, that's annoying.  I think the fix here is in the core, it should
ignore MUST_TX and MUST_RX in 3WIRE mode since they clearly make no
sense there.

--WZLuFERxa6Y0cbOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7H/c0ACgkQJNaLcl1U
h9Cejgf9HdcJ4wfZ4TAHuSVLhSZ1f3OnJd4SsU3i35KhZ712W6yrHngXy+nbYV4N
NhjTvvpDmzBo349gEEKpFG3dhTYbtS1kgzaVDbDeHh2B9M5YrRLkIYAjflSzwLeg
Yti6Jgi8Lx7rwmbBx7ACHi/MwbFhTgRxmebmW/EprvqsF+Q1LPKwoqZzgewibxLc
PHCGuWASzrD+VUARI8yApx4c0VvYevsCX3SqhAgEVABuyv5unCyrdK6feQ4pOe6j
AWVdgGrscUVgis28iFGnfmjKc72Ilct0g+jn6CcMAxcNH75lYFazRIihBrGTjh2j
TLYng7hGWV16ZT1d0tdphETvEKKG5A==
=R/O9
-----END PGP SIGNATURE-----

--WZLuFERxa6Y0cbOt--

--===============6314046386582917530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6314046386582917530==--
