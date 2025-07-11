Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D43B0166E
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 10:38:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C59EC3087A;
	Fri, 11 Jul 2025 08:38:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0505CC32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 08:37:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D841EA54D0E;
 Fri, 11 Jul 2025 08:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DA7C4CEED;
 Fri, 11 Jul 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752223076;
 bh=eyV4X++/VGEzxaguebcqSjDqRWFXr+hAR8/E84bBbo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ip9QS0q1Oh7taDoQfGWcgwPMmN/hoN6SmTPcIcH9mZ1EjLwPjZC+5SxmrHICfI/Y+
 Hkyqi9EQoNA0FOfl6OBmW8rgypMiyHSGB8wRoVCbljOJ6eoUOZU7n1sT90PP9KrqZB
 akE6Oef7QNgRjYuqgumt3epv/VBaVmxVx3369AZqOM2t/5tmv/JsO3Z8EdkmIeD4tI
 gwnmD1cc94RLaa6jS667Zh7lkwj44Hy0Xkk7dGc/rekbhlz+FKVgOw7W3GKrFbSMSr
 4dATtbLHVxzxiS9Apilik6ayWhjZSVG62W50oTDV6NtWc95q2NycUTwM7nPoiLazlu
 85FwllO+rm4Fw==
Date: Fri, 11 Jul 2025 09:37:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <aHDNYFdAefD0iiyM@finisterre.sirena.org.uk>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
X-Cookie: Do not cut switchbacks.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] sound: convert from clk round_rate()
 to determine_rate()
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
Content-Type: multipart/mixed; boundary="===============1706026947122654009=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1706026947122654009==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YnpWRE/TMlIzvZ9t"
Content-Disposition: inline


--YnpWRE/TMlIzvZ9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2025 at 11:51:06AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YnpWRE/TMlIzvZ9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhwzV8ACgkQJNaLcl1U
h9A6mQf+Mw4rOQ3YyKPyHMvM67lMhdwxJj81LDMaZnJrgOzRgYNwVehAF6z/3sjh
qE9RvCkeO6G1c5ngoFta8gB3Ba2chjtNsYln9QP8sxMhhzsQ/7hiiykf6NxALakJ
DR9tsOcL1vl2WKaCZ1HitICcSuWY6cLbTUpH0q85mv6rH1AJ0WdN8HHIw++p6m32
NMwkqwyG8z677hO9RdI1QwT4itEoh83UzLWoORxBTto7L/WnyP4uFrT2XefgEjE2
tBWfG9WPoG8Howvt2/8o+nnLbVwOnxeXkPE4TfC01MyK82f9voFg2EHSpuKiR9Gf
Gu40mCfxcvb/iKz7V9zpon/05BytBQ==
=OeRb
-----END PGP SIGNATURE-----

--YnpWRE/TMlIzvZ9t--

--===============1706026947122654009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1706026947122654009==--
