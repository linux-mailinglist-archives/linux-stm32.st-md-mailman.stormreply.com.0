Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA2D3909DB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 May 2021 21:47:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D659C5978A;
	Tue, 25 May 2021 19:47:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17824C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 19:47:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1813961413;
 Tue, 25 May 2021 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621972043;
 bh=x1sZbWOtSnpsgAzWYUcCGvxF6SzmM2vlaPv23eDSbUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQtpHLqhPJn2UYJpruqslAFFKj1MBQumrD8KgZJApbKPN2e+l67JIITYqGAn5uEWf
 hPRwG83r3Az+S8IQH7hoLeqcH58teCNNnbThnbMuu6bGEg9JMFEr+q27REEnyk6hxC
 yg6MtYVLnqkDb1BEGpB4BBr/ws8mA7FCa3ei2KWRVgbooC38z8dImWgANHot1t8Uzs
 DjIEpzXaSaie8daLBX3zt69uXxJlpiEL3i8il63J7aR986vBd8a1Byq/I7f4K8QZFd
 L95J93gWhFXhNte423FQUgwRji/jPr2o0bi6EJ+x6VW0eNb+wrmKpGeBjidns+ANrC
 ps5FYOVLoYXOg==
Date: Tue, 25 May 2021 21:47:20 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YK1USI+N4LYDrnWz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, mark.rutland@arm.com,
 pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
 <20210507005517.GA1098665@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210507005517.GA1098665@robh.at.kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] i2c: add binding to mark a bus as
 supporting SMBus-Alert
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
Content-Type: multipart/mixed; boundary="===============5293493056408718000=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5293493056408718000==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lXCiqtMu/rloN6dd"
Content-Disposition: inline


--lXCiqtMu/rloN6dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This needs to be added to i2c-bus.yaml too.

We don't have that yet? Am I missing something?


--lXCiqtMu/rloN6dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVEgACgkQFA3kzBSg
KbbzHA//eAe069xksWcCK4n4PJAH2iB8PYC+w/jZxOPD0UicTsl3ggHeP+ul45hP
lssT9Qxk1U/Hz6gMm+id5gDCeIiWIMl4TmpA9f2xov8rUVCv1crPlSpfVQe/ilqJ
KV26fwonV7eXtnKd4FLvCk75T9wWC8DagOcKslHUhmNjmUZYymOKx8b+F2Fnouyr
nR0J7OL0DwgBOWimLi95b4fjt3Q1egV51OPU81s5y5M6ACnhrKRFXGg5rxBETYD3
i3P2k/ONVfAWx+W9u1Ew1h5ASCPp/cj/SSnNXFgANNhiGDmO0hIL0SI3sKQZKLa0
0kCfQ6NrofW+asO/9KjYo5kr4ChfdiCciZVfKTleRUFjscfVBEcnjNhmsKiao0IJ
CJPFJl0s2JF/zAUIh7yK0Eyk9d7Bv4eWUWUeClpjZzmMxlmXcpNi/eXjbpEloTIf
xQJs3OILv1NhpY5yYyL6Ra2/JMSieswf6zQce97OwohkIg9zUOcic5q94yKDseHQ
oiR5zt6XhmkF7SNyWwCUDzwEfoY/pniUKjuN3ifHl38aOi8RANsX9nsCUa+upL4o
GCPsKEBfrzT0hrRaV6wAOsrXd5ik7XDaUbeyd0pVmB/DvozD6eI3q/ys780rfiij
En37xYvZQlxj2zEEcWUp0g/jlauFbySCSltcw3gOZ99cN6yKzrc=
=Jwz7
-----END PGP SIGNATURE-----

--lXCiqtMu/rloN6dd--

--===============5293493056408718000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5293493056408718000==--
