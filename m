Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2F27D14
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 14:45:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 722B0CCB42A
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 12:45:56 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43129CCB429
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 12:45:55 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CD9B2100022;
 Thu, 23 May 2019 12:45:46 +0000 (UTC)
Date: Thu, 23 May 2019 14:45:46 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190523124546.6agw7fu5qteag3ol@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
 <20190523110715.ckyzpec3quxr26cp@flea>
 <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
Content-Type: multipart/mixed; boundary="===============4691747341427984664=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4691747341427984664==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tf5grxv2ddxyomh6"
Content-Disposition: inline


--tf5grxv2ddxyomh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 11:25:09AM +0000, Jose Abreu wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, May 23, 2019 at 12:07:15
>
> > You can then run make dtbs_check, and those YAML files will be used to
> > validate that any devicetree using those properties are doing it
> > properly. That implies having the right node names, properties, types,
> > ranges of values when relevant, and so on.
>
> Thanks but how can one that's developing know which bindings it shall use?

I'm not quite sure what you mean here. Are you talking about which
file to use, or which property are required, or something else?

> Is this not parsed/prettified and displayed in some kind of webpage ?

Not at the moment, but it's one of the things that are made much
easier by using a formal data format.

> Just that now that the TXT is gone its kind of "strange" to look at YAML
> instead of plain text and develop/use the bindings.

Well, it's kind of the point though. Free-form text was impossible to
parse in a generic way, and you couldn't build any generic tools upon
it. YAML provides that.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tf5grxv2ddxyomh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOaV+gAKCRDj7w1vZxhR
xbIiAQDiQ/YoNNi0GkGaqteHf9TnQ2HqpEptDspMMmoMtI/iUQD9GIkc5JePBFh2
kcr5Fwff9irX+EB/TCiw12tiyLODug8=
=9C+d
-----END PGP SIGNATURE-----

--tf5grxv2ddxyomh6--

--===============4691747341427984664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4691747341427984664==--
