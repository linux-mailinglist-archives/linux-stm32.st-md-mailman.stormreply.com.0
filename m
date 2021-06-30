Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 208613B823D
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 14:35:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD77C57B53;
	Wed, 30 Jun 2021 12:35:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60FABC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 12:35:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2DA61622;
 Wed, 30 Jun 2021 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625056516;
 bh=Ou0dDCgoY93+XH7Ohp1U845vXDZIJyhjcdMYSiuQTkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C56YgfjRwydgzFN0x7mgvW0G4MUTRG/h21qRv1gFf57Z8fePi1NOU9hsbSNqfe6bp
 n6BvGMRjpFR82y/1STdAjD46sczRg2gRbQa6cCQuKe3aOq3ts+rqJ/iRYQd7q76fA7
 FGH/oJrHYVKUEg6KzCgtmRUt4QxmHlAuZ4R13OsrAx8BQ1TPAOm61Zn3agDgmK6AgJ
 KdcmNOeQ3T7uDV1L+sGDe1f4pky5Cjk/0OLPRT0hiVZ6CbqemMmS0WehZzjYH5RnlF
 hOVVLd04fomkCA1tC1GqhNWcfcAWvneCbd8lVmMj6nq1Mh8ejpXwIQMlF7aK2jXwYm
 qkT0wLLwMY/vg==
Date: Wed, 30 Jun 2021 13:34:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210630123447.GD5106@sirena.org.uk>
References: <1625042723-661-1-git-send-email-alain.volmat@foss.st.com>
 <1625042723-661-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1625042723-661-4-git-send-email-alain.volmat@foss.st.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/6] Revert "spi: stm32: properly handle 0
	byte transfer"
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
Content-Type: multipart/mixed; boundary="===============0946516339042187046=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0946516339042187046==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 10:45:20AM +0200, Alain Volmat wrote:
> This reverts commit 2269f5a8b1a7b38651d62676b98182828f29d11a.
> 0 byte transfer handling is now done within the core in code added
> by commit b306320322c9 ("spi: Skip zero-length transfers in spi_transfer_one_message()")

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcZOcACgkQJNaLcl1U
h9B/ogf/Vst1y720ItQmoJtAnynVuU00lwrfCgpr2gA02reYHLKL2xL3r0VmqKBe
SCuYcM9dUn+xbGcvjgWs2vufZmXKUu7WLkSHl6F01GZWMV2oHflU9XsY7zcbYZIO
hRV7/ZN/Q1s/jwqwnI+pd4EbJ+lpdW6GRrJVgxj4TzUgEqwv0X2LPtZDDKqbSpHH
vtdwsYl/4JFmz/OfvHT046uAdbNeJft/Cwzn4ZZA83QxGuHbnVAOzSC1YQKiwuxR
Zsp5Ppr2NHJqD4em8bY7PKfZpocM0MGTknqrF9ZEs9It/vUnjF6JRDkJmze7R79d
nIdR40lj7E6pdA4xrv3U+mkfRkBY6g==
=8ayZ
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--

--===============0946516339042187046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0946516339042187046==--
