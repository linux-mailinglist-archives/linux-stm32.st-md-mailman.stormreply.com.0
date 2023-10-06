Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A04AE7BB564
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 12:39:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58402C6C838;
	Fri,  6 Oct 2023 10:39:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE39C6B478
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 10:39:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1185DB827ED;
 Fri,  6 Oct 2023 10:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CDEC433C8;
 Fri,  6 Oct 2023 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696588761;
 bh=31fUj/22FScFXvKh4mUa0QxeM51SdMhxUNNZAjaUauk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bqPXZnCrTGyT2v7qQp2gS6VXtnU5oalgXNi+9bHcnJbC70fEfHNR1e7YdSfszZt65
 cRjdkHtQU55If4mUBCykU7iE3sOC6QdK+ose9SZXuYRfQhWGehkjBANgye7SS8Q5/f
 rz5PjtLfOVr+5OkIsRGOHMxACuOceh28dn83JgOrWSJzH+WuvCaNv93Mvnd80EeoCK
 Lux7DuE+H22JMTr5GhmA9b26mqNONwcmk/iETEUf4vlCsQqqvsTaV1iuiqlFPJXy29
 kLe5vuM0e4TPUpJv2wgn2XX3i+EYoykyJS6aqqzXLbzRM77F972x+GkTzNvIHz2vnt
 +R2uF3xq5a0cQ==
Date: Fri, 6 Oct 2023 11:39:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20231006-sandworm-provided-217161692e54@spud>
References: <20230919083553.35981-1-eagle.alexander923@gmail.com>
 <20230919-98b276afdbc85d62815da0b9@fedora>
 <CAP1tNvS8KsEjs_KhimD6X4CPe7vQ3LKikoz3yU3w2z7pKE9G0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP1tNvS8KsEjs_KhimD6X4CPe7vQ3LKikoz3yU3w2z7pKE9G0A@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: stm32: document
 MYD-YA151C-T development board
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
Content-Type: multipart/mixed; boundary="===============8948407472798114867=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8948407472798114867==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wwlCXlw5mobA6jp8"
Content-Disposition: inline


--wwlCXlw5mobA6jp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 06, 2023 at 10:18:30AM +0300, Alexander Shiyan wrote:
> Hello.

> > On Tue, Sep 19, 2023 at 11:35:52AM +0300, Alexander Shiyan wrote:
> > > Add new entry for MYD-YA151C-T development board.
> ...
> > > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > > index 4bf28e717a56..5252b9108ddc 100644
> > > --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > > @@ -140,6 +140,11 @@ properties:
> > >            - const: engicam,microgea-stm32mp1
> > >            - const: st,stm32mp157
> > >
> > > +      - description: MyirTech MYD-YA15XC-T SoM based Boards
> > > +        items:
> > > +          - const: myir,myd-ya151c-t   # MYIR MYD-YA151C-T STM32MP151C
> > > +          - const: st,stm32mp151
> >
> > It appears that this file is sorted by soc part number, which would put
> > this entry now in the wrong location.
> > With that changed,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>

> I looked through the entire file and saw that the entries were
> sorted by board name and by SOC part number within the board option.

I must not be reading the same file you are. The one I looked a is
sorted by the SoC compatibles
...mp135
...mp151
...mp153
...mp157
and thereafter by boards.


--wwlCXlw5mobA6jp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR/j1QAKCRB4tDGHoIJi
0sLTAQDtR2jnnMWZG3LDrgIV8xVxdyUuLXDYQMA5frcsa2B1twEAg67TS87Ig9PA
ibukTzNzhnBhbC6EImDas0MADZX2bA8=
=R6l+
-----END PGP SIGNATURE-----

--wwlCXlw5mobA6jp8--

--===============8948407472798114867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8948407472798114867==--
