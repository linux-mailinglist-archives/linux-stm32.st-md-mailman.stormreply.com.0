Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8319293B1A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 14:19:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 871DEC424B8;
	Tue, 20 Oct 2020 12:19:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED7F9C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 12:19:25 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 427942222F;
 Tue, 20 Oct 2020 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603196363;
 bh=v6hvzZnm5fO2LRuaf67yjm5Dmk41dAfQBo695kCsG/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJJ/FkLcr/+ezJTlcNE93HVLZFVLAgVCweDitu6Xjjt0lx+j8u2muD2BZeJ5OKhWC
 F/KlgfG/e+ktLqHgxyHqT+l5ubxWadGxHAgHIGncHt3ye3W4AT6Lo4pKaqTEUvnLor
 29xF8Osd83iq1oX9q5S63X53T3HoF89FKQDuSJiU=
Date: Tue, 20 Oct 2020 13:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201020121913.GB9448@sirena.org.uk>
References: <20201020090457.340-1-olivier.moysan@st.com>
MIME-Version: 1.0
In-Reply-To: <20201020090457.340-1-olivier.moysan@st.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, arnaud.patard@rtp-net.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: cs42l51: manage mclk shutdown delay
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
Content-Type: multipart/mixed; boundary="===============0514273936335184126=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0514273936335184126==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 11:04:57AM +0200, Olivier Moysan wrote:

> +static int mclk_event(struct snd_soc_dapm_widget *w,
> +		      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	struct cs42l51_private *cs42l51 = snd_soc_component_get_drvdata(comp);
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event))
> +		return clk_prepare_enable(cs42l51->mclk_handle);
> +
> +	/* Delay mclk shutdown to fulfill power-down sequence requirements */
> +	msleep(20);
> +	clk_disable_unprepare(cs42l51->mclk_handle);

Why not use a switch statement here?  The control flow is a bit odd with
what's basically an if/else done with only one branch in the if - this
isn't idiomatic for DAPM stuff apart from anything else.

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+O1cAACgkQJNaLcl1U
h9A/vAf+JYXtEW1+AAEACgq9gDYA589X13HKVS73HAERhV2VefPqsSWHlF+UhKx1
YUOU94GV71Ch7RLyaoFfQhaxVZghyjDXxWeqsMe1mJwxVfBCAxq5N6Q/Mm/hyORl
fA62L8BHyO2iDoJX72VoaGN0HLxTzqWvHXvnhU7tfaaTAVVVdNpBPSya+pbU8EM6
Ya6XwOejv7Rr3wcO1OsmVJfxW+n4xjyrM06oM+Ld7VSVTXKxdaAgltBthCPxD9pO
Km4xA9vhbo76xXiER2/arnWKgqSsXAT8bJbK5oipa/RlpnpFXZvokhd0bxBmkOop
xss2mjf+rEEkN3hJS2irSUZb0/X5sw==
=Yz7U
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

--===============0514273936335184126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0514273936335184126==--
