Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC565964BE5
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 18:45:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61169C6DD6E;
	Thu, 29 Aug 2024 16:45:04 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD788C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 16:44:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BED9CA402B7;
 Thu, 29 Aug 2024 16:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D008C4CEC1;
 Thu, 29 Aug 2024 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724949895;
 bh=OMsOLBdAsSGlf4aitflcY78wVc+gfDKPy/epnfUGNfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7iIbi0+kkKXOsu1mXRZ4FOTjZwDzCcoThaO3gUYPUIOHToB3KaSIV6gJLAoKvcFP
 /qh5/vKTzlaksp5IKAUn+6OPtBCKaUFJViqhMo681z34OuCj/d3jYnqRjUc/rAr+Sr
 EXl1gBptTJE/7FytpitmpThOUGkA7k4+TjresSyFq/3Frv14hDzn7xeOT+181Owv3A
 qycizKgULOL9iaM+453afn0Y+nPxQDwfW8QbLDi6EjHy0kz5RIZLQCH2wR8xSzGkxV
 exg06hklD+k5v0Jm98im+sFPh8sPARra//zyjFOSosgjPv0EaNIxi+N0uzQTpmqKlT
 OIfaSZYDza2Fg==
Date: Thu, 29 Aug 2024 17:44:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20240829-manifesto-tray-65443d6e7e6e@spud>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
 <20240828143452.1407532-2-christian.bruel@foss.st.com>
 <20240828-handsfree-overarch-cd1af26cb0c5@spud>
 <005a2f7d-ab46-46c8-a0cc-b343685caf7c@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <005a2f7d-ab46-46c8-a0cc-b343685caf7c@foss.st.com>
Cc: kishon@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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
Content-Type: multipart/mixed; boundary="===============8455229696921621214=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8455229696921621214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d1nrqP5TuJn4PExU"
Content-Disposition: inline


--d1nrqP5TuJn4PExU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 01:06:53PM +0200, Christian Bruel wrote:
> On 8/28/24 18:11, Conor Dooley wrote:
> > On Wed, Aug 28, 2024 at 04:34:48PM +0200, Christian Bruel wrote:
> > > Document the bindings for STM32 COMBOPHY interface, used to support
> > > the PCIe and USB3 stm32mp25 drivers.
> > > Following entries can be used to tune caracterisation parameters
> > >   - st,output-micro-ohms and st,output-vswing-microvolt bindings entr=
ies
> > > to tune the impedance and voltage swing using discrete simulation res=
ults
> > >   - st,rx-equalizer register to set the internal rx equalizer filter =
value.
> > >=20
> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   .../bindings/phy/st,stm32mp25-combophy.yaml   | 128 +++++++++++++++=
+++
> > >   1 file changed, 128 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/phy/st,stm32mp=
25-combophy.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/st,stm32mp25-combo=
phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
> > > new file mode 100644
> > > index 000000000000..8d4a40b94507
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
> > > @@ -0,0 +1,128 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/st,stm32mp25-combophy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
> > > +
> > > +maintainers:
> > > +  - Christian Bruel <christian.bruel@foss.st.com>
> > > +
> > > +description:
> > > +  Single lane PHY shared (exclusive) between the USB3 and PCIe contr=
ollers.
> > > +  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: st,stm32mp25-combophy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#phy-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    minItems: 2
> > > +    items:
> > > +      - description: apb Bus clock mandatory to access registers.
> > > +      - description: ker Internal RCC reference clock for USB3 or PC=
Ie
> > > +      - description: pad Optional on board clock input for PCIe only=
=2E Typically an
> > > +                     external 100Mhz oscillator wired on dedicated C=
LKIN pad. Used as reference
> > > +                     clock input instead of the ker
> > > +
> > > +  clock-names:
> > > +    minItems: 2
> > > +    items:
> > > +      - const: apb
> > > +      - const: ker
> > > +      - const: pad
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    const: phy
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  wakeup-source: true
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +    description: interrupt used for wakeup
> > > +
> > > +  access-controllers:
> > > +    minItems: 1
> > > +    maxItems: 2
> > Can you please describe the items here?
>=20
> I can specialize the description: "Phandle to the rifsc firewall device t=
o check access right."

Right, but there are potentially two access controllers here. You need
to describe which is which, so that people can hook them up in the
correct order. In what case are there two? Your dts patch only has one.

> otherwise described in access-controllers/access-controllers.yaml, see al=
so bindings/bus/st,stm32mp25-rifsc.yaml
>=20
> >=20
> > > +  st,syscfg:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: Phandle to the SYSCON entry required for configurin=
g PCIe
> > > +      or USB3.
> > Why is a phandle required for this lookup, rather than doing it by
> > compatible?
>=20
> the phandle is used to select the sysconf SoC configuration register
> depending on the PCIe/USB3 mode (selected by=A0xlate function), so it's n=
ot
> like a lookup here.

If "syscon_regmap_lookup_by_phandle()" is not a lookup, then I do not
know what is. An example justification for it would be that there are
multiple combophys on the same soc, each using a different sysconf
region. Your dts suggests that is not the case though, since you have
st,syscfg =3D <&syscfg>; in it, rather than st,syscfg =3D <&syscfg0>;.

> This sysconf register is also used for other settings
> such as the PLL, Reference clock selection, ...
>=20
> >=20
> > > +
> > > +  st,ssc-on:
> > > +    type: boolean
> > flag, not boolean, for presence based stuff. And in the driver,
> > s/of_property_read_bool/of_property_present/.
>=20
> ok
>=20
> >=20
> > > +    description:
> > > +      A boolean property whose presence indicates that the SSC for c=
ommon clock
> > > +      needs to be set.
> > And what, may I ask, does "SSC" mean? "Common clock" is also a bit of a
> > "linuxism", what does this actually do in the hardware block?
>=20
> SSC for Spread Spectrum Clocking. It is an hardware setting for the 100Mh=
z PCIe reference common clock,

Ah, so not really a "common clock" linuxism at all.

> I will rephrase the description

How is someone supposed to decide between on and off? Is it always on
for PCIe, or only on in some configurations? Or maybe only (or always?) on
if the pad clock is provided?

Cheers,
Conor.

--d1nrqP5TuJn4PExU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtClggAKCRB4tDGHoIJi
0mz4AQCOLJVTuu1biezoFWNlwB78dkF2W3NgTHnu4EeKe/fVegEA8PVCgbv2TNfb
/QSr9nkfPam8mQ4ZKijx7IvnTCm3LgQ=
=SvVH
-----END PGP SIGNATURE-----

--d1nrqP5TuJn4PExU--

--===============8455229696921621214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8455229696921621214==--
