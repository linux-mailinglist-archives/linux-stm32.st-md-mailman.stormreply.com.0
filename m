Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKeIOS3ZCWossQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 17:05:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDF561E0B
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 17:05:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99598C8F286;
	Sun, 17 May 2026 15:05:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3C9DC87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 15:05:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6305A438DB;
 Sun, 17 May 2026 15:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980A7C2BCB0;
 Sun, 17 May 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1779030314;
 bh=HTf0CYA7N9N3ycOlSsH2RN9JpiCBHmSJID9/ns/WmqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OacEpg0BHllVT5dCFHETKkOb/zz7Q6gsVg68LmodwakwJs7TUwK+px4dfd2w1SItX
 SroQwxfa2dxebFsbEq5TJ+CIIfKootwvJE9alpoAqCLALsL/IFibntmjImIo6CCP9v
 hMhNc4WPIc2JRIvnEXCUpq8tzXLQEO89zHHz4GPzfn02Vy2WD/KGtkONSGloh3TuKG
 zTh3oKtNfwX62moIN6h5K6pGVWelBPzdZq+/n9ZViXSd32bbfLO71eeE5RMVQpiDN3
 nGkQ2RavjezKKqbnCJeZNZfRh96kfFQH5fC75f0aVKPwNl95uHNFBR4qHOR3oJIKut
 ULi35LN7GpmSA==
Date: Sun, 17 May 2026 17:05:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Message-ID: <agnY16I4sYAdRd9T@monoceros>
References: <20260509193928.19030-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260509193928.19030-1-manishbaing2789@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linusw@kernel.org, lee@kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: st,
 stmpe: fix PWM schema and drop legacy binding
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
Content-Type: multipart/mixed; boundary="===============3731707461417835206=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 7EDDF561E0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
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
	FORGED_SENDER(0.00)[ukleinek@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linusw@kernel.org,m:lee@kernel.org,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.726];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============3731707461417835206==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjp4gispirhzowi5"
Content-Disposition: inline


--mjp4gispirhzowi5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
MIME-Version: 1.0

Hello,

On Sat, May 09, 2026 at 07:39:28PM +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema in
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> PWM subnode was missing a 'required' properties block. This allowed
> Device Tree nodes to pass validation even if the 'compatible'
> string was omitted. This omission could lead to probe failures
> at runtime.
>=20
> Fix the schema by adding the missing 'required' block and
> remove the obsolete and redundant text binding file.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
> Changes in v3:
> - Added 'required' properties to the pwm subnode in st,stmpe.yaml
>   to close a validation gap identified by the Sashiko.
> - Updated commit message and description to reflect MFD subsystem changes.
>=20
> Changes in v2:
>  - Droppped the TXT file instead of converting to YAML, as the
>    functionality is already covered by st,stmpe.yaml.
>   =20
>  .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------

If the patch was split into two, each touching just one of the files,
there would be no need for merge coordination. Also logically it's two
patches. Would you mind splitting?

Best regards
Uwe

--mjp4gispirhzowi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoJ2SQACgkQj4D7WH0S
/k7qMgf9F8VgNDKxylmZdIj4jJug5gFq8NLuFrwgb2rwAp26Bz+awUtEStzEzWKd
YpjTwUDqoiOqAam42pv06UN8+mKhBH9BVfekX4xbfyJ3WtQVCvea1hPgVXfWv7Ed
ADiMCiIY/8grsyCNp5IFeCgnhYBjn7gh4u+aCdhebcKWUnmTSZjcLAsncqe2WhWI
PLxxYjvuQyZ32cYE5w0TZ99ak4QNLT4kjaanPA92nxbT7RXSWs2d0OZOPdKAE0i9
s3Bu31dCoJ9u7XgQxtrlZGHxKMhuv6MBZdf+L73abLabw7tMi+nLe2V8p/nOv9AI
XTZoWFflGQwfAyG8uEGHOxvzIgCRyw==
=LQj8
-----END PGP SIGNATURE-----

--mjp4gispirhzowi5--

--===============3731707461417835206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3731707461417835206==--
