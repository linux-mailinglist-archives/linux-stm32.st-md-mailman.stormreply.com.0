Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF03B8236
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 14:34:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76846C57B53;
	Wed, 30 Jun 2021 12:34:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97178C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 12:34:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E41461446;
 Wed, 30 Jun 2021 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625056486;
 bh=Z9x3GPXX5UDNNSeGBtZIhbnKqfm3VGMh8OJUpTt4KAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vzm1nfHNN+6KM8/TSNktE3t3iPV6Azfw4y79YkRbMhexF+XgHZuJXJw0iN9OarujM
 y7DaHW5bMLzUFR4Ew2mzt1KUKZtWR2Oby0BrxFqkNFxhOvMQGxXJO1dJWGRfqicdLc
 A2uW0u7SFFgMelau9rSInKvsxRT223PdeQ1GFq6YQS5asUFFD9FTbZLTzRhkJn6utQ
 0bSGez6IdzXPABGNiaybfIttg7fn16VCgZws3cNldwnjS6lZNRQygcBWhL5NNiUm6/
 Vwe5eBfWPlJxHf+zn3DD11wFNFUcHMlCpAhie15qTfZv+CNreHRrCFfLecM60y410G
 5CUvTgF8lDKhw==
Date: Wed, 30 Jun 2021 13:34:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210630123418.GC5106@sirena.org.uk>
References: <1625042723-661-1-git-send-email-alain.volmat@foss.st.com>
 <1625042723-661-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1625042723-661-2-git-send-email-alain.volmat@foss.st.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] spi: stm32: fixes pm_runtime calls in
	probe/remove
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
Content-Type: multipart/mixed; boundary="===============7974856579721472224=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7974856579721472224==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 10:45:18AM +0200, Alain Volmat wrote:

> +	pm_runtime_set_autosuspend_delay(&pdev->dev,
> +					 STM32_SPI_AUTOSUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(&pdev->dev);

The driver wasn't using autosuspend at all prior to this patch so
there's no fix from that part of the change, the enabling of autosuspend
ought to be split out into a separate patch.

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcZMkACgkQJNaLcl1U
h9DXLgf/dpUymBzs+75+EMb8O8mDM+gMWDyMhP8TO8gcDlEkvTSasetcZbaMyz88
E3/TS2v4YQ1mp1lRti627C1p0nqWhJfGiDQO9G9ihuFQnn/9MwcqmYNj60ycWUDr
aDdHGDoeH4mUSyONrOT56m8+/cNzUu7OopXuG9YGwIXFuy0WIGmb8TzRwOVK9Go8
vNze2q5aSmuBB7aTAVpvqkdw8aUc2di5Td/RV0KxGOFG8TjRXu4jA2KU8acQmsSs
ePWxx2I/jqK+xCTKyFP9wCs0qQxwv5FA6jPY/OBoH1OmP3vI0aii2f4sQW7s6kkd
EiTKkxFYdPz9fIxABY6uB7qnzCwo+A==
=QyYV
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

--===============7974856579721472224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7974856579721472224==--
