Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C928DF48
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 12:45:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45895C424AF;
	Wed, 14 Oct 2020 10:45:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A6C5C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 10:45:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EAh9Lw019937; Wed, 14 Oct 2020 12:43:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ecOelpSBGEEQOBA7CraIE87FEegexzTRyWZKnUVJtU0=;
 b=AV2h70z8X48oSxSNQ5yczg4FoAcHwN4yo0OhkUXOHvQhqz0hWxqkd50tztOR9LFqo4Pk
 B0cveBL4B4Y6yr2mXHlBu9pO+e8VwRf3a0+WnkfgLlV3tuGgjnzdTnjbcTc1P9xUGzHO
 gvIIAR9WVO21vK3U9wyW1ZkAd1k7JHZRvPvQ1b7V44HDWl4tsZhuCWiiUnv0fRT4JIUk
 uyn1WRFhGyK1viJ2A5ff303vOIyKz7/Hzm7xzvrA1Aqt3nHPXFNMP4JRHC/JLrZfgCYj
 /Ji/wrYN65lUiL4hrluhHc2lv9IZCO0h3yRUE32Y1N2a3h37jq0gggkHO44S8Wu1d3WC rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ed0yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 12:43:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87DB810002A;
 Wed, 14 Oct 2020 12:43:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 330322B53E0;
 Wed, 14 Oct 2020 12:43:41 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 12:43:40 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Wed, 14 Oct 2020 12:43:40 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Thread-Topic: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Thread-Index: AQHWoKc05b6XwNbbukilsBYWkG/VOqmV/N4AgADODgA=
Date: Wed, 14 Oct 2020 10:43:40 +0000
Message-ID: <bca05e8d-461f-87d5-67e6-c02877b16edb@st.com>
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
 <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com>
In-Reply-To: <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <D82C7A708A3A8C46AFC366BC561E2AC9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] media: ov5640: fix support of BT656
	bus mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Prabhakar,

On 10/14/20 12:26 AM, Lad, Prabhakar wrote:
> Hi Hugues,
> 
> Thank you for catching the polarity bug.
Y're welcome.

