Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 217029D97E9
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 14:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88026C78F7C;
	Tue, 26 Nov 2024 13:04:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CB84C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75C565C4C12;
 Tue, 26 Nov 2024 12:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4227AC4CECF;
 Tue, 26 Nov 2024 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732623002;
 bh=X1ZW6fAmw9BsbKNLM84F8Yh9PGsgTv9DvBZGDJRKcPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJYxmWMrgHFfFMx4SZZpmRSPoxZkpZdW9Fzl0DNJVl9iZcJ9LACkFNimQ/Zl9Ggy3
 SYCmCDCBy3wYS/4BAHyvqBSpdevfR2A8+Cl0poDBsaqFAiVPtYI4ZQNn2Ms/nXmQS5
 B/UrH8sh1oOZZQLERhS2NMh5SThIcY98v8FukZxyJm5VP1r2O666m32kVPiCbDWwMI
 NeeMi+iCzohnE5XpteEv/7Om1Ca0sbx5DmiPYy2VCMROZDM0dKBJnbXfWeQXAyW6i1
 GaqOFZ7w3KO5d/7R8FWJR/goyXglI4rOOwcqF6zVI3DKQH1O1UjUQx+UM9YEv1s9DQ
 YGDLHXsFjAikA==
Date: Tue, 26 Nov 2024 13:09:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <874j3uxptp.fsf@intel.com>
X-Mailman-Approved-At: Tue, 26 Nov 2024 13:04:30 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Nyekjaer <sean@geanix.com>,
 David Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/modes: introduce
 drm_mode_validate_mode() helper function
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
Content-Type: multipart/mixed; boundary="===============0893874012864155030=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0893874012864155030==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qwww7zw5ccyu53nk"
Content-Disposition: inline


--qwww7zw5ccyu53nk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > I wonder about the naming though (and prototype). I doesn't really
> > validates a mode, but rather makes sure that a given rate is a good
> > approximation of a pixel clock. So maybe something like
> > drm_mode_check_pixel_clock?
>=20
> Quoting myself from a few weeks back:
>=20
> """
> Random programming thought of the day: "check" is generally a terrible
> word in a function name.
>=20
> Checking stuff is great, but what do you expect to happen if the check
> passes/fails? Do you expect the function to return on fail, or throw an
> exception? Or just log about it? If you return a value, what should the
> return value mean? It's hard to know without looking it up.
>=20
> Prefer predicates instead, is_stuff_okay() is better than
> check_stuff(). Or assert_stuff() if you don't return on failures.
> """

Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
you want to return a mode status enum, I don't think they are better
names.

Maxime

--qwww7zw5ccyu53nk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0W6lwAKCRAnX84Zoj2+
dpfkAX9rQ95STenTbFaPTqzNs0f3hXHKnVKDzQwlwme3v/FEzAw3GEWZWO1BNFdE
ChoLbYwBf06ASgUEBRxVk52nFUsJogUobfhi2/VS/xGu8+SOUnSsG50ueId2dS+n
zeEpgo7ogA==
=OHka
-----END PGP SIGNATURE-----

--qwww7zw5ccyu53nk--

--===============0893874012864155030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0893874012864155030==--
