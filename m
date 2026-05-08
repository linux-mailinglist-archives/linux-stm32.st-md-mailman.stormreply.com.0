Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JJwInX5/WnYlQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 16:55:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FF4F82D3
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 16:55:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE707C87ECE;
	Fri,  8 May 2026 14:55:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5ACC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 14:55:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A392F60052;
 Fri,  8 May 2026 14:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEFAC2BCB0;
 Fri,  8 May 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778252146;
 bh=N869R35gS1hmPx22qrwaifKiqn02BVaqbn9SBybbSpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rjLnu2D10PWshoFmra/WqT2x/oIazuGIRH8ewIGoBqLvCb8aB9EYk8O+CkpUcagTh
 296wobZZiAHV25FyTCp5M3vABi828lVuMnB8U/NAzbSpyD68jS/FZcQVWXjLjyQ70g
 uriBMCHtOGT+YTrfC+K9Squ9DQR5y8LcBOGY/NqpOIC+KFYmztke+3TBg/pChX2mlE
 sc2R87QeTXzp7dJXNJmrANH6ufElnyNlJ+mqfNI2mbpK2RC6Xmo04EWZ9nXy5a7W6X
 0teea2lGgLpGHYqIdSOKndHAo78EixdezGqcPVOtMKhgmYZ1UiDE4tmXDFlIfnsnKQ
 +FvNwNzPFsiXA==
Date: Fri, 8 May 2026 15:55:40 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <20260508-detention-frisk-84cff00cb228@spud>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <20260507-mural-moocher-ad6e07ef8ae0@spud>
 <22d09a07.7cfd.19e061cacea.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <22d09a07.7cfd.19e061cacea.Coremail.lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] dt-bindings: ethernet: eswin:
 refine delay model and HSP register description
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
Content-Type: multipart/mixed; boundary="===============0974499016318206465=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 2C5FF4F82D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.839];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============0974499016318206465==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z+PhFZ7j1pI5I6B9"
Content-Disposition: inline


--z+PhFZ7j1pI5I6B9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 01:43:23PM +0800, =E6=9D=8E=E5=BF=97 wrote:
>=20
>=20
>=20
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Conor Dooley" <conor@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-05-08 01:24:02 (=E6=98=9F=E6=
=9C=9F=E4=BA=94)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: lizhi2@eswincomputing.com
> > =E6=8A=84=E9=80=81: andrew+netdev@lunn.ch, davem@davemloft.net, edumaze=
t@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@=
kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.ke=
rnel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandr=
e.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin=
=2Ecom, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.in=
fradead.org, ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.=
vaghela@einfochips.com, pritesh.patel@einfochips.com, weishangjuan@eswincom=
puting.com
> > =E4=B8=BB=E9=A2=98: Re: [PATCH net v1 1/2] dt-bindings: ethernet: eswin=
: refine delay model and HSP register description
> >=20
> > On Thu, May 07, 2026 at 04:31:36PM +0800, lizhi2@eswincomputing.com wro=
te:
> > > From: Zhi Li <lizhi2@eswincomputing.com>
> > >=20
> > > Refine the EIC7700 Ethernet dt-binding based on observed hardware beh=
avior
> > > and clarify the original delay model for eth0.
> > >=20
> > > The previous binding used an enum-based definition for
> > > rx-internal-delay-ps and tx-internal-delay-ps. Replace it with a
> > > range-based model using:
> > >=20
> > >   - minimum: 0
> > >   - maximum: 2540
> > >   - multipleOf: 20
> > >=20
> > > This better reflects the actual hardware implementation, which
> > > supports 20ps granularity delay steps in the MAC RGMII interface.
> > >=20
> > > The tx/rx internal delay values are clarified as MAC-side programmable
> > > delay components applied on the RGMII clock/data path, representing
> > > the effective delay seen at the MAC interface.
> > >=20
> > > This does not change the intended hardware semantics, but aligns the
> > > binding with the actual hardware implementation.
> > >=20
> > > These properties are optional and only required when MAC-side fine
> > > tuning is needed; otherwise delay alignment is provided by PHY or
> > > board design.
> > >=20
> > > Depending on the selected RGMII timing mode, delay alignment may be
> > > provided by the PHY (e.g. rgmii-id) or by board/MAC-side configuratio=
n.
> > > When PHY or board design already provides the required delay, these
> > > MAC-side properties may be omitted. When MAC-side fine tuning is
> > > required, they should be provided to describe the internal RGMII
> > > timing adjustment.
> > >=20
> > > Additionally, extend the description of the HSP subsystem register
> > > layout used by the MAC glue logic. This includes explicit TXD and RXD
> > > delay control registers to ensure deterministic initialization and
> > > to override any residual configuration potentially left by bootloader=
s.
> > >=20
> > > Add reference to the EIC7700X SoC Technical Reference Manual,
> > > Chapter 10 ("High-Speed Interface"), Part 4 for background of the
> > > HSP CSR block:
> > > https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Ma=
nual/releases
> > >=20
> > > There are no in-tree users of this binding, so no ABI impact is
> > > expected.
> > >=20
> > > Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7=
700 SoC")
> > > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> > > ---
> >=20
> > While this is v1, it's really v8 and there should therefore be a
> > changelog that explains where my ack and the new compatible went.
> >=20
>=20
> Thanks for the review.
>=20
> Based on Jakub's feedback on the previous v7 series, I plan to split the
> changes into two separate series:
>=20
> - a smaller fix series intended for net,
> - and a separate eth1 feature series intended for net-next.
>=20
> After the split, the scope and target trees of the two series will differ
> from the original combined series, so I plan to restart the revision
> numbering from v1 for both series.
>=20
> The additional compatible string and the eth1-specific DT binding
> extensions will be moved into the separate feature series, and I will
> reflect this in the v2 cover letter.
>=20
> The DT binding changes in this fix series v1 are simply extracted from the
> previous v7 series as part of the split.
>=20
> Since the series has been restructured, I will drop the previous
> Acked-by tags.
>=20
> I will also document the reason for doing so and the impact of the split
> in the v2 cover letter.

This isn't what I am looking for. I just want/wanted an explanation for
why the new compatible has been removed from the patch.

>=20
> If you think the binding changes are still effectively unchanged and the
> previous Acked-by can still apply, I am happy to retain them or re-apply
> them as appropriate. Otherwise I will assume a fresh review is preferred.

If the removed compatible is the one for eth1, then
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Please let me know your preference.
>=20
> Thanks,
> Zhi

--z+PhFZ7j1pI5I6B9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf35awAKCRB4tDGHoIJi
0gmJAQDr6xhvwtTAQnqP7MMHtuQzQnKum+qSUdWXb8zOKVsrRwD/X6Xp21HqiPK6
cDQ6QwfRf7AfLBtSYxseFDv4lV/jMQw=
=T72E
-----END PGP SIGNATURE-----

--z+PhFZ7j1pI5I6B9--

--===============0974499016318206465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0974499016318206465==--
