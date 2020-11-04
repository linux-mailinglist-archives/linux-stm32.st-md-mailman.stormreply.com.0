Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A487F2A6193
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 11:28:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D66C36B36;
	Wed,  4 Nov 2020 10:28:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01CB6C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 10:28:48 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kaG23-0005vg-Ay; Wed, 04 Nov 2020 11:28:47 +0100
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20201021183149.GA8436@Red> <20201023134201.GA533@Red>
 <20201023203943.GA21435@Red> <20201024115307.GA2745@qmqm.qmqm.pl>
 <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
 <20201102202727.GA20042@qmqm.qmqm.pl>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <124b90a8-72c7-c6cb-790f-7a22ef7510eb@pengutronix.de>
Date: Wed, 4 Nov 2020 11:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102202727.GA20042@qmqm.qmqm.pl>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [BUG] Error applying setting,
 reverse things back on lot of devices
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

On 11/2/20 9:27 PM, Micha=B3 Miros=B3aw wrote:
> On Mon, Nov 02, 2020 at 01:48:54PM +0100, Ahmad Fatoum wrote:
>> Hello Micha=B3,
>>
>> CC +=3D linux-stm32
>>
>> On 10/24/20 1:53 PM, Micha=B3 Miros=B3aw wrote:
>>> On Fri, Oct 23, 2020 at 10:39:43PM +0200, Corentin Labbe wrote:
>>>> On Fri, Oct 23, 2020 at 03:42:01PM +0200, Corentin Labbe wrote:
>>>>> On Wed, Oct 21, 2020 at 08:31:49PM +0200, Corentin Labbe wrote:
>>>>> I have just saw thoses 3 lines which are probably the real problem.
>>>>> I have started a new bisect with this error, but it is hitting the sa=
me "crash range" the first one.
>>>>>
>>>>
>>>> I have bisected the problem to commit aea6cb99703e17019e025aa71643b4d3=
e0a24413 ("regulator: resolve supply after creating regulator")
>>>> Reverting this fix my problem.
>>
>> The change broke boot on all the STM32MP1 boards, because the STPMIC dri=
ver
>> has a vref_ddr regulator, which does not have a dedicated supply, but wi=
thout
>> a vref_ddr-supply property the system now no longer boots.
> [...]
> =

> Can you catch debug logs for the bootup in question? I'm not sure what's
> the failure mode in your case. I guess this is not a bypassed regulator?

Boot up with v5.10-rc2 + your cf1ad559a2 ("regulator: defer probe when tryi=
ng
to get voltage from unresolved supply") hangs:

[    1.151489] stm32f7-i2c 40015000.i2c: STM32F7 I2C-0 bus adapter
[    1.180698] stpmic1 1-0033: PMIC Chip Version: 0x10
[    1.189526] vddcore: supplied by regulator-dummy
[    1.195633] vdd_ddr: supplied by regulator-dummy
[    1.201672] vdd: supplied by regulator-dummy
[    1.207452] v3v3: supplied by 5V2
[    1.211997] v1v8_audio: supplied by v3v3
[    1.218036] v3v3_hdmi: supplied by 5V2
[    1.223626] vtt_ddr: supplied by regulator-dummy
[    1.227107] vdd_usb: supplied by regulator-dummy
[    1.234532] vdda: supplied by 5V2
[    1.239497] v1v2_hdmi: supplied by v3v3

Boot up with v5.10-rc2 with aea6cb99 ("regulator: resolve supply after
creating regulator") reverted boots correctly:

[    1.151458] stm32f7-i2c 40015000.i2c: STM32F7 I2C-0 bus adapter
[    1.180668] stpmic1 1-0033: PMIC Chip Version: 0x10
[    1.186629] BUCK1: supplied by regulator-dummy
[    1.192628] BUCK2: supplied by regulator-dummy
[    1.198667] BUCK3: supplied by regulator-dummy
[    1.204623] BUCK4: supplied by 5V2
[    1.209424] LDO1: supplied by v3v3
[    1.214931] LDO2: supplied by 5V2
[    1.219897] LDO3: supplied by regulator-dummy
[    1.225784] LDO4: supplied by regulator-dummy
[    1.229239] LDO5: supplied by 5V2
[    1.235097] LDO6: supplied by v3v3
[    1.240164] VREF_DDR: supplied by regulator-dummy
[    1.246130] BOOST: supplied by 5V2
[    1.248617] VBUS_OTG: supplied by bst_out
[    1.252698] SW_OUT: supplied by bst_out

Boot up with v5.10-rc2 + your cf1ad559a2 + &pmic { regulators { vref_ddr-su=
pply =3D <&reg_5v2>; }
boots correctly as well:

[    1.151531] stm32f7-i2c 40015000.i2c: STM32F7 I2C-0 bus adapter
[    1.180759] stpmic1 1-0033: PMIC Chip Version: 0x10
[    1.189543] vddcore: supplied by regulator-dummy
[    1.195651] vdd_ddr: supplied by regulator-dummy
[    1.201687] vdd: supplied by regulator-dummy
[    1.207470] v3v3: supplied by 5V2
[    1.212015] v1v8_audio: supplied by v3v3
[    1.218053] v3v3_hdmi: supplied by 5V2
[    1.223647] vtt_ddr: supplied by regulator-dummy
[    1.227128] vdd_usb: supplied by regulator-dummy
[    1.234553] vdda: supplied by 5V2
[    1.239510] v1v2_hdmi: supplied by v3v3
[    1.244932] vref_ddr: supplied by 5V2
[    1.247397] bst_out: supplied by 5V2
[    1.251338] vbus_otg: supplied by bst_out
[    1.255416] vbus_sw: supplied by bst_out


Cheers
Ahmad

> =

> Best Regards,
> Micha=B3 Miros=B3aw
> =

> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
