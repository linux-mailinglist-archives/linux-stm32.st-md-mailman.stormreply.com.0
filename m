Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAC4614DB
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 13:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC64AC57B6F;
	Mon, 29 Nov 2021 12:17:31 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA10DC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 12:17:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 821A4CE114D;
 Mon, 29 Nov 2021 12:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F379C53FCB;
 Mon, 29 Nov 2021 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638188244;
 bh=MF4pWr2Q+9m9KQijQj8/y5kE5CLSfMRfQm3KSe1TCZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGbs6nYN6P63/qzyFkNaJ8lepdzFPoR+5IZRNrqqNUYMKj1sL150IBliUPbE6DHNv
 YcpFpm6b7t4dDMgmGe/gzw1xbK66vvqD/f++myigEr2hbjFwPQCtITZ9L8u/g6eEB7
 /VA+YZcOc/jdBVxc0zSPeBtd7FEkx51GYWE/uHNziDAwt7vxrhWdxx4aWkAnvj0E2g
 R7AsL5hJ++8OzuIEzR1Am3SmJOdplTZ+4drdtQjnjz+s58Q2KTcksgJk94hi7tfJZF
 5s+u8d2W+HY9OGWCFTwSbkeXN4dM8JeKAtRdkaAkXGqhEnHa/B22vdUNa3QGhQe+Lu
 OjAro4Rco0atQ==
Date: Mon, 29 Nov 2021 13:17:21 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaTE0f9ciy5JRZ3Q@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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
Content-Type: multipart/mixed; boundary="===============7125818211854653048=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7125818211854653048==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0e/kpnV1GKTrdwmD"
Content-Disposition: inline


--0e/kpnV1GKTrdwmD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		stm32f7_i2c_wait_free_bus(i2c_dev);

This does only a controller reset, not a bus recovery with 9 toggling
pulses, or?


--0e/kpnV1GKTrdwmD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkxNEACgkQFA3kzBSg
KbbreA//dH/TKvFG6peSxcSRE8ktcwY1eyHGCEfFXRdOU2Ml0I0KsEkCqSB7se0L
sfsuxAN5mxQfpZdP70KODDZGpRi8s5z9nL4kRyBY/VM7qBzxTwz1J3+TbnTeLXC4
A1VsgIvK8uIamtx/aFiCcpVk1AGd8zXnUJxhJts1k9feRIFAIq5niNBX60A9bbZA
2TTnBQ7qH03ecmKOV0kbRzch+ajceayx29YMWeuUV6hNFmc99VH4uVdBoL0bg3nv
VdqA6nWLS2AEtmR5TVClTuw5NoU5n6KxgVE37Bj9B5FUHHkNeUpljZmWt2y1bHLJ
8HbfkA/q36lO3qzF2iKWSKR8Lxrq87+XTnwhY4duCgUSuP+b8nLvmiTRYhD+Y4bx
4GGATMCAyvZuLD6JdNds26HMgefF5yCgi/DHUf3p7adhghGqeESb094Ewd9oZDGy
2a33eTMcIDYVqmtWV51D+dPafXBkIXYV92w4+vdAPiV1aJUmSUppSqUh9TvYD0Zs
422GgRNP2HLqzN4mawITWLYiGiTH/alzWAcwCI6dsg+fvz5GbIUBO5gc0miSpYO/
6Za169OnI06nOXP44e9LIkUbtO4b7q+XFGsPfW5w8WSCSmG7R26j/C0w0v1zuLy8
34ZjwNpxaCvFraneXFoJQwEDXCE4ayjMr6D1KWYVHyC3uvN32eU=
=k33g
-----END PGP SIGNATURE-----

--0e/kpnV1GKTrdwmD--

--===============7125818211854653048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7125818211854653048==--