> 
> On Mon, Oct 12, 2020 at 3:55 PM Hugues Fruchet <hugues.fruchet@st.com> wrote:
>>
>> Fix PCLK polarity not being taken into account.
>> Add comments about BT656 register control.
>> Remove useless ov5640_set_stream_bt656() function.
>> Refine comments about MIPI IO register control.
>>
>> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   drivers/media/i2c/ov5640.c | 77 +++++++++++++++++++++++++++-------------------
>>   1 file changed, 45 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index 8d0254d..c0ebf4c 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>>                                BIT(1), on ? 0 : BIT(1));
>>   }
>>
>> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
>> -{
>> -       int ret;
>> -
>> -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
>> -                              on ? 0x1 : 0x00);
>> -       if (ret)
>> -               return ret;
>> -
>> -       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
>> -                               OV5640_REG_SYS_CTRL0_SW_PWUP :
>> -                               OV5640_REG_SYS_CTRL0_SW_PWDN);
>> -}
>> -
>>   static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>>   {
>>          return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
>> @@ -1994,6 +1980,7 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>   static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>   {
>>          unsigned int flags = sensor->ep.bus.parallel.flags;
>> +       bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
>>          u8 pclk_pol = 0;
>>          u8 hsync_pol = 0;
>>          u8 vsync_pol = 0;
>> @@ -2001,6 +1988,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>
>>          if (!on) {
>>                  /* Reset settings to their default values. */
>> +               ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
>>                  ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>>                  ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
>>                  ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
>> @@ -2024,23 +2012,51 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>           * - VSYNC:     active high
>>           * - HREF:      active low
>>           * - PCLK:      active low
>> +        *
>> +        * VSYNC & HREF are not configured if BT656 bus mode is selected
>>           */
>> +
>>          /*
>> -        * configure parallel port control lines polarity
>> +        * BT656 embedded synchronization configuration
>>           *
>> -        * POLARITY CTRL0
>> -        * - [5]:       PCLK polarity (0: active low, 1: active high)
>> -        * - [1]:       HREF polarity (0: active low, 1: active high)
>> -        * - [0]:       VSYNC polarity (mismatch here between
>> -        *              datasheet and hardware, 0 is active high
>> -        *              and 1 is active low...)
>> +        * CCIR656 CTRL00
>> +        * - [7]:       SYNC code selection (0: auto generate sync code,
>> +        *              1: sync code from regs 0x4732-0x4735)
>> +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
>> +        * - [5]:       Fixed f value
>> +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
>> +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
>> +        * - [1]:       Clip data disable
>> +        * - [0]:       CCIR656 mode enable
>> +        *
>> +        * Default CCIR656 SAV/EAV mode with default codes
>> +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
>> +        * - CCIR656 mode enable
>> +        * - auto generation of sync codes
>> +        * - blank toggle data 1'h040/1'h200
>> +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
>>           */
>> -       if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
>> +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
>> +                              bt656 ? 0x01 : 0x00);
> Did you test bt656 on your platform ? with these changes BT.656 mode
> doesn't work anymore on my platform. With the below diff on top of
> your patch it works OK. Could you please test the same works on your
> platform.

Yes of course, tested on STM32MP1 evaluation board with OV5640/parallel 
setup (stm32-dcmi capture driver). Several captures made, no issues.

So in short you have to move the CCIR656 mode enable from set_power() to 
set_stream(), this is similar to changes you've made in code recently
around OV5640_REG_SYS_CTRL0 & SW_PWUP/DOWN, but the reason to do that is 
still not understood, at least on my side.
My understanding reading your patch was that OV5640_REG_SYS_CTRL0 -> 
SW_PWUP trigs the real "stream on" of the sensor and only at that time 
the data are produced by sensor, but if this is true, why do we need to 
enable CCIR656 right before SW_PWUP instead of enabling it with other 
DVP settings (DVP enable and so on...) ? This is not logical.

I think that we have to understand what happens on your side before 
going to more changes on this already so complex driver.

> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 49e73ace8685..c5e45bc17bdf 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1977,6 +1977,40 @@ static int ov5640_set_power_mipi(struct
> ov5640_dev *sensor, bool on)
>          return 0;
>   }
> 
> +static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> +{
> +       int ret;
> +
> +       /*
> +        * BT656 embedded synchronization configuration
> +        *
> +        * CCIR656 CTRL00
> +        * - [7]:       SYNC code selection (0: auto generate sync code,
> +        *              1: sync code from regs 0x4732-0x4735)
> +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> +        * - [5]:       Fixed f value
> +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> +        * - [1]:       Clip data disable
> +        * - [0]:       CCIR656 mode enable
> +        *
> +        * Default CCIR656 SAV/EAV mode with default codes
> +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> +        * - CCIR656 mode enable
> +        * - auto generation of sync codes
> +        * - blank toggle data 1'h040/1'h200
> +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> +        */
> +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> +                              on ? 0x1 : 0x00);
> +       if (ret)
> +               return ret;
> +
> +       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> +                               OV5640_REG_SYS_CTRL0_SW_PWUP :
> +                               OV5640_REG_SYS_CTRL0_SW_PWDN);
> +}
> +
>   static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>   {
>          unsigned int flags = sensor->ep.bus.parallel.flags;
> @@ -2014,31 +2048,6 @@ static int ov5640_set_power_dvp(struct
> ov5640_dev *sensor, bool on)
>           * VSYNC & HREF are not configured if BT656 bus mode is selected
>           */
> 
> -       /*
> -        * BT656 embedded synchronization configuration
> -        *
> -        * CCIR656 CTRL00
> -        * - [7]:       SYNC code selection (0: auto generate sync code,
> -        *              1: sync code from regs 0x4732-0x4735)
> -        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> -        * - [5]:       Fixed f value
> -        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> -        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> -        * - [1]:       Clip data disable
> -        * - [0]:       CCIR656 mode enable
> -        *
> -        * Default CCIR656 SAV/EAV mode with default codes
> -        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> -        * - CCIR656 mode enable
> -        * - auto generation of sync codes
> -        * - blank toggle data 1'h040/1'h200
> -        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> -        */
> -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> -                              bt656 ? 0x01 : 0x00);
> -       if (ret)
> -               return ret;
> -
>          /*
>           * configure parallel port control lines polarity
>           *
> @@ -2935,6 +2944,8 @@ static int ov5640_s_stream(struct v4l2_subdev
> *sd, int enable)
> 
>                  if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>                          ret = ov5640_set_stream_mipi(sensor, enable);
> +               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> +                       ret = ov5640_set_stream_bt656(sensor, enable);
>                  else
>                          ret = ov5640_set_stream_dvp(sensor, enable);
> 
> Cheers,
> Prabhakar
> 
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (on) {
>> +               /*
>> +                * configure parallel port control lines polarity
>> +                *
>> +                * POLARITY CTRL0
>> +                * - [5]:       PCLK polarity (0: active low, 1: active high)
>> +                * - [1]:       HREF polarity (0: active low, 1: active high)
>> +                * - [0]:       VSYNC polarity (mismatch here between
>> +                *              datasheet and hardware, 0 is active high
>> +                *              and 1 is active low...)
>> +                */
>>                  if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>>                          pclk_pol = 1;
>> -               if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>> +               if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>                          hsync_pol = 1;
>> -               if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>> +               if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>>                          vsync_pol = 1;
>>
>>                  ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
>> @@ -2052,12 +2068,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>          }
>>
>>          /*
>> -        * powerdown MIPI TX/RX PHY & disable MIPI
>> +        * powerdown MIPI TX/RX PHY & enable DVP
>>           *
>>           * MIPI CONTROL 00
>> -        * 4:    PWDN PHY TX
>> -        * 3:    PWDN PHY RX
>> -        * 2:    MIPI enable
>> +        * [4] = 1      : Power down MIPI HS Tx
>> +        * [3] = 1      : Power down MIPI LS Rx
>> +        * [2] = 0      : DVP enable (MIPI disable)
>>           */
>>          ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
>>          if (ret)
>> @@ -2074,8 +2090,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>           * - [3:0]:     D[9:6] output enable
>>           */
>>          ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
>> -                              sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
>> -                              0x7f : 0x1f);
>> +                              bt656 ? 0x1f : 0x7f);
>>          if (ret)
>>                  return ret;
>>
>> @@ -2925,8 +2940,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>>
>>                  if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>>                          ret = ov5640_set_stream_mipi(sensor, enable);
>> -               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
>> -                       ret = ov5640_set_stream_bt656(sensor, enable);
>>                  else
>>                          ret = ov5640_set_stream_dvp(sensor, enable);
>>
>> --
>> 2.7.4
>>

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
