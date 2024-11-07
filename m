Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CD9C0C76
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 18:09:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12CC8C6C855;
	Thu,  7 Nov 2024 17:09:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F929C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 17:09:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2C5A5C062E;
 Thu,  7 Nov 2024 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243F8C4CECC;
 Thu,  7 Nov 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730999369;
 bh=9f54dxIl3eMwRNQ9RNH0nhNpQ6mFCD7DUPK+U+I+s2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1ceALmOpXVDmMxRbzPEfjf44ktMb8IJIw5lCn4O2WlljA5gnCeFuqPvPRcu98S4V
 6HAILwGAs7kg8T56TOAySl75Sp1LxU3tBT53AkwaWgpikEnuuALLIP2KJZJwpXv6W0
 9Ghf5BuxO0K+n81/KZhb1PcxyiH6msIl3EWOog8mq1rYdc0o1rizGr+Kn5BdR+CKJh
 +H11tCH5HBVLIDlDemnlhdooj3Z8xdwOlQJdtkPLI6fgPxN8/TSnVpBXbmdzifW4MQ
 qAExp1IDuQTjDvnnukK3cn4UfHgedhjHz6g+pX4clyeJlf6w0mAtZu13eHXdULURBr
 2TkK3rA5gn+Gw==
Date: Thu, 7 Nov 2024 17:09:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <20241107-slip-graceful-767507d20d1b@spud>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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
Content-Type: multipart/mixed; boundary="===============4897225706866528997=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4897225706866528997==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yB3ZUxT4SMqLRowR"
Content-Disposition: inline


--yB3ZUxT4SMqLRowR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:15:51PM +0800, Joey Lu wrote:
> Conor Dooley =E6=96=BC 11/6/2024 11:44 PM =E5=AF=AB=E9=81=93:
> > On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
> > > +  nuvoton,sys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to access GCR (Global Control Register) reg=
isters.
> > Why do you need a phandle to this? You appear to have multiple dwmacs on
> > your device if the example is anything to go by, how come you don't need
> > to access different portions of this depending on which dwmac instance
> > you are?
> On our platform, a system register is required to specify the TX/RX clock
> path delay control, switch modes between RMII and RGMII, and configure ot=
her
> related settings.
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +
> > > +  mac-id:
> > > +    maxItems: 1
> > > +    description:
> > > +      The interface of MAC.
> > A vendor prefix is required for custom properties, but I don't think you
> > need this and actually it is a bandaid for some other information you're
> > missing. Probably related to your nuvoton,sys property only being a
> > phandle with no arguments.
> This property will be removed.

I'm almost certain you can't just remove this property, because you need
it to tell which portion of the GCR is applicable to the dwmac instance
in question. Instead, you need to ad an argument to your phandle. The
starfive dwmac binding/driver has an example of what you can do.

--yB3ZUxT4SMqLRowR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyz0QgAKCRB4tDGHoIJi
0lP1AP97tmKwKt+UudFKraxNYO3cXznEar2+8w3QtbqK/bnqlwD9H1utLpv2RnF0
zj3DwLQ3RnwTIwDLuyIHy2v/2FNbawI=
=i7sq
-----END PGP SIGNATURE-----

--yB3ZUxT4SMqLRowR--

--===============4897225706866528997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4897225706866528997==--
