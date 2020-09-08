Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9E2611F8
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Sep 2020 15:23:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8650FC424B1;
	Tue,  8 Sep 2020 13:23:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC763C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Sep 2020 13:23:29 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F172723BE5;
 Tue,  8 Sep 2020 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599571408;
 bh=pUEfMpq/UYZC7azZMZ5kSA/t1DHYIvIV/tbSmdkMHt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F0S8l6qu0IET3EzvZa3BeHFC0eAm7E2aMFtOGtSg4MVL1uz8Bf2WvkYY7OEOJOI+g
 zeE2vL5jNPiS75krNhH/BAAmujRDEfwUzgv3ohTAR5HKdwMAWJxGwat9vAFf1wxe4X
 hSjqMSsMuTCoX1v0XkWWt2kLar5QEeFnSbqv1oqs=
Date: Tue, 8 Sep 2020 14:22:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200908132244.GA48155@sirena.org.uk>
References: <20200901152713.18629-1-krzk@kernel.org>
 <20200901152713.18629-2-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200901152713.18629-2-krzk@kernel.org>
X-Cookie: Remember the... the... uhh.....
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-spi@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 02/11] spi: sprd: Simplify with
	dev_err_probe()
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
Content-Type: multipart/mixed; boundary="===============0241522719232399410=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0241522719232399410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2020 at 05:27:04PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.

This doesn't apply against current code, please check and resend.

Applying: spi: sprd: Simplify with dev_err_probe()
Using index info to reconstruct a base tree...
M	drivers/spi/spi-sprd-adi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/spi/spi-sprd-adi.c
CONFLICT (content): Merge conflict in drivers/spi/spi-sprd-adi.c

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9XhaMACgkQJNaLcl1U
h9BD+Qf/aECmurEbZzuMemn3QkE80q0VxXmiRjrG37cSIuZiDfm3np+BN4O6qef4
jaozUFazSi1o8PpDSZtZmUuUhXIxs1TnlfIiET/a770NsLAy1CiCZcV7oIY2KWQ8
5h51M2zOavV16MTiPa3BpaNJig5ZCrrltr+cVzP8GZ8ZlQRQJxS63yHkWPEvJ6jP
N7nQ1JidLKkucxQveOxuFd8fUEajsGwJboKYBcFWL10Ga6A5aZOwNb8/fsjiu8sx
KgGKvEZgoTfhhfGX5kg6s7ZWdCRLyyaSekjAXtY6ECQL6j4RHwGcx5sHqRUKR0pS
TnET69OatkEPU5lbOiMrQS1KC+ycBw==
=hY0h
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

--===============0241522719232399410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0241522719232399410==--
