Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB528BADD
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Oct 2020 16:31:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6756BC3FAD5;
	Mon, 12 Oct 2020 14:31:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B17F5C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 14:31:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CES67S022265; Mon, 12 Oct 2020 16:30:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ACT07Tit0mj3YAY5SAKue3s63JiaejUyLP9li/xMGN8=;
 b=DnEiVViM3uAh9kMrRQraR5pHHn7pW4c9JTvdFEl5O1jPmhnElN4lTIIGc+oTiYS1FaEW
 vwJtiUzZxYFhOtL13xp89rUTeDpBBpE1++jctjsLGJb7Lj3kui3jZEcTQ5gkaEbyMGu+
 w7U486U2N+gkw3LYoQOroKvxmYSqVexLkPd+YNgjNMYyVxLNmUNx/liS7QO71R3EJj4T
 eUEk6SRwdxgQ0amkupQyp4Orj86gQbmeZBiVYmtbSVhqeL8F0fHMi1dzACgqkPdTjgAw
 LDR013059j4AzExojKHrpOUIX8fZuzIVR2An74eq6nUqHLX723t0runeOSAUIP0syqaR bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353w1n2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 16:30:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E661E10002A;
 Mon, 12 Oct 2020 16:30:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85C052A7E89;
 Mon, 12 Oct 2020 16:30:55 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Oct
 2020 16:30:54 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Mon, 12 Oct 2020 16:30:55 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Thread-Topic: [PATCH] media: ov5640: fix support of BT656 bus mode
Thread-Index: AQHWnLWhj+jiS/lF9USlFsRWc43I2qmT3jEAgAAKMwCAAARXAIAAAOcA
Date: Mon, 12 Oct 2020 14:30:55 +0000
Message-ID: <1c0ede18-def3-b2db-306c-ba4ab357d2da@st.com>
References: <1602080692-6383-1-git-send-email-hugues.fruchet@st.com>
 <20201012133538.2k6jpn6k2py7h2ym@uno.localdomain>
 <8c89da85-ccb9-4515-3995-27fe8e00c3cd@st.com>
 <20201012142740.at5dogcofr7r43pj@uno.localdomain>
In-Reply-To: <20201012142740.at5dogcofr7r43pj@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <2BF57B28CECC564D80F47020CB76E633@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_12:2020-10-12,
 2020-10-12 signatures=0
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: ov5640: fix support of BT656 bus
	mode
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

Hi Jacopo,

Many thanks for the explanations on commit message, I'm currently 
writing the v2, but if you already have comments on this v1 -appart from 
the power off section- feel free to post.

BR,
Hugues.

