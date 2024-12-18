Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F229F6D3A
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 19:25:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83B59C78012;
	Wed, 18 Dec 2024 18:25:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90A37C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 18:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 598665C5EB3;
 Wed, 18 Dec 2024 18:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626BCC4CECD;
 Wed, 18 Dec 2024 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734546316;
 bh=D6u2L19JS6pbTNNuvH1fm6hioIhl6wEIC6EicTPp610=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RIIiVOrJhpS4mof2OVCscKCGFjYkMtydgnNgGl+n07x+zrtd45qEeG3yepUU3d+00
 JioGl9EWw9Wd8DM5GwWKl0UTaDCVEQ3Fg5oLaY5trT3zIAG43bzPzLBriiLG0epXw1
 os5hshz4vbltC3BAn4TObhZViNPU9KcGhGd7PVtN53Y0F0aQVJESZyTn4tBTicUXqo
 cMlViXOom2Tik2+JLWGzIzQEaajTOjKG+zTn99zt3/wXU+LqBdkx/oftVaKb0Lun6M
 vrcwBsQPjYpsF/7dQk/hF8B+gGiC1aFZKAidMgwORmEgkocYtVSv6FK5iu2ev2GWG1
 MrRTg4kZIt6fw==
Date: Wed, 18 Dec 2024 18:25:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20241218-yelling-palm-da676b67afb9@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
 <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
MIME-Version: 1.0
In-Reply-To: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: media: clarify stm32 csi
 & simplify example
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
Content-Type: multipart/mixed; boundary="===============8121673376645467930=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8121673376645467930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6nk/t1HXQvWcK4R"
Content-Disposition: inline


--e6nk/t1HXQvWcK4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 09:12:55PM +0000, Sakari Ailus wrote:
> Hi Conor,
>=20
> On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> > On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > > D-PHY.
> >=20
> > > Remove the bus-type property from the example.
> >=20
> > Why? What's there to gain from the example being (seemingly?) less
> > comprehensive?
>=20
> As the device has D-PHY, other options are excluded. I.e. that property is
> redundant for this device.

That should be mentioned in the commit message.

--e6nk/t1HXQvWcK4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MThwAKCRB4tDGHoIJi
0o0EAQDdidjMXnrkFQSJAvyE/XWYtA2L1k+FW4aOm16Xb96MYwD/eAxuFSIsmUDZ
+vFPpziEjTA32zkU1AjGcSfHJIsolAs=
=TaR/
-----END PGP SIGNATURE-----

--e6nk/t1HXQvWcK4R--

--===============8121673376645467930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8121673376645467930==--
