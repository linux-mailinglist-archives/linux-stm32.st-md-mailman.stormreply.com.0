Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F709557852
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 13:02:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0825C57B6C;
	Thu, 23 Jun 2022 11:02:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2267AC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 11:02:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D195061ED8;
 Thu, 23 Jun 2022 11:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C860C3411B;
 Thu, 23 Jun 2022 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655982171;
 bh=QWxmpYJIQevrOn+jIA9BiDlZ1Jm6cS7KRCVZB/rj9MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQk8I+JcFVSOI+L8cXE8qm9iQ8k8bUT7pZ8ijL0cSccXLN/EnEJluw10gdhEyLr88
 s6xeP9hTwyT3i50PQskxDM7s5sJ2nLymilcYIEePm8cIm44TRyGaEB2yaLeixVYMrg
 0mAYkNT2SfaDKlQsjc/t8JthcQT6mrQJK6lEVobXtbCMLERvjkwCLxxYNMtYejSyuS
 HSovhcM4827L2LVHZT2VNMWzjxl7vsjEsFQKWsfL1FBmkr3e3R9PDrzQmE8758RzF+
 yE7Esv/81d3SjOJ4ZNdwrzouWuT87mR+AC21FSj5henoKNvlHs7tJDzCKhtuX9qPOn
 ITMDCSQZB//dg==
Date: Thu, 23 Jun 2022 12:02:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <YrRIUef2WAs15/Mg@sirena.org.uk>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
 <20220623093951.GG38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
X-Cookie: I had pancake makeup for brunch!
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 kernel test robot <lkp@intel.com>, pierre-louis.bossart@linux.intel.com,
 krzk@kernel.org, linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 27/96] ASoC: au1x: Migrate to new style
 legacy DAI naming flag
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
Content-Type: multipart/mixed; boundary="===============8418501075362945228=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8418501075362945228==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aRjk/oNkrDuhHxkv"
Content-Disposition: inline


--aRjk/oNkrDuhHxkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 23, 2022 at 09:39:51AM +0000, Charles Keepax wrote:

> Mark do you want me to send a v2 for the whole series? Or given
> the size would it be better to just resend this patch?

Series please.

--aRjk/oNkrDuhHxkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0SFEACgkQJNaLcl1U
h9At5wf6Ax7J+7EqACjWVB1NBLm4Fqt/fn2hmYjsWEp5xg2nu64uAExOpqhd88Ub
8EiQ8JJ5Yh+LqGAd+ebgMayuxNfGx/YW+EBYI86mKPNt5JUiC9pf7v5IDM8Tdowt
ItjroWnrAvyu755n93nXekhH53LbekNQZ3r38IqmgYxXfRwuBwo+6LDpWwG+yuZM
qsKAlnQyapzbY/t5/1ziDvbV9Tu1jRGLpytGhBD3ishspCgdES0U6CAXTAiQbGpc
MjSi61J4JAE+Xhu37HN97vid7MjwfolyUldVhZBQk80qRTtR78Iu5cv5Mg1kJ1v7
BEu+WlV4O3xD0frAhInPwl3skpKkHQ==
=ECPa
-----END PGP SIGNATURE-----

--aRjk/oNkrDuhHxkv--

--===============8418501075362945228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8418501075362945228==--
