Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9983CA8125
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Dec 2025 16:04:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B90AC5F1D4;
	Fri,  5 Dec 2025 15:04:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D9C2C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 15:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ABCDD444B6;
 Fri,  5 Dec 2025 15:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2394EC16AAE;
 Fri,  5 Dec 2025 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764947049;
 bh=fWc8yd+0bDzCw3qQ5ygXRxbKCfMlTU1HktkdP0IaG3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyjA9VzuPNg3rClJ43uxFcvXJh26Dujge/ihCyQA1zwNphKcpff7bqSLelH1EEjUv
 3zlq3QrL1y7Wn/obZsDzR6S50GJ54N+BqFL82ruzjq7Iv/XkQNQMUGS1iISzK6FSLv
 qxarYcrhx+snd8r101zVrXWYohoANbdxOBBgLdiruzTFOpDXp23WpNLa32Uunt95mc
 SAWwrauV1m0jvZZ80kHKmH2VmLVDNmKhH+T6JMBKTJFKHRHI6eSbyV0hiZQQ8pQaQi
 N7wXrzfAG5E6VwdsnkCNThKL6aT0rqEhPoC3WvcZJLlCoHU/XbQd62c9uBQMHHzixe
 CguBMWGrY42Tw==
Date: Fri, 5 Dec 2025 15:04:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <3c621482-ba56-4136-aabb-f7614568ecab@sirena.org.uk>
References: <20251205-upstream_qspi_ospi_updates-v1-0-7e6c8b9f5141@foss.st.com>
 <20251205-upstream_qspi_ospi_updates-v1-2-7e6c8b9f5141@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251205-upstream_qspi_ospi_updates-v1-2-7e6c8b9f5141@foss.st.com>
X-Cookie: My EARS are GONE!!
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] spi: stm32-ospi: Optimize FIFO
 accesses using u16 or u32
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
Content-Type: multipart/mixed; boundary="===============0162602110363646090=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0162602110363646090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7csFwg/9ZLrMWD7v"
Content-Disposition: inline


--7csFwg/9ZLrMWD7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 05, 2025 at 10:04:52AM +0100, Patrice Chotard wrote:

>            before        after   gain
> Read :  5693 KiB/s  21139 KiB/s   371%
> Write:   765 KiB/s    910 KiB/s    19%

Nice!

--7csFwg/9ZLrMWD7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmky9GQACgkQJNaLcl1U
h9CS8Af/T+OIuHNNRgwiBToaS3fETPsSl9l1OaArD+o69QCQXSl2pkKOjHkQH4dx
bjtZv6/8//pr0OA0iy6ByRrQFs0x2wFernGEbHHTlrvaexOdYDXeurN+SEcC+wvj
WVYVhSireSHS0yOxmBzpkAQhAH8dSKnVc7/uXwXXNJoYtlT/7PM1vn6P+qaW4AXJ
jTsIwRNU6qXFfV7kePUnZ2bybXN9DnfvcOJRTIqsH+cOEGC049z+7aqEtfb4lOW/
W5yOFBv66JXdnsydbCNAJoGDeTCaEPCtnhf7P5yzYWJN5vBYqehzfWuqVZ57p9j1
lVgq/I2sNCFqD1CyzIsyXNZ4SiOLAw==
=HYqh
-----END PGP SIGNATURE-----

--7csFwg/9ZLrMWD7v--

--===============0162602110363646090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0162602110363646090==--
