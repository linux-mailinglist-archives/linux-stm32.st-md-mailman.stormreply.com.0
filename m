Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E950876CA87
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 12:10:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5F9FC6A603;
	Wed,  2 Aug 2023 10:10:54 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90D2BC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 10:10:53 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1690971052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O3flfNg7D3xDoacIyuCI9Tv6Ia0JzLVFeGS0pO9j6hc=;
 b=lCcwn+4dDNiakaikCPd2NRCJcwoRItNDzrmThzLoywqqDYp7HfD1V9RNpnqmN11+0wX23O
 do0T01D47qno0jZQbT2Aynk7OqfhvuqBKeW0KMajE8HH25docPlL9J++RyfSfxwjoVW9K0
 EAfwd5jFfATDzdIiVx3u9Lm9zeQJbK+ZToxlVi3qUMUduOCeYOhno3JRa1xlh8iwFtMNpV
 srZP6R/k+Z79S7rqpq1tPbEJymDc7WXJgWJz1t3V/TpxgF29bsp7QyfgqMH5zY8ZwHZYL5
 cz2A724eTdfIHGmV3FiA7mLpnP3w+BsiViM31XMknAplqhHwpg2hlrsSl4mV/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1690971052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O3flfNg7D3xDoacIyuCI9Tv6Ia0JzLVFeGS0pO9j6hc=;
 b=AA0b0nIT91SHfhSeCVwZv1JCnRBTwk9kar1m+JPxGBdwU5gHLHVW0umEXE6SihZK0R4R2X
 YM5YnK1Esun1x2CA==
To: Johannes Zink <j.zink@pengutronix.de>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>
In-Reply-To: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
Date: Wed, 02 Aug 2023 12:10:51 +0200
Message-ID: <87fs51kb4k.fsf@kurt>
MIME-Version: 1.0
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel test robot <lkp@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 0/2] net: stmmac: correct MAC
	propagation delay
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
Content-Type: multipart/mixed; boundary="===============3992587742064818600=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3992587742064818600==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Tue Aug 01 2023, Johannes Zink wrote:
> ---
> Changes in v3:
> - work in Richard's review feedback. Thank you for reviewing my patch:
>   - as some of the hardware may have no or invalid correction value
>     registers: introduce feature switch which can be enabled in the glue
>     code drivers depending on the actual hardware support
>   - only enable the feature on the i.MX8MP for the time being, as the patch
>     improves timing accuracy and is tested for this hardware
> - Link to v2: https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de
>
> Changes in v2:
> - fix builds for 32bit, this was found by the kernel build bot
> 	Reported-by: kernel test robot <lkp@intel.com>
> 	Closes: https://lore.kernel.org/oe-kbuild-all/202307200225.B8rmKQPN-lkp@intel.com/
> - while at it also fix an overflow by shifting a u32 constant from macro by 10bits
>   by casting the constant to u64
> - Link to v1: https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de
>
> ---
> Johannes Zink (2):
>       net: stmmac: correct MAC propagation delay
>       net: stmmac: dwmac-imx: enable MAC propagation delay correction for i.MX8MP

Tested on imx8mp <-> TSN Switch <-> x86 with i225:

Before your patch:

|ptp4l -i eth0 -f configs/gPTP.cfg --summary_interval=5 -m
|ptp4l[139.274]: rms    9 max   27 freq +29264 +/-  13 delay   347 +/-   2
|ptp4l[171.279]: rms   10 max   24 freq +29257 +/-  13 delay   344 +/-   2
|ptp4l[203.283]: rms   10 max   24 freq +29254 +/-  13 delay   347 +/-   2
|ptp4l[235.288]: rms    9 max   24 freq +29255 +/-  13 delay   346 +/-   1
|ptp4l[267.292]: rms    9 max   28 freq +29257 +/-  13 delay   347 +/-   2

After:

|ptp4l -i eth0 -f configs/gPTP.cfg --summary_interval=5 -m
|ptp4l[214.186]: rms    9 max   29 freq +28868 +/-  16 delay   326 +/-   2
|ptp4l[246.190]: rms    8 max   22 freq +28902 +/-  15 delay   329 +/-   2
|ptp4l[278.194]: rms    9 max   24 freq +28930 +/-  15 delay   325 +/-   1
|ptp4l[310.199]: rms    9 max   25 freq +28956 +/-  15 delay   327 +/-   3
|ptp4l[342.203]: rms    9 max   27 freq +28977 +/-  14 delay   327 +/-   1

And the derived register values:

|[   15.864016] KURT: PTP_TS_INGR_CORR_NS: 3147483248 PTP_TS_INGR_CORR_SNS: 0
|[   15.870862] KURT: PTP_TS_EGR_CORR_NS: 400 PTP_TS_EGR_CORR_SNS: 0
|[   20.000962] KURT: PTP_TS_INGR_CORR_NS: 3147483636 PTP_TS_INGR_CORR_SNS: 0
|[   20.007809] KURT: PTP_TS_EGR_CORR_NS: 12 PTP_TS_EGR_CORR_SNS: 0

So, seems to work:

Tested-by: Kurt Kanzenbach <kurt@linutronix.de> # imx8mp

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmTKK6sTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgpH7D/9gvmG6+n49HSx1HFttoXKOeJBVJJO2
BD3+idE7X5Uq6p5FErWUWpOgLRSYMrNTXYO3V/Z+MAaFoxiPm/mjnW0d5Angr2Hu
8OW/krHNG8eupFVzJ7zVmdtY9Ct1bkcUCdOb6YEP53YMqbgnFogzrXL1Ym9PDuKL
DcZjC4fLYZbpS+sqqEt7nPfHk6fWaSpGzLb7XsMFfH+xBQN4sA3XblSY9dmmiL98
gNvCPkbpk6pRKwDpM46xefREyBOiocRbgtxbubuSI2t2858EbONQmam394axk52J
qc/zf4LxGfAia8gtqtSqEMK+l4Xd3kkb1bKX1fFoZc2TLZExQDDUNC6UjAZwAl0n
TMWi4g+qDKDFAcyszh3EQtRFx0LPj/HLmX9u9WTCt7DOP9MgKlNwMNuppTO6GT//
yAw+0QYNyEebvge0z/ZkVn+zNZXCMSLyskkaa/CC4p9pjfp/IuUJyUhfnDIL+Svn
2WoB2IU7AqKPDAeVJI/rx8LNftu8KgAL1Z7SKOYpW42nWPv7wH17W3hgil56YTk6
mzAyIHWu90aFePMXrLrbPHoAdGJiHxLHIiwjkzzowInj7Pk/QiplYYtUaCJAZioh
NMWO3PBMVdGInW6ys9pZsDSf8MI3diR2aU7g02k7A666pCrx1ugCaYnx9cks59cv
18dkcDquyqvDMA==
=4fSs
-----END PGP SIGNATURE-----
--=-=-=--

--===============3992587742064818600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3992587742064818600==--
