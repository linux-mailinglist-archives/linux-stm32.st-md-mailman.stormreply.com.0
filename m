Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B102A48A1
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 15:53:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A933C36B25;
	Tue,  3 Nov 2020 14:53:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA4C5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 14:53:43 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77BE620757;
 Tue,  3 Nov 2020 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604415222;
 bh=GVewwPMeCjAxDalOCCOf46CmJoqqIh23iYK56tZAfQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgGH85FrWT7zXFS6P4u2q+HG2JtNzvLUQSa2ajV+G7JKbeQBbuxoqwaGSe/1sjcOF
 UZYUiR09pGaGOQ8zAomcm8ACk8K9UVixl4pOeBAUHcqnhuRoSPxhO80a7KLiIke40K
 gn+LYgpGFQvVGuuRQWxT+Ksg/1pslaPlzt/A8yd4=
Date: Tue, 3 Nov 2020 14:53:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier MOYSAN <olivier.moysan@st.com>
Message-ID: <20201103145332.GC5545@sirena.org.uk>
References: <20200911091952.14696-1-olivier.moysan@st.com>
 <20ed825b-10b6-e71f-9da4-91df38a950de@st.com>
MIME-Version: 1.0
In-Reply-To: <20ed825b-10b6-e71f-9da4-91df38a950de@st.com>
X-Cookie: I don't get no respect.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: i2s: add master clock
	provider
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
Content-Type: multipart/mixed; boundary="===============7619722025629486333=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7619722025629486333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 01:38:27PM +0000, Olivier MOYSAN wrote:
> Hi Mark,
>=20
> Gentle reminder on this series, as it seems that there was no update=20
> since Rob's "reviewed-by" for dt bindings, on 11/09.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+hbusACgkQJNaLcl1U
h9Dm9Qf+JPb2goRZsdbee0uFj53fh/s4jI5jzfiqEEX5flUTcLaxnRR27AcGii7B
9lcpaOHDzg/6oPwTXmQUWN8GMq/QNU+YDiAE+3PeafsCoi+0SZqqYu+UlignrFOy
mRygNLL8OocnwrwtUTFhQpcqs6MJXiLYAvwo5fw+zNpG42C1xnkvH83ZUglhmK3C
ph7kV5Ez7b4/kK1yMqsHBvnftPIPMyZeyauf5xpTGftvzyxMWRqwk9D/Pp4vQkYM
e0/AoIFpz/o3RE62XbLW9Y2+v7vqSXuQr31GcKZwF5lmeVzHJpDOfxdtsHExzTGv
S6xL8vxHCBwnRNrL9lEzduzWwk9Teg==
=3wTy
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--

--===============7619722025629486333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7619722025629486333==--
