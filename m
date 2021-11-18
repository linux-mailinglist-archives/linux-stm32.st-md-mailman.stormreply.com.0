Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE42A455D15
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 14:56:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1DE3C5EC56;
	Thu, 18 Nov 2021 13:56:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3726CC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 13:56:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C1AE61A88;
 Thu, 18 Nov 2021 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637243814;
 bh=WyD60zF4TADv7Odqa4b6XduvB11Zc9zW6/nl4Y+HIfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSNT3NisYQGLoK+k8jV9XStEAIBSLtOy3AwfJ3ZsSdbitcJgpSr45ucmlAkBoM1q0
 cFrD8wtYUSDxLvO76PmxuTmrsSpE2XY+lNKTGYAo9CEqBKa7/is0HSuNRXSDeIb/aD
 eVQyF3z5QqqpTDmPvF2q90VPMs2bKGtG8Zctjs5+JwqTOLA6gZVWXqJTcgo8C624kz
 +tB42/Jj7G5+Rdv4ff29qSci9IFMLFnYxf9KOiPuXOIAQzsmYWgFQtI0q5mU24jGRo
 aOlghhOy1yLc0genpTVf7xhF9rNw0rOF0XpMWGJMF18nVklg91gQEsVE1TYKEFBKDA
 CD0553Ou1FGlg==
Date: Thu, 18 Nov 2021 13:56:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <YZZboeQpqK8CwmL+@sirena.org.uk>
References: <20211118090035.5331-1-olivier.moysan@foss.st.com>
 <20211118090035.5331-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20211118090035.5331-3-olivier.moysan@foss.st.com>
X-Cookie: People respond to people who respond.
Cc: alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ASoC: stm32: dfsdm: add pm_runtime
	support for audio
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
Content-Type: multipart/mixed; boundary="===============7905689636289396148=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7905689636289396148==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HMgHyk9z9XITysq"
Content-Disposition: inline


--/HMgHyk9z9XITysq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 10:00:34AM +0100, Olivier Moysan wrote:

>  	ret =3D snd_soc_add_component(component, NULL, 0);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
>  			__func__);
> +		return ret;
> +	}
> =20
> -	return ret;
> +	pm_runtime_enable(&pdev->dev);

Enabling runtime PM after registering the component may potentially lead
to a race where something manages to go in and starts using the device
including what should be runtime PM stuff.  That'd lead to a reference
not being taken that should be.  It's unlikely to actually happen but
it's better to be safe.

--/HMgHyk9z9XITysq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGWW6AACgkQJNaLcl1U
h9CLGAf/ZPgpWw+sUfS92Ur9sKBg2iJ8B0peY+lx9xIeWYpe4VUroAOLj1ZPvJGA
FuarngOZVU6HQb9qTBibk10pwkoYkyvH5g7wqCtj54sQQLx0TCD94mxFEx10ag33
/4WbSlYmxgC4W2xLr5acaPCaik8qm2qQMMaNIYLyZpFgPya1cSAxUnUC8FMr5erl
tctUP/CIoF7vBR+u+96lVB4BDqm0kQFGo8ftUg+h1kxf1gtEV/eD/Y1gCFZ1O/SW
6IN5K1ATFMZPHNUMkEpPLt23NCLinzdkxy2/eF87sj+gkDk+7fbgya/deQmu5oLL
0y++J0llhfmrUPbM25n7D//VjII/PA==
=OGhT
-----END PGP SIGNATURE-----

--/HMgHyk9z9XITysq--

--===============7905689636289396148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7905689636289396148==--
