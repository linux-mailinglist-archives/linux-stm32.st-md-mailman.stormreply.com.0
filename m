Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D0302443
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 12:29:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75D99C57181;
	Mon, 25 Jan 2021 11:29:25 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A22CAC5717F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 11:29:23 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1l403e-0003BU-Q1; Mon, 25 Jan 2021 12:29:22 +0100
To: Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210119095241.17888-1-a.fatoum@pengutronix.de>
 <d14933ea-2c77-7cca-8e2b-3972ea47d733@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <55578a12-2049-ef17-e6bb-9c2e4b1da5ea@pengutronix.de>
Date: Mon, 25 Jan 2021 12:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d14933ea-2c77-7cca-8e2b-3972ea47d733@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: enable STM32MP1
 crypto/CRC accelerators unconditionally
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Lionel,

On 19.01.21 11:50, Lionel DEBIEVE wrote:
> Hi Ahmad,
> =

> These IPs could be enabled in the secure side. To avoid any concurrency a=
ccess, I prefer to keep all that crypto IPs status disable.
> For examples, RNG can be managed in OP-TEE, so it will remain disable in =
Linux.
You could extend that reasoning (OP-TEE might use them) to all peripherals.
As the device tree is supposed to describe the hardware., I'd assume whether
something is enabled in Linux or OP-TEE should be project-specific configur=
ation
(or fixed up by boot firmware).

But I don't feel too strongly about it. Please dismiss and thanks for the c=
larification.

Cheers,
Ahmad


> BR,
> =

> Lionel
> =

