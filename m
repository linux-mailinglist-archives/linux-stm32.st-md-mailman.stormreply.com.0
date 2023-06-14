Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE672FE2B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 14:16:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06876C6A61A;
	Wed, 14 Jun 2023 12:16:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44A85C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:16:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C0BE63437;
 Wed, 14 Jun 2023 12:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16384C433C0;
 Wed, 14 Jun 2023 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686744976;
 bh=KONbjq4rJQQJic1hHon1ie/Ekdj395YZ8PBC63PLpeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BRdbC8mQyi1BfZxbcfGcbdMbObXSdrsf9RwceswN5hVqwfT32GTV9pUVM4jWRBMzt
 +wIWm2CG8RNulzEWnADIyPoNve4bgFTusHb1N1iJGc9QL58XcP7aHLEN6M/hfCzxyJ
 baeQxARyeuLWhG1T9dQY57sbRezI+uVYUl/EqSnuU/KZh2dhnZ1ATrFRzWnYqjETom
 XzFiXGIH5Pe/qPsV2zQcEJsqrMNYLYo80BI8ZbKeriWQcgOrzaBJEGdjltNl6+jO8O
 wAAV4EXZT9sfwB9kP3pdoUgmW3+rFZ5D1TqMvLWq8oyl5fWpvrr1VdvnwKUKPnsJSO
 /PLe6lNGN7dpg==
Date: Wed, 14 Jun 2023 13:16:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <d0b62ef2-5355-4c00-9ff6-4ea9995ec0e1@sirena.org.uk>
References: <20230614102628.202936-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230614102628.202936-1-valentin.caron@foss.st.com>
X-Cookie: At participating locations only.
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] spi: stm32: add spi slave mode
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
Content-Type: multipart/mixed; boundary="===============4036574266625689953=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4036574266625689953==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xsbh6SZE0ffTF5Fr"
Content-Disposition: inline


--xsbh6SZE0ffTF5Fr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 14, 2023 at 12:26:23PM +0200, Valentin Caron wrote:
> STM32 SPI can operate in slave mode.
> This series add this functionnality in spi-stm32 driver.

The more modern terminology here is device mode.

--xsbh6SZE0ffTF5Fr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSJr4kACgkQJNaLcl1U
h9Ag3gf+LLqdQq0z4sfFAJOLfVZqO0E38o7KHUE8gSP6VvTWuhZpt6VCzZ9tm5+D
KCcckmQKCsedk6yQAqjyA/udx1gKX2+M6YJzjcdBw+0IlFaar5WfhNHJSFAR6nmW
Ygr69XT2eVRJ+Zefc9vnUyhug6FZyrb4BcjB90kTpIPkGrtQr78v+GADRbU2tMHU
bHjD7lQ6aDYxP3kYjLfz4MHilWV9VctyCT8ryvTZ6Gr1KROhiJ3LECX9DI0QDhCr
GwRBoaCmvNfUD77+AjuRBIyqpR8zBMH4QPoc00jxXwqJky8dLAAknbqbzH9d3czf
jMV62p05IqlFlK/utF7MjJx1DwF6cg==
=YvVo
-----END PGP SIGNATURE-----

--xsbh6SZE0ffTF5Fr--

--===============4036574266625689953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4036574266625689953==--
