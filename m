Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C469E4FD0
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 09:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 114D6C71292;
	Thu,  5 Dec 2024 08:34:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 788A5C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 08:34:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 750CE5C718D;
 Thu,  5 Dec 2024 08:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF60C4CED1;
 Thu,  5 Dec 2024 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733387676;
 bh=gKCbD7Svx+y4jFvtnoFhWfAzzEJNorqOmAWV9TmCq9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOVY2eowOfL3vNW8Xwy5XggMKNW3YYHT+8993h3w9/y8N1zctDMuY7oVKQfrb/Shm
 XZoSoyO7+uNHD8uaqywzHVzQdlixDFafBXjnbpSJiNKB7dJ4WF5wC/wYemnYNRPl7D
 30F4TCXZQPxhMIo8oO/P6rN10HxY/wFCS+nieVBBTB/MrCWCHYSIOdCv0G5aSrwMtL
 6cLO7bCYv6wsLJC+NDMaCd93D4AZ01fRD8MBXj3QhMlNNdK3fCbHxiZAYJQ0uLndCY
 TGVt4FZ1Xyh8sDS1ekD1atTSyi3kuhNvWTdcVeG0NQLTn9HuWutbzvaaQuyz6bQrbJ
 k6oIIa9CsKNlw==
Date: Thu, 5 Dec 2024 09:34:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Message-ID: <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
References: <20241205051746.2465490-1-zmw12306@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241205051746.2465490-1-zmw12306@gmail.com>
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, coquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32-lp: Add check for clk_enable()
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
Content-Type: multipart/mixed; boundary="===============4447479737038729231=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4447479737038729231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shdmdu5ypwpb65ru"
Content-Disposition: inline


--shdmdu5ypwpb65ru
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 12:17:46AM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.

Is this something that you actually hit, or just a janitoral fix you
noticed while browsing the code (or reading some checker output)?

> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
> index 989731256f50..4abef304417d 100644
> --- a/drivers/pwm/pwm-stm32-lp.c
> +++ b/drivers/pwm/pwm-stm32-lp.c
> @@ -163,12 +163,16 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *=
chip,
>  	unsigned long rate =3D clk_get_rate(priv->clk);
>  	u32 val, presc, prd;
>  	u64 tmp;
> +	int ret;

Please move this variable to the block where it's used. No need for such
a big scope.

Otherwise looks fine.

Best regards
Uwe

--shdmdu5ypwpb65ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRZZUACgkQj4D7WH0S
/k4TXwf/Wzw/hs8+EisqpH4An6STPdmc8pwIJCKQu1lwE6fQKkTYk5nYTs4JMxRx
9JLhTTsBNGJrQ3mjJrjjOEPscREqkZoVBxdlZFEPaPpYukjgvSiYQwvPERXQNqbR
y+Xb+CZuo5cITA51Jd3UDRIHktAIABl3Ox8GcqDhGgMq1Cje+XE24dwQ85kMyFJq
2ncZRb7TuNhF9XtQkUmGcWXsEUq5iVlhG25UziKlX+ZhMz9MJaU5LnVOFSy9HAPb
DTUS7vmaNGJiePZagOduLZ5Z/f7q/xMu311Xi4ylcjc59I54Ohp+VKuEnTMVzqaR
R1M+5N2Zbe9/BZGXpnHvfs9MOLb7pg==
=wFbu
-----END PGP SIGNATURE-----

--shdmdu5ypwpb65ru--

--===============4447479737038729231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4447479737038729231==--
