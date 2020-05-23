Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E92051DF6A1
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2020 12:36:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A550C36B25;
	Sat, 23 May 2020 10:36:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27EEEC36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2020 10:36:14 +0000 (UTC)
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBBAC2071C;
 Sat, 23 May 2020 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590230172;
 bh=0HzKqeO/bdhEuUfUb/+2HOuRW4/bgdkt0jgum4LSP7I=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=tcvPOX7FmK7rYwEMs0HJbm5mXoYSvZ/SjgG1xtFkYnqcuzPx/GVq4O6LXnX6Eh5jk
 c4jwP5wSX6gLthoBAv+t1O0DRMCFFPSoFh5CSHH6U2P0G10YU4sxA9pZOvnSnMBic0
 PkhLQwfl1X1gtHJthD25SaApF13kbUkzfAA8Ia8Q=
Date: Sat, 23 May 2020 12:36:01 +0200
From: "wsa@kernel.org" <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>
Message-ID: <20200523103601.GA3459@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-4-git-send-email-alain.volmat@st.com>
 <20200513021932.GA9172@bogus>
 <20200513054231.GA16558@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20200513054231.GA16558@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Linux-stm32] [PATCH 3/4] dt-bindings: i2c-stm32: add SMBus
	Alert bindings
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
Content-Type: multipart/mixed; boundary="===============7050300083396533055=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7050300083396533055==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +        st,smbus-alert:
> > > +          description: Enable the SMBus Alert feature
> > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > +
> >=20
> > We already have smbus_alert interrupt. Can't you just check for this in=
=20
> > the slave nodes and enable if found?
>=20
> My understanding reading the code (smbalert_probe within i2c-smbus.c, of_=
i2c_setup_smbus_alert called when
> registering an adapter within i2c-core-smbus.c) is that smbus_alert refer=
s to an interrupt on the
> adapter side. That is an interrupt that would be triggered when the adapt=
er is receiving an smbus_alert
> message.
> In our case (stm32f7), we do not have specific interrupt for that purpose=
=2E The interrupt triggered when
> an SMBUS Alert is received (by the adapter) is the same interrupt as for =
other reasons and we check
> within the irq handler within stm32f7 the reason before calling i2c_handl=
e_smbus_alert if the status
> register indicated an SMBUS Alert.
> So my understanding is that we cannot rely on the mechanism of naming an =
interrupt smbus_alert.
> Did I misunderstood something ?

I just wonder what is bad about specifying the same interrupt twice in
the interrupt properties? You could then check in probe if "smbus_alert"
is populated and if it matches the main irq.


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7I/I0ACgkQFA3kzBSg
Kbavuw/+NO4H+Xha0Xe144SeVcvWUywbqoyWBQ0bwabNCH3szXM85RHPfEQsUXMo
bwOa6rKiRHSI34T/PwCmjvNVAadYuYIkjGpLFNbUQEhpnEehWiLcsQMYWJUzg+ZE
5uOg0Gbd5/Db6a/jpdF9A0FaPomsmqNPuXiThftutc5p1pk0eQzixOBaK61Ywky3
OZoyCrOS4y2nZ0jNvCcccJI/38s35Sf0E5vMo0VUkXpUlqucdRp8oDWhapDNW8UP
bvmCU9Xw7vfM1iaYOQ4hX0bUus/bH5/vkgEjnsEUNxlsbNB+nZDNAxm4ZLRr3hYW
aLKVw6H+P7ZSbSOKy9SYzo+aHixk1r47kpzwCxLMEh3ul0BYwcArDQbqq0WtbhYf
4fVswX9t5t194CW61jE2k/f12qiDpVJ3cn7XZZ2ygKY5JfmW3N6qjB+FY/o0amxs
pfxClFmbMXuq4Bcn4+4Qj23QSAO4xxYkY7ImziQa9mYQAtmaJUagVzRxUz9JkP3Q
qigB58PeO8etgZ+U6yNKjG6fxNg1THTmWtuE83Z5z0ZdwXyEtZLBpsXM8zCtptHq
8m4ZI4SU6XVAFvQjrPgJXVSuZ1Tkc7ZJuBpXWF2UFhVGcJSeptEnkPQel6VJXME+
ka3e+K9lySX+ub5zdNvEI+Uz3q9mTVzJP4RbW7PP7w13jb3kjm0=
=NDSc
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

--===============7050300083396533055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7050300083396533055==--
