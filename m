Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0D76E546
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 12:12:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F260C6A5F2;
	Thu,  3 Aug 2023 10:12:08 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDEF2C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 10:12:06 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1691057526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oiVoDpGFErenAPJYIoDQaO8WcyM2sxmCgiwrUKjcUok=;
 b=WrrEOVdnOdB84MFc8v4Wyze4PgqymqxYOau1flFR77RrUsU7dXyjpLQUr/8TASETefRTAe
 DRhIC/BOAHkvVVgHu/79Jp5upeNyLN3rjNaecg6XyMi8ytQw6Wg3B5ND5vrqF8OU20sjJ3
 StQF6PjL5S5Kz/S0joxze54sY+2GQdlnh6/sqkVWhSeL98ZXIGqWcpZg+CQ0npIfk/a+9d
 D9DTWArUlKnGh+10yzNMaMMF7rsF5hAklOl17pfjyxmx3wBSBO4T8/+7J9jS/EvNfDrg6F
 FfaByrAXY7Wzjca2PpQJbq/yVsW+OWhnAPcC6nGoBwA3JOKBdsxgOlDcXBnNGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1691057526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oiVoDpGFErenAPJYIoDQaO8WcyM2sxmCgiwrUKjcUok=;
 b=HnUKr1KU3hzi8BqZfsmys2qqfOSq4KfZjvA95qh1zVmVn8ommVJRoyi3XHDwkVsWrISl9g
 VQLjDPYOnfnrOIAA==
To: Johannes Zink <j.zink@pengutronix.de>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>
In-Reply-To: <9954c171-cb2d-83a4-6965-f5cb3a4a6166@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
 <87fs51kb4k.fsf@kurt>
 <9954c171-cb2d-83a4-6965-f5cb3a4a6166@pengutronix.de>
Date: Thu, 03 Aug 2023 12:12:04 +0200
Message-ID: <87a5v8a0zv.fsf@kurt>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
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
Content-Type: multipart/mixed; boundary="===============2508595154516773133=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2508595154516773133==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed Aug 02 2023, Johannes Zink wrote:
> Hi Kurt,
>
> On 8/2/23 12:10, Kurt Kanzenbach wrote:
>> On Tue Aug 01 2023, Johannes Zink wrote:
>>> ---
>>> Changes in v3:
>>> - work in Richard's review feedback. Thank you for reviewing my patch:
>>>    - as some of the hardware may have no or invalid correction value
>>>      registers: introduce feature switch which can be enabled in the gl=
ue
>>>      code drivers depending on the actual hardware support
>>>    - only enable the feature on the i.MX8MP for the time being, as the =
patch
>>>      improves timing accuracy and is tested for this hardware
>>> - Link to v2: https://lore.kernel.org/r/20230719-stmmac_correct_mac_del=
ay-v2-1-3366f38ee9a6@pengutronix.de
>>>
>>> Changes in v2:
>>> - fix builds for 32bit, this was found by the kernel build bot
>>> 	Reported-by: kernel test robot <lkp@intel.com>
>>> 	Closes: https://lore.kernel.org/oe-kbuild-all/202307200225.B8rmKQPN-lk=
p@intel.com/
>>> - while at it also fix an overflow by shifting a u32 constant from macr=
o by 10bits
>>>    by casting the constant to u64
>>> - Link to v1: https://lore.kernel.org/r/20230719-stmmac_correct_mac_del=
ay-v1-1-768aa4d09334@pengutronix.de
>>>
>>> ---
>>> Johannes Zink (2):
>>>        net: stmmac: correct MAC propagation delay
>>>        net: stmmac: dwmac-imx: enable MAC propagation delay correction =
for i.MX8MP
>>=20
>> Tested on imx8mp <-> TSN Switch <-> x86 with i225:
>>=20
>> Before your patch:
>>=20
>> |ptp4l -i eth0 -f configs/gPTP.cfg --summary_interval=3D5 -m
>> |ptp4l[139.274]: rms    9 max   27 freq +29264 +/-  13 delay   347 +/-  =
 2
