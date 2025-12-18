Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C18CCB085
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 09:57:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2EE7C5663A;
	Thu, 18 Dec 2025 08:57:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EBC4C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 08:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 725DD600BB;
 Thu, 18 Dec 2025 08:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C19C4CEFB;
 Thu, 18 Dec 2025 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766048261;
 bh=ksxqoIpdRbVVOvr7sIw8thdMYg/F82UJczT1uvG5tPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rbpAqrezzp8uuA2ZOZDduDt+vMbOJUBBZbkTqRAjEFQALTpWw+lt5pwId+qr1w2p5
 JmlAxpLrWHymWA+CC9rrgxPsHXV+BdkE+kkkJ+xSj01np0plzIOjeNYvOFex1jkoTL
 NIkM8vRJJHMchwQ1usAci5W+FALJgxX1JshGGBOJzf31ZAkLw1RswHsa19dwYIJynm
 PnADjA5oeizDVvhses5PaZ7llu9wZe1YY2pAZLtGySr9aDOT+UXzK8ACdiuZFlLQvG
 21HjjbUrGy/6svePzpAkMDjSNohf3ioqVzKny9zwTftZ1M6DAUJRCYmcwVPevfgCQl
 iHL1P/MmCW8nw==
Date: Thu, 18 Dec 2025 08:57:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <6c153ddd-a586-4138-b3c4-793278d93305@sirena.org.uk>
References: <20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com>
 <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
 <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
 <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
X-Cookie: Close cover before striking.
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] spi: stm32: properly fail on
	dma_request_chan error
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
Content-Type: multipart/mixed; boundary="===============3974505121449261342=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3974505121449261342==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFnOC0IiRVMkfwqs"
Content-Disposition: inline


--dFnOC0IiRVMkfwqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 18, 2025 at 09:38:40AM +0100, Alain Volmat wrote:
> On Thu, Dec 18, 2025 at 08:00:57AM +0000, Mark Brown wrote:

> > Bug fixes should go at the start of serieses to avoid spurious
> > dependencies on new or cleanup changes.

> Actually I wasn't thinking about requiring this commit to go into
> stable branches. Without commit, the driver will still work even if
> there is an issue to request a dma channel since it will fallback to
> interrupt based transfers.
> This commit makes the error visible now, ensuring that if the
> device-tree indicates that a DMA should be used, it will either be used
> or probe will fail.

I'd not send it to stable either (admittedly I generally stopped tagging
stuff for stable entirely) but I will apply it for v6.19.

--dFnOC0IiRVMkfwqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlDwf8ACgkQJNaLcl1U
h9BLLQf/WR5nHoveAuyhE2UOKgmFpx1YKda7i+ruawoOM0V7DPsliCaVggh/eF5m
/uZhfiWjK8bhx5ag6iz650iYXBTmfL7J6joyuVeazhRgkVSdS6c4ht08aUTR/OUv
rNcwH8Zg4/yXYy7i/PheBof1pLD3O1RFIiMy4cl4TRswYGf+u98VZI+2EbQ+TcoE
WWqspzdkwoluh3pf918qQL8q4A6OOiM3fRDx6ca+R9xAjWhHAtSGyq25Oj8H8gcO
gNQ1zBaIfrKbFg8TUHzPS2uvORvxBD5pDrkvVeti4HTjv2QiqHgwmNL3fuwqBx0g
EJfAbZsL8053B8Pig7u3A24gWYwFiQ==
=JC2D
-----END PGP SIGNATURE-----

--dFnOC0IiRVMkfwqs--

--===============3974505121449261342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3974505121449261342==--
