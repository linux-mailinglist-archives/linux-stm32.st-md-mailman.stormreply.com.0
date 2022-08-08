Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7EC58C973
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 15:30:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E24C04001;
	Mon,  8 Aug 2022 13:30:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6984C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 13:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22A4DB80E8B;
 Mon,  8 Aug 2022 13:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B98EC433C1;
 Mon,  8 Aug 2022 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659965404;
 bh=a11PrFr0QU2TMyjEjHd+D+4ZCEi56EIcD/sVdbPA3TI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuDhuwm/QcTsNh0is7t//3B9+WHiIeVx3ZPjdyJFyhaQIlDI9bkrYIfyqbntMFhS9
 M1YTVKshagYN9BdY3hHlXibw4YOp61AipofX35bPepSo40/IN9bDHAS9t8aTLSNEoQ
 /maE81f8ccwW5SFOO0BcZyUWwOqDhNurpW1QDIuxpYRHokbBZAzYF9UWSBZHIVaMnY
 CEke5nKo+Ny0U0wWF8mx35fHbr4/w7cEXyCoHk+1J0j2n8mFj+Hh4JP8Gym42dBttp
 2dpxkEUoBOJ5qyISKDmA9HpORWlZlvBQV8+POdgMOeVsi2Hl1yLSejntcmCQvTres3
 H4UmlRnhvB2Kw==
Date: Mon, 8 Aug 2022 14:29:59 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <YvEP15/7KmQGyPgL@sirena.org.uk>
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220808074051.44736-3-patrice.chotard@foss.st.com>
X-Cookie: Flee at once, all is discovered.
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] spi: stm32_qspi: Add
 transfer_one_message() spi callback
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
Content-Type: multipart/mixed; boundary="===============6411990651144845024=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6411990651144845024==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cLMWiIMhBnFRWQta"
Content-Disposition: inline


--cLMWiIMhBnFRWQta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 08, 2022 at 09:40:50AM +0200, patrice.chotard@foss.st.com wrote:

> +	ret = pm_runtime_get_sync(qspi->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(qspi->dev);
> +		return ret;
> +	}

Use the core runtime PM, there should be no need to open code.

--cLMWiIMhBnFRWQta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLxD9YACgkQJNaLcl1U
h9B5sgf+In74ixHnCRZMTBmlDnGq0rbz2vl15eopttvjouYl8KTYKUmRnu8dfafd
nscthycpSYVRecbPtNW3Q1PoEOg9x5iEwUtC7uEPmk2oWD/c2Ck2691Zd5aUA18r
aOPa0BO3D/TPDhAwWfI6jPIcNbrPYksSL2yFSRogAeBhq3ze/USWI+6IOspS6IR9
uvkG/XI2gA6b5CcJBXQsK40bZNX97y4QnKtzWLERmPDe3s+ljYTdJf0+djVVQg24
Oi67dvkkT8FFu8Je4S/bStR8rNvksD40FnM7RYU7Z+200TzNcRd/NCBrfAx5xSuD
BAaW4TcV9hF2egVdRVLL+xLtZR63Ew==
=y3IU
-----END PGP SIGNATURE-----

--cLMWiIMhBnFRWQta--

--===============6411990651144845024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6411990651144845024==--
