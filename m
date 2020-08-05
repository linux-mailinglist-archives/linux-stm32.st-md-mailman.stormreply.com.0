Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9123CA22
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 13:03:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 201B1C36B3C;
	Wed,  5 Aug 2020 11:03:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F5ADC36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 11:03:47 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAA1622CF7;
 Wed,  5 Aug 2020 11:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625426;
 bh=EiATByOyKVVEDEiKPvEDXfJXjBlvSpmgzgFeI6rtaeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1U99Db/ClRkQ6KDU37nlwCde0OcY8IsBhaUDb/7P4LktqYY+Z0aXwlIHJjaLLEg0i
 HP6UmQ81xNImqJlw9hvBneS5eOrYgM8OpOB2BwT4o1Bk6ZArKj0cqnNrzzsAZPZsn9
 CMXDKJsrOkcPyiFsNo1isIOAWdLVMRyDgwbTlfLg=
Date: Wed, 5 Aug 2020 12:03:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805110323.GJ5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-17-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-17-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/18] spi: stm32: always perform
 registers configuration prior to transfer
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
Content-Type: multipart/mixed; boundary="===============3968244449641138634=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3968244449641138634==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2020 at 09:02:11AM +0200, Alain Volmat wrote:
> SPI registers content may have been lost upon suspend/resume sequence.
> So, always compute and apply the necessary configuration in
> stm32_spi_transfer_one_setup routine.

This also.

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkfoACgkQJNaLcl1U
h9BirAf9F8v+4ZpcM5/rsegzbIEMnqmQNj2m1sFs+bLGVfyscsekXzaSTqzqJkC7
nev7KJtz7moksvzFim3TlHdPOTGmX9YOGii/DSqoYftYYbqHLfZhYkEXE5xZQfkm
NymiZpnrHMSWOUaV8EGcpL2971rJHz+7LoOwwiJAPLofZu6fJLHXDw7ZMCZ27RIk
6GKEVtsn+Vhh0oh5RzSVeKwmEBtaj0Qng8SA0xRC2+1dGhmPFYAbznHVWrFyJYs1
WtIKtCh/v8wZ732BrS4qiyd/l5UdyesjRBugNMwx7ZNlqLwYHiFQhh8VxX1ot+hI
72nCUjTwhxvzVa40nFYNpPYf/9ZbAw==
=1GlO
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--

--===============3968244449641138634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3968244449641138634==--
