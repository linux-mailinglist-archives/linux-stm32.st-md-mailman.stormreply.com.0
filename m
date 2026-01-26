Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNAkBuzHd2lOkwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 21:00:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3608CD76
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 21:00:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48CBEC87EDB;
	Mon, 26 Jan 2026 20:00:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DCC3C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 20:00:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35B8260145;
 Mon, 26 Jan 2026 20:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489E6C116C6;
 Mon, 26 Jan 2026 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769457640;
 bh=W/s9B8G5AAVa1Ka8hwUbZ0G6I72DbzHIqE5HpGQCPNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQpeICeyJSjkOhlUCdhsHfBjOVMQbxJZt5iv694GjcLRSgCdNa70WSlPLusbcNSIG
 cf7KBZEUGxL7QkUkQmqPRUFfGjPUxIu2D2ugRxPTcbsnbB9AN3a7LhW/vJL0M0n2Ki
 L5w0znY9rQ5iBzW9JnwxwmEynbt7Hl8LnZ2YNbpywE7BVbGpt1Or/HrmpshUPduDm6
 OKoBYCLyyvrtN0n25eTeS+/3E84PyvcO1me1ZMeo99FNFowVq2CWwoGlKmj/VEVwYm
 gno+nZ5oYW8my4Lrun/5mweiK8UP4tn92qiPzifhiby96RbUkuic0livRkinilnaxf
 DKj7WQMGi/IBQ==
Date: Mon, 26 Jan 2026 20:00:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <20260126-blinker-secluding-a745f60caccb@spud>
References: <20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com>
 <20260123-dwmac_multi_irq-v3-2-cc53f2be8961@oss.nxp.com>
 <20260123-dinner-aloft-e57deb6c546a@spud>
 <aXdiNb92B4HH+ZFt@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
In-Reply-To: <aXdiNb92B4HH+ZFt@lsv051416.swis.nl-cdc01.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: net: nxp,
 s32-dwmac: Declare per-queue interrupts
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
Content-Type: multipart/mixed; boundary="===============6151858003889712775=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
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
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9F3608CD76
X-Rspamd-Action: no action


--===============6151858003889712775==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yK1i+yQq5ZBwutQC"
Content-Disposition: inline


--yK1i+yQq5ZBwutQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 01:46:45PM +0100, Jan Petrous wrote:
> On Fri, Jan 23, 2026 at 05:13:03PM +0000, Conor Dooley wrote:
> > On Fri, Jan 23, 2026 at 11:09:55AM +0100, Jan Petrous via B4 Relay wrot=
e:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > >=20
> > > The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> > > set them to allow using Multi-IRQ mode when supported.
> >=20
> > The binding only supports s32{g,r} devices, why is the existing minimum
> > retained? What devices are going to not have all 11 interrupts
> > connected?
> >=20
>=20
> The original idea was to support backward compatibility, as older DTs
> didn't contain queue-based interrupt lines described.
>=20
> But now, when you asked, I started to think it is not needed,
> the requirement for backward compatibility is managed inside the driver
> and yaml shall describe the hardware not used configuration.

Just to be clear, cos the last portion of that "yaml shall..." isn't to
me, you mean that the driver will support 1 or 11 interrupts but you
will make the binding only allow 11? That would be fine.
Just note in the commit message that all of these devices have the 11
interrupts.

> Is it my understanding right? Should I provide v4 with minimum =3D 11?


--yK1i+yQq5ZBwutQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfH4QAKCRB4tDGHoIJi
0tNuAPoDxV/IAeHe/4sVvqAaVI5emQP++yc9VFODMCulOLOD3wD/ZLyJy71N+Tg4
4efjJ30p/XNWBZVQgvn0cruDyAqP1ws=
=0Jjo
-----END PGP SIGNATURE-----

--yK1i+yQq5ZBwutQC--

--===============6151858003889712775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6151858003889712775==--