On 10/12/20 4:27 PM, Jacopo Mondi wrote:
> Hi Hugues
> 
> On Mon, Oct 12, 2020 at 02:12:09PM +0000, Hugues FRUCHET wrote:
>> Hi Jacopo,
>>
>> Thanks for reviewing, comments below
>>
>> On 10/12/20 3:35 PM, Jacopo Mondi wrote:
>>> Hi Hugues,
>>>
>>> On Wed, Oct 07, 2020 at 04:24:52PM +0200, Hugues Fruchet wrote:
> 
>>>
>>> As per the comment from Sakari in another patch, 'Fixes' (capital 'F')
>>> usually comes before Signed-off/Reviewed-by tags
>> I understand the "F" upper case, but I don't understand the "comes
>> before Signed-off", my signed-off is inserted after this line.
>>
> 
> So, this is not stated explicitly in submitting-patches.rst, but as
> per all the other tags attached to a patch, they're usually placed
> after the commit message
> 
> in this case:
> 
> Fix PCLK polarity not being taken into account.
> Fix ov5640_write_reg()return value unchecked at power off.
> Reformat code to keep register access below the register description.
> Remove useless ov5640_set_stream_bt656() function.
> 
> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
>>>
>>>>
>>>> Fix PCLK polarity not being taken into account.
>>
>> This one fixes a real bug.
>>
> 
> I don't think I've contested this
> 
>>>> Fix ov5640_write_reg()return value unchecked at power off.
>>>
>>> Am I wrong or you broke out this part to a separate patch ?
>>> As commented there, I don't think it's a good idea.
>>>
>>> Are you planning to send a v2 of this patch ?
>> The patches was sent at same time, so it's normal that they are designed
>> in same way, I'll send a v2 with this "reset to default at power off
>> without check" strategy.
>>
> 
> I was wondering if you were planning to send a v2 with the part that
> changed the power-off path removed as I would have reviewed that one
> instead of this, that's all.
> 
> 
>>>
>>> Thanks
>>>     j
>>>
>>>> Reformat code to keep register access below the register description.
>>>> Remove useless ov5640_set_stream_bt656() function.
>>>>
>>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>>>> ---
>>>>    drivers/media/i2c/ov5640.c | 95 +++++++++++++++++++++++++---------------------
>>>>    1 file changed, 51 insertions(+), 44 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>>> index 8d0254d..1b20db7 100644
>>>> --- a/drivers/media/i2c/ov5640.c
>>>> +++ b/drivers/media/i2c/ov5640.c
>>>> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>>>>    			      BIT(1), on ? 0 : BIT(1));
>>>>    }
>>>>
>>>> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
>>>> -{
>>>> -	int ret;
>>>> -
>>>> -	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
>>>> -			       on ? 0x1 : 0x00);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
>>>> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
>>>> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
>>>> -}
>>>> -
>>>>    static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>>>>    {
>>>>    	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
>>>> @@ -1994,20 +1980,12 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>>    static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>>>    {
>>>>    	unsigned int flags = sensor->ep.bus.parallel.flags;
>>>> +	bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
>>>>    	u8 pclk_pol = 0;
>>>>    	u8 hsync_pol = 0;
>>>>    	u8 vsync_pol = 0;
>>>>    	int ret;
>>>>
>>>> -	if (!on) {
>>>> -		/* Reset settings to their default values. */
>>>> -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>>>> -		ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
>>>> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
>>>> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0x00);
>>>> -		return 0;
>>>> -	}
>>>> -
>>>>    	/*
>>>>    	 * Note about parallel port configuration.
>>>>    	 *
>>>> @@ -2024,27 +2002,57 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>>>    	 * - VSYNC:	active high
>>>>    	 * - HREF:	active low
>>>>    	 * - PCLK:	active low
>>>> +	 *
>>>> +	 * VSYNC & HREF are not configured if BT656 bus mode is selected
>>>>    	 */
>>>> +
>>>>    	/*
>>>> -	 * configure parallel port control lines polarity
>>>> +	 * BT656 embedded synchronization configuration
>>>> +	 *
>>>> +	 * CCIR656 CTRL00
>>>> +	 * - [7]:	SYNC code selection (0: auto generate sync code,
>>>> +	 *		1: sync code from regs 0x4732-0x4735)
>>>> +	 * - [6]:	f value in CCIR656 SYNC code when fixed f value
>>>> +	 * - [5]:	Fixed f value
>>>> +	 * - [4:3]:	Blank toggle data options (00: data=1'h040/1'h200,
>>>> +	 *		01: data from regs 0x4736-0x4738, 10: always keep 0)
>>>> +	 * - [1]:	Clip data disable
>>>> +	 * - [0]:	CCIR656 mode enable
>>>>    	 *
>>>> -	 * POLARITY CTRL0
>>>> -	 * - [5]:	PCLK polarity (0: active low, 1: active high)
>>>> -	 * - [1]:	HREF polarity (0: active low, 1: active high)
>>>> -	 * - [0]:	VSYNC polarity (mismatch here between
>>>> -	 *		datasheet and hardware, 0 is active high
>>>> -	 *		and 1 is active low...)
>>>> +	 * Default CCIR656 SAV/EAV mode with default codes
>>>> +	 * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
>>>> +	 * - CCIR656 mode enable
>>>> +	 * - auto generation of sync codes
>>>> +	 * - blank toggle data 1'h040/1'h200
>>>> +	 * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
>>>>    	 */
>>>> -	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
>>>> +	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
>>>> +			       on && bt656 ? 0x01 : 0x00);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (on) {
>>>> +		/*
>>>> +		 * configure parallel port control lines polarity
>>>> +		 *
>>>> +		 * POLARITY CTRL0
>>>> +		 * - [5]:	PCLK polarity (0: active low, 1: active high)
>>>> +		 * - [1]:	HREF polarity (0: active low, 1: active high)
>>>> +		 * - [0]:	VSYNC polarity (mismatch here between
>>>> +		 *		datasheet and hardware, 0 is active high
>>>> +		 *		and 1 is active low...)
>>>> +		 */
>>>>    		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>>>>    			pclk_pol = 1;
>>>> -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>>> +		if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>>>    			hsync_pol = 1;
>>>> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>>>> +		if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>>>>    			vsync_pol = 1;
>>>>
>>>> -		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
>>>> -				       (pclk_pol << 5) | (hsync_pol << 1) |
>>>> +		ret = ov5640_write_reg(sensor,
>>>> +				       OV5640_REG_POLARITY_CTRL00,
>>>> +				       (pclk_pol << 5) |
>>>> +				       (hsync_pol << 1) |
>>>>    				       vsync_pol);
>>>>
>>>>    		if (ret)
>>>> @@ -2052,12 +2060,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>>>    	}
>>>>
>>>>    	/*
>>>> -	 * powerdown MIPI TX/RX PHY & disable MIPI
>>>> +	 * powerdown MIPI TX/RX PHY & enable DVP
>>>>    	 *
>>>>    	 * MIPI CONTROL 00
>>>> -	 * 4:	 PWDN PHY TX
>>>> -	 * 3:	 PWDN PHY RX
>>>> -	 * 2:	 MIPI enable
>>>> +	 * [4] = 1	: Power down MIPI HS Tx
>>>> +	 * [3] = 1	: Power down MIPI LS Rx
>>>> +	 * [2] = 0	: DVP enable (MIPI disable)
>>>>    	 */
>>>>    	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
>>>>    	if (ret)
>>>> @@ -2074,8 +2082,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>>>    	 * - [3:0]:	D[9:6] output enable
>>>>    	 */
>>>>    	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
>>>> -			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
>>>> -			       0x7f : 0x1f);
>>>> +			       on ? (bt656 ? 0x1f : 0x7f) : 0x00);
>>>>    	if (ret)
>>>>    		return ret;
>>>>
>>>> @@ -2085,7 +2092,9 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>>>>    	 * PAD OUTPUT ENABLE 02
>>>>    	 * - [7:2]:	D[5:0] output enable
>>>>    	 */
>>>> -	return ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
>>>> +	return ov5640_write_reg(sensor,
>>>> +				OV5640_REG_PAD_OUTPUT_ENABLE02,
>>>> +				on ? 0xfc : 0);
>>>>    }
>>>>
>>>>    static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>>>> @@ -2925,8 +2934,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>>>>
>>>>    		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>>>>    			ret = ov5640_set_stream_mipi(sensor, enable);
>>>> -		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
>>>> -			ret = ov5640_set_stream_bt656(sensor, enable);
>>>>    		else
>>>>    			ret = ov5640_set_stream_dvp(sensor, enable);
>>>>
>>>> --
>>>> 2.7.4
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
