Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6226A8E2D
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 01:32:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F341AC6A606;
	Fri,  3 Mar 2023 00:31:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C088C6A601
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 00:31:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D18F3B8161C;
 Fri,  3 Mar 2023 00:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226B3C4339B;
 Fri,  3 Mar 2023 00:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677803517;
 bh=PZRHS2ZDdyUW2dpnwGHL8YvvYRiGH5FDvsJ/j7DwmM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzSDzBpz4fmFCbf3D1QuAA5mncF/iT7AlnCAoZTPzzGNhp27+T4uKk4/KA/29d6AH
 jZBdTdlj3JWWwgY5NOnDk8eQpPrDqadh4vzzjPIYuhl1sjAL+WCT6NZUHXlNvnGaKa
 rT/xQVNO4Crgsog3RwPmMYlkyOTTjXCvuX9hR5/dOSFjdDazNueZcw9qtC57sIBWxZ
 9BccpcAHYbx+GY2bnb//I8GR4j4jbVutCEh9k5Sdj0HYBbCXVPQbbWwcN+MxNLuvOD
 EDZJJp3NZ7uvzmaPhp4Ueb8mGepRj7+vgXZP24rYw7ZGfgE8Mun91CBpVK/buHDyuD
 1hzS1G8SEfvCw==
Date: Fri, 3 Mar 2023 00:31:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Message-ID: <ZAE//jJ0GHvLN1m2@sirena.org.uk>
References: <20230302211759.30135-1-nick.alcock@oracle.com>
 <20230302211759.30135-14-nick.alcock@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230302211759.30135-14-nick.alcock@oracle.com>
X-Cookie: Single tasking: Just Say No.
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, mcgrof@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 13/17] regulator: stm32-pwr: remove
 MODULE_LICENSE in non-modules
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
Content-Type: multipart/mixed; boundary="===============4903194201534791884=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4903194201534791884==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZDUqYhnMhlBcRxOs"
Content-Disposition: inline


--ZDUqYhnMhlBcRxOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 02, 2023 at 09:17:55PM +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro

You've not copied me on the rest of the series so I'm not sure
what's going on with dependencies.  What's the story here?

When sending a patch series it is important to ensure that all
the various maintainers understand what the relationship between
the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or
at least copy them on the cover letter and explain what's going
on.  If there are no strong interdependencies then it's generally
simplest to just send the patches separately to avoid any
possible confusion.

--ZDUqYhnMhlBcRxOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQBP/oACgkQJNaLcl1U
h9DY3gf/Ri+5vS1m3/yKzksHQgSn4OR0nHC4qjB5n39Me0giqfbnkLhJvJ3Zs8dd
36YSWsKIE6IszlJcJO097L7r/O6Nb5tct7Gwhw5HJFC7KZ63CbLjl/1mQ2YNc23w
TwCYthOfm4cLjStFjxkTCBZtKuuaI9yqZnYwIX79+hAzPQ16RgUsna9SEYI0LxtK
jPS9KUw0FIBXKmxXvaybwQJFVBHPDwPlHx2+HidUJ4s3zpvzJWlvB9pUc8FkjZoY
MGoy3/CiZnDy/05osLyb4UdmKRlg5+D+8ehNWQWrxGMy6Gdzm+0g2WeRFjkwHopf
+VwWGTp7AlMQIdV9r9yxknKPZzbZiA==
=mlc0
-----END PGP SIGNATURE-----

--ZDUqYhnMhlBcRxOs--

--===============4903194201534791884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4903194201534791884==--
