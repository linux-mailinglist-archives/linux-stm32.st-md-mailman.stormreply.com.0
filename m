Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOIZGt37p2mlnAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 10:31:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F18401FD9A6
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 10:31:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DFD3C87ED1;
	Wed,  4 Mar 2026 09:31:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33256C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 09:31:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA6CA408EB;
 Wed,  4 Mar 2026 09:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99223C19425;
 Wed,  4 Mar 2026 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772616664;
 bh=zgQE9FPg79NGedD2qfd8rrEbgmI4ffrc7T2hh1mMJGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nM++lJkfi0p1/jKfOa1D+SffAY8be/O9gEmD2PT9ZTwuqGwVM1VSkTvzj+W7HiYE/
 u1bt9hSCZdXwGoyy71KOHeyUeE5T5BQ3/LHCed27eQcXArBchaxw7NyiRKJUB4FunA
 HBgTGF2hDdooYslK8PIhi4PWwpvCin/mEoz/9Op0AHUHIPgnIGgTUlNLnu/Rioj8x1
 /6RhEweeWR2ms7D/bxvbWrFo+/ISYanwH6djArYLBHXYdakBjHdtP0GeovKHxhhCQJ
 JE7u1UuyeHI73A1i7yFg5/TPmB28KzDjkCncr8WDbuGtARNrAmf02o7AGBos5Je4C4
 hYKrLmEEfy1sQ==
Date: Wed, 4 Mar 2026 09:30:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Message-ID: <20260304-capable-setback-908ba5b5c858@spud>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
 <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
Cc: linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, pritesh.patel@einfochips.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org, lizhi2@eswincomputing.com,
 andrew+netdev@lunn.ch, palmer@dabbelt.com, mcoquelin.stm32@gmail.com,
 pjw@kernel.org, davem@davemloft.net
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
Content-Type: multipart/mixed; boundary="===============9213809460420932593=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: F18401FD9A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:ganboing@gmail.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:lizhi2@eswincomputing.com,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.483];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,eswincomputing.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============9213809460420932593==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VyT/OApBJ2ELuMkj"
Content-Disposition: inline


--VyT/OApBJ2ELuMkj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 05:23:18PM -0800, Bo Gan wrote:
> Hi All,
>=20
> On 3/3/26 16:47, Conor Dooley wrote:
> > On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
> > > On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> > > > There are currently no in-tree users of the EIC7700 Ethernet driver=
, so
> > > > these changes are safe.
> > >=20
> > > What do you mean by this sentence? The commit under Fixes was part of
> > > Linux v6.19 already.
> >=20
> > The "funny" thing is that caring about users doesn't even really matter
> > on the devicetree patch, except for this hunk:
> > |@@ -81,7 +99,9 @@ properties:
> > |                          or external clock selection
> > |           - description: Offset of AXI clock controller Low-Power req=
uest
> > |                          register
> > |+          - description: Offset of register controlling TXD delay
> > |           - description: Offset of register controlling TX/RX clock d=
elay
> > |+          - description: Offset of register controlling RXD delay
> > |
> > | required:
> > |   - compatible
> > And it only matters here because an item is injected mid-list. If this
> > was moved to the end with the RXD delay, the **dt-binding** changes
> > don't have issues with safety. I've not looked at whether there are
> > knock-on concerns about users in the driver or whatever yet, but from a
> > binding POV only that hunk can break something that currently works.
>=20
> This was already discussed here in v1:
> https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/
>=20
> The device-tree is not checked in yet by ESWIN folks, so there's currently
> no user of the dt-binding. No need to worry about backward compat.

The binding and driver exist, there doesn't need to be a dts in tree for
there to be potential users. If the break was important I might not
care, but this seems to be a gratuitous break, since the new items could
be added to the end of the list and compatibility maintained without
incurring any more difficulty for you.

--VyT/OApBJ2ELuMkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaf70QAKCRB4tDGHoIJi
0t+yAQDaqUwbBXUnRZdznNlE9A9+14ZFfzPctlXgnLmjDlK8KQEAznLn0a9hkqF9
NpmQ3RerxFbR3zZlgJKl/8p/5oYxngk=
=yS9x
-----END PGP SIGNATURE-----

--VyT/OApBJ2ELuMkj--

--===============9213809460420932593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9213809460420932593==--
