Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0SF3CEDfEmrG4wYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 24 May 2026 13:21:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9475C22EA
	for <lists+linux-stm32@lfdr.de>; Sun, 24 May 2026 13:21:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79271C87ED4;
	Sun, 24 May 2026 11:21:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83851C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 11:21:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 7E0C0600AA;
 Sun, 24 May 2026 11:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 874481F000E9;
 Sun, 24 May 2026 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779621692;
 bh=oLiSri69Now47RImuq7She4lhkBga74FFWNykITHvrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Ivt+XsYsfCEwwRlyrk81FgW8qmN3XGVrUO4QIE49s7hLG85UWNqNJFaSnj2oNI2Ba
 i1HR34jswIcsOXNFB3K/MjAqwzGQ79pneyvAfKAIvQfzwvTX6+dMpKQirtRaCRntgj
 X8gg/k38ukFxyZBKSukaVZ8pP4IHopZFKAMnlQWlkvZYGl3gzaIJ9/kpC+abZ54y64
 wAnUhPcRqaCOF6Gt5OxzSvpXai5cXSrsDJnmFwWSg4NHRMjofNGihVHDuwCwXk7txi
 MJ+YuW8qYiRyo/oGNqnAziNoro3Kf1WmvoCaolWRJK3C0GpMPMuEOJYge820VPRPJz
 ej0Ch+HZiwFGQ==
Date: Sun, 24 May 2026 13:21:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Message-ID: <ahLemdy7Ie9n-Ltx@monoceros>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
 <20260523173251.72540-3-manishbaing2789@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260523173251.72540-3-manishbaing2789@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 linusw@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop
	legacy binding
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
Content-Type: multipart/mixed; boundary="===============3811015249451802317=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ukleinek@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:linusw@kernel.org,m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:devicetree@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,microchip.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.502];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9A9475C22EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============3811015249451802317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apdghv2sfx72heyb"
Content-Disposition: inline


--apdghv2sfx72heyb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy binding
MIME-Version: 1.0

On Sat, May 23, 2026 at 05:32:51PM +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
> obsolete and redundant text binding file.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with Rob's ack from v2.

Best regards
Uwe

--apdghv2sfx72heyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoS3zYACgkQj4D7WH0S
/k7CnQf+LrJy/swVkHwrkqPTyAvOZxezQIxQ6APF6k7/l2fout14sLJ0g7dQtpaW
nUc8cmeCXmoQkDQ/uhzxhfQBxEGXIX+p92kbur2eXOUWsErUzdPFqEQ1bxZhGb5p
clieA/lMQE/uZBoFhSlF73S9yBKoQks6s5rqTsEq6vyArWYXm74eHvrcsW+UNL17
Qsr7my0ZvgUpvRVE6F++d2SpNdtgrrjUAhq3dMqn/HnlQFoNoOxPAh7FKyg5MTyF
IduJDMP/25MrUL1hRm7XDoiP8xkbHfoHpZif0h0z1xrm8URPA4N5BvTO0hlPmgCd
pDpNs+9W5CK4XIhyssis+HaaiShrMQ==
=1Xa4
-----END PGP SIGNATURE-----

--apdghv2sfx72heyb--

--===============3811015249451802317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3811015249451802317==--
