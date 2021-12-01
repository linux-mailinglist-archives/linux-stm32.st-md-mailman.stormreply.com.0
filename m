Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F6464C4E
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 12:04:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67BF1C597BE;
	Wed,  1 Dec 2021 11:04:28 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C997CCFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 11:04:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EE5EBCE1DCB;
 Wed,  1 Dec 2021 11:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B3C53FCC;
 Wed,  1 Dec 2021 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638356664;
 bh=7pQ0uFUOVKeErMhY9dzJH14SYOZ5LKeB2g8dQfFONSY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ewIcKZnbCOe2YvYsNotfoJhLmZuLVD/iDH+zlwmFTbDxRcUzOfb4MgPz56fPQi3/m
 vVAUze2gR897KUAJhHtA+f7YFxIZe64HwqtszzAS5GwwSYkhPvQZfFfpDlBZHFVbST
 angezio7KkhQR0MAFSwAjfV5EmLznL3D41GFwDreb2TTCJj+QLQ6UuwT0Vpr8mXfoX
 zI56kgoyk8IfQZfTIlEMScgnVuEjIGwURXb3fgOX5KsAFyYE82Zbgf7J/WotBIan0r
 SPZ7jA8KGKV1zLYsZtf0+opfrG50cP2fY31VlCBFO/yNeuBnGVyyadIER8yuY8FUEA
 DQgZEmwXJNt0Q==
Date: Wed, 1 Dec 2021 12:04:21 +0100
From: Wolfram Sang <wsa@kernel.org>
To: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 pierre-yves.mordret@foss.st.com
Message-ID: <YadWtUWHhQgWbh4+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 pierre-yves.mordret@foss.st.com
References: <20211130093816.12789-1-wsa@kernel.org>
 <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
 <YaaakSa16Dun6b+h@kunai>
 <20211201105953.GA825735@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20211201105953.GA825735@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: remove noisy and imprecise
	log messages
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
Content-Type: multipart/mixed; boundary="===============7150454908375954785=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7150454908375954785==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NuMdnzB3da78tof9"
Content-Disposition: inline


--NuMdnzB3da78tof9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ok, I thus send a 2 patches serie with mine and yours reworked on top of
> mine together. Hope you don't mind.

Please do.


--NuMdnzB3da78tof9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGnVrAACgkQFA3kzBSg
KbZFqBAAqoRiBLM+wqt8C/bR/WA5jcs7cTFUiZuRBT1bmfGGDqlqoizsNhF39Ms4
OLAsU/9u7K3btfWcopWLWlmnnvcGXb90cV2CY1AAJG0dQRhFMdW9a5+llW/wpYyM
F0jtNoMa+5cd85pvEa9RVlOPK1QnwvLTd/IktdpaxqFSITVLrwc6RJ2fmUkqFSLH
7p/PtEGGgOp1fVYmPvLW8FZ0UFE0EaVcaVcpcstyyKDz+F4tYD0YSqWuFS3b+9TF
URPpQ9M1xVCu9Ygz9X9UPmVXxOlYILhrymSCOaUs2095ypKQUVI1+IuyJpRfPyp1
T8TUWo4mMFVHglTYdrE1Ulz/dORTAqPF2ht6BKZQVfYsHSxU7+dFqSQ6k1NuEaat
Yy5wGWNCJ/fH5BYKVxGgfWVjKL387HuRtF6vdbe6s8wMvkPFyIBc80l69INvFsup
bGTpW6jTluoEdN8tChdHsySd/xWgMXh+8NJqIq+7ObKCcm4Sabl0zOMgJBycBsSQ
xZhAJA0x5EvSmIVslwCpjFbnw5xrxMZCFjGGKX6DpDRAD5JDQyOT2fV5UjhcuM+g
wzHvnCkoEUVIDm1xmz2xa4Up3qWw82i1GXin5z2XfdMcHNe2M4uN5b2ov5Njb57e
NEDAWA+EqtuUaA7C8RNITHx/DLEBvYQsGNHwAiB3eyShSY70KJg=
=J5Dz
-----END PGP SIGNATURE-----

--NuMdnzB3da78tof9--

--===============7150454908375954785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7150454908375954785==--
