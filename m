Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF436B3E59
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 12:49:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C4A2C6A60E;
	Fri, 10 Mar 2023 11:49:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56819C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 10:44:54 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1paaEp-00071Q-Df; Fri, 10 Mar 2023 11:44:39 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1paaEo-0001df-34; Fri, 10 Mar 2023 11:44:38 +0100
Date: Fri, 10 Mar 2023 11:44:38 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20230310104438.GB7352@pengutronix.de>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
 <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
 <27b9e057-bdd7-b4e6-445c-8da700423600@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <27b9e057-bdd7-b4e6-445c-8da700423600@foss.st.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 10 Mar 2023 11:49:11 +0000
Cc: kishon@kernel.org, error27@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, linux-phy@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32-usphyc: add 200 to 300 us
 delay to fix timeout on some machines
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
Content-Type: multipart/mixed; boundary="===============7644470380719487771=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7644470380719487771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fabrice,

On Tue, Feb 28, 2023 at 06:28:21PM +0100, Fabrice Gasnier wrote:
>On 2/27/23 16:13, Michael Grzeschik wrote:
>> An minimum udelay of 200 us seems to be necessary on some machines. After
>> the setup of the pll, which needs about 100 us to be locked there seem
>> to be additional 100 us to get the phy really functional. Without this
>> delay the usb runs not functional. With this additional short udelay
>> this issue was not reported again.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>
>Hi Michael,
>
>Thank you for the updates,
>
>Fell free to add my:
>Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks!

Trhough which tree will this be picked?
Wil it be possible to add this to v6.3?

Regards,
Michael

>> ---
>> v1 -> v2: - changed the mdelay to udelay_range(200, 300), like suggested=
 by fabrice
>>           - moved the delay to pll enable so it will only be triggered o=
nce
>>
>>  drivers/phy/st/phy-stm32-usbphyc.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm=
32-usbphyc.c
>> index 5bb9647b078f12..dd469f57fba7eb 100644
>> --- a/drivers/phy/st/phy-stm32-usbphyc.c
>> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
>> @@ -317,6 +317,9 @@ static int stm32_usbphyc_pll_enable(struct stm32_usb=
phyc *usbphyc)
>>
>>  	stm32_usbphyc_set_bits(pll_reg, PLLEN);
>>
>> +	/* Wait for maximum lock time */
>> +	usleep_range(200, 300);
>> +
>>  	return 0;
>>
>>  reg_disable:
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmQLChUACgkQC+njFXoe
LGSckg//ZonCarFQiaZdDZZ8dqltO/AmRY2Lu1k1HjsKZM7ROzxjjapPHtuMiuI2
ZJGFrY/3OsHCT8MYlVKSvKLkzyvpnJ/y6aKmg65o2mou6n6ikFkg0Run9XbZypLL
3O5/PZxg9p+y/FZSuoTMSHOgtD30kCxgnFQJd9UNjJMFS9IEha6Kyjy4lFuMnamA
hE6yKxUH3g6rRa2mTYG9uCVHHEVrWuyItZ9v9Br8RxZiOATK1i1BzwxSGBCBxu/B
iRPpjLtybUBuDkmkvQ5p+koYr6ZxrORxynlYyDWvKkEo+xoEXoOuXpSRv5P3zM1S
f3m9izPLSOpFxQmGMT2iShdkawetuIQ6YFgTIAVBOIsP23KKEsa5r2DKQ2105KdV
WmBWxjbhnRPfNWVyDj85xnHGGn+PO2RgeiFIVhIevCsEm6G8M2REqb4Oy/yULMe5
cyCn65ZhMxsNxg80UEvOZSYnvkeDatYqi4Y68hgATCQku3U6nr9GJHWFSxax3lGC
QydjjYwuyrRFj8R0pdJ1q+Tae3k9FMK7tIeZKbrTn3wJFE/QcNLWlrYcHwp2fVtp
qVea+pLmA5T/rKZRV8IHOnh7yWu8BLVhnM0MslypbFN7Dwj3iNIagwF6E3UUzX+h
EcyX71uL+FIQeomN+B6CBLgP/NVAbg0mfBfDq0y82zX+BBKqCvo=
=GkzB
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--

--===============7644470380719487771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7644470380719487771==--
