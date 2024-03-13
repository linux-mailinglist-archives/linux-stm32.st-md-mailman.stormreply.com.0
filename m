Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A787A955
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 15:17:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F07C5C6C83C;
	Wed, 13 Mar 2024 14:17:12 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ED9AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710339431;
 bh=7LeOG2wNuxDjCRbEa+kiNhbHeBP3r4A3vvB0gv+OL1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSSQi3xcCksgyjMDBukyOvFXAqcj6zABeVftEMLPXBvAz3ZUF9aONImTVbkJL4mFq
 fSz1SeNylIwugM4ZgfGQ6o6/yFsnXJVIanSABL1R4XAGkfX0NCA99H4rZqBxQe2W6F
 ei7OplwH9OSwGDXVKvzzel5+BiJyICrp8R205slhxuB8xAfeqsV/0LrjEhiHMAIwNE
 VRaWQ+R+8W8oyfgNGlCFUjLtusKYFKcGmBPsfdkh/fehr1wfpplv7a6HBqan5n/u5i
 D8I8dmYOGAS2kG0swlvF7SXCxCYtgkoybq58Df8L6tUIK0YK0S9UL0HATzOgu8vO0S
 6REnjOzPiBQiA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 820EE37820D4;
 Wed, 13 Mar 2024 14:17:11 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id 13DD81061C35; Wed, 13 Mar 2024 15:17:11 +0100 (CET)
Date: Wed, 13 Mar 2024 15:17:11 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <mz55sv7refxxpf7krrbbu4etnim6z7kv4ksovg2vsoi5dzymub@hsi3qgqnzm3k>
References: <20240313140057.2088667-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240313140057.2088667-1-andriy.shevchenko@linux.intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-rk: Remove
	unused of_gpio.h
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
Content-Type: multipart/mixed; boundary="===============2719967576522931214=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2719967576522931214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4m5pnqu3w2utz3e"
Content-Disposition: inline


--s4m5pnqu3w2utz3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 13, 2024 at 04:00:57PM +0200, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 382e8de1255d..7ae04d8d291c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -12,10 +12,8 @@
>  #include <linux/clk.h>
>  #include <linux/phy.h>
>  #include <linux/of_net.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/delay.h>
> --=20
> 2.43.0.rc1.1.gbec44491f096
>=20

--s4m5pnqu3w2utz3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmXxtV4ACgkQ2O7X88g7
+ppV1A//fyQqXP+7uaMBcWR9nRq+3t4g6Z61t1qGl8setP/+tyCbdYlUZ7CWSBAq
Kk/fxK5Jh9ChrPByBz8/kNmub2Qj/x0iHKyabQYcH9p0Ifon98pP+D/Cw5olXAIf
e4uq/bKHwSPe8XnB9YSgseVci5CSqBzwoc+1pZkhi2zZwTskKq6jFar/KWDE6GiL
1QdlO5JOojO6Iv+cJKtqSmZ0ebc6WvhDb25Kcz0bkNy2znTy0XZlpVZrHCFV0SXf
6lDxoBN6vba7rVq+2RFnT6ieam+5L8unJGn0cnePHoWQX9yekrrZNMfdYDBZxIfj
PdB4vVt8aQohtGRU0m36RfKiQEDGim61oji9NiHhLPt8yhWSK0kWPy5An5LfnyvS
0HGkd5lKGYSlfTM71bt7YkAL1ixgJZ3iOzfe/J2KlpyarZMCskh2ycB+4vl0XJkS
rC5OwSXtLF+/34mHJblKiMaKcIxrLX5Pssa/d+6EE8lfVTqlkZdPRipyPZUbdZ7r
J+JibT3Yv5coDWAnkBBeB+P9rKj9CUXK2NHA9exN/3cKnYglBn2T8BC8XiaSVOWd
ITDvFSs3fQjLjXtOB1UbA2nJHl8kVtifdQDTd0oXVnR6FuBp+I2lG2nLVhzeQ4NA
+8ZdWZIhI0lxvN9xMHLS17MpnvBh/0iEUtPAlkN6/Z3kM1IAfk8=
=bv+r
-----END PGP SIGNATURE-----

--s4m5pnqu3w2utz3e--

--===============2719967576522931214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2719967576522931214==--
