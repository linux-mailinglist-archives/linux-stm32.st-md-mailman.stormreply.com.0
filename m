Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B0BC0881
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Oct 2025 09:57:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C78E2C3F938;
	Tue,  7 Oct 2025 07:57:06 +0000 (UTC)
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF2B6C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Oct 2025 07:57:05 +0000 (UTC)
Received: from ripper.localnet
 (p200300c597021AE00000000000000C00.dip0.t-ipconnect.de
 [IPv6:2003:c5:9702:1ae0::c00])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.simonwunderlich.de (Postfix) with ESMTPSA id 0692EFA12C;
 Tue,  7 Oct 2025 09:57:03 +0200 (CEST)
From: Sven Eckelmann <se@simonwunderlich.de>
To: Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 07 Oct 2025 09:56:58 +0200
Message-ID: <1839711.VLH7GnMWUR@ripper>
In-Reply-To: <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20251006204529.GA549972-robh@kernel.org>
 <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Shayne Chen <shayne.chen@mediatek.com>
Subject: [Linux-stm32] Re: [PATCH mt76 v2 1/3] dt-bindings: net: wireless:
 mt76: Document power-limits country property
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
Content-Type: multipart/mixed; boundary="===============5595082784623004066=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5595082784623004066==
Content-Type: multipart/signed; boundary="nextPart8631237.NyiUUSuA9g";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8631237.NyiUUSuA9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <se@simonwunderlich.de>
Date: Tue, 07 Oct 2025 09:56:58 +0200
Message-ID: <1839711.VLH7GnMWUR@ripper>
MIME-Version: 1.0

On Monday, 6 October 2025 22:48:15 CEST Johannes Berg wrote:
> On Mon, 2025-10-06 at 15:45 -0500, Rob Herring wrote:
> > 
> > > +          country:
> > > +            $ref: /schemas/types.yaml#/definitions/string
> > > +            description:
> > > +              ISO 3166-1 alpha-2 country code for power limits
> > 
> > This would be constrained to something like this?:
> > 
> > pattern: '^[A-Z]{2}$'
> 
> There's a "00" special case for "world roaming", so maybe that would
> have to be '^([A-Z]{2}|00)$'? Not sure you'd ever want to specify that
> though. We also use '99' internally for even more special cases, but I'm
> pretty sure that shouldn't be specified externally.

Good point. I would say that 00 is already handled by the "fallback" limit 
code. If it finds neither a country nor a regdomain, it just marks this entry 
as "fallback".

Regards,
	Sven
--nextPart8631237.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaOTHygAKCRBND3cr0xT1
ywhZAP4s8bEDQwSmJy8BeB8DNxkjVbJ4TMzkk1jlnOud1CgbZQEAsezHw+N0eJXn
R256VuIFrw6VaIWcPQe0BI7De6ceaAM=
=jlgT
-----END PGP SIGNATURE-----

--nextPart8631237.NyiUUSuA9g--




--===============5595082784623004066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5595082784623004066==--



