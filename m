Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8C37310C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 21:51:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDB12C59784;
	Tue,  4 May 2021 19:51:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EF04C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 19:51:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0737D611AC;
 Tue,  4 May 2021 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620157907;
 bh=SWUJv5d4872tU6nW6iDKKGKvOjvlmLsvLCPi+Eg57iM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ou89yEXMMKesNONxn4RdobCYPoCbcezZxAwm5qtcmQihSOY5qnJf2B9tMTD7NLC1v
 wLuETiCCgpmD/IFjoJ8OJKYerqmsQmf/eAG1/RMkzbXn+wOVdsqBHzXD80ew7Y164i
 HBaSZHE1lrvzm+qZRGACjRkEW/HzAMChLor09h0qnrlbxnmheLXmQgaMBF2tv9N4/U
 jJL/gMCjsH0fuoOtRG+wIp46GUMoI/NXemv454aFiCdnfoly7bLOkwMnnK5lgWdWAi
 cF80BDPiyQpwpjvJZltsuY92ayzEgJQ90Cl6kJwpiUrZ4g6zpPMZV4xcOXLCxCyyaG
 r5NAaTsFcID8w==
Date: Tue, 4 May 2021 21:51:40 +0200
From: Wolfram Sang <wsa@kernel.org>
To: robh+dt@kernel.org, mark.rutland@arm.com,
 pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
Message-ID: <20210504195140.GA1783@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
 <20210430164413.GA3426@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20210430164413.GA3426@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/2] i2c: stm32f7: add SMBus-Alert
	support
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
Content-Type: multipart/mixed; boundary="===============0337064300241843324=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0337064300241843324==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Gentle reminder about this serie about SMBus-Alert. Could you have
> a look at it ?

Yes. I first thought to do this after increasing SMBus Block length to
255. But because of the userspace ABI problems, it probably makes sense
to work on this first. Here, no userspace is involved.


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCRpcgACgkQFA3kzBSg
KbakzQ/+N25uj+rj94z+nfTHAwsOaC98K1SzwArTqt0eQGltp+bYYnOuH10WYnot
NbvWEGTdhs324Ww5pak8EdBAqmYAR0Rj1g+kFNMRO5W4pglTRW5IMGsI/CR85VcF
jg2DPnBABV4+IcTIYFS+/uXhrevG8vZEqeGutxiYSNgeKbciy/CzL0G75sZgsA/D
V94M+MgmEIQFEgFZ6mJmhvtvLzU5Xu1nm8SBZ+GHpQZAt9llAhGCj3wNKh8YS9+z
GjTscv6PPlll8K7vB+ON5a/OzH1IDo3P2ctdG2Xp41w2VnZtaUqN6xI10Ync5tbW
cC6LKmolWHsNCCczHUr1iFKWe8PO1bKyHzceYhiU7ES+XATvX9IcPzJ4UR/phw9D
7z6AjAitwABPQmXhLSr52hy2itVFjJ9F2fshxphmdoF4fKNIk2xZEYOAdlRU0Eay
JfHdSwJmGwMD82KFqm4eYrZidVqO8Y9rD1YloaI/nVpaWHumEoAUthEhcx4Pi9kE
Z0cPmRIPs6FWowdTzyxHJ0X9UoJOiGX8YkjDYL0WSWvFMALrcBn3q0kTFYEfcE8N
Qkv+Faq1kvvanNgk8RrPL8YtNAQDCjbrqLlZcLnd8I64e9EFdd8/ACBWbDTpnfXT
ysFkR+mkRxXbGIDNbnevX5A0/bLWubx2SxAdKL7LctditeHzDa0=
=i/1G
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============0337064300241843324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0337064300241843324==--
