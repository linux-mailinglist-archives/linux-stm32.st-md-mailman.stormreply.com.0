Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D539E7679
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 17:54:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADF77C6DD9D;
	Fri,  6 Dec 2024 16:54:06 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A6EC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 16:54:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 056DBA4430C;
 Fri,  6 Dec 2024 16:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEB6C4CED1;
 Fri,  6 Dec 2024 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733504044;
 bh=YDomNLDNajdoJ1pBaUnkgQgWUUdvwDEczy/rTy2dTbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VyJ8LGjgKsTP180BTd2aZsogaMbr5GsUU5SD/4TEZb0FoWaezrs6XOcxMKOA5ig/5
 Hpcx+1bUEu3JiDO12HHydxvzvQtj8gSVNKtCPhsH/UY2gnyjLswYuoXLCyHGrj0qwk
 n7iIi1BAOOPZta+iWiKCJzYH2KARp1qZqUOgKPhPEU2fKuxGCdEjsX9oG7GIIuLok+
 RDlXQphub6Cj6UvMvjzhQ+bvMw2daLcMOEmxN+gLXs8bGcK/34UHzgyuihOrkvU6YD
 FKQEDPDqKKBCNuL8al67YQ1tltwI1ro/vVjGxxqzoMpIxZqkOajSKXRa1yPO7aoJn0
 GWt0pDvpx0dCw==
Date: Fri, 6 Dec 2024 16:53:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20241206-juncture-copier-97c30459c041@spud>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-3-o.rempel@pengutronix.de>
 <20241205-hamstring-mantis-b8b3a25210ef@spud>
 <Z1KV9bCW0iafJ2hF@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <Z1KV9bCW0iafJ2hF@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, kernel@pengutronix.de,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1 2/5] dt-bindings: vendor-prefixes: Add
	prefix for Priva
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
Content-Type: multipart/mixed; boundary="===============0571485322668666932=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0571485322668666932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d/WfSM3/k/7/bMv1"
Content-Disposition: inline


--d/WfSM3/k/7/bMv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 07:13:09AM +0100, Oleksij Rempel wrote:
> On Thu, Dec 05, 2024 at 05:16:14PM +0000, Conor Dooley wrote:
> > On Thu, Dec 05, 2024 at 01:56:37PM +0100, Oleksij Rempel wrote:
> > > Introduce the 'pri' vendor prefix for Priva, a company specializing in
> > > sustainable solutions for building automation, energy, and climate
> > > control.  More information about Priva can be found at
> > > https://www.priva.com
> > >=20
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index da01616802c7..9a9ac3adc5ef 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -1198,6 +1198,8 @@ patternProperties:
> > >      description: Primux Trading, S.L.
> > >    "^probox2,.*":
> > >      description: PROBOX2 (by W2COMP Co., Ltd.)
> > > +  "^pri,.*":
> > > +    description: Priva
> >=20
> > Why not "priva"? Saving two chars doesn't seem worth less info.
>=20
> This is typical prefix which is used by this vendor, if it is possible
> i would prefer not to change it. But, last decision is on your side :)

I dunno, think if I was being unreasonable like that people would tell
me where to go.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--d/WfSM3/k/7/bMv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MsJwAKCRB4tDGHoIJi
0q7+AP0WgVVYCgxQgsALCbzKmK4HISYQEtJkGhxbcC8rwUd3TAEAwBQ/eBKPr4RW
KuUnP3OeYJ7cqKeQXBHhBYkRbSC5gg4=
=wzoa
-----END PGP SIGNATURE-----

--d/WfSM3/k/7/bMv1--

--===============0571485322668666932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0571485322668666932==--
