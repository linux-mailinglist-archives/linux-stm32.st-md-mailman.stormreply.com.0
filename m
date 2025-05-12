Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC5AB36C3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 14:11:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A96ADC78F93;
	Mon, 12 May 2025 12:11:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1DB7C78F92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 12:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23F9F5C6424;
 Mon, 12 May 2025 12:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AADC4CEE7;
 Mon, 12 May 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747051904;
 bh=OIzn1mPnTSPLZjpB6j7XRj/AFW6cs5zlnmrS1IKRsKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pXQUd8a9pbhwP2kR2m3LdSR8Eo636ZyBTl977P0+jodT/APhlh++OfPy+q40Zr++q
 A7HeU+/IxQuwBLqbj8uWkmNS5STfJoxMZy6Gt4P5yV9f/+4JSQSj7YAUyMGxyIpmOM
 z+yb50PYdw1v7QJbwiAOM0urByyiZz0EOFAQLtHwVU9CIxWQTn/DED+7bg3WfY7Bqa
 Q2usjiip4zWsnUrdnTKmwrOzpGtNcoWNNz9ghRBS8eFXsE9ZPF/YbUUV7UZuRJpx70
 shZFJ3t/znt3ob3UFGdyu9MHLIBsQww892qr9CHVX/n9sHP2MhFslkJE1iS6cxs3eN
 sMXp/ydGhdgPA==
Date: Mon, 12 May 2025 21:11:40 +0900
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============3977669441960907013=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3977669441960907013==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Up6TTTXwV3c9rzJk"
Content-Disposition: inline


--Up6TTTXwV3c9rzJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 12, 2025 at 09:01:04AM +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.

This doesn't apply against current code, please check and resend.

--Up6TTTXwV3c9rzJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgh5XsACgkQJNaLcl1U
h9CakQf+Lpn5673L+a+Kd8BDCJp+K0LSEk6Gm4jTSeW4OQokDsRA9bfIlOjLdgzV
ORMqH5XETEjmrOXd9mXLWBQKn0v6qd0oRNx4NS47Guka1G1cWRgZN07vPz6TtS/j
yIPNVBaSJdcbTt+vq8Hi39KyW1v6+Bfltd83BwLFfF6VZSlr1JG5wJ9QLOfYBYx3
eZ+/8Uq9O0ZKBmoLOT32s0VqfoT82snwGrh4GPKJ52cFJ4UT8PQ2ijxB82pQK6Ni
9W2yxwEqiIyRF7V5UT1SLGH3mTkQXxf+ehJY/s8wgdVv4FdxJ/qcTWFkXBmMm4DS
DZoG5cAUB75NzruPspH29ac7txNyXw==
=OXiw
-----END PGP SIGNATURE-----

--Up6TTTXwV3c9rzJk--

--===============3977669441960907013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3977669441960907013==--
