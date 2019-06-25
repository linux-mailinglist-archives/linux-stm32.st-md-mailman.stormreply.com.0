Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEA528AF
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2019 11:55:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68F86C0DB3B
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2019 09:55:36 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86C47C0DB39
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 09:55:34 +0000 (UTC)
Received: from localhost (p54B333A7.dip0.t-ipconnect.de [84.179.51.167])
 by pokefinder.org (Postfix) with ESMTPSA id 275C22C376D;
 Tue, 25 Jun 2019 11:55:34 +0200 (CEST)
Date: Tue, 25 Jun 2019 11:55:33 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <20190625095533.GC1688@kunai>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net>
MIME-Version: 1.0
In-Reply-To: <20190625093156.GF5690@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Nicolas.Ferre@microchip.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 Eugen.Hristev@microchip.com, peda@axentia.se,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] I2C filtering (was Re: [PATCH v2 6/9] dt-bindings:
 i2c: at91: add binding for enable-ana-filt)
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
Content-Type: multipart/mixed; boundary="===============2938304437099011763=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2938304437099011763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 11:31:56AM +0200, Alexandre Belloni wrote:
> On 25/06/2019 09:14:13+0000, Eugen.Hristev@microchip.com wrote:
> > > Perhaps
> > >=20
> > > 	microchip,digital-filter;
> > > 	microchip,analog-filter;
> > >=20
> > > ?
> >=20
> > Hi Peter,
> >=20
> > Thanks for reviewing. The name of the property does not matter much to=
=20
> > me, and we have properties prefixed with vendor, and some are not.
> >=20
> > @Alexandre Belloni: which name you think it's best ?
> >=20
>=20
> I'm not sure, it depends on whether Wolfram thinks it is generic enough
> to be used without a vendor prefix.

I could imagine that we design a generic property for filters. The ones
above make me wonder, though, because they are bool. I'd think you can
configure the filters in some way, too?

I never used such filtering, so I am unaware of the parameters needed /
suitable. Quick grepping through I2C master drivers reveals that
i2c-stm32f7.c also handles filters, but only with default values. Maybe
DT configuration would be benefitial to that driver, too?

Adding some people to CC.


--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0R75EACgkQFA3kzBSg
KbaFyA//UefpasMtRS97YQqN/2m6N9Xgl7LiXTof1v53GW/mee1Y8ce675X8tAHL
H2Hcvak1eeDIBiN+FPopoUSZ3EhxO3jsMeuR4cAXAKgbFS9lngHGyQcYWd8EZG3p
lxcbnahpnUOBnvFKHet1j84f3RAkk8tksxEc7sFaV5puN3dReSBA5e++trJz73yk
oUjx+42R9Zytrt27IsH+Vy86znzzuDboc+ngLwl+deTGG3E56xLAUNX4U5eGLJiJ
jL7Ot0GUBIw+iHI610z+HrzuKREIQGY3XkGowq+ZU6RxgSnpdf0faRp8EqfRaJdb
i0379EM5C0Hb4O0l7RLMmlNPWaIGPVhoh7Hr2cBSEXMmL4Fr8uBWNlpkKU1aFM4v
4mq4KBULWYfihJ2CfFqWyKOLzY4320whOiHcq0O+81nYSrRoXCEpYyxHMLpfTicW
YSysulIyWNbAv+j+Cns7y6SRE/Pm6HBaWsHuP8gqKha0+wjmAs+eE6zwZ4RiUYez
tSqP31BTOQw7UG26/FOX+N/fAtBGQP2NcBePPSAmMBLTGAiAXWnEIZv/x9MO9qJ1
kVEs2wtgeyX93qxwedyL9ueTa/d5HbmMpYDN0R3PFwpqGyC+qkyNlatWd/DJutwP
oXKFHwEdabgjoSwYIaIfHkP4gxF/5BJp3F0H+vR/n+sDlQoaWp4=
=qB/9
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--

--===============2938304437099011763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2938304437099011763==--
