Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB75KeB9BmrnkAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 03:58:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFA548982
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 03:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 781EFC8F263;
	Fri, 15 May 2026 01:58:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCD1EC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 01:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8B4660008;
 Fri, 15 May 2026 01:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48918C2BCB3;
 Fri, 15 May 2026 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778810332;
 bh=/csn1MNH7CqxFXm3s7m/76YlqYFlImYSXV+Re8/2PKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5pxKzdwNjKdE8TGxE90IYP/49WOgSOflnJanmfjicNzCsOcd2c4CFiACAzlBXFRb
 n0ACEYMRTcu0F1UVnqo2B0lB/s+oN5ktVIXiONRISjc63QmnT0baoUYaHN73Dt3Dk2
 q10yhPgkw9/gvlg9Jg+0ILBJdFbJKvAlcqET3mpZJ5TtnO4ttmKMQCZQCcR4zf+VCC
 WemngNbgxqgeVrCDWwNpsF5Z2tM+Xkr6Kgh0D8L0XTHfSGrrPqHC4Nn0PGpCp/aw//
 OAGb5GkztWe0exOdND7MFI8KmRSLA7a5o9clb75x6nChwksC16NIiW+y4AWMg/Bkc9
 U08+t8bGvzUkA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EABCF1AC58D5; Fri, 15 May 2026 02:58:49 +0100 (BST)
Date: Fri, 15 May 2026 10:58:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Message-ID: <agZ92TVjcYpEv_eH@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0181905387220546707=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 47FFA548982
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
	NEURAL_HAM(-0.00)[-0.991];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action


--===============0181905387220546707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JHw9B3lGFRV/+bbA"
Content-Disposition: inline


--JHw9B3lGFRV/+bbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2026 at 05:33:17PM +0700, Bui Duc Phuc wrote:

> I'll send a v2 of the whole series with this fix.
> Would that work for you?

Yes.

--JHw9B3lGFRV/+bbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoGfdkACgkQJNaLcl1U
h9B8ZQf/Wr48Xle/QH86Qy9wtXpd8zyaMYRJrmD7tgd33VlhL1P2qqPPpzIgFrUx
+oQOYBU8Y+JZajXK4OINoFfDIr1rLrMm7+nu5V8VYWVitSbQS0DF78UDQKn6AbVl
qbP4EkTeB4F5EP734i8DHd8asnpcB7wiDy8NAmyxpdlfswb4YNza/Zgv56BMbAQQ
vT9e6m3hAbFpmHqROAfgjOMExTCn2sjNEZ7EoZIZPpDWzDssNwavU+844z8UqFeT
sdaNE5jTe+DIV6NHimxIdUWkmnJMO5FFj7vse9C2Zrfp5J990SHdQUM4nmTzcXld
iEtrhJ77xFh2eFPZij6nhd7doLSf1A==
=xBvo
-----END PGP SIGNATURE-----

--JHw9B3lGFRV/+bbA--

--===============0181905387220546707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0181905387220546707==--
