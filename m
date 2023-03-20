Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B06C1164
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 13:02:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B753AC6A5EF;
	Mon, 20 Mar 2023 12:02:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 786F2C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 12:02:22 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1peEDL-0001VQ-Hw; Mon, 20 Mar 2023 13:02:11 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1peEDK-0002MP-3H; Mon, 20 Mar 2023 13:02:10 +0100
Date: Mon, 20 Mar 2023 13:02:10 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20230320120210.GA26652@pengutronix.de>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
 <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
 <27b9e057-bdd7-b4e6-445c-8da700423600@foss.st.com>
 <20230310104438.GB7352@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230310104438.GB7352@pengutronix.de>
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
Content-Type: multipart/mixed; boundary="===============3968437232123893747=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3968437232123893747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gentle Ping!

On Fri, Mar 10, 2023 at 11:44:38AM +0100, Michael Grzeschik wrote:
>Hi Fabrice,
>
>On Tue, Feb 28, 2023 at 06:28:21PM +0100, Fabrice Gasnier wrote:
>>On 2/27/23 16:13, Michael Grzeschik wrote:
>>>An minimum udelay of 200 us seems to be necessary on some machines. After
>>>the setup of the pll, which needs about 100 us to be locked there seem
>>>to be additional 100 us to get the phy really functional. Without this
>>>delay the usb runs not functional. With this additional short udelay
>>>this issue was not reported again.
>>>
>>>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>
>>
>>Hi Michael,
>>
>>Thank you for the updates,
>>
>>Fell free to add my:
>>Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>
>Thanks!
>
>Through which tree will this be picked?
>Will it be possible to add this to v6.3?
>
>Regards,
>Michael
>
>>>---
>>>v1 -> v2: - changed the mdelay to udelay_range(200, 300), like suggested=
 by fabrice
>>>          - moved the delay to pll enable so it will only be triggered o=
nce
>>>
>>> drivers/phy/st/phy-stm32-usbphyc.c | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>
>>>diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm=
32-usbphyc.c
>>>index 5bb9647b078f12..dd469f57fba7eb 100644
>>>--- a/drivers/phy/st/phy-stm32-usbphyc.c
>>>+++ b/drivers/phy/st/phy-stm32-usbphyc.c
>>>@@ -317,6 +317,9 @@ static int stm32_usbphyc_pll_enable(struct stm32_usb=
phyc *usbphyc)
>>>
>>> 	stm32_usbphyc_set_bits(pll_reg, PLLEN);
>>>
>>>+	/* Wait for maximum lock time */
>>>+	usleep_range(200, 300);
>>>+
>>> 	return 0;
>>>
>>> reg_disable:
>>
>
>--=20
>Pengutronix e.K.                           |                             |
>Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmQYSz8ACgkQC+njFXoe
LGRbkQ//eOR236b0+6LMuH5ek/HAf47UMfPZPStT3U8amYAgfBQmECQnWvijfGYF
alJYCzkIoqvWu30YjpG4Ka1d2eQQFOhU/kcz6JFMYC4knqKt+MIBKb1M60koiHib
5UHp89WzGM9W33INJGbl7WHceMRVXyeWNq8vM89CkOzIw7ZdaUrDScNsThUyi0Cb
Y9+OjfL3DPIcc+K2g6zi00P9Yt0PLZS5euD6aATqoHFAV7SsmTMUMiNH82/P7/P8
PoM3mIqk1O0qOGPsnqAad02cKVYk6rgXWEow5ZRwbpMwQqZL53ZmyPgaoMOU8+nU
iRxI/n6WAm0+pWOq/AvGHj2dsHE+kMa2aQL/smod7kh77xhxA5RFLy+VZRd7LJXE
NySradjZD3CJ9xenTfdDi/QoDqiC4bTTV6hqdztl4OoMNj3G15h9qj5+gpsiNM5W
JTMBYCqaDMc2S2Ja/MUFziAXiky+TFxDzsl7VV9aUR4I9lGZUcBYn20X2C/qnaRx
gbj+uBsw2yUn+mmFTqqxxxwEo7BLrqQSHXv5XvgjAtTbrRdBuAvPS5sSdZj1T9Vj
mvFsYG7CkKo2EIOr4dNnImtFkyYzWnD16FJbxVpHluyJla/OXpwrBD13UFXEs220
KN5zxM6YTp4sSzOE7a67xTaBNBZVwLa2HzbL1sfq6hEMHd06z8k=
=nVhr
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

--===============3968437232123893747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3968437232123893747==--
