Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8884E342
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 15:32:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F2EC65E4C;
	Thu,  8 Feb 2024 14:32:33 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B045BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 14:32:32 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1707402752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kmnynK8D4W3OfNuOIakrEyfM7cioDAxgVK3FbytS1U=;
 b=bGpOxOdZz8KjIh3Scht2Wl87HpaRmBa9E6aSTbQ4MeB4JrLU4CQbks1axiceU91YTAN4SP
 1f0UJixuPUpQvEZeL7Cjj9K5cjw/IjHUDWNPKhop8GqGyox3Wnr3u7flz6tzNMf8EirgYd
 xCuEjuYNJY+uWUom+lCCTn39HTinS8/QbKNCxMFAtDh4bcYOw8v2LfOHIRM2eKc7tBwmz2
 KIUxOE+eHNS4dLoUAe/dkHiQKvy3AklloYgLvpU+78DKum0ARqd0mERdi0DRXO0lzA4vRf
 /Ey/Np4r3CnVNfkGJeEfXeyo7TbVA1uVrkgDMrzmkVkngTZlcI8tkLOhwcAJRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1707402752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kmnynK8D4W3OfNuOIakrEyfM7cioDAxgVK3FbytS1U=;
 b=l2Hlnwmg21eD+EOblp3zmFXVSzKQLlL+jBRqJ6ezflWTXHuUah7YE9Sav4hgzNlxyfc2Pw
 0/u0JfQuqs9z9YBQ==
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
In-Reply-To: <ZcTNCxrWTAfj90Es@boxer>
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
 <ZcTNCxrWTAfj90Es@boxer>
Date: Thu, 08 Feb 2024 15:32:30 +0100
Message-ID: <871q9n81s1.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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
Content-Type: multipart/mixed; boundary="===============3595505215488996735=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3595505215488996735==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Feb 08 2024, Maciej Fijalkowski wrote:
> On Thu, Feb 08, 2024 at 11:35:25AM +0100, Kurt Kanzenbach wrote:
>> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
>> interrupts") disabled the RX FIFO overflow interrupts. However, it left =
the
>> status variable around, but never checks it.
>>=20
>> As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
>> simplified.
>>=20
>> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 04d817dc5899..10ce2f272b62 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -6036,10 +6036,8 @@ static void stmmac_common_interrupt(struct stmmac=
_priv *priv)
>>  				priv->tx_path_in_lpi_mode =3D false;
>>  		}
>>=20=20
>> -		for (queue =3D 0; queue < queues_count; queue++) {
>> -			status =3D stmmac_host_mtl_irq_status(priv, priv->hw,
>> -							    queue);
>> -		}
>> +		for (queue =3D 0; queue < queues_count; queue++)
>> +			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
>
> Hey Kurt,
>
> looks to me that all of the current callbacks just return 0 so why not
> make them return void instead?

Well, there are two callbacks of this in dwmac4 and dwxgmac2. Both of
them still have the code for handling the overflow interrupt (and then
returning !=3D 0). However, as of commit 8a7cb245cf28 the interrupt
shouldn't fire. So yes, it could be changed to void along with some
code removal. But, maybe i'm missing something.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXE5f4THGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgoVNEACRQG38O8qvFH2wPmjBeFoLAK3lGxP9
bezvRO/XBO+/YBwOfbfDcFVq4IV46JU3wPsWwSUob/X6dtVWrbuvo18PmIJQLbf7
/w09ozvI59oMpgyGuht7p+sMW6rZJopvnnHcXWyZx5Q6dm78sqxpXJRCOJGgdq2R
LNs6DFtw3GNLC+mgz2qlWKWZb15eNMfPkI9pfzlfIiHC3NOoU06tRGM+u3O8zIkA
LuiZy9jeUW0lfTs73EictPtAWV+kIjAC0Gt20R0D7Y8IqgqhRQLKzsa1Yq2n4oV5
CQgcRZqcsxakjVfNp2P2yubTE9q6OlYYEBL/zW2tKmX93EPQLdKW5e+l04uv5scO
ppbcyFnw4flKX6eNBE5p1Ls2xJx5UypS0B/E/MTmGC/sytC5C6UWvv+S9c/tmbhb
fMWUwqa2nR2weXo7rRqu3Y9BncycxDAl99xCLq7tQJ3TifuX1WQKw6V49w1CTCu1
v98dHRh8Hcb46ZygVRyorNDjynf+ykWJ+arEynZL2qRpoaghPu53zQcwfus2P20D
Iwx8Ps/qRxUimLuyb9xlLaqbMo7pyx7xUf2JX9HCr5MeiDiGEH89IxQ6kmRapaSs
cqoWc8HbLrfRGSaTIzVOHyANQFDZh8yONokswgK3VWb6sJKnc5gTX2IcILiyUMSG
zVDIO7KCp60RvA==
=ersf
-----END PGP SIGNATURE-----
--=-=-=--

--===============3595505215488996735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3595505215488996735==--
