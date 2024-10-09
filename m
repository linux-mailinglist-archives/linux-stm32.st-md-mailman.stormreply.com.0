Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D499716D
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 18:29:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B0CAC71290;
	Wed,  9 Oct 2024 16:29:41 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C90DC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 16:29:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C66DA442DF;
 Wed,  9 Oct 2024 16:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA94C4CECE;
 Wed,  9 Oct 2024 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728491371;
 bh=WpKDaxI/W+NgcFtv51vOUNwp4op6/pUKdULfxWhhdvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYpjPk0pqIGNTD3ujE4Z/aMlU3dLX7DpVkbtdJCHTW2ff+r8vISInbPTpbzIQVw0b
 n8pvIg8BtbsXlVSxqW9Pn2Ceym/nK3O15mB7o+RkIO/j3k2e9mfXkiooLJNJzwiavk
 9PGEcj+Sd+6/pwvoB9lr/48uJuswyAJpJN9G8zlwCKLF3kuvG85cTF4SlLi5BSPZzp
 eMJErYmjbY2hTXJjc9c1XXPjMD/bsEZwYt/NfxyZZwoJqvEAgfSCmH8zR6dpl47v8W
 zqWcn7jXqaFYiecD3ycUFH/Uwn6kFQlTwRvc9wqxE/3vhAS6aIXGdpEpZmN4ZhTlad
 tiSc6+s8RW5HA==
Date: Wed, 9 Oct 2024 17:29:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZwavaP0QHQCyDbtB@finisterre.sirena.org.uk>
References: <20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com>
X-Cookie: Editing is a rewording activity.
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix missing device mode
 capability in stm32mp25
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
Content-Type: multipart/mixed; boundary="===============8737101225935754068=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8737101225935754068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nhlvC0ehYU1eXsqp"
Content-Disposition: inline


--nhlvC0ehYU1eXsqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2024 at 06:15:52PM +0200, Alain Volmat wrote:

> Fixes: a4e7908abf0c ("spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc")
> Cc: stable@vger.kernel.org

That SHA1 doesn't exist...

--nhlvC0ehYU1eXsqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGr2cACgkQJNaLcl1U
h9BQYwf8DJmILKbY03TZr3Z+bBleGn5Ey9cfwTqSEWz24LYOMrmDUe8h4EhJpwrv
/E3XpZC10q9Cj8nEJiTBOX8PW+sFKFZdKj8ej9DcufTn9ihaVrq4i6TzdX19cUFq
BBkbxj/6jyBJD3Hjk+c7jFoQHGPBkdV/6+/KbjpExWnSLZvv5yBRuVvVMusiFUmj
yfILJeZSYjAt3pHqeie+RMEiyw+5+ga+ZwKy13S5v56JG9HEEnre+9GPN7SW0cIm
B2ksBiCORK8O/BDdmfZAT4iFz0QivhByfRIGLLlL6OpfvK5oXXW9DO+qvt+r7g99
P9bWBZSNrbaIqlDvQEgvip+vdiLqMg==
=UQzM
-----END PGP SIGNATURE-----

--nhlvC0ehYU1eXsqp--

--===============8737101225935754068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8737101225935754068==--
