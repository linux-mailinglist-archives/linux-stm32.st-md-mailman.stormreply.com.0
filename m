Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNeLFNRRd2lQeAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 12:36:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1387B2F
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 12:36:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AA97C87EDC;
	Mon, 26 Jan 2026 11:36:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 334DFC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 11:36:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C169443F79;
 Mon, 26 Jan 2026 11:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8ADC116C6;
 Mon, 26 Jan 2026 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769427408;
 bh=fMW3xln2MzGP70duAqnJmh3ux9jiSOnAfn5MysH+Zf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hWCONtom9UR35t4Jjg3grUOMwMwuvzMOJI1zIHbZ2/aygSZ4SaN2wxDn2cy5JPlRo
 o0KIKUo529wIjKbFgV5xJIQiSrBq1719FvNQ9QMesPN/ke/CKDMjXRefGv49uttz7M
 qr1JIeKqOxvVZSfmwqKVLFgZ2nZLxnBxOzqN5dhDnbuq18EevZMcWnyr+SVYSk8L+m
 vjUvTuHAuuXzTVD7HUmEh5+e4opKlnWszVGJ4qpGcDhLGNpbKnWfF03Qm2auoUr1z6
 Ykf0IpTSNI5i2zBrDg5w24yv8iTnY0lNdGpG1ocBCiWNbIIG/DWtuX2ZLLk5uqxfv0
 FQADRLXGkHWHA==
Date: Mon, 26 Jan 2026 11:36:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <c869a528-8f94-43e5-9f39-e0a6aa412291@sirena.org.uk>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
X-Cookie: Haste makes waste.
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH 3/4] treewide: convert hwspinlock
 users to the new consumer header file
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
Content-Type: multipart/mixed; boundary="===============2229781634603671082=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:linux-iio@vger.kernel.org,m:nuno.sa@analog.com,m:dakr@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,lists.infradead.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: D6E1387B2F
X-Rspamd-Action: no action


--===============2229781634603671082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U27r7qI+dLbbzJvx"
Content-Disposition: inline


--U27r7qI+dLbbzJvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

Acked-by: Mark Brown <broonie@kernel.org>

--U27r7qI+dLbbzJvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3UccACgkQJNaLcl1U
h9DfNQf8DbjFMTf4Rb2LTOoQjS2RvGlVbcaxAJBcyUFBL5+qR9H5s02vvhD/lqtb
vkxgPBX9XjhK6W/x2BjZOowhS74+Vsi8IVWF0P+rskimDpri9uWVA+19UQ3bKhqD
NCAJa3MPHQcjewDiwKtqNrgRTcnkwFcbCM7uufWpy7JHraLQMxbysBrYyqR9hsOK
De3xCE3fZX7Xu282B7P7dUEzKFhCPUl6uXytbN0GA+NXrF5TAU7BIOVFkDghgyko
Rd6g/XwputLTKOCDYKXgtjCrpKbARTfrQFvJGRbYaKIlnIkXYiCDqNMhvOsDAaVT
1S9DAngxqouYY85AHzBVffc18Fusnw==
=JxoC
-----END PGP SIGNATURE-----

--U27r7qI+dLbbzJvx--

--===============2229781634603671082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2229781634603671082==--
