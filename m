Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 870EC6E53EB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 23:33:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33618C65E70;
	Mon, 17 Apr 2023 21:33:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BFDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 21:33:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB4B62AA8;
 Mon, 17 Apr 2023 21:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745FFC433D2;
 Mon, 17 Apr 2023 21:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681767230;
 bh=DevFUD2pXPhn+7qfSYqBFbAMM38Bh/J+7pB96YIeCO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADfEtqMR+K4KEUM0j4f0TkpVqPh5F4A4S6hW7z0Ozghn/n4W0SwN+di2Rii8laW3E
 KEEblr/tirCyldF9c+zbPrpYJhpGlvSPqaZnrjffWzBC7XBo/++bapkyingkVo32sP
 4FSGNeCkMe9CfxgasFku8iN8zkQXkHfWVhhAxl6mdJiw1LzwaFB6Jk56rwjrVo2ab/
 pq+GI20Ik6SYZ9AZZweW+vTTvEZ6hq0lA+KQEVPaL5parzQyLz3EKho4sXGx0epz4s
 kwq88bnUHlZW4t4C2HVvhm3wrkYMR6UnCBfsBHSDPETfGhe7p5UbgzNNTylmiJuMF0
 TvMi2lclY9YpQ==
Date: Mon, 17 Apr 2023 17:33:47 -0400
From: William Breathitt Gray <wbg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZD27O3l1WMPSQnzy@ishi>
References: <20230413212339.3611722-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230413212339.3611722-1-u.kleine-koenig@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 William Breathitt Gray <william.gray@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Reset
 TIM_TISEL to its default value in probe
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
Content-Type: multipart/mixed; boundary="===============3189560914115244996=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3189560914115244996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="if/W+Y61PnsCB3GM"
Content-Disposition: inline


--if/W+Y61PnsCB3GM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 11:23:39PM +0200, Uwe Kleine-K=F6nig wrote:
> The driver assumes that the input selection register (TIM_TISEL) is at
> its reset default value. Usually this is the case, but the bootloader
> might have modified it.
>=20
> This bases on a similar patch submitted by Olivier Moysan for pwm-stm32.
>=20
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Applied to the counter-next branch of the Counter tree. I made a minor
fix to Fabrice's Reviewed-by tag line for the missing closing chevron.

Thanks,

William Breathitt Gray

--if/W+Y61PnsCB3GM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZD27OwAKCRC1SFbKvhIj
K+cOAQDeYS4l9+RlqHr4D7QYrKZxrerhqbYBTIvV2vktTXzPIwD/dhyY5SuBy/hf
gGPzZn8MPwGhXr9LAN8tnKpuZwaoCgc=
=AAdE
-----END PGP SIGNATURE-----

--if/W+Y61PnsCB3GM--

--===============3189560914115244996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3189560914115244996==--
