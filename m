Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLthCbtAk2kg2wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 17:07:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590F145EF7
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 17:07:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B0AC8F273;
	Mon, 16 Feb 2026 16:07:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 369C4C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 16:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF1A36012B;
 Mon, 16 Feb 2026 16:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2960C19425;
 Mon, 16 Feb 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771258038;
 bh=hEPLR8cnMpgueHZG50gYeR0KoXwhGhymV94A/W+Z2Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7bhGQ4iHc5VxfRhPoZKY2dwSlBIf7egpLYIQgCKHFuqypDasXrw2FJNLPVe1tehz
 Bb6abyCh4X8yjy+pJQqILtmAAGQQpP68mbn11T8fLDPR/+GaW9ujE7Nmfh0I6f+6Yd
 7GnkjwGy7p7u/An1ROb+kpAheOvzK6SLpdqKRsujbbSrgybdu7xGkDtPyakDyx1gr2
 aunERHIyXbyXkpWd09WaDGmffdeHBmSx8RGOW43INddzw8l/FjqOkOBZj8F0ernRwN
 0cVBhXurMlzXAogKLNBhhqEMq2GXPjNUW5S7okQ1erhe7ssnKpizafyfCHFdlokcXP
 2+lK8I52iV8Jw==
Date: Mon, 16 Feb 2026 16:07:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <97c1ffb9-e661-4021-8ebc-a5be1f650d42@sirena.org.uk>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Cookie: Beware the one behind you.
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 linux-remoteproc@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Orson Zhai <orsonzhai@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH v2 13/13] hwspinlock: refactor
 consumer.h from public header
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
Content-Type: multipart/mixed; boundary="===============5830487811023768931=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:andriy.shevchenko@intel.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-doc@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmai
 l.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,vger.kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,intel.com,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9590F145EF7
X-Rspamd-Action: no action


--===============5830487811023768931==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HvgiA0QUjJpkbfJw"
Content-Disposition: inline


--HvgiA0QUjJpkbfJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 15, 2026 at 11:54:53PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.

Acked-by: Mark Brown <broonie@kernel.org>

--HvgiA0QUjJpkbfJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTQKwACgkQJNaLcl1U
h9Dr4gf/dawn1jflZdEr4KfMA/MruyXk1IsoKKd6nHfm1oO8lk65Zor92E7Xmfx4
fv2GB5hE6qadTOAvHqXE7x79fteb3IQklPN/wT3cu2aTI/rjEgZ0sRP8ppDwAFl8
Y+uWW4fiu0/GF3r0JU+w0eUmNySB2x6iuzQYbSAt0kHRupCUL+7oMfkYUpFloTGP
gXpYBXwh3vIHVbl82mqSr64E76why0OmoRZ742fRWj4PVB+Db4B928d6tVNMV2dq
a1dzjyT+6l1OFHdgN7X4XZQbtdLAhmz6Dk++pV55q+WvAYKpU0jg21AXf9al99U6
k/uHzg/1zB+99V44BT6S1tVSG7Udww==
=dPJC
-----END PGP SIGNATURE-----

--HvgiA0QUjJpkbfJw--

--===============5830487811023768931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5830487811023768931==--
