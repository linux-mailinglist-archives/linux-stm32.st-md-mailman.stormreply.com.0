Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51F58EDB5
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Aug 2022 15:57:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E321C04000;
	Wed, 10 Aug 2022 13:57:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB4F3C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 13:57:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84ADA614C0;
 Wed, 10 Aug 2022 13:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD2AC433C1;
 Wed, 10 Aug 2022 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660139860;
 bh=8U9yFOGIsXPYWmmnHIYLkHpeD5RKwBawgrNQqyoYFfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N2HOEhRqGwBfJPfdmKK0Bn6Nzt07oLlpSXiNyADoQ7PN0jhltBCRr6m1p6CtP/XE0
 UO0ylwcggBYllVAIfR4Lihsq2rGG1HaPBug1pa50c8GpEvmmUPzMJ+xDyMhwUfiU+r
 oiJ11orrOdDYtHDX3fjUqeaFvcziXD9V8JTufeieE0LDb/PYDxyk0Qgw9vy8VWve76
 y1J+BBupGRONFNsNFXt4syOMPrkC8wcKGh/QNft8y8LbHjebDyYzcAlUo6KBpIkheV
 pc6IHhdr2K24E4mBJ8sI+VDFDwn85QTCzuj5/meMCk2tevBN9B7vdcSSTCo2mRVKco
 04I0CZHGv7CXw==
Date: Wed, 10 Aug 2022 14:57:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <YvO5UKACe2FMa5K4@sirena.org.uk>
References: <20220810093215.794977-1-patrice.chotard@foss.st.com>
 <20220810093215.794977-2-patrice.chotard@foss.st.com>
 <YvOtZtrRHd4AT+j+@sirena.org.uk>
 <d41e3814-3fab-18a3-7218-d5c28eaecff8@foss.st.com>
 <YvOxOg0vXSGrZLfP@sirena.org.uk>
 <38200a6f-fdc1-fa94-7bc6-91ca528235ed@foss.st.com>
 <YvO1U7VB7WQv0oKR@sirena.org.uk>
 <cfc882a2-c8f3-0ec8-706e-a16dccc9fda7@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <cfc882a2-c8f3-0ec8-706e-a16dccc9fda7@foss.st.com>
X-Cookie: First pull up, then pull down.
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] spi: stm32_qspi: Add
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
Content-Type: multipart/mixed; boundary="===============8116080532707110974=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8116080532707110974==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qp2XHivCik8DSJHB"
Content-Disposition: inline


--qp2XHivCik8DSJHB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 03:52:39PM +0200, Patrice CHOTARD wrote:
> On 8/10/22 15:40, Mark Brown wrote:

> > Can't the controller figure this out by looking at the properties of the
> > connected devices?  You'd need to just return an error if we ever
> > triggered transfer_one_message() on a device that can't support the
> > operation.

> It should be a solution.

> I just noticed another point, property parallel-memories is an array of uint64 which represent device's size.
> In case a FPGA is connected to the qspi 8 line bus, parallel-memories property will be set with what ?
> simply random value to make dtbs_check happy ?

> IMHO, adding a new proprietary property would be cleaner.

I tend to agree that this is all rather unclear for things that aren't
actually storage.

--qp2XHivCik8DSJHB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzuU8ACgkQJNaLcl1U
h9C8lgf/Ty/PVO0gORA+r8yXkatIJMlVbunpNkmNDYE+OPE1h59+rHpcNnt4pzcv
JACDJhEStqwIsqNOfBxHD5J7D4+jbRvCXhiL70yqKhOTw64DkUa65AJY136SSqLS
XGvpjz1QMv98fljk/zS1PBDAQ8ysQ7xtY2wxQh+aqelNiTgsDb8TFC/T22C/iDxF
2tRbU6HlL6VKoUUKHOvB4lBuTOo2gyMuloxVASblBnOqOO8Sb9er8P1ka4R1+BxE
76U+2YCwNiDOZaug7c39cUKHWwYXwArj7TUlSszHiROFyHe0pkW0m/G550FVa9uF
r5LLiJ7asVOVuuRyf5ow2bvxvAl6Yw==
=Ovrt
-----END PGP SIGNATURE-----

--qp2XHivCik8DSJHB--

--===============8116080532707110974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8116080532707110974==--
