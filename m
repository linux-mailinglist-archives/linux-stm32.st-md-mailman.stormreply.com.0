Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE790B3A1
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 17:14:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60886C69067;
	Mon, 17 Jun 2024 15:14:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCB4BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 15:13:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E5EF61314;
 Mon, 17 Jun 2024 15:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F2FC4AF1D;
 Mon, 17 Jun 2024 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718637232;
 bh=hIWzbXsh4mRighfIgGhRcgmXvHJgCqDvgPH9Ldm/Ioc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DK3bqfLX0WxhffXPr5lbsmxoeHwQMsu+flSjBg8PWwwTJKZxnKGEo8YNAd90sgEqP
 Zs5j/ab+R7s1TRE+6QDbmCWZSojGojXmTSMNuXzotxzOmEKRlNFHZyBzKhVHxyfCHc
 JYQtGxatwp1DlQdbgPNVOHyoyKcM/a9OD5l9lhApRu3oO8El55tVrlsySaA45ZHhF8
 +riQ7+R3GZgDqyxqRHcimWsXH6b/8gZBDtV20TcOxAdNFGh2CwRe1tPCJ1lKD/Sd9R
 Phwm86BRC/DwPRz8r/HwlYGLkLUcpkYFIudTp9jSSyCspfG5eAjsKHqvT9mlDVLRP7
 KGbONMEOjopAg==
Date: Mon, 17 Jun 2024 16:13:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Message-ID: <20240617-shaky-amenity-5727816e00e1@spud>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
 <15b20cdd8b9148559352fdb2f02e4e53@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <15b20cdd8b9148559352fdb2f02e4e53@foss.st.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Lee Jones <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pascal PAILLET-LME <p.paillet@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for
 st, stpmic1 bindings
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
Content-Type: multipart/mixed; boundary="===============6697823354727922561=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6697823354727922561==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nDhD1gxr6ZJ9vEJW"
Content-Disposition: inline


--nDhD1gxr6ZJ9vEJW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 09:21:13AM +0000, Etienne CARRIERE - foss wrote:
> Hello Conor,
>=20
> >
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Saturday, June 15, 2024 2:14 PM
> >
> > On Fri, Jun 14, 2024 at 05:33:46PM +0200, Etienne Carriere wrote:
> > > Change include/dt-bindings/mfd/st,stpmic1.h license model from GPLv2.0
> > > only to dual GPLv2.0 or BSD-3-Clause. I have every legitimacy to requ=
est
> > > this change on behalf of STMicroelectronics. This change clarifies th=
at
> > > this DT binding header file can be shared with software components as
> > > bootloaders and OSes that are not published under GPLv2 terms.
> > >
> > > In CC are all the contributors to this header file.
> > >
> > > Cc: Pascal Paillet <p.paillet@st.com>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > > ---
> > >  include/dt-bindings/mfd/st,stpmic1.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindin=
gs/mfd/st,stpmic1.h
> > > index 321cd08797d9..957c48300cd4 100644
> > > --- a/include/dt-bindings/mfd/st,stpmic1.h
> > > +++ b/include/dt-bindings/mfd/st,stpmic1.h
> > > @@ -1,4 +1,4 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 */
> > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
> >
> > The usual dual license for bindings is BSD-2-Clause, was there a
> > specific request for the 3 version?
>=20
> My mistake. Thanks for spotting that.
> I have my company agreement for the 2 dual models: "OR BSD-2-Clause" and =
"OR BSD-3-Clause".
> We expect to conform to DT bindings preferred licensing model. Indeed the=
 kernel documentation explicitly mention "GPL-2.0-only OR BSD-2-Clause".
> We prefer to conform with it. I'll update my patch.
>=20
> By the way, I'll fix Lee Jones e-mail address that is deprecated.

I figure this is a send-email mistake cos you have to do something
god-forsaken to send plaintext mail from the st mail system.

--nDhD1gxr6ZJ9vEJW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBSrAAKCRB4tDGHoIJi
0haXAQDscqmPiNOh0Bh+PkIiCfAxILuu6s2z2D2dalTF/DcSyAEA9mSKKJhCsVH1
gd9VVgFw5ZfTa4bXLVuLmNkIF+8wxwU=
=Nc3K
-----END PGP SIGNATURE-----

--nDhD1gxr6ZJ9vEJW--

--===============6697823354727922561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6697823354727922561==--
