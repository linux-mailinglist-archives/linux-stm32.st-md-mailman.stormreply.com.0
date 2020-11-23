Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 244782C16A6
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 21:40:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAEF7C56632;
	Mon, 23 Nov 2020 20:40:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37C9EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 20:40:54 +0000 (UTC)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC74E204FD;
 Mon, 23 Nov 2020 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606164053;
 bh=l4oI3EJf9twL417qKLDDDLHkuxNIhLOKXfN3lkF6Kxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dI6Y/FEBhMomP9yXJDZL18c5N1fJUnSufmLsfsEErCEx1I73uujBVn+VmR2nTBil2
 7st2qM1JoV+aEr2XQJCNbg/JTowpnkJOkAAUW5m9jaxq8C/w1ZUMTqrjWm7inA4kgh
 US9uOR3tP2rC+WdSErFnKjZ9+DgugTP0ToQkJ/y8=
Date: Mon, 23 Nov 2020 20:40:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20201123204030.GA21709@sirena.org.uk>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
X-Cookie: Will stain.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 kernel test robot <lkp@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to
 fix compile tests
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
Content-Type: multipart/mixed; boundary="===============8600703495298045716=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8600703495298045716==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 06:51:30PM +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):

This doesn't apply against current code, please check and resend.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+8Hj0ACgkQJNaLcl1U
h9BQUQf/Zb+qnudCOxcpsy60ses8As7w+FYZS80ubduXvGWgILbXemT1oMzbNgmK
OBkiqTnFNc6tff+PV8KL223IYl0NE87wbj+TZtPLS2kwcmLzGYN5Nk6tOJ/BqNaL
NZGwQweuvCXNOZgVaqRuCp2am79NZzjniDlGELtbcdX1bnrbKQqrpfl+OQYOXBxs
u/xwWXzpd63eM4B4tN8a4S3TsUzJvuypdWshYHELUV5vsxSCXp1NWiire0N1SPO7
bnkqkZUg10ymAq75x5OE6laeMbsDfwWnS9tRnOJxnN4H8oTMcmzxTQiFD0922P0s
w0Jrqx6xOb9ZoR7U22kR1FHwhkpH8Q==
=Zs8x
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============8600703495298045716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8600703495298045716==--
