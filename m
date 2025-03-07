Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6FA568C9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 14:24:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF99AC78F95;
	Fri,  7 Mar 2025 13:24:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A85C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 13:24:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BEA85C57E3;
 Fri,  7 Mar 2025 13:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340D7C4CED1;
 Fri,  7 Mar 2025 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741353848;
 bh=9OCou/LxbyRarhdBQeea7UlQ71nAsQw9C80k68D611o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gfuiCWPm2uKw/bA0VZBhF8DvMN4wC3kmsCCSkVg3wQWJ5U7R+GXJRPSD1cOCy5zQu
 F0tv3C5Or9FtqrXicOro/2LlUsst/NGLfQlses9yin2wxMXfg61LWcx+L1tVWyZg+F
 KYTF+LiktZxrE2nYFfE/aPFyxVbGp9V7K/wHEyUOZCNoJXRZZ4hxQHICr1fLowvAFR
 arY7ZGqbHCcAS8i8srEL3Uvn1n+q7pnB4ItpQ+5S9baEFZfC1vzO01fosU9R5WZT94
 KC/ePncWmhWoe2bcsomh0P5zxsMOYFhpaRKRFHHJDZs+lUTJtp7PCJX8vGRS/njkvT
 Q77DT+ikKhvzw==
Date: Fri, 7 Mar 2025 13:24:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <Z8rzc8suhKPr5SHV@finisterre.sirena.org.uk>
References: <20250307032530.116837-1-hanchunchao@inspur.com>
 <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
X-Cookie: Editing is a rewording activity.
Cc: Charles Han <hanchunchao@inspur.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Fix a NULL vs IS_ERR() bug
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
Content-Type: multipart/mixed; boundary="===============7504138327179063801=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7504138327179063801==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKhienEiuUGd3VD1"
Content-Disposition: inline


--fKhienEiuUGd3VD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 09:59:42AM +0100, Patrice CHOTARD wrote:
> On 3/7/25 04:25, Charles Han wrote:

> > The devm_ioremap() function doesn't return error pointers, it may
> > returns NULL.  Update the error checking to match.

> No need to copy/paste other contributor's patch by just swapping some=20
> words in title/commit message.

> This fix has already sent By Dan Carpenter and merged.

No idea if it applies here or not but since a lot of Dan's work is based
on static checker results it's quite common to see duplicates of his
patches when someone else runs the same or similar checkers - I think
all the people running these checkers are aware this happens but often
figure it's easier to send the duplicates than to check -next.

--fKhienEiuUGd3VD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfK83AACgkQJNaLcl1U
h9C6DAf/SppwraYcs3hm+tA8JgynoM6XNXFnzcupDCDn8T1COBVOwH2vXjv1IxaL
NtNktXiNdmlS4s1gVJK/xhlNTf24sa+SCj4AiRZd7gVhM/3ajKo/ONnUzTnBsmhi
QdzADx/vYjhHj1kLjG9srDIs5nDtP1lCfcUimCxhu57dZHzEiT4yDSnrQfYZNKva
lvKvTckBdBrDfDmzSAOV9BHmHOZdeeGsmbjpHXXaao2Q5VhpdYO+HG6lds7TzPWw
KJJROXJwjT8hsdstk/n7PyT5C183z/8l9D9Mj0qPqF4Dzd0LfdMig3eTJz/E2Lvd
Okl9rsg7Lkrf0YNo52PA0NMbLNgFKg==
=YO1O
-----END PGP SIGNATURE-----

--fKhienEiuUGd3VD1--

--===============7504138327179063801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7504138327179063801==--