> On 1/19/21 10:52 AM, Ahmad Fatoum wrote:
>> There is no SoC-external hardware support needed for the hash1, rng1,
>> crc1 and cryp1 IP blocks to function. Enable them thus unconditionally
>> instead of replicating their enablement in board device trees.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>> =A0 arch/arm/boot/dts/stm32mp151.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 3 ---
>> =A0 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi=A0=A0 |=A0 4 ----
>> =A0 arch/arm/boot/dts/stm32mp157c-dk2.dts=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 4 ----
>> =A0 arch/arm/boot/dts/stm32mp157c-ed1.dts=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1=
6 ----------------
>> =A0 arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi |=A0 4 ----
>> =A0 arch/arm/boot/dts/stm32mp15xc.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 1 -
>> =A0 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi=A0=A0 |=A0 8 --------
>> =A0 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi=A0=A0 |=A0 4 ----
>> =A0 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi=A0=A0=A0=A0=A0=A0=A0=A0 | 12 =
------------
>> =A0 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi=A0=A0=A0=A0=A0=A0 |=A0 4 --=
--
>> =A0 10 files changed, 60 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32=
mp151.dtsi
>> index 3c75abacb374..c2d998343b6a 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -1297,7 +1297,6 @@ hash1: hash@54002000 {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dmas =3D <&mdma1 31 0x2 0x1000A0=
2 0x0 0x0>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma-names =3D "in";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma-maxburst =3D <2>;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 rng1: rng@54003000 {
>> @@ -1305,7 +1304,6 @@ rng1: rng@54003000 {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x54003000 0x400>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&rcc RNG1_K>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 resets =3D <&rcc RNG1_R>;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 mdma1: dma-controller@58000000 {
>> @@ -1402,7 +1400,6 @@ crc1: crc@58009000 {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "st,stm32f7-crc";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x58009000 0x400>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&rcc CRC1>;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 stmmac_axi_config_0: stmmac-axi-config {
>> diff --git a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi b/arch/arm/boo=
t/dts/stm32mp157a-stinger96.dtsi
>> index 58275bcf9e26..268a99291d79 100644
>> --- a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
>> @@ -253,10 +253,6 @@ &pwr_regulators {
>> =A0=A0=A0=A0=A0 vdd_3v3_usbfs-supply =3D <&vdd_usb>;
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &rtc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/s=
tm32mp157c-dk2.dts
>> index 2bc92ef3aeb9..045636555ddd 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
>> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
>> @@ -29,10 +29,6 @@ chosen {
>> =A0=A0=A0=A0=A0 };
>> =A0 };
>> =A0 -&cryp1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &dsi {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0=A0=A0=A0=A0 phy-dsi-supply =3D <&reg18>;
>> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/s=
tm32mp157c-ed1.dts
>> index 81a7d5849db4..f69622097e89 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
>> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
>> @@ -115,14 +115,6 @@ adc1: adc@0 {
>> =A0=A0=A0=A0=A0 };
>> =A0 };
>> =A0 -&crc1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> -&cryp1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &dac {
>> =A0=A0=A0=A0=A0 pinctrl-names =3D "default";
>> =A0=A0=A0=A0=A0 pinctrl-0 =3D <&dac_ch1_pins_a &dac_ch2_pins_a>;
>> @@ -144,10 +136,6 @@ &gpu {
>> =A0=A0=A0=A0=A0 contiguous-area =3D <&gpu_reserved>;
>> =A0 };
>> =A0 -&hash1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &i2c4 {
>> =A0=A0=A0=A0=A0 pinctrl-names =3D "default", "sleep";
>> =A0=A0=A0=A0=A0 pinctrl-0 =3D <&i2c4_pins_a>;
>> @@ -325,10 +313,6 @@ &pwr_regulators {
>> =A0=A0=A0=A0=A0 vdd_3v3_usbfs-supply =3D <&vdd_usb>;
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &rtc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/b=
oot/dts/stm32mp157c-odyssey-som.dtsi
>> index 6cf49a0a9e69..a2aca1982bf6 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
>> @@ -250,10 +250,6 @@ &m4_rproc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &rtc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp15xc.dtsi b/arch/arm/boot/dts/stm3=
2mp15xc.dtsi
>> index b06a55a2fa18..86953d7ddde0 100644
>> --- a/arch/arm/boot/dts/stm32mp15xc.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xc.dtsi
>> @@ -12,7 +12,6 @@ cryp1: cryp@54001000 {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <GIC_SPI 79 IRQ_T=
YPE_LEVEL_HIGH>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&rcc CRYP1>;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 resets =3D <&rcc CRYP1_R>;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>> =A0=A0=A0=A0=A0 };
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boo=
t/dts/stm32mp15xx-dhcom-som.dtsi
>> index ac46ab363e1b..603c14054509 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
>> @@ -377,14 +377,6 @@ flash0: mx66l51235l@0 {
>> =A0=A0=A0=A0=A0 };
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> -&rtc {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &sdmmc1 {
>> =A0=A0=A0=A0=A0 pinctrl-names =3D "default", "opendrain", "sleep";
>> =A0=A0=A0=A0=A0 pinctrl-0 =3D <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boo=
t/dts/stm32mp15xx-dhcor-som.dtsi
>> index 803eb8bc9c85..3f4af430aaf4 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
>> @@ -204,10 +204,6 @@ flash0: spi-flash@0 {
>> =A0=A0=A0=A0=A0 };
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &rtc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/=
stm32mp15xx-dkx.dtsi
>> index 89c0e1ddc387..0cca6c3ff4a0 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> @@ -124,10 +124,6 @@ &cec {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> =A0 -&crc1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &dts {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> @@ -155,10 +151,6 @@ &gpu {
>> =A0=A0=A0=A0=A0 contiguous-area =3D <&gpu_reserved>;
>> =A0 };
>> =A0 -&hash1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &i2c1 {
>> =A0=A0=A0=A0=A0 pinctrl-names =3D "default", "sleep";
>> =A0=A0=A0=A0=A0 pinctrl-0 =3D <&i2c1_pins_a>;
>> @@ -482,10 +474,6 @@ &pwr_regulators {
>> =A0=A0=A0=A0=A0 vdd_3v3_usbfs-supply =3D <&vdd_usb>;
>> =A0 };
>> =A0 -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
>> -
>> =A0 &rtc {
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dt=
s/stm32mp15xx-osd32.dtsi
>> index 713485a95795..d03d4d12133c 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
>> @@ -224,7 +224,3 @@ &m4_rproc {
>> =A0=A0=A0=A0=A0 interrupts =3D <68 1>;
>> =A0=A0=A0=A0=A0 status =3D "okay";
>> =A0 };
>> -
>> -&rng1 {
>> -=A0=A0=A0 status =3D "okay";
>> -};
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
