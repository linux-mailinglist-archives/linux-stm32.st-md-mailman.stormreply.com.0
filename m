Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB423CA06
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 12:51:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D728C36B3A;
	Wed,  5 Aug 2020 10:51:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47E77C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 10:51:28 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 616D7207FC;
 Wed,  5 Aug 2020 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596624686;
 bh=x3ZHXxquKDbAiA2NrYdhb8ekIS3wwnWPgFDvfXsCgjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tz9/O3MwNWVUjnDemRDBvIBHLVnCwzcZU9KwGVAfLwJL9klqT5BXqz1Xdd8jPqNwM
 JihxqNRzl/tuH3X1xIDDy5h7jYfjdribFzyTkod95UguTpz2DDZsDpOs0iFqDPn3aZ
 SwLoSRPWz174jubsykqQiQ8naeWwRJ0IJ1ilLquY=
Date: Wed, 5 Aug 2020 11:51:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805105104.GC5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-4-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-4-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/18] spi: stm32h7: remove unused mode
 fault MODF event handling
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
Content-Type: multipart/mixed; boundary="===============4623841106132726228=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4623841106132726228==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2020 at 09:01:58AM +0200, Alain Volmat wrote:
> From: Antonio Borneo <antonio.borneo@st.com>

> Accordingly to STM32H7 document RM0433, "mode fault" MODF is
> a special mode to handle a spi bus with multiple masters, in
> which each master has to "detect" if another master enables
> its CS to take control of the bus. Once this is detected,
> all other masters has to temporarily switch to "slave" mode.

> Such multi-master mode is not supported in Linux and this
> driver properly disables the mode by setting the bits
> SPI_CR1_SSI and SPI_CFG2_SSM, thus forcing a master only
> operating mode.

> In this condition, we will never receive an interrupt due to
> MODF event and we do not need to handle it.

> Remove all the unused code around handling MODF events.

What does having this cost us?  Hopefully it's not doing much but if
something goes wrong with the hardware and this does get flagged up for
some reason it'd be good to know about it.  It doesn't seem to be having
a big impact on the code or anything.

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qjxcACgkQJNaLcl1U
h9C+kAf8CK9hJ/6Jc4BQ05hn0nAaypIJAYNq1bv8lExUjoH1m3AeiTfTBbh8Aq25
W/1u3hhb83akhry/0vcVC2vSF5UGKInNhyeb6FRRoqUaiBD2krRo55ZDgmYeD7Ta
F34U8K3C4QbYMpQeKO5ceuZZOadkfjxKrgX4h+ZkFwGXaUn8tIGN9MDZLKyQ85md
ecRl77X3Wt9kX9OxEml6f5UFJvbaVA//arSxikBmyBnFDAe4udEu9PVXHtdJ1pNy
jvw6E20aw6tBoteFTfL1iv36f8kImbVrjGWJjgHEUu2ujyEgQgJfg9xrU3wWIykr
OlTao50KMlI4sHvYI2leN01XzXGJdA==
=gL3F
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

--===============4623841106132726228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4623841106132726228==--
