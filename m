Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E591DE58F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 13:36:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6523FC36B25;
	Fri, 22 May 2020 11:36:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13C84C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 11:36:39 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6CF8206C3;
 Fri, 22 May 2020 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590147397;
 bh=z/6OXOepRElS/C2Gkk6RRZeDF9+60BoN0+lQKMHv4sc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SViwwqlJ87aevdHn4RYwBdrJnJkpk2rgiCE7e168UaD8MlGXvEupOGhOH7ejYfrbJ
 N3kZOSYajFR+FWCWBWyZDHjCeSTW6pHxtLB0BJj1sTzEGGQE0HGaQz/KalAcMtdjVw
 a7j7/Lewv8pBtYtgHXcvbty7bFHiOt4Q0y6gEdzA=
Date: Fri, 22 May 2020 12:36:34 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20200522113634.GE5801@sirena.org.uk>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, sboyd@kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, mcoquelin.stm32@gmail.com, daniel@ffwll.ch,
 sam@ravnborg.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============3476312191707707122=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3476312191707707122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:

> 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> null, we must add dummy data sent out before read data.
> so, add stm32f4_spi_tx_dummy() to handle this situation.

There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
that the driver can set if it needs to, no need to open code this in the
driver.

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7HuUEACgkQJNaLcl1U
h9DV4Qf/SihsJbdjpA046b8/NxOUN0XzKoBRryG9nf4DC4x3Fpb0tscXdk2/FeTd
JceAquzFzEEQ49acoXxDA2UQXUMtmlEiGfbWhNHS0Jwo9JVU3XPHLG5d+nX+sudU
L+O+LPQB61KcC2OQniMIjgApMjvyj2ePQY0lfjl1jnAb3PLHvlpaUt5Mjp8P0iVB
N2skbxjLqD/nDEDYXV+S0Jp689oOuNDJ/zeNk3ds99vhHEc55yvZxvZB8OcWNuop
AJ94iVaqJX+b7qak3V7Ts6Hb6GgkNvr/78bWpjGK5eB+a00Ia0l8yP9svyYdczOK
GS605iD0geP72ehzZUhOjifzaJ7rgg==
=XMsa
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--

--===============3476312191707707122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3476312191707707122==--
