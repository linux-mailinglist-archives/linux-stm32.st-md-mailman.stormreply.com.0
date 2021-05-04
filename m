Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7E37310E
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 21:53:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24E05C59784;
	Tue,  4 May 2021 19:53:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4803DC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 19:53:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27CF4611CB;
 Tue,  4 May 2021 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620158032;
 bh=0r/j8p/v0WMfwl7qORsmq6s2OTxkG5aV8XkOqLqw72Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDO27gy4lnDgiHSPEYDc8pkPgY7LqE9sm34xJn7XG1luMHes+6XjCwdLbhnJxJoih
 xidjKRzDFx6FzlTmAxcfvcDPPcebe5KOyTg4kmdifo6+FJ2WTeEhbctDgHJ6LWdXU8
 TxkHd//qRzJvwE4yNyXiuFWves3HyPOfzTCmBeNlkT7IJ/F67tuQ0FaLWvzxxLCjT7
 KVzSrXEKErcuPzODm6zmeuZdIYisFLR7jr5FwH/XmqMjg1OZkVJY94tx2LqFfH4wEE
 uc+edw9HeUsckvPz+w66qKjyH50SXlcLSKMNDvD9ah09Z62ePeew4M9oaNp6jE2K5J
 lI+m4RWho/nQA==
Date: Tue, 4 May 2021 21:53:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210504195348.GB1783@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
 <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: i2c: stm32f7: add st,
 smbus-alert binding for SMBus Alert
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
Content-Type: multipart/mixed; boundary="===============4306873476321588688=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4306873476321588688==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +        st,smbus-alert:

After reading the specs again, I think we can make this a generic
binding. SMBusAlert is optional. So, we can say it is not covered by the
"smbus" binding and needs a seperate one. Makes sense?


--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCRpkwACgkQFA3kzBSg
Kba/8g//fDwD9sm7N+HAiL7vPmZr0Uock8CYReRf6YpDV+9Yrhh7MVqURaDwtor8
sIXzxCIeW+HfNXOVjWgEEYwW+NIhjqerMTl+1bG5SLJq+R0gvlsEo7IIAoZ9TdYh
Urt2LEYuR5yXwD38zkpG110NeqvzgMbYnXk7l8t8+FOCLYfhR3FH1VVM5c5/rPy1
P5IY/V+z6Kq+YzMpxUreBg/erR14SxUfy3it1cSSJn2TpiSiUuHooV15orA3+VLR
2VpQLmVBpN86UFHLEHpgSwIYTiOvDu0tF86eZQPCUo3l3blCuId/RhX5ysroAA1s
R/QwP787hLZHrCbvwfFPFMWi9/Yety6/BLWVDHpp22eR9kHtBhQ1tVvn/Fhy+qaz
UZnLlVDMqi6N7tQoKDNYF8tzpz7kyhXMCLT4ZoSlxiFIkCACmYZs+Q8+5CSJKo7A
yuRoVgvy0XG4mTmqDQNda6l2p+SQyQxTri9gSEGczKS6nO8vv/Gb+WZfTyuXe7dW
SPsckWowrvq7Mq0Ea51YqvdRDN3YpvSUEGeBc0hIgOsqRgpsdBAflM97PLV1BktQ
6Ee4/xaVDhrjplvpqVwXJZdslRMQO9iawelqngz0P4xVnMJxNzM73ZHOWIM8AP4S
SreuL3RNm/pPROdtld4xb66OK/mm/cHxgvjy3cLhtbtLrVt/zrk=
=W6P4
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

--===============4306873476321588688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4306873476321588688==--
