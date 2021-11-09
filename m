Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3944AFB8
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Nov 2021 15:47:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72444C5EC6F;
	Tue,  9 Nov 2021 14:47:29 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34FD9C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Nov 2021 14:47:28 +0000 (UTC)
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636469247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=my3Sq2GxcHarOIeboyqYV38k/8EAQpknRRdSAQw/6Kw=;
 b=ji9/LLavr/D+jfw74jza0ix0qq6aUgASeiWAPg+yazflUDWV27JC+JqW4bEKVB0t9BDLlo
 niofonePu6XrImbQwHBs/NK10kQERS3Uuh+w+nHf/+84oB94GJv5xITvpXowKxHfjlg6cB
 9jaKCZSJHC2wt7arIHr1tnKP2hsFraJ0PmT2S0QqKQ4iTPRREThtwE/YBHun8GVtYcKDNX
 949j1hniYNTbomqiRNsPUNVp0VV55sFrklYvZshbyFybJiEM+UvwUgX9GNwqpeKJMZcxn0
 jrokGIBGih6/utL1+5CIa+qoq8W/aa36hyq9FVtQ5DnRcTIZt7UableCr9DpjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636469247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=my3Sq2GxcHarOIeboyqYV38k/8EAQpknRRdSAQw/6Kw=;
 b=tD9K8m1grP4/5SkjocmDU3Mxa18F5p2rDhaWae87sQBGW0aSy5pjiHgEt060gOJfBXY4iL
 lZQeSGGa18P7L5CA==
To: Vladimir Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <20211109103504.ahl2djymnevsbhoj@skbuf>
References: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
 <87bl2t3fkq.fsf@kurt> <20211109103504.ahl2djymnevsbhoj@skbuf>
Date: Tue, 09 Nov 2021 15:47:26 +0100
Message-ID: <87h7cl1j41.fsf@kurt>
MIME-Version: 1.0
Cc: Yannick Vignon <yannick.vignon@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: allow a tc-taprio
	base-time of zero
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
Content-Type: multipart/mixed; boundary="===============5202874596551279966=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5202874596551279966==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue Nov 09 2021, Vladimir Oltean wrote:
> On Tue, Nov 09, 2021 at 09:20:53AM +0100, Kurt Kanzenbach wrote:
>> Hi Vladimir,
>>=20
>> On Mon Nov 08 2021, Vladimir Oltean wrote:
>> > Commit fe28c53ed71d ("net: stmmac: fix taprio configuration when
>> > base_time is in the past") allowed some base time values in the past,
>> > but apparently not all, the base-time value of 0 (Jan 1st 1970) is sti=
ll
>> > explicitly denied by the driver.
>> >
>> > Remove the bogus check.
>> >
>> > Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler=
 API")
>> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>>=20
>> I've experienced the same problem and wanted to send a patch for
>> it. Thanks!
>>=20
>> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
>
> Cool. So you had that patch queued up? What other stmmac patches do you
> have queued up? :).

I'm experiencing some problems with XDP using this driver. We're
currently investigating.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCgA8FiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGKif4eHGt1cnQua2Fu
emVuYmFjaEBsaW51dHJvbml4LmRlAAoJEHkqW4HLmPCmzxgP/0XguZxeRKAZTsrh
KEiq22SJMzz3TtNz0OqvOVJWep4m5GFn4IuQFMr3V7L5yk4wfZF6aPflnHC9TzkA
XlWaS4jvjojV5+FkcUvJKx9IM4ZzcRCDGyLGffgngkwNwgORKey9RE+01SOz6ae0
OkERyseSiYZ4Q+ckd7ZcCsmvEOK+i3JkddOqEHtevRPaaevFYKyir7oBFHsSZTzO
Xvii7a/K9iIuj4Ex4RfK5g/oKtGIyChKhhRGDRSocpr6yMH/6Fhdumx4n3SDZdE/
Nbq9Dwjabk3KeZdByHcF2oMAjzYgUTemSbm7bgvyxpsOxReDylewNzuOMw5b27M1
VlFi1Rqu7SntRpqjV46DdWBi3AIAtDqsvZ+Z5wRzyncvmIriJPKXuOjHOlNua4Ab
qAKTHXN3zl1pvl1andzfVoBFuL6fM7+wR65M0d9XpPsRddLaM0t2Q+8IEqY6Vfq0
s3d4bhadvY4bJ6iHJcA40aDDwq3jIpukBEfipNKjOAzrkq7qKR7PEFDmqRk4iRoT
WmnKP4X9LsmYO97znragDFPzmvJrXq+hyh7BkkZuNm38gmWVt5YfDbRAMqpEB6qP
8OuOqtU/KItulB5U7XkRRQ2bTNUqxFW6aV/TqIAyd/z9xKX/2YqKpmSxqK3myjNd
RtiuTk1EKATLOnUlQ+WMj7RRCiS7
=XpiJ
-----END PGP SIGNATURE-----
--=-=-=--

--===============5202874596551279966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5202874596551279966==--
