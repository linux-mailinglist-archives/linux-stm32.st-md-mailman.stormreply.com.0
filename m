Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E5291D2
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 09:35:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC7A2C57188
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 07:35:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC98AC57186
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 07:35:01 +0000 (UTC)
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EDB8E40011;
 Fri, 24 May 2019 07:34:55 +0000 (UTC)
Date: Fri, 24 May 2019 09:34:55 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190524073455.46auhvhwb5no6ebp@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <9094f39f-0e26-55dd-9b47-9a55089400da@st.com>
MIME-Version: 1.0
In-Reply-To: <9094f39f-0e26-55dd-9b47-9a55089400da@st.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/8] dt-bindings: net: stmmac: Convert the
 binding to a schemas
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
Content-Type: multipart/mixed; boundary="===============5628258444208164755=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5628258444208164755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="23ickihnik62sivg"
Content-Disposition: inline


--23ickihnik62sivg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

On Thu, May 23, 2019 at 05:05:51PM +0200, Alexandre Torgue wrote:
> Hi Maxime
>
> On 5/23/19 11:56 AM, Maxime Ripard wrote:
> > Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> > schema to enable the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
>
> First, thanks a lot for this patch. Just one question:
> We could add ranges for some properties in order to avoid "bad value" for a
> property. If I understand correctly you do it only for snps,dwxgmac,
> snps,dwxgmac-2.10 and st,spear600-gmac. Why not do it for all supported IPs
> ? (Maybe it is something that we could add later)
>

We definitely can do that. It wasn't really obvious to me what the
limits were by reading the previous documentation, but if you can
provide them we can definitely add them.

> > +        snps,tso:
> > +          $ref: /schemas/types.yaml#definitions/flag
> > +          description:
> > +            Enables the TSO feature otherwise it will be managed by
> > +            MAC HW capability register. Only for GMAC4 and newer.
>
> TSO is also available for snps,dwmac-4.00 and snps,dwmac-4.10a

Ack, I'll change it.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--23ickihnik62sivg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOeenwAKCRDj7w1vZxhR
xeATAQCcQsgy7vfEdnFVRTUYXu4cQi7yVev/HZ6IHxvhXUxohQEAlunQSSosiD+q
hCssuxFFbw2++ejr0HSjYCaQvSZesQA=
=FrHP
-----END PGP SIGNATURE-----

--23ickihnik62sivg--

--===============5628258444208164755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5628258444208164755==--
