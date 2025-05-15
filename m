Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E80AB825B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 11:20:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E5AC7A844;
	Thu, 15 May 2025 09:20:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 875D6C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 09:20:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7DFC5C068B;
 Thu, 15 May 2025 09:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E82C4CEE7;
 Thu, 15 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747300798;
 bh=yAE5ZaqBHdVLWaZoDrZHlWAUy//bRfgw5fCUmaQcQXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lN542K2tpX5KeIGgI5eh1Qj9mt3QfJDXZrQxR2X5IRG3WttDFY3pHx2Zdv28uKO9h
 NNRjgNVuZOptIjAmgcO8VBWBt0GFqfBETj3B2FbXWgZOXig/OF6cwo+mnAPtlNswzx
 ny3y2JxKtfU7xKXsFBI2fasxxM3PmQmYgbasJol+hp7J051xlDPTXTN6jv54rMgqhA
 wsfzNFh7LNm+pN0DgY+RcaVAKra0e0RJEoB0fpvO6yn/urlS9RCiGt0PgZYJk2AliY
 g5j/+ekx6LRPo+sCcwI0tJJi1GPgD/g5P8SHQmf1HyjyerWvx5BMZUuQSaR+1K6g/l
 LMWRL5Wcg1Ugg==
Date: Thu, 15 May 2025 11:19:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
References: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
X-Cookie: Well begun is half done.
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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
Content-Type: multipart/mixed; boundary="===============4282842761827571276=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4282842761827571276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NvFxYeYGiMf1vQuJ"
Content-Disposition: inline


--NvFxYeYGiMf1vQuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 03:56:01PM +0200, Patrice Chotard wrote:

> This patch is dependent on commit 6b3754009f87
> ("reset: Add devm_reset_control_array_get_exclusive_released()")
> available on tag reset-for-v6.16.

When telling people about dependencies like this the standard thing is
to also specify the repostiory, or link to a pull request.  The git
repository is needed to actually pull the tag.  This appears to be the
PR at:

   https://lore.kernel.org/all/20250513092516.3331585-1-p.zabel@pengutronix.de/

which is the full reset pull request for v6.16.  The commit you
referenced isn't the tagged commit, it's further back in the history
but still has a whole new reset driver backed up behind it.  I'd have
expected that if this was expected to be pulled into other subsystems
it'd be on a topic branch and directly tagged?

--NvFxYeYGiMf1vQuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglsbkACgkQJNaLcl1U
h9ClaQf/duEFMH9ku1tjFSWXgNBEHbSEBi9hfGtmNs2Vmy0bYAFCf/Ny5aHYrPmK
JJ7L1eHj3dfPW+ihDp5TgXjKgxHQdI5GMG2ywfUKCzT+I1Y12sb4g8F3CUWCAS1V
Wsu2gEje4X/5agpo3BprY1CgvAcuM9/u8/ycG7/DBXBmriq7BrYjbgxYIk8oxFpK
UAU49XCozl1o1It3RaLMSB3xnYnMyX+FaM2tMPrHXZJHLtAwuWChuCfQDo/qZIpa
yX7DwKID+h+/Lr5+EiUuaGLutyvNqjiC/kLtCi3LhSnVkgmFtvnfXQWZyCEZRkuL
J7OieaxVMHoILV2MPzAnMhSalQ5VGg==
=WTr9
-----END PGP SIGNATURE-----

--NvFxYeYGiMf1vQuJ--

--===============4282842761827571276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4282842761827571276==--
