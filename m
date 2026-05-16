Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7BXSAurdB2raMQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2026 05:00:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6236E559FA7
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2026 05:00:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2A1FC8F266;
	Sat, 16 May 2026 03:00:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C280C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2026 03:00:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 421BD41959;
 Sat, 16 May 2026 03:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A96C2BCB7;
 Sat, 16 May 2026 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778900454;
 bh=HFLpP0j57Gst4fAbdNsreMBu/SwQoUZ1kgnq8j+IcOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hdDsscDNmeL62JgZyX0rtWcMD1xBb532z/HpVKZ3REYKXl0dI7OmYkmV+8w80da/L
 nPxcPUHwo66Tz0PZA/aT+42eq+c9w4cWxf0QGrXWVIp2FEPEImCZzaZe9RPNaaCUUe
 PUq2sE9bemEPg0sYSMexZ9LrSUgSWOqI9aeGvHy4xhedERQ9NGh8mEhoQPgIajVcGh
 9doQzUTQmaV7EPD2+wksEaD8CGmBeJ/OIKLYG++RhjfryFDv2nhLdiFQwmqJmMlHu6
 NxTAMq9e/sszeYTHyoQMucCOBu0qlAnf/lICxYtypNj8DaMg60dftIZ4buaYiI2wfJ
 Ti8BBQNTYEW6g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B913E1AC5A48; Sat, 16 May 2026 04:00:50 +0100 (BST)
Date: Sat, 16 May 2026 12:00:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Message-ID: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
 <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
X-Cookie: Truckers welcome.
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for
	spin locks
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
Content-Type: multipart/mixed; boundary="===============6985570728908020280=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 6236E559FA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action


--===============6985570728908020280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wb7h2GZXqtWpMj3T"
Content-Disposition: inline


--Wb7h2GZXqtWpMj3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2026 at 11:48:55AM +0700, Bui Duc Phuc wrote:

> From a maintainer perspective, is there generally interest in gradually
> converging these drivers toward more modern/common PM patterns,
> or is preserving existing hardware-specific sequencing usually preferred
> unless there is a concrete issue to solve?

There are likely to be different considerations for different drivers,
on some systems the power savings from managing the clocks may not be
meaingful or we may need the clocks for register access.  In general
it's nicer to actively manage the clocks but it's not super urgent to do
so from a framework point of view, it's more a how much work the people
working on the individual drivers want to do and if there's a use case
for specific hardware.

--Wb7h2GZXqtWpMj3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoH3eEACgkQJNaLcl1U
h9CWHAf/dTTHqWbJspq/0Qx6ffNRKEylxcdLqo4FSGl/tNx3HRkaSdyCNp1MGOW/
JBoLRDGCg6Zzt9LCEnQVLDIui/dyYHlgeHyPUsRNMoW0CIGvkiv8LAYfBb3fqenB
wDzwLZIlYwjuO/GmD4upv0XA+rT/YdNHmL2ENMmKDD9e4k8aI4V6kOHhc2ZXpV3f
VomzNihV82+hNOs9885tQOnf3haJwwAPG9yuUqJA9M4a3jdm7WEk6tc8+N7rtltR
4Satj7kr/K6bUtWJDRZ+Z5Nbpr9meCN5PSD+qZt3hWhiVAaQK4w9hKKhS+1oxWAR
/c6vmVHrbIq7x8SebQcdDs/oHp4ijA==
=76w0
-----END PGP SIGNATURE-----

--Wb7h2GZXqtWpMj3T--

--===============6985570728908020280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6985570728908020280==--