>> |ptp4l[171.279]: rms   10 max   24 freq +29257 +/-  13 delay   344 +/-  =
 2
>> |ptp4l[203.283]: rms   10 max   24 freq +29254 +/-  13 delay   347 +/-  =
 2
>> |ptp4l[235.288]: rms    9 max   24 freq +29255 +/-  13 delay   346 +/-  =
 1
>> |ptp4l[267.292]: rms    9 max   28 freq +29257 +/-  13 delay   347 +/-  =
 2
>>=20
>> After:
>>=20
>> |ptp4l -i eth0 -f configs/gPTP.cfg --summary_interval=3D5 -m
>> |ptp4l[214.186]: rms    9 max   29 freq +28868 +/-  16 delay   326 +/-  =
 2
>> |ptp4l[246.190]: rms    8 max   22 freq +28902 +/-  15 delay   329 +/-  =
 2
>> |ptp4l[278.194]: rms    9 max   24 freq +28930 +/-  15 delay   325 +/-  =
 1
>> |ptp4l[310.199]: rms    9 max   25 freq +28956 +/-  15 delay   327 +/-  =
 3
>> |ptp4l[342.203]: rms    9 max   27 freq +28977 +/-  14 delay   327 +/-  =
 1
>>=20
>> And the derived register values:
>>=20
>> |[   15.864016] KURT: PTP_TS_INGR_CORR_NS: 3147483248 PTP_TS_INGR_CORR_S=
NS: 0
>> |[   15.870862] KURT: PTP_TS_EGR_CORR_NS: 400 PTP_TS_EGR_CORR_SNS: 0
>> |[   20.000962] KURT: PTP_TS_INGR_CORR_NS: 3147483636 PTP_TS_INGR_CORR_S=
NS: 0
>> |[   20.007809] KURT: PTP_TS_EGR_CORR_NS: 12 PTP_TS_EGR_CORR_SNS: 0
>>=20
>> So, seems to work:
>>=20
>> Tested-by: Kurt Kanzenbach <kurt@linutronix.de> # imx8mp
>
> Thank you for testing!
> Johannes

AFAICT from the manuals the MAC propagation delay should be corrected
for the Intel TSN NIC(s) as well. I'll follow up with testing and a
patch when this set is merged.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmTLfXQTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgnyCEACi9X3yHgUwGnbH1P7AlE8/gsS0phPA
OxZwseaU0omYN84euiQcVKvwUC7jNQVGRFGT3TVKZgvkxoCcPLaseaJThJhPXqAo
FCoIosjX6Xt0n2LnJo17DVvngEG9ZODRad5t0pBS17N/1sIBWVaSiKXuJfx66Gff
gYPx+7YJdhJG9fG9WpQPNv7IMECdzEG90D/11SMUbUmHJt6Lat5BGI+E65ET3tCK
lJyiSxaeroZ+qrHfIuqYdTCQxIh8A4RD7ZvPB9uSVu1cMEk5letxfD31N7TZ9Fe+
XbijdVXbAEsgNUazpfLLSS+ltkLTPocWUDH+75JT1c23ihstR2cikH8YiWhvO+7y
JbmUP1hZ68wMc6V6oHzhtSYf24GRyjNAgony24HrX3PTKHr5cdHRFvOLHD2YDZeb
MhW4Pl2Uul87rMqMPzj2AWIVN9MOvl8I9DimcJ0UPpmiTWJc4Hvh/+maKfXrKziE
XNneasrmNBxFAivp378veWbzsP+ftW3KBnTkM+dZDQhYaG8thlW4S9npAcowbMgX
e8a0uCsgq8qOYs3JeGqhhV/nOq35nouXz7aKzVbXZsA/caDdJ+doZxO8UwDja7EC
bJg+bMq0l1Tfw+ucjgniyjUOfAJiGKjj5WwAEFzd4ATLn12dZtbo/1HHxFEwlDSE
35HOaQDKmHh9eQ==
=UTxK
-----END PGP SIGNATURE-----
--=-=-=--

--===============2508595154516773133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2508595154516773133==--
