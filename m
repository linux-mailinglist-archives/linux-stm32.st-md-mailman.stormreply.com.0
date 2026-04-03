Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DuyD43Rz2mY0wYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 16:41:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC5395513
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 16:41:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D103C8F271;
	Fri,  3 Apr 2026 14:41:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C4CDC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2026 14:41:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A24E60123;
 Fri,  3 Apr 2026 14:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93C3C4CEF7;
 Fri,  3 Apr 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775227274;
 bh=ibcg/0c32l63ELnz6pcHv0xUM+Jh8xoFMgT/DG4WjUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g47xt+fcI3o8MMhA00xZZwUrsUSzoh1yTpVBh9ylCfGHL/vbpmh0jmCb91bGhW346
 YANfjpgBZxHb8M6Co7KELDSiSpSpyQNzjlEci+PcLlXvjrq4W87fqtBCW1wEc2Cq0b
 v0dHgJMaiALVkCrUQdl1WkyUjA/FOyZc1+cPuOsNcmJI6rXN4LqBoX0OSUQ28NGJRB
 izkDjMe/BANOiECIky5Bar9XTnJiRAvnuZaTSWiYTxrmzqYd9UjFhRvgy3HTyM39K0
 E1OmQSWB8m9Yefusd85Lr6SRfGcBaK5QX/D6UEXFomexVicVAdRmt8yxmVGc8baicf
 zN9lJMPbsrbMg==
Date: Fri, 3 Apr 2026 15:41:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Merta <Tomasz.Merta@arrow.com>
Message-ID: <fe1e50f4-30cd-467c-8db0-8af7a9a3abb8@sirena.org.uk>
References: <SA1PR04MB8467CE79DCA58DF65FD9A798935EA@SA1PR04MB8467.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA1PR04MB8467CE79DCA58DF65FD9A798935EA@SA1PR04MB8467.namprd04.prod.outlook.com>
X-Cookie: The Korean War must have been fun.
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
Content-Type: multipart/mixed; boundary="===============6206670962377245750=="
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Tomasz.Merta@arrow.com,m:alsa-devel@alsa-project.org,m:mcoquelin.stm32@gmail.com,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.768];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,arrow.com:email]
X-Rspamd-Queue-Id: C3DC5395513
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============6206670962377245750==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmpnob42kQqUYH2A"
Content-Disposition: inline


--zmpnob42kQqUYH2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 02:07:52PM +0000, Tomasz Merta wrote:
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
>=20
> The STM32 SAI driver do not set the clock strobing bit (CKSTR) for DSP_A,
> DSP_B and LEFT_J formats, causing data to be sampled on the wrong BCLK
> edge when SND_SOC_DAIFMT_NB_NF is used.

Your mail is pretty mangled here, there's a HTML part and the patch
appears to be appended after a signature, it looks like all the tabs got
converted into spaces too.  If you're having trouble sending b4's web
submission API:

   https://b4.docs.kernel.org/en/latest/contributor/send.html

bypasses your mail infrastructure which tends to make life easier.

--zmpnob42kQqUYH2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnP0YQACgkQJNaLcl1U
h9CehAf+KeIAvH9Na4hWFjXfP9Vk5S2dwRr3ytLXIbhh7UH/s2xaoP70u8WyBDSl
4OQapxRTHOuPfq8a/o/or1KXCgl+zsOFW3WOfwYIAd5yiqjcQQCFwUfv/yuzurAh
ungTZRxN6rqEKKgeUbbFHAPU+5SIB9+wD1S2P4IVRDf3vrpW3FsOmh1uPmh9wM7b
QGZpUu3MHHJhUXMJ2smG5MIaTY1+47VPCPjsqNo/xIn1iFBsSx8ibuFYJRXBz11O
0fxpLliVt0IZUmHjhRSw3DsmUbZUA1SgNX63JTGc+bVarqrnHqF7z8tTKdot6UeQ
6nFxKe5DR1YdEAD9wKW6XfoTaV9HYg==
=Gdk7
-----END PGP SIGNATURE-----

--zmpnob42kQqUYH2A--

--===============6206670962377245750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6206670962377245750==--
