Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC0110076
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2019 15:39:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38C95C36B0B;
	Tue,  3 Dec 2019 14:39:53 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D76E1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fp1zIL2SAEar9dlKMYM/RfsmIkwJExCTW8u8xALWSC4=; b=SVtk5WFRlwEs+eVTFb0dxpn/a
 +g7p4XXuEkIrnH0632RPHUvw2hjP1m+sPepNvWNLcm3CfleuHd95OCxIO5RnaEgCeHgWjVhcQR29g
 14ZZZhbHLQvrHxt+snCURi55qiO4J1T/wTKzvL/UZ4nHok/xkXdTqC5Rro5rT270VGApE=;
Received: from fw-tnat-cam1.arm.com ([217.140.106.49]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ic9KY-0002mV-9f; Tue, 03 Dec 2019 14:39:10 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 03672D003B4; Tue,  3 Dec 2019 14:39:10 +0000 (GMT)
Date: Tue, 3 Dec 2019 14:39:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20191203143909.GL1998@sirena.org.uk>
References: <20191203141627.29471-1-olivier.moysan@st.com>
MIME-Version: 1.0
In-Reply-To: <20191203141627.29471-1-olivier.moysan@st.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, mcoquelin.stm32@gmail.com, apatard@mandriva.com,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: cs42l51: add dac mux widget in
	codec routes
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
Content-Type: multipart/mixed; boundary="===============2323552395462517051=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2323552395462517051==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kaF1vgn83Aa7CiXN"
Content-Disposition: inline


--kaF1vgn83Aa7CiXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2019 at 03:16:27PM +0100, Olivier Moysan wrote:

> -	SND_SOC_DAPM_DAC_E("Left DAC", "Left HiFi Playback",
> -		CS42L51_POWER_CTL1, 5, 1,
> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
> -	SND_SOC_DAPM_DAC_E("Right DAC", "Right HiFi Playback",
> -		CS42L51_POWER_CTL1, 6, 1,
> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("Left DAC", NULL, CS42L51_POWER_CTL1, 5, 1,
> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("Right DAC", NULL, CS42L51_POWER_CTL1, 6, 1,
> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),

This looks like an unrelated formatting change?

--kaF1vgn83Aa7CiXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3mc40ACgkQJNaLcl1U
h9CUawf9E5BprJC3A8QmnT0q77HnN92qqStvFvpZ7Q+v1APD/Orb+E4kskU/mHiN
B5qpYUUgoYUGyeTSG4nlSpBOG6nG2O7cpuaGz0ObLfybVJRGI7UgTIU+OtMm34DL
HzyhFvaYhg7xYbtj0m2LNLEgUWTwY2L7ktbZachaCpAjDs9IRSE/Eint/DSKl5SN
2X+nFXeDTl7Ig0vE26pukGume2hbhrnozhZIU1P4r4F965QBd4T2/490LXOWandk
xTCSMOJIkL7SBsXSlu2nwY6vYn9QBsuF/OMSfC1VqY05lxeqCcg/RJZLJj2aKizM
kPKMYjCzJLneVYT+7IsywZGFeIfH2Q==
=Bvzr
-----END PGP SIGNATURE-----

--kaF1vgn83Aa7CiXN--

--===============2323552395462517051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2323552395462517051==--
