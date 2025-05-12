Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09741AB3088
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1621C7A834;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82FE7C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 06:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747032022;
 bh=3YA3dyA7fc/Ouhhp+VM8Zd1IJ48oa+kRBjWppAACdkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZQSAymog4yTGdUmTPYv5NA2Lls2DaVwWQ0mZK37+lOXJJaEq6jt+f59bAqI7Ka6j6
 n0vFhBRTSgcNhq79s7VdaPHNkJsXmHTKx/V6JlGbRxugXgFq9ppiRTQmNN1WN6WjGy
 bsNt2mOTsrxz5ko5qHA5zxHtVX4tddP5mpkPbUzzhqsYlMZo7xlqhzG1z5rU1iANfB
 WBxFz02MfjnO6yv1WdsUWh3coxNhQ917lqIsIRi7bYnOpViCt5ZSWQz52tsd9qnmpN
 XOAXAMqRScvYdO/JBC/vTdcsGvJoKy4bIehDRA8b8EEj6qpaigtENuPLigSBaCCdir
 OOP4PYcLkirFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwqjc6J7lz4wcy;
 Mon, 12 May 2025 16:40:20 +1000 (AEST)
Date: Mon, 12 May 2025 16:40:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Message-ID: <20250512164020.55eb30f7@canb.auug.org.au>
In-Reply-To: <aCGGZ9gApo+QwSMD@linux.ibm.com>
References: <20250509122348.649064-1-skb99@linux.ibm.com>
 <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
 <20250510110455.10c72257@canb.auug.org.au>
 <aCGGZ9gApo+QwSMD@linux.ibm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Greg KH <greg@kroah.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Mykola Lysenko <mykolal@fb.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stanislav Fomichev <sdf@fomichev.me>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 KP Singh <kpsingh@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Fix bpf selftest build
	error
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
Content-Type: multipart/mixed; boundary="===============2325220887944383487=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2325220887944383487==
Content-Type: multipart/signed; boundary="Sig_/nLXLLJNx8i0XWRzr=BN1g7o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Saket,

On Mon, 12 May 2025 10:55:59 +0530 Saket Kumar Bhaskar <skb99@linux.ibm.com=
> wrote:
>=20
> Apologies for missing the Fixes tag. Would you like me to resend the patc=
h with the=20
> Fixes tag included?

Yes, please, but send it to Greg (keeping the ccs) so that he can apply
it to the driver-core tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghl9QACgkQAVBC80lX
0Gxjogf8CwRo3iw1LLROG/ll6OqsWmpdaFegvG57rScdZeaWHH1xMCOl/GmBTJu2
gp1/6uX5sx7/87CFLgEWAIjT6h7ijKj5V5d4F3wM6HHR04BC0lzUWtO99rn20FMU
Mxg1/jTzDcHqsMmakFCiFPkxQQmcuy7+TMY+1UsC2ouyvdsOgtE4wf7YSmiTRJLl
Q2tlLWAYHIZTsDUxng2h4eq9d19f1QZvlfntpAfvfblkKuaM/gzEiQcJnC2iG159
RZyQCPMEbySj2XUJqx8slBUvS853/uTL9Ms2ggrt1t2pf7uKdcCRNtHF+pFxJPbm
6jOW5Bu8Ncm0+xSJaiFB+z29byxL2A==
=xLJ7
-----END PGP SIGNATURE-----

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o--

--===============2325220887944383487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2325220887944383487==--
