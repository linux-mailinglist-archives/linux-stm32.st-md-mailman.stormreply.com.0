Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F758AF9490
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 15:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1DBDC36B2E;
	Fri,  4 Jul 2025 13:50:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2A5DC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 13:50:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DB1A5C6367;
 Fri,  4 Jul 2025 13:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAFAC4CEEE;
 Fri,  4 Jul 2025 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751637029;
 bh=H8pS8KHBQfQCZOxaW9Nq6KsExgCXwxkJothpg5OYWxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWRM1iZDqc8SoZaQPC8XvcPUt2jHoSFrYDSEVTnheFxunM40lgJSfNI9Cx1HXts/P
 97RoWcEjhifrX+fWcApr5fRkNtO8+oXdBgQCRd8DOZLsGieMB7oboGkk5GZoiSeLme
 I8JZgiYMgEKeup10LZ7lJZian7zgFkHq7xTGazB1AvXxyr9RBnjVfZ5fKPauEueK7z
 StABYyemKJTjlPsIbyjzh3Qh1GjXwWEjUlJi8Or54bb5mAaojIHE/Vh3GnQhUukFGa
 cISdUHoazFZfLMOa6RDlihqD0VkIOJmbMZ6YukcsS7/r0WLIe+Ja/dJBX3iIaDURHi
 XVVWokqBV7jQQ==
Date: Fri, 4 Jul 2025 14:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
References: <20250703183537.2075746-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250703183537.2075746-1-robh@kernel.org>
X-Cookie: f u cn rd ths, itn tyg h myxbl cd.
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
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
Content-Type: multipart/mixed; boundary="===============0038408149216494477=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0038408149216494477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lr37qIzB0o1A4+Ag"
Content-Disposition: inline


--Lr37qIzB0o1A4+Ag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 03, 2025 at 01:35:37PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.

This breaks an allmodconfig build:

/build/stage/linux/drivers/spi/spi-stm32-ospi.c:775:23: error: unused variable 'rmem' [-Werror,-Wunused-variable]
  775 |         struct reserved_mem *rmem = NULL;
      |                              ^~~~
/build/stage/linux/drivers/spi/spi-stm32-ospi.c:776:22: error: unused variable 'node' [-Werror,-Wunused-variable]
  776 |         struct device_node *node;
      |                             ^~~~

--Lr37qIzB0o1A4+Ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhn3CAACgkQJNaLcl1U
h9DVRQf8D1AxmRv5Ojv+GEHol13LiGp7nkJN0LfuSBN6gWwV5TqcAVMFganzfiNP
XEh8akPtA7v3GAW0p3oNRN2/IrzP3kJ/XMkd65XCNMjL/eSWkhumXlAm2eG3x4I1
9QVOAHniUh7usC0bnhTMaNHvq7NQIrg0DSrWH3GkN5Zu53mYnWo8CXCYxqBEtJ/Z
vyJEvDWeyvubDhQT/rjARru7quA0vGfW9Kk5Z8tUJVrJYv6EhU3UKjfSr+FxNLsA
0ZAPRipto6tHlUe4f+BZfvvI2vAJ9r6d/vd4y+J29NAxB7/YF81V2qcs3Km7SdUS
vU4DbbrSRKtZlkaS1N4s9BYJIhO5ig==
=4Mpz
-----END PGP SIGNATURE-----

--Lr37qIzB0o1A4+Ag--

--===============0038408149216494477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0038408149216494477==--
