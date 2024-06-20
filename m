Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850590FF78
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:51:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F46AC7128D;
	Thu, 20 Jun 2024 08:51:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A733C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718873517; x=1750409517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2TvpXXhOk9nqvvpL7r4WYpLMcH8C6BL3/fs1sCKRmQI=;
 b=Ta49aOEjNRUDniaoPq5+2gRUP+foSl68AWTL1t7CvizbMwsZm+ueQIoa
 6JN7hKGWvgNp3FFojP40XNccQ6DjnxlC2tI9BnHpp06E9KN3QefFts5TC
 96Y3rjY8+UY8Tmzr2XlkYL/OkonhVgi5VzX45X4XaofVGwJ/pqa+DFq5c
 JBb/i2j3N7IQLvg8ChF2fjzVTffK7+BurYMdytp8NYxiDOiCuFm1471cy
 wIKQO7Yw8nRM0p2+Q3wWYRN2WA+j5PoWfL41iEWxWjg7ZAdnJa7G29NmF
 It/oUolFcv4Z0vn3rd09fupz7FwCp7H9zW1qywTOyBTHqGr1ki1LT3tmT A==;
X-CSE-ConnectionGUID: 56ZSahdTSAWG5kTlegWLxQ==
X-CSE-MsgGUID: n5KP9bTySkmIbaRvewCWMg==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
 d="asc'?scan'208";a="28910098"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2024 01:51:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 01:51:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 01:51:22 -0700
Date: Thu, 20 Jun 2024 09:51:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <20240620-custody-jailbreak-6540620d6570@wendy>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-5-olivier.moysan@foss.st.com>
 <20240618-footwear-impotence-5284985a609d@spud>
 <4734e915-9ea7-4e65-a9ef-bc1e88c40e76@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <4734e915-9ea7-4e65-a9ef-bc1e88c40e76@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 4/8] dt-bindings: iio: dfsdm: move to
	backend framework
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
Content-Type: multipart/mixed; boundary="===============3705384269966988339=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3705384269966988339==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJFxl4lrwoiFDjYE"
Content-Disposition: inline

--NJFxl4lrwoiFDjYE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:03:44AM +0200, Olivier MOYSAN wrote:
> On 6/18/24 20:10, Conor Dooley wrote:
> > On Tue, Jun 18, 2024 at 06:08:30PM +0200, Olivier Moysan wrote:
> > >       allOf:
> > >         - if:
> > >             properties:
> > > @@ -199,9 +264,19 @@ patternProperties:
> > >                 description:
> > >                   From common IIO binding. Used to pipe external sigm=
a delta
> > >                   modulator or internal ADC output to DFSDM channel.
> > > +              deprecated: true
> > > -          required:
> > > -            - io-channels
> > > +          if:
> > > +            required:
> > > +              - st,adc-channels
> > > +          then:
> > > +            required:
> > > +              - io-channels
> > > +
> > > +          patternProperties:
> > > +            "^channel@([0-9]|1[0-9])$":
> > > +              required:
> > > +                - io-backends
> >=20
> > Why is this here, rather than with reg above? Only some channels require
> > a backend?
>=20
> The io-backends property is required only when we use st,stm32-dfsdm-adc
> compatible. In other words, when we are in an analog use case. In this ca=
se
> the channel is a consumer of a backend (typically a sd modulator)
> In an audio use case (compatible st,stm32-dfsdm-dmic) the backend is not
> required.

Ahh, I think the hunks and indent confused me here. What you're doing is
making io-backends required based on the compatible, but what I thought
you were doing was trying to make io-backends required in channels if
st,adc-channels was set.

Thanks for the explanation,
Conor.

--NJFxl4lrwoiFDjYE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnPtdwAKCRB4tDGHoIJi
0j93AP44jgZe6b+HBEZ4omA3y0tvrLry/EB6akIV7NR8Vap5igEAg+cGLKESOy+o
Zt9PvSP8qWdePXuj43/CfT/7C1OO8go=
=JkF+
-----END PGP SIGNATURE-----

--NJFxl4lrwoiFDjYE--

--===============3705384269966988339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3705384269966988339==--
