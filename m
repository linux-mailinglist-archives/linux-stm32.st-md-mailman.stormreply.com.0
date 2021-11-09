Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7B44AA9C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Nov 2021 10:33:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B000FC5EC6E;
	Tue,  9 Nov 2021 09:33:03 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94B50C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Nov 2021 08:20:55 +0000 (UTC)
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636446055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XB/jnYZ0uAToeYDc7Y7hi585Z8EzRcsq8mXeI7xQiTE=;
 b=xLh65Aosy0wl+keM6T5b2UegXmKcoboE5B+wmF8R7inWqAc1nCgGHHEUrufdnempYhnM/5
 X5p0xVaec+ULF5b5q/X2i/gzDXbZ5XOT5Hqh41KoTYln9KerxDb5oTSr3Uy3VUETQyK0yh
 VlAeLPlF+Hd/Fv1OGqB2qS5EYqOz8aXGFRcp2JnVVTRNL+Jw7vCyDXtZ8KJ321joa21j6Q
 svJS/GZszig+ZI0GXN4NMKsoipn0jhgXpVvgcpyJI0nojXn6P13N/UMRJJtB3i0pppTFBh
 dWsUABHSK1Ar5+fDlUPU915/j7YKFvNhY8uRfZxRhN07H3rqtxMQjVbSBB4AKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636446055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XB/jnYZ0uAToeYDc7Y7hi585Z8EzRcsq8mXeI7xQiTE=;
 b=b2/KdFGJzTuZQm1oEiRtYg5xGPVDKtF4nRMqhODSq10mZ15j1APcTZ/rxCeq+Go+Plie2Q
 InEqAb+8v7hwY9Bg==
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
In-Reply-To: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
References: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
Date: Tue, 09 Nov 2021 09:20:53 +0100
Message-ID: <87bl2t3fkq.fsf@kurt>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Nov 2021 09:33:02 +0000
Cc: Yannick Vignon <yannick.vignon@nxp.com>, linux-kernel@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============0521827016621255195=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0521827016621255195==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi Vladimir,

On Mon Nov 08 2021, Vladimir Oltean wrote:
> Commit fe28c53ed71d ("net: stmmac: fix taprio configuration when
> base_time is in the past") allowed some base time values in the past,
> but apparently not all, the base-time value of 0 (Jan 1st 1970) is still
> explicitly denied by the driver.
>
> Remove the bogus check.
>
> Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

I've experienced the same problem and wanted to send a patch for
it. Thanks!

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCgA8FiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGKL2UeHGt1cnQua2Fu
emVuYmFjaEBsaW51dHJvbml4LmRlAAoJEHkqW4HLmPCm/PoP/27bUDpdMEQXWqTt
MeXl0o1uh6dc4KXB1elbTcoN+eJscsgO4uex5zH6atF6xlEtAjfmigT1APc1imvH
+1wwP1gaDLc7csegFvuKzfDSGfX6sWwsx4Z5rrfhTzv1COU4WMGspg3gFC/vh8Tk
vrUJFvwFv7uq0YLEaqbwMUF0wwKs0wxO4uMSpSjjTzPUAL1dQBQAXzlR8TrFZBn0
WLC4jTmDZhd+9aNtgQYJel9F/mkTAyGn0e9T69ysO1mLv3v0V8OTnvYdVFOZlpc5
voyNTZwxYNR5oaAbHfhDzG37neCjqou/BWTJt3P8BZzUZENT1B6x74OxIpntGaxV
TJ2tvnfFtCb2aikxCUTwBqYZDvufYfXduIYCrwp6ub0LavLMdsJycZhRf7S4Jpp0
rDLFGFd8k4b4x5FeXS6cx7nS8pT8KHwbII92+HEKm9083KlbrS7dxAKgNRSV11k0
2sdUlC2Z3Am4vYC+mtHF/A1neozXymiRiN67upmdnKz04uhokeUsVjQnaJAmZQ+H
gY15SKiujkxUjFhVfw5bG5Fe9Zoh13YQnpOMDpjtGkf7aRYsuksTBQCLgdvgF0Ww
GrHLPbxGhm0UdKnsEYYhB1p5cdaFU0tbjO2Q+F9FYTJETweXtq8wgm/pjkVy2hVH
dw3uQ6RDYBLDCiH5Nt0ZXAMe5kyX
=zNUQ
-----END PGP SIGNATURE-----
--=-=-=--

--===============0521827016621255195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0521827016621255195==--
