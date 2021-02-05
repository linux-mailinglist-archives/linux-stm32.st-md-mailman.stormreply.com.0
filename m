Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B15310BCE
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 14:30:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C18CEC57B51;
	Fri,  5 Feb 2021 13:30:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95254C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 13:30:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C37164F6C;
 Fri,  5 Feb 2021 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612531832;
 bh=8/S6dC/Cyik2IWPqPhmn7AbHJFdhxexop0d79CYhEaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDo8YhqUJAJClF4NCrCvU51d0X/24FNmGuc0WrS7hydeqAjgKGxWXl9Q7DDS+azbK
 h7jMc1pTK0KpZMBFmCqkALv4BP3/Ecj5DZcuFDbqSTuKtxKMJWNGyIbzVn0SkQigD8
 gp9T1MyYldNhUKKOBseQ98FqH4SjtWD3WrI+djoINV/+FQeKBVXL/BeQoi2mEWDGXL
 jBvN7GQQaI1D4Gwm8xOIYoBJg379wlh+R78xtQZa53ceASYjbpc1bnSJBzHwNEbv43
 OwGAh1/ZTYcMWaYXqPGG2mUXDQZHnzkWWgDzKjxzJxyYt53lCpp+x0axXfe2HRxfCY
 j56FQMdzg+Qyg==
Date: Fri, 5 Feb 2021 13:29:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210205132942.GA4720@sirena.org.uk>
References: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
 <1612523342-10466-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612523342-10466-2-git-send-email-alain.volmat@foss.st.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] spi: stm32: properly handle 0 byte
	transfer
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
Content-Type: multipart/mixed; boundary="===============5405238838865755515=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5405238838865755515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 12:08:55PM +0100, Alain Volmat wrote:
> On 0 byte transfer request, return straight from the
> xfer function after finalizing the transfer.

> +	if (transfer->len == 0) {
> +		spi_finalize_current_transfer(master);
> +		return 0;

The driver only needs to finalize the transfer if it returned a value
greater than 0, returning 0 indicates that the transfer is already done.

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdSEUACgkQJNaLcl1U
h9DG6gf+Pkz5r4YOP6ld6ZsZdM/LuqTjO92jsCER31Xl2O8S1A2Tgfj1La0v40tE
2GBWz1gdoIam2hxKE3HYTIqB/952V5ETUMekujRNnFQq4mRn1oxaaD8z85LWqAxB
OUDkBLLVch560M5MUfZxYMydbd+DbZrbR4K1XE/oTB+Sn79XNQtKrClK6ytHjnbW
XDtHWh+zlm12jj5qm160n0takkQaEYkAdYxE8C5imuRhk+OXsgrqoYOLTehde0hp
nBkaLiBVsup7XbOMmbpkH1hEKk9GEwmn46Q3S9TnkUYblsdAaGYGRtA/m0XEy2nA
QFJBlfHf6+dAAXVb4YaWxPp/Q8S5QA==
=ad7+
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============5405238838865755515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5405238838865755515==--
