Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ABA2AAC89
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 18:08:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9F8C3FAE2;
	Sun,  8 Nov 2020 17:08:19 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D4D0C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 17:08:18 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CTgYl4S1Tz74;
 Sun,  8 Nov 2020 18:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1604855297; bh=elnvWS7IXp5QgmLJI68ZikB+DhWiK84NFXlg99WZ4XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8Xqw0TBwjUIKUwXx31liJdbow08YYBH1SS0snw4mtIfi+YJD9BmCyOPqr9K84+32
 RD/dbmu5zk/frFAz+m9tVMmRy0YOZVKx/xJeaCgcQ5USx7IWCCoH4yK+stJBZ8QSHg
 Gsgsiv79eI+MIRqLUeE5KWBF/BX5iiNAdh2fbCT/xWp+5/aUmx1wWeMFqT9Bqyd6ew
 7IcmkR9zH8+kZOs7Tj9ZugkjM9N80I0KNTOcLIrEkx4mE3Ys8Cdhjzg8vtIJ+Kd3Gy
 h3AX161+QDlKRGiYp55Z0cT3Zh1N/XHAyJ/SN0t9IqkmWMFGnxnD5WEM6wDoWTvr1w
 OZfAgL03MkRMA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Sun, 8 Nov 2020 18:08:07 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201108170807.GA10914@qmqm.qmqm.pl>
References: <20201021183149.GA8436@Red> <20201023134201.GA533@Red>
 <20201023203943.GA21435@Red> <20201024115307.GA2745@qmqm.qmqm.pl>
 <8a580d12-fa4a-6cd8-4d82-3e3b784e348b@pengutronix.de>
 <20201102202727.GA20042@qmqm.qmqm.pl>
 <124b90a8-72c7-c6cb-790f-7a22ef7510eb@pengutronix.de>
 <20201105025706.GE17266@qmqm.qmqm.pl>
 <7edc2b69-b77b-3546-63d7-108dab95fc91@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7edc2b69-b77b-3546-63d7-108dab95fc91@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Nov 05, 2020 at 10:11:30AM +0100, Ahmad Fatoum wrote:
> Hello,
> =

> On 11/5/20 3:57 AM, Micha=B3 Miros=B3aw wrote:
> >>> Can you catch debug logs for the bootup in question? I'm not sure wha=
t's
> >>> the failure mode in your case. I guess this is not a bypassed regulat=
or?
> >>
> >> Boot up with v5.10-rc2 + your cf1ad559a2 ("regulator: defer probe when=
 trying
> >> to get voltage from unresolved supply") hangs:
> >>
> >> [    1.151489] stm32f7-i2c 40015000.i2c: STM32F7 I2C-0 bus adapter
> >> [    1.180698] stpmic1 1-0033: PMIC Chip Version: 0x10
> >> [    1.189526] vddcore: supplied by regulator-dummy
> >> [    1.195633] vdd_ddr: supplied by regulator-dummy
> >> [    1.201672] vdd: supplied by regulator-dummy
> >> [    1.207452] v3v3: supplied by 5V2
> >> [    1.211997] v1v8_audio: supplied by v3v3
> >> [    1.218036] v3v3_hdmi: supplied by 5V2
> >> [    1.223626] vtt_ddr: supplied by regulator-dummy
> >> [    1.227107] vdd_usb: supplied by regulator-dummy
> >> [    1.234532] vdda: supplied by 5V2
> >> [    1.239497] v1v2_hdmi: supplied by v3v3
> > [...]
> > =

> > Can you try with the patches I just sent and with debug logs enabled?
> > =

> > The first one just plugs a memory leak, but if there is some state
> > changed/saved in the rdev->constraints (can't find that code, though),
> > this might prevent it from being overwritten.
> > =

> > The second patch will just tell us if you hit the early resolve case.
> =

> Problem still persists. Early resolve case not hit:
[...]
> [    1.594492] vref_ddr: at 500 mV, enabled
> [    1.597047] edt_ft5x06 0-0038: touchscreen probe failed
> [    1.597211] stpmic1-regulator 5c002000.i2c:stpmic@33:regulators: Looki=
ng up vref_ddr-supply from device tree
> [    1.612406] stpmic1-regulator 5c002000.i2c:stpmic@33:regulators: Looki=
ng up vref_ddr-supply property in node /soc/i2c@5c002000/stpmic@33/regulato=
rs failed
> =

>   [ snip - continues many times ]
> =

> [    6.699244] stpmic1-regulator 5c002000.i2c:stpmic@33:regulators: Looki=
ng up vref_ddr-supply property in node /soc/i2c@5c002000/stpmic@33/regulato=
rs failed
> [    6.713312] stpmic1-regulator 5c002000.i2c:stpmic@33:regulators: Looki=
ng up vref_ddr-supply from device tree

It seems that final regulator_resolve_supply() is spinning recursively.
Is the regulator name the same as its supply_name? Can you try the patch
below to verify this?

Best Regards
Micha=B3=A0Miros=B3aw

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c84e3b0b63de..983a4bd3e98c 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1798,6 +1798,8 @@ static int regulator_resolve_supply(struct regulator_=
dev *rdev)
 	if (rdev->supply)
 		return 0;
 =

+	dev_dbg(dev, "Resolving supply %s for %s\n", rdev->supply_name, rdev->des=
c->name);
+
 	r =3D regulator_dev_lookup(dev, rdev->supply_name);
 	if (IS_ERR(r)) {
 		ret =3D PTR_ERR(r);
@@ -1816,6 +1818,12 @@ static int regulator_resolve_supply(struct regulator=
_dev *rdev)
 		}
 	}
 =

+	if (r =3D=3D rdev) {
+		dev_err(dev, "Supply for %s (%s) resolved to itself\n",
+			rdev->desc->name, rdev->supply_name);
+		return -EINVAL;
+	}
+
 	/*
 	 * If the supply's parent device is not the same as the
 	 * regulator's parent device, then ensure the parent device
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
