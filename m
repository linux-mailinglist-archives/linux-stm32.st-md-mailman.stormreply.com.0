Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 00xwCN6rS2orYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:21:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B2711306
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:21:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=hzhGtLEI;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A231C8F262;
	Mon,  6 Jul 2026 13:21:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF39C7A835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:21:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AE61C4078E;
 Mon,  6 Jul 2026 13:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E42B1F00ACF;
 Mon,  6 Jul 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783344091;
 bh=LIBdR4kNPFgAFg6CIvOqngtwtnAfcvSaKkHxpyzx3/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hzhGtLEIi1bGKJUC8u0qeW903kcSL3pljP7AzVrtfkZGGdgUDrJReqcoxx+k3wMrP
 Zz/RnazFls+zmQ8qsn1GMbrnZ7t5QVR0DM1m1vzifytBeK3QFfRGlZgP8DV/8RcrsY
 W7sc6enVxVr0saHu8cE8jQyiQuo0kLSlFLwWvsK20bBlrZiotMIxEmcS4aYw0USZaf
 IJqxLzl1Htxaa7FBiJ6AMgwyHg1HnPrY9B6qOdeY6Z3G1BVSzCC0UgnZd9vfe1Dzmw
 ukFJvYnBBzWJuKp4++gojDAnCDOmKlaQOIaKuk9fbhj1zMZAFXNcF+lFVH6z+eystA
 D494h+6Eq+sLw==
Date: Mon, 6 Jul 2026 14:21:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20260706-confess-dagger-e60b5fad57e8@spud>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
Cc: linux-kernel@vger.kernel.org, lizhi2@eswincomputing.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 andrew+netdev@lunn.ch, ningyu@eswincomputing.com, lee@kernel.org,
 maxime.chevallier@bootlin.com, kuba@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu, mcoquelin.stm32@gmail.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org, edumazet@google.com,
 pritesh.patel@einfochips.com, palmer@dabbelt.com, horms@kernel.org,
 pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
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
Content-Type: multipart/mixed; boundary="===============1877700031929102315=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:linux-kernel@vger.kernel.org,m:lizhi2@eswincomputing.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:andrew+netdev@lunn.ch,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pritesh.patel@einfochips.com,m:palmer@dabbelt.com,m:horms@kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,eswincomputing.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,ghiti.fr,lunn.ch,bootlin.com,eecs.berkeley.edu,gmail.com,armlinux.org.uk,einfochips.com,google.com,dabbelt.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,eswincomputing.com:email,stormreply.com:url,stormreply.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB2B2711306

--===============1877700031929102315==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ULiKs6VR99TI7WYu"
Content-Disposition: inline

--ULiKs6VR99TI7WYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> >=20
> > Enable the on-board Gigabit Ethernet controller on the
> > HiFive Premier P550 development board.
> >=20
> > This patch is included only to provide the DTS context for reviewing the
> > binding and driver changes in this series.
> >=20
> > The upstream DTS series will be submitted separately after the binding
> > and driver changes are finalized.
> >=20
> > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>=20
> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
> PW, but I think it needs explicit acks from relevant SMEs. Could you
> please have a look?

We do not typical provide tags from dts patches, but that's irrelevant
for you, because this (and effectively all other dts) patch(es) should
not go through the net tree to begin with.
Instead, the platform maintainers should review and/or apply it.

Additionally, it seems the contributor's commit message suggests
that they didn't intend this patch to be applied at all?

Cheers,
Conor.

--ULiKs6VR99TI7WYu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakur0wAKCRB4tDGHoIJi
0lJJAQDyznJ0mXwKfkHnFRg/RjkZfn/slGLhUuYfKnvvJnC3yAEA7uHRCP2yagsd
bJ/ACyG7Ej0e3jeZwhPFEWzspucP9go=
=kICX
-----END PGP SIGNATURE-----

--ULiKs6VR99TI7WYu--

--===============1877700031929102315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1877700031929102315==--
