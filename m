Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDF9F4FDF
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 16:46:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB6BCC78012;
	Tue, 17 Dec 2024 15:46:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17266C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 15:46:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D056A41AB2;
 Tue, 17 Dec 2024 15:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F786C4CED3;
 Tue, 17 Dec 2024 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734450383;
 bh=ru/q+OLGAIOy3QN6Qk2nhuzxbhuGYxQydpgLzzKFXdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4tBmVlf2a9CV2oWg8wZRHGKdVamvAT4WqSZfWlCDb+hK6/pA+pcZMe3hRlC0q6GG
 D4DdkHQRibVHNIXDxlP4HkGR+Tmm7zZKibNYyT3Le0eSR+0zGJLJ6frkbzH6SlUIec
 kmohquthw4MuVytZTMmvw3jaC/sJTKbRwROGG9SX5lCBSyXBsfoXkS6/u/oWYcFvo3
 vXW2O5DRUG/3HdweNMCM1OYITNF5jjTVPGVnRApRz7jrmtv7JfsX6mcN4lOsWoryUN
 yqmx5Gb9cqBNZR3Oa01fB7fx4+xQzuoiRT4e9Gahdol43ZCHcYSIBgcWcEl4Qk6VgI
 j9NZZ7Ta+ZIpQ==
Date: Tue, 17 Dec 2024 16:46:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <dwwbefhhvjczcakd4nrrunzoq7mhzwrxxpm7gdtabgm6flk4cp@5w4usax4n67h>
References: <20241217150021.2030213-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241217150021.2030213-1-fabrice.gasnier@foss.st.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: fix complementary output in
 round_waveform_tohw
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
Content-Type: multipart/mixed; boundary="===============1526921523455161691=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1526921523455161691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbozxwrmepqihx7u"
Content-Disposition: inline


--qbozxwrmepqihx7u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: fix complementary output in
 round_waveform_tohw
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 04:00:21PM +0100, Fabrice Gasnier wrote:
> When the timer supports complementary output, the enable bit is
> overridden. It should be OR'ed. This makes all PWM channels for
> such timer not to work.
>=20
> Fixes: deaba9cff809 ("pwm: stm32: Implementation of the waveform callback=
s")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/pwm/pwm-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index b889e64522c3..17e591f61efb 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -84,7 +84,7 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chi=
p *chip,
> =20
>  	wfhw->ccer =3D TIM_CCER_CCxE(ch + 1);
>  	if (priv->have_complementary_output)
> -		wfhw->ccer =3D TIM_CCER_CCxNE(ch + 1);
> +		wfhw->ccer |=3D TIM_CCER_CCxNE(ch + 1);

Oh, indeed. Thanks for the fix.

Applied to=20
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes
and I will send it to Linus later this week.

Best regards
Uwe

--qbozxwrmepqihx7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdhnMoACgkQj4D7WH0S
/k42SAgAukU0izAyfSfEHr+srRGWulhaFMrUOYDLRgBWAa5ELJaS/8gHKrhtj2om
rFl31JAs/8uiXYgP2w4Wlui1qJma5JH1qWpDjAsYxepnNRJMWENSjjiU/I8lKiiJ
Mk9cKUV4uZlrG/wWNso9OnNNQgeQgjysqkEvcbWdSTza65lZMKLMjy4ar2aLVCIQ
wP94l6Fe3WFDvoedqb2jMlGOIbbOYxV3zxeec91jo3AJMIAGXVwFngeU1sKNqSgR
ReR741ODSY7Alqjm6RpstItWz4nR0J+cdYwnAffA/J7UBQGlKZ+sfK/U8xrfS0YZ
v0QpIr5tXXha04SFh12DaiQ2aztudg==
=DF95
-----END PGP SIGNATURE-----

--qbozxwrmepqihx7u--

--===============1526921523455161691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1526921523455161691==--
