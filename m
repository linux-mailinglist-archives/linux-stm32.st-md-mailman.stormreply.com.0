Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA0A02626
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 14:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB93C78013;
	Mon,  6 Jan 2025 13:08:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 729C3C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 13:08:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4DBCAA41779;
 Mon,  6 Jan 2025 13:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997E8C4CED2;
 Mon,  6 Jan 2025 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736168897;
 bh=Odx9Mi78CnBl/areN0tvg+kryNXSjlbRYjIftgM5H8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUDeXyN1Jlhl/AxkbRlfAf2u8WA31or+eOCr5Y7MMHiOuy80W6WA+gJjc14yb/dAR
 jI8DFjz03bz/c3f6SivfQuByjI3oOnbsG8TTlZc0nyos/TjyLu57qMMbs35e/mdor2
 EU2DaplKu0ygrgNvJw4wXAfqU8teWx7y6WapfRtfU8vSQ9duGGrjTTZPc/6b1v5/+B
 mQjBpjmqRR99R1DWkCZhtnyDrJfO9TMRHSCDdUy/ANsEZym7aOAlBbDIMZxWcsMl44
 oDjFCT6tfN169qJdVEJu0ezMiXe0E/Wdgh01/WAieVnqtUh2OilVLu7egU3i1RnXN9
 4/nBKZmMrd5TQ==
Date: Mon, 6 Jan 2025 13:08:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
X-Cookie: Do not pick the flowers.
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Niklas Cassel <cassel@kernel.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Richard Weinberger <richard@nod.at>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to
	pm_sleep_ptr()
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
Content-Type: multipart/mixed; boundary="===============5014049602417318201=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5014049602417318201==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emAp2yveWLVSOdEe"
Content-Disposition: inline


--emAp2yveWLVSOdEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 12:32:39AM +0100, Raphael Gallais-Pou wrote:
> Prevent the use of macros, and rely instead on kernel configuration for
> power management.
>=20
> This series makes the same change over six different drivers:
> usb-st-dwc3, sdhci-st, st-spi-fsm, ahci_st, sti-dwmac, spi-st.

Is there any actual interaction between these changes?  In general you
shouldn't combine patches for multiple subsystems into a single series
unless there's some dependency or other interaction since it just
complicates management of the patches.

--emAp2yveWLVSOdEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd71bkACgkQJNaLcl1U
h9AGHwf/V/ekmXWwVL15xDEBbZZ+uqPpz0aLMa1v6gvSRA3S9ugHT9vW0elxEGf0
2+0EU7GuIo88DOYxKpOYDd1XHk6xkBI7Whic7ijl1+LK8Kq6Rec0zpzlsv7Rcja1
TmoHi68uCDrHguH5BH94YBKZVfT2U0gSc20ljleO66MKEJQEYob46c3649Gbpxwl
UPiwHVuWa6eMXfzJsS+vZgMEE58Q57GLiVmbZcN0u0FC1QM83kVDExYTCXuTtwx0
g5fiTrBVg4O93cd003jWflIlqao9U/nMREgX5M9/CytGX32MeXIPLlt73A15itVF
DQJXk1CapG8Sm0o+2Y/tH5c6IVJqFA==
=p10y
-----END PGP SIGNATURE-----

--emAp2yveWLVSOdEe--

--===============5014049602417318201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5014049602417318201==--
