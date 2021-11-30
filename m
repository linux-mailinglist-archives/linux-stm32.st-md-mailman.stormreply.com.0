Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB2346406B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 22:41:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAA2FC58D58;
	Tue, 30 Nov 2021 21:41:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB3A8C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 21:41:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21D69B81CFB;
 Tue, 30 Nov 2021 21:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192C9C53FCC;
 Tue, 30 Nov 2021 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638308500;
 bh=EmUZcpafmX5TsFiIq/04znbXzCnRq3pY+sxp6gOGOWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NrYVac+gKeA8hXaeujMSIpbujRfSQ860qaDHplwXIJyuY+/e7Jaowo2B3s7YRqpjx
 wGW69d8xfEBmJoHEOUV4aIJAPTGmfww5OsYeAsCzCEn458x2hIO0TGNDRr40QvF7oH
 7BXogOWtUhrdV7auVjlQ6ApLMdPcZ5Pwghiu4Sg8wvecwsyv4rQGIjPLJG9E6494rx
 rKq6D48KDmeKYoNEzBrB4m3HwUXQ0JjbS0cT98n89mtdttJl/eO/4TEfiC25fREcuD
 +3Hr52011jfFVWewhpr4g44t/4YjMHjSIFpGL4gHNPEgSG/fjnvR9fhTEjvtQY9pdg
 8hrvi2naGZZlw==
Date: Tue, 30 Nov 2021 22:41:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaaakSa16Dun6b+h@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 pierre-yves.mordret@foss.st.com
References: <20211130093816.12789-1-wsa@kernel.org>
 <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
Cc: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
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
Content-Type: multipart/mixed; boundary="===============5206576705070894437=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5206576705070894437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XbDZKjp4LqR3YEbT"
Content-Disposition: inline


--XbDZKjp4LqR3YEbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> - looking at this area of code again, it appears that the function stm32f7_i2c_release_bus
> is ALWAYS returning 0. So it should actually be a void function.  I thus
> propose, if you agree with that, that I propose, and apply a patch PRIOR to your/this patch
> to change that and remove the error checking of the stm32f7_i2c_release_bus function since it is useless.
> Is that fine for you ?

Well, I'd think we can also apply this patch first and then make the
function void, but I don't really care about the order. But we should do
both, I agree.


--XbDZKjp4LqR3YEbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGmmpEACgkQFA3kzBSg
KbaTaA//RK0kf1EZFsMoMMztOOqBXBe902lbsT1t37s9bqJBJ4I9EiYTSf+AbZjU
rkYmP+gQdR09f+lF0/pAhBYrHJaQMklFgagR6FbZb2+Y1hL2schKU8pPI8YCsc7w
yL26hg30CZeTY26KB2uaFJBf0Wmj1ljyfvBW7uYi5ySINAx2AbzJhYqIOdp0MlC9
jnCKyq30vKmlO4V487RpbrvYeK+PCoqPQSDVVZO2VH92+6RTSJ62pwj3bacWOe1b
FGUmSaTPr26Xar32qRWL//llo2BxJ1IJgu3zeUc/pFXc9z22jIJTayV6BC1UzZCn
f3aN11a7Q1kH6kHinV73YMjfEdvAAIc/ck5TolEoOOMmbMJYyY96wNXOIrzXgyYr
6wlBTZ1NMh0Ry44qWEVqUZhzUKnRJp4/W0OpniepXUuJPAel/gDJTUUfSJ0LYkcR
t/0jSwOyLBCNXJZVPWzVj36KPyR8mlQexegSWWh+doWPot77YkfPntsBYF0o6lw8
Puh02JCr+OS29Om3IBHJvPOzqbfbXFJd1P+MSx7pR0raV/5mDmxI9qaQHm9BrQ3v
qP6gIwkqrGhq66Eco2TWGZSFsTbl6ZupOmL/ya7JP0x17ivSVobC93KXOTVDedXd
aph1M53kFn0VNF6D4AEbbvJpVVRmPvj0c9xPVj34tOlzVVRH/j4=
=9bj8
-----END PGP SIGNATURE-----

--XbDZKjp4LqR3YEbT--

--===============5206576705070894437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5206576705070894437==--
