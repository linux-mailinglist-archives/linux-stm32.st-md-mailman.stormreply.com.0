Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CF1E3FB5
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 13:18:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0B4EC36B21;
	Wed, 27 May 2020 11:18:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC45C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 11:18:35 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9302A207CB;
 Wed, 27 May 2020 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590578314;
 bh=Eb5W1Mu4UnXinW4nhuzmv6KKdI/oP0r3mQb3N4LC+sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtBpaS+v/lpJ9RrOyaPoiNOws0yskW0gCFJwnq5/cqlLekMU3baEbiWM2aeapJ8di
 CklyM05gEwvP4Kf2SWN9Va00wb2otRuEMe7bisF3ZeRBm8TTQ0bikOri9+9fyDnkXP
 E7vBo27aAiaM9AkQWfLi96qnlVRBQMOK2vWz9Xfs=
Date: Wed, 27 May 2020 12:18:31 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <20200527111831.GC5308@sirena.org.uk>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
 <20200527095109.GA5308@sirena.org.uk>
 <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Hua Dillon <dillonhua@gmail.com>, p.zabel@pengutronix.de,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX',
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
Content-Type: multipart/mixed; boundary="===============6634235299016691749=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6634235299016691749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 06:45:53PM +0800, dillon min wrote:

> sorry, forget to remove these two patch from this submits, will not
> include it in later submits
> which ack other's review result.

Ah, OK - no problem.

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OTIcACgkQJNaLcl1U
h9CjnAf9EH3yOA2f087uyr/KGCDeTZDdKdksfcJ4a9wlCQWW1Cur92auEEnoA3Rt
OaZkMT9iqrDJqCSZ80c9Be1Ql4zXnjxCHU+qExkLFmDJcR448ywgqaYh9gluj6D3
xQnn0fxJcjgY+eixxAPqszazPIQm3iHZL0TsQo5DNBU7uDO/p+HytpUoYEntT7AT
bjn2mYE+1drgcxELR/TkQdRnV0jUiAtcpkGnI2tPO70MBQ6jcAwIAX4cBSnjwdhO
L9bXUB58NNMcuUWSj9+c8WyJn0zssre7UWLaYiX9g92/yJEPJNzGN2SFXiM1Jsks
PQH9axxSmBjKf8StOS7727u+sJ8H8Q==
=Ibfd
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--

--===============6634235299016691749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6634235299016691749==--
