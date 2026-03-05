Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9XY3NJXOqWk+FgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 19:42:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65573217122
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 19:42:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2F3BC8F26D;
	Thu,  5 Mar 2026 18:42:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42F68C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 18:42:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDC7B60053;
 Thu,  5 Mar 2026 18:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA36C116C6;
 Thu,  5 Mar 2026 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772736145;
 bh=mFBLekNu0pFh38RoS+ly8NDtbNgs1xYCpIaBJhYLK6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZaL/avDCoUq1hdotZkUw4/COICPIBYrMTm9k+d4uRIetbmtsqV+GciipM7MHurTLs
 xHKY4E1BNjwJGd2GYjVAnecZv+VegXt/ug1yhqZmDzUTKSpx7rTJHNSrEBGXXySL/W
 kyIxF8P7MJ11z1jrIc2AUjshfmglqddtat59eBfoN0Oi8qusPMCySS3Om/bmYQra1a
 lA5GxnsDdMfBVF1ZqNLyQfG6boF98td58zsHVg7txsiJ7vE915l0hsQz3+JNEcWxDZ
 M/Fr5jz9XHNktZEpxJSj5qc6+1mX8szkHIZfo3b32soS53mwKvluR2akgE776dmWg/
 7iBc+LfwGFkvQ==
Date: Thu, 5 Mar 2026 18:42:17 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <20260305-goldsmith-omnivore-21958a41ff48@spud>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
 <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
 <20260304-capable-setback-908ba5b5c858@spud>
 <9eaad6e.4df8.19cbbe95b3c.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <9eaad6e.4df8.19cbbe95b3c.Coremail.lizhi2@eswincomputing.com>
Cc: Bo Gan <ganboing@gmail.com>, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, pritesh.patel@einfochips.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
Content-Type: multipart/mixed; boundary="===============8870134497596808974=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 65573217122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:ganboing@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.843];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--===============8870134497596808974==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LdxKbp5rG3ADm6j"
Content-Disposition: inline


--9LdxKbp5rG3ADm6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2026 at 10:52:38AM +0800, =E6=9D=8E=E5=BF=97 wrote:
>=20
>=20
>=20
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Conor Dooley" <conor@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-03-04 17:30:57 (=E6=98=9F=E6=
=9C=9F=E4=B8=89)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: "Bo Gan" <ganboing@gmail.com>
> > =E6=8A=84=E9=80=81: "Jakub Kicinski" <kuba@kernel.org>, lizhi2@eswincom=
puting.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@daveml=
oft.net, edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt=
@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gma=
il.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, wens@kern=
el.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghi=
ti.fr, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormrepl=
y.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =
ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfo=
chips.com, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
> > =E4=B8=BB=E9=A2=98: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: =
eswin: add clock sampling control
> >=20
> > On Tue, Mar 03, 2026 at 05:23:18PM -0800, Bo Gan wrote:
> > > Hi All,
> > >=20
> > > On 3/3/26 16:47, Conor Dooley wrote:
> > > > On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
> > > > > On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrot=
e:
> > > > > > There are currently no in-tree users of the EIC7700 Ethernet dr=
iver, so
> > > > > > these changes are safe.
> > > > >=20
> > > > > What do you mean by this sentence? The commit under Fixes was par=
t of
> > > > > Linux v6.19 already.
> > > >=20
> > > > The "funny" thing is that caring about users doesn't even really ma=
tter
> > > > on the devicetree patch, except for this hunk:
> > > > |@@ -81,7 +99,9 @@ properties:
> > > > |                          or external clock selection
> > > > |           - description: Offset of AXI clock controller Low-Power=
 request
> > > > |                          register
> > > > |+          - description: Offset of register controlling TXD delay
> > > > |           - description: Offset of register controlling TX/RX clo=
ck delay
> > > > |+          - description: Offset of register controlling RXD delay
> > > > |
> > > > | required:
> > > > |   - compatible
> > > > And it only matters here because an item is injected mid-list. If t=
his
> > > > was moved to the end with the RXD delay, the **dt-binding** changes
> > > > don't have issues with safety. I've not looked at whether there are
> > > > knock-on concerns about users in the driver or whatever yet, but fr=
om a
> > > > binding POV only that hunk can break something that currently works.
> > >=20
> > > This was already discussed here in v1:
> > > https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lun=
n.ch/
> > >=20
> > > The device-tree is not checked in yet by ESWIN folks, so there's curr=
ently
> > > no user of the dt-binding. No need to worry about backward compat.
> >=20
> > The binding and driver exist, there doesn't need to be a dts in tree for
> > there to be potential users. If the break was important I might not
> > care, but this seems to be a gratuitous break, since the new items could
> > be added to the end of the list and compatibility maintained without
> > incurring any more difficulty for you.
>=20
> Hi Conor and Krzysztof,
>=20
> Thanks for the reviews.
>=20
> - The next patch will fix the property order to avoid any breakage
>   with existing DT bindings.

Good, thanks.

> - Eth1 does have a timing issue in silicon, as discussed here:
>   https://lore.kernel.org/lkml/32a1f814.2c79.19bfe173225.Coremail.linmin@=
eswincomputing.com/
>=20
> =C2=A0 Based on this, and according to the advice from Andrew
>   https://lore.kernel.org/lkml/59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.=
ch/
>   https://lore.kernel.org/lkml/bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.=
ch/
> =C2=A0 adding a DT property is not a reasonable approach.
> =C2=A0=C2=A0
> =C2=A0 In the next patch, I will improve the description/paragraph and pr=
operly
>   document the timing issues.

I personally don't mind having two compatibles, but I might be more
clear about what device the new one refers to (so something like
s/clk-inversion/eth1/g). But Krzysztof was the one who objected to
having multiple compatibles, so it's worth waiting to see what he has to
say.

--9LdxKbp5rG3ADm6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaanOiQAKCRB4tDGHoIJi
0kTVAP9/DDa/WZb3rTbhG6Imf28y6B3b5r9J/wxYjlBtYoF2VAEAq36UpKZJpbys
a5AO5ebrLpv/DEjmj/ymz2YiZYHVtgw=
=oXU3
-----END PGP SIGNATURE-----

--9LdxKbp5rG3ADm6j--

--===============8870134497596808974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8870134497596808974==--
