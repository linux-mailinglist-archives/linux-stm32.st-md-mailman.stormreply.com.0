Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC9715929
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 10:56:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFC6EC6A616;
	Tue, 30 May 2023 08:56:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACB19C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1685436999; x=1716972999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TwJucBXBGUN+OLdeFJgi+mcuaAx9YZFO5Ndm7y/BYEo=;
 b=KUgqVYBAqbK5hPGxuMoWtFu1M1XUH2mLl8ronIPqqoKoatjWU3G6dBGb
 efj7NkIrjfF7kq3VrzdYhaVFxDrTptFYSEpLA7k5h49FJnSjbHRnW1sVY
 aIM6XmumOH79jX1HJ5HjruOgXGMVu+5QkkVJ0bwD8o51jITGM4Yl+WaEt
 6Kql9atIBd16wc+4IMdPloZaMTYNVeoYtqmVc5AoSi+T0imlIhkP5XV4R
 TuzSUMcJxBFGVO6GkfvEGxi1V2qBpywSLKbVUAngVMhDfSjUMlwiWVhke
 MaxmCZ8RpdyaPUkAozm+FUn7dwGBScPdld5N3xa/lukN1UrZQ49toD5K9 w==;
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
 d="asc'?scan'208";a="216001309"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 May 2023 01:56:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 01:56:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 01:56:33 -0700
Date: Tue, 30 May 2023 09:56:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <20230530-payday-gravity-45a26bd7f2dc@wendy>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-3-alexandre.torgue@foss.st.com>
 <20230529-enrich-clammy-14b498baf09f@spud>
 <879b7689-5663-28b5-9431-2fdd243ffff2@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <879b7689-5663-28b5-9431-2fdd243ffff2@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-gpio@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/11] pinctrl: stm32: add stm32mp257
	pinctrl support
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
Content-Type: multipart/mixed; boundary="===============8569311947403507160=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8569311947403507160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nUFaAWKbUup9Ifzb"
Content-Disposition: inline

--nUFaAWKbUup9Ifzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 10:38:30AM +0200, Alexandre TORGUE wrote:
> Hi Conor
>=20
> On 5/29/23 20:04, Conor Dooley wrote:
> > On Mon, May 29, 2023 at 06:20:25PM +0200, Alexandre Torgue wrote:
> > > Add stm32mp257 pinctrl support.
> > > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/=
stm32/pinctrl-stm32.h
> > > index e0c31c4c8bca..5e5de92ddd58 100644
> > > --- a/drivers/pinctrl/stm32/pinctrl-stm32.h
> > > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
> > > @@ -24,6 +24,9 @@
> > >   #define STM32MP_PKG_AB		BIT(1)
> > >   #define STM32MP_PKG_AC		BIT(2)
> > >   #define STM32MP_PKG_AD		BIT(3)
> > > +#define STM32MP_PKG_AI		BIT(8)
> > > +#define STM32MP_PKG_AK		BIT(10)
> > > +#define STM32MP_PKG_AL		BIT(11)
> >=20
> > Mainly out of curiosity, why have you go duplicate defines for these?
>=20
> Mainly to fit with available packages for various STM32 MPU. Currently MP1
> SoCs are available with packages AB/AC/AD and MP2 series with AI/AK/AL but
> in the future we could have package AB/AC/AD/AI available for a particular
> SoC and then I need to anticipate this case.

Sorry, what I meant was "why have you got defines for these in this
header, when there is an existing set in
include/dt-bindings/pinctrl/stm32-pinfunc.h?".

Cheers,
Conor.


--nUFaAWKbUup9Ifzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHW6KgAKCRB4tDGHoIJi
0kFZAQDNwlhOAKYKGvOi/CDjWW2Mt/BRKIp/vzjgcMjS9EwGVQD9F29KDtdq+WOs
LS3PsjPYYdNc61FM+WOSgjb+Z3y1bAc=
=gjoB
-----END PGP SIGNATURE-----

--nUFaAWKbUup9Ifzb--

--===============8569311947403507160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8569311947403507160==--
