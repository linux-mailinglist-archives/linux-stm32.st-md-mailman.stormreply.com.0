Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09623EE2B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 15:27:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D867C36B3A;
	Fri,  7 Aug 2020 13:27:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F41F7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 13:27:48 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 771D12086A;
 Fri,  7 Aug 2020 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596806867;
 bh=cauRTF3cdR/PFgrsmHkzjr279ml8ZN/267S96A1D070=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBXsGfYbdXLESB4THwag+WPAVnL5mwYabZopJFRadh5IwTbV4OJ5YuQUZpprZ3CC6
 bp5X4FM9FzAK5ruMBje7aHEMQRi4UGr1Zwrdl/k+wEInPd2Z6/7BUoIJLBqrLxbuZb
 S3wmrfHiLijtUeSy2UjsqgR4FyGcBNUjf5tSXAVA=
Date: Fri, 7 Aug 2020 14:27:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200807132722.GJ5435@sirena.org.uk>
References: <1596806485-3810-1-git-send-email-alain.volmat@st.com>
 <1596806485-3810-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596806485-3810-3-git-send-email-alain.volmat@st.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] spi: stm32: fix fifo threshold level
 in case of short transfer
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
Content-Type: multipart/mixed; boundary="===============7504335049284284665=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7504335049284284665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AXxEqdD4tcVTjWte"
Content-Disposition: inline


--AXxEqdD4tcVTjWte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2020 at 03:21:22PM +0200, Alain Volmat wrote:

> +	/* data_packet should not exceed transfer length */
> +	packet = (half_fifo > xfer_len) ? xfer_len : half_fifo;

Please write normal conditional statements to improve legibility.

--AXxEqdD4tcVTjWte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tVrkACgkQJNaLcl1U
h9AKZQf/a+Ru7h5ixAXVScXCOGiC+r341yYUTHK9LElaCpXw4iTXlGHMRiJkJOsr
adMT9NNEs2Ka5PQ7wiKIw558VLZ5WbCQ2paWcKN4vElYOhulMCRn3X7Lcs6VYzW1
scWxT07YTt15Tvxi7uBpRedIgOYUO/1sey+1skdwaqQbQYykoV/XUvRYehzyeZ7G
tFJMFskTaBJ8T2I910IItEFasKttZUrLa1X3xtn97WiM2wnX+YCu+BDPwsKv5x0V
63H0dHkTGwEnNiByRU4O3rL8Bx0XnopWzYJlfSY+ayH0QYmh5raD0Fgn/86cW4e4
BVP46YZ6w0ZmTKL/prjveFSWY6zLyQ==
=v0uW
-----END PGP SIGNATURE-----

--AXxEqdD4tcVTjWte--

--===============7504335049284284665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7504335049284284665==--
