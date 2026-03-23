Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELoMLnFEwWnpRwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:47:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E32F341C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:47:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3E59C349C4;
	Mon, 23 Mar 2026 13:47:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F6A8C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:47:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2B4600AC;
 Mon, 23 Mar 2026 13:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA10C4CEF7;
 Mon, 23 Mar 2026 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774273647;
 bh=n/BN5CL1WxBMpMxMXTlEGYNKW0+Dt8dFs9PN5GhrPc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jFqT8tOKxCtEL4bjUYtNwV0kyZpM34BPJ1M7/93ycZ8k+sJjClfRZHcpWmd80cGFW
 VQ+Brrjc4Gc68SlSQvKBmgHg63PEeO0YQGlKgHC2+UX4HtnYp1e2xxtx/ihz/NOuv3
 WbVIT734BcsAp35mgE/L5VJDSGjJDrM0OfqKuSb03tCMkub76wR9a6AFLDbwkTe1Md
 FJE583U1jnwmjBtb8+gl6xbV6x+Py0Rqe12Xh7E46hYf+QJdrYdytiFZKwsQTh1vk+
 0HbKVfl068bHzb798Kg3ZmEt9hR1oGxSve/zPag4U0kuT227V/hUPR+WSnLBlQsEcw
 Xpet+rWYat6Mw==
Date: Mon, 23 Mar 2026 13:47:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Message-ID: <e4146fbd-3e2e-4d2f-b042-2af006bdfefb@sirena.org.uk>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: Fix incorrect
 compatible string in stm32h7-sai match
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
Content-Type: multipart/mixed; boundary="===============7333096364266608236=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jihed.chaibi.dev@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:jihedchaibidev@gmail.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,sirena.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 499E32F341C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============7333096364266608236==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qE4q0SY78LU6P2Qu"
Content-Disposition: inline


--qE4q0SY78LU6P2Qu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 21, 2026 at 02:20:11AM +0100, Jihed Chaibi wrote:
> The conditional block that defines clock constraints for the stm32h7-sai
> variant references "st,stm32mph7-sai", which does not match any compatible
> string in the enum. As a result, clock validation for the h7 variant is
> silently skipped. Correct the compatible string to "st,stm32h7-sai".

A web search for stm32mph7 appears to show stm32h7 as the correct part
number...  ST people, any confirmation here?  Are both valid?

--qE4q0SY78LU6P2Qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBRGgACgkQJNaLcl1U
h9Ad4gf9FDP7GFBd0VCxZa8UNz10NKWI6UItALUjjjsjEf9mhswPDggnsknBDl2Y
4w+9nGrTJ1aX9nQUDXAk5ffeZJkk91NB7AwIOTVNqXoduBQZ3SaN/xy79C2JNNEN
CDIUAvRPa7QIA4bxmHJCA7AttHDuDToBYSGm3TOMJpJqtDZiGBmLckgE9tkMEzDX
odvwRZL1SHf94AwsDZw5rSV3+xBtGHwSiGcOr419u7dE8MuEZmU/W2/ghdhCHgMx
cuL7bDPqfruIPaOgiVXK3yoSyOQjs/KqtyOrwIjMoxjLUt8bNUMTkKvbB2udagcV
P3rXfJ+QMo5MqneyzB7J7DS+1Mjf0g==
=Zi5l
-----END PGP SIGNATURE-----

--qE4q0SY78LU6P2Qu--

--===============7333096364266608236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7333096364266608236==--
