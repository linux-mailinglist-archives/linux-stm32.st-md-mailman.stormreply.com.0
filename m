Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75085B7EE
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:45:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56912C69067;
	Tue, 20 Feb 2024 09:45:01 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1473C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 09:44:59 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708422299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0IOZw6hyqiMqx4EefUlP36lkvuV/22XmEQa54rFkuug=;
 b=hnEuLAHnE35zRzIKCohcn8gnB/h12LULynfKsxpr97CogKyO26g5Z+AwjtoBLtne01WvW1
 W0wP9Idd+jr74lq8ogajkpHodAmursLOqj8+vkqPAGDrUo98RcZ7Hxy+Gl35hQbeBzJP5m
 5cQmhW/HdZhi47TAF7kbjyU1p9Kpl4A502wLvIaTC9rm5ES/g0gIpNLSrb9xiojIJkdrhB
 5kTXcLXdPlWAxpd9Dw83qv7/KiNUVr/Ym7WHB1TAfr6sq3MvBFsLLgeG3KsF+5BiYPPFGK
 EX46b6+LL8Kp9h/Hj+zdsbq9kKcs3V5Xvu9zglOH6qn3SWJEXG3pUBiKOMI7bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708422299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0IOZw6hyqiMqx4EefUlP36lkvuV/22XmEQa54rFkuug=;
 b=uuKrjn6dTnGMOlTvKs6676TlXRz1fM26Uzpz5QUWhv2bNCeL/A/Y+8EZuxjhEXVtefHfAW
 /NtYsJlYYV2jdLAQ==
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <mmjrlyzhegve5u3s3lhw4hmhooxixn3pwxkkdikxgxno4teqyz@rtetljwg6ffg>
References: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
 <mmjrlyzhegve5u3s3lhw4hmhooxixn3pwxkkdikxgxno4teqyz@rtetljwg6ffg>
Date: Tue, 20 Feb 2024 10:44:57 +0100
Message-ID: <87ttm3wjty.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Rohan G Thomas <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix EST offset for dwmac
	5.10
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
Content-Type: multipart/mixed; boundary="===============8893125797384804882=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8893125797384804882==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue Feb 20 2024, Serge Semin wrote:
> Hi Kurt
>
> On Tue, Feb 20, 2024 at 09:22:46AM +0100, Kurt Kanzenbach wrote:
>> Fix EST offset for dwmac 5.10.
>>=20
>> Currently configuring Qbv doesn't work as expected. The schedule is
>> configured, but never confirmed:
>>=20
>> |[  128.250219] imx-dwmac 428a0000.ethernet eth1: configured EST
>>=20
>> The reason seems to be the refactoring of the EST code which set the wro=
ng
>> EST offset for the dwmac 5.10. After fixing this it works as before:
>>=20
>> |[  106.359577] imx-dwmac 428a0000.ethernet eth1: configured EST
>> |[  128.430715] imx-dwmac 428a0000.ethernet eth1: EST: SWOL has been swi=
tched
>>=20
>> Tested on imx93.
>>=20
>> Fixes: c3f3b97238f6 ("net: stmmac: Refactor EST implementation")
>> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/hwif.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/et=
hernet/stmicro/stmmac/hwif.c
>> index 1bd34b2a47e8..29367105df54 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
>> @@ -224,7 +224,7 @@ static const struct stmmac_hwif_entry {
>>  		.regs =3D {
>>  			.ptp_off =3D PTP_GMAC4_OFFSET,
>>  			.mmc_off =3D MMC_GMAC4_OFFSET,
>> -			.est_off =3D EST_XGMAC_OFFSET,
>> +			.est_off =3D EST_GMAC4_OFFSET,
>
> Unfortunate c&p typo indeed. Thanks for fixing it!

No problem. I was just wondering why the confirmation message doesn't
show up after updating to v6.8-RT :-).

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXUdJkTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgkDMEACpywx0fzS87yvO1q6df6W3FbGVVYuB
Ius17j0DnWupFElYtSbJvmOjHI9wI2j1aOBSbqSOdTTxEsYR2XWvfmlgH57WOfBB
oz4JPnfjV8P3rb6nlXcqOeWlultJg2ee7P4/P9kbDeEkSRb6KOArkjBxkQT99oLS
wNaqPjboXyO50ZDR2lrZqjjQWCSg8uHKt70vMfxCOra/ENiMRM/oNBb1ZQj02XcP
5rN3bKJGiwuyjFvLZUmWnvmI9KYRErEHtuoN+SThdPZzvLATJQxMM0b4YT53wUHf
5ATVgFvF/slTVh8OR5b/9K9Io17hpESubQN293JVK7Ja2kNMjmahvZaS3LvXlJu0
e9QqVHQsMgHdhp0QrBCalGvRY8wow4bJ+41IaJdGYSsoqOJBFEYNCj/EWjTdovz7
uQ0qeNJaaAz82ZGF4816jVrFY3b/nkTm/eI4YzFnl6IKTiRkxvDbm7/ER0XWel+e
huh420Nt7km7Xcs8t0pSYur2hE8YH/lh595iW7032llm4SuxpdDDKlgVYmVtoXUW
/lQLtrLiaXYEDE3HjmBrCQb14Wbc4WL2cdgqcakKfHRrWvezXICvcFGsHhCUMPDu
VGNXo8iO9bWdmuzwDHe/Yt1Ujq/8ZQsP2C0/2PZYejdXBNQJuzhypdur8WTFqul8
GKydbDv/RnY8Bg==
=08hW
-----END PGP SIGNATURE-----
--=-=-=--

--===============8893125797384804882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8893125797384804882==--
