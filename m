Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBJbIz7w1GkjywcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 13:53:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CC3ADF88
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 13:53:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96FCCC87ED4;
	Tue,  7 Apr 2026 11:53:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 901AAC87EC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 11:53:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FA13600AC;
 Tue,  7 Apr 2026 11:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EC2C116C6;
 Tue,  7 Apr 2026 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775562810;
 bh=81UCFkPSusex4GmC+Y85/hvgzegpWkjrUV5/bZWlTZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TbLU9v4/cc8KfvMORMKJvc7+bLiwyXRd6uznC+lAdS3kbTUKst3sBSyYCGZmzIFw9
 7wDsmNDskDfqoDlItODwk6V8XJlVdrI5DRG6aRj4E0yk17nygbakM27gkK2E1ZSv4O
 cg3Oi+v2lNH5RelVAYSwauSPudm6l1/gNcRR5fdYhIZABRHWnlw4o71+zlMjx2s7Rw
 7CzxDlQGZA8IAF05jiQf0cJNMx2XGD4bN1JgKOj8i4jm+Ujcogsx5bcrGP/1r9Keb2
 t9wetgw8kk5tcc10SH7h2UVYfmmoAiurw8Tv7nZxRDdFOGNPeJ10rccYdOhNlyY1wq
 Sc5vn3I3uimGA==
Date: Tue, 7 Apr 2026 12:53:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Merta <Tomasz.Merta@arrow.com>
Message-ID: <9b0a5620-b075-4808-a033-8e9171341a36@sirena.org.uk>
References: <SA1PR04MB8467F5A56C565316DC5C1EF2935AA@SA1PR04MB8467.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA1PR04MB8467F5A56C565316DC5C1EF2935AA@SA1PR04MB8467.namprd04.prod.outlook.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] Subject: ASoC stm32_sai: fix incorrect
 BCLK polarity for DSP_A/B, LEFT_J
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
Content-Type: multipart/mixed; boundary="===============4240647223713627106=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,vger.kernel.org,suse.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Tomasz.Merta@arrow.com,m:alsa-devel@alsa-project.org,m:mcoquelin.stm32@gmail.com,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.536];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Queue-Id: 2A2CC3ADF88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============4240647223713627106==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDtN4iSQoPsycoIG"
Content-Disposition: inline


--CDtN4iSQoPsycoIG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 08:06:01AM +0000, Tomasz Merta wrote:
> From 553c09cfa84fa801fbd8dcd5c9ae96e94a54ee31 Mon Sep 17 00:00:00 2001
>=20
> Tomasz Merta
> Software Engineer
> E: Tomasz.Merta@arrow.com
> Arrow Electronics | arrow.com
> From: Tomasz Merta <tomasz.merta@arrow.com>
> Date: Fri, 3 Apr 2026 10:33:11 +0200
> Subject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
> DSP_A/B, LEFT_J

It looks like the tab/space thing might've been fixed but this is still
very mangled...

--CDtN4iSQoPsycoIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU8DQACgkQJNaLcl1U
h9DyvAf/Rt2CH1P5hJqmRtVbipB1zP7s6plYwyWWK4scyfs22d0+G+bPrVM0h45A
ye3OsFSPEKhSfQLwziSEcPSypARuBZLnrxOaQxuK0NK3GjusOk+AAcHJSggTEUsc
dswtziesZx+XCL5KhNP+SsdazSk/bXityi12kq4bVO2lsH0jTqnmpt2PtFuihrG+
PIOD09BXCI+K8s2rqbNZnDX9OzicNPCmDml/11048YzX8gEN5glo5FiWwKOtR83d
gFnj3G5DqBdBTvZl5qSUXv8QWRk3nSVFsqaYjRa7ek6BCa0nEdK7u2LN2wDrHkx6
n/8mvu5s2y7hBttzz9c2cBCdWcOOdQ==
=m0cC
-----END PGP SIGNATURE-----

--CDtN4iSQoPsycoIG--

--===============4240647223713627106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4240647223713627106==--
