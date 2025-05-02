Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83808AA7757
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 18:31:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 255A7C78F7D;
	Fri,  2 May 2025 16:31:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 170C5C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 16:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44DA344856;
 Fri,  2 May 2025 16:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E50CC4CEE4;
 Fri,  2 May 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746203512;
 bh=1UWbogJgeco5WHNezkVt8ymTxY2YVnBpAsTKrv/cZmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFysst/03X8hMdpX7sFMDrNdgbyCwQPuks5HCkYv8hzqEoQPzHdryNaChZk1HshOu
 o63yTy7OBPNw6CYZdBX+yVGAEL009P8R5Sbe4oUtT74144L2lIBDpdeiV5KoDaCuG6
 Pviy+zCWGlzVC8jUK107vjFkuGKs9HTF1tA83O02jwuS8ktnFaOiAkk+zSnkx002Jn
 ZKnOZc3kGfgPpuMSHuB/BWzn8lHsZMXHb+/84agLKZeyxaw2KRRAFhQwPiLjHUSbko
 CVdnt3iDclcrCjWsGgOk1StOxc+mqmMayJYpiUXjIrJ5270O5CTw57QiEwEV+Xi4IE
 xvEobnpBn8cww==
Date: Fri, 2 May 2025 17:31:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250502-pound-clay-e5c00911b26c@spud>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: timer: renesas,
 ostm: Document RZ/V2N (R9A09G056) support
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
Content-Type: multipart/mixed; boundary="===============0004380006763308293=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0004380006763308293==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1h659JRnvzLpgwnc"
Content-Disposition: inline


--1h659JRnvzLpgwnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 01:46:26PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>=20
> Also update the bindings to require the "resets" property for RZ/V2N
> by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> the "resets" property.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1h659JRnvzLpgwnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBTzcgAKCRB4tDGHoIJi
0pXcAP4z3/dK6X2Ypr13HK+ekeneGtjckP7okUIxK5d79phtnwD/QbJEr7QLNlGo
eAqFaqZ0TrpadWiEN6QfAHSjqdT3awU=
=i5nU
-----END PGP SIGNATURE-----

--1h659JRnvzLpgwnc--

--===============0004380006763308293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0004380006763308293==--
