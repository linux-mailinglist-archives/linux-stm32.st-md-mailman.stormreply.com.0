Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67762A6BCD
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2019 16:48:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12EEEC35E01;
	Tue,  3 Sep 2019 14:48:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B04C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2019 14:48:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83EkAv5015836; Tue, 3 Sep 2019 16:48:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jQ3oaMkgpunhFsNFXMQeykqpkTdNCICZj4PFzvK8kuY=;
 b=wo9qENYgZQwaFjge0C30fYjdA27Yt2zAQ7sLzRjKAJg1zlGr+8bDoJyRBc6bQcI7zx8I
 cvZyzlzvKfDXiGNHQLUxl9MM3Kr3dYUp1fB6kgr1/VHZJ3Sbhf13tGS0bTdKCwFAHN69
 GcS3WYOAPsrTFMzHUTB0b4SO2CnC+XWeBuruACOGv19s+T2syhWtW6yPA15QoYegjsbK
 iDkG5zlpA78qhE4p3hVQ2vLcJaHwJ7cDM4FSjvJCwJOkh+dqXZsxB4sczHnsTyBp9EB5
 gtYM0tFBwYlywR1pWXMZbhnLOozVNoaE6ZBT6f3GATZNcRQJ0Mj0G1rGH8owOxbTq/IY cA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec2ugcg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 03 Sep 2019 16:48:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C399B22;
 Tue,  3 Sep 2019 14:48:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D42C32C6103;
 Tue,  3 Sep 2019 16:48:05 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Sep
 2019 16:48:05 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 3 Sep 2019 16:48:05 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Thread-Index: AQHVLQJlOjCpwYSvfEindPL7LJBZs6a3ZHgAgEyO9wCAAekzgIAUdQGA
Date: Tue, 3 Sep 2019 14:48:05 +0000
Message-ID: <3a54de53-6a9b-f0e9-f4bb-77ccbb1f8ede@st.com>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
 <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
 <20190820091311.GB5123@paasikivi.fi.intel.com>
 <20190821142407.facveek5omjdide6@uno.localdomain>
In-Reply-To: <20190821142407.facveek5omjdide6@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <A7D6D8320BE893428EC492FC1E01D9DC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_02:2019-09-03,2019-09-03 signatures=0
Cc: Laura Nao <laura.nao@kynetics.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] media: ov5640: add support of
	V4L2_CID_LINK_FREQ
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

On 8/21/19 4:24 PM, Jacopo Mondi wrote:
> Hello,
>     +laura who has been working on supporting RAW capture for this
>     driver.
> 
> On Tue, Aug 20, 2019 at 12:13:12PM +0300, Sakari Ailus wrote:
>> Hi Hugues,
>>
>> On Tue, Jul 02, 2019 at 04:05:46PM +0000, Hugues FRUCHET wrote:
>>> Hi Sakari,
>>>
>>> On 6/27/19 6:05 PM, Sakari Ailus wrote:
>>>> Hi Hugues,
>>>>
>>>> On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
>>>>> Add support of V4L2_CID_LINK_FREQ, this is needed
>>>>> by some CSI-2 receivers.
>>>>>
>>>>> 384MHz is exposed for the time being, corresponding
>>>>> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
>>>>>
>>>>> This setup has been tested successfully with ST MIPID02
>>>>> CSI-2 to parallel bridge.
>>>>>
>>>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>>>>> ---
>>>>
>>>> Thanks for the patch.
>>>>
>>>> The driver calculates the sensor configuration based on its configuration,
>>>> and this needs to be reflected in the link frequency: it's not a static
>>>> value. See e.g. ov5640_calc_sys_clk().
>>>>
>>>
>>> I know this code, but for a reason I don't understand yet, this seems
>>> to not have effects on the CSI-2 link frequency.
>>>
> 
> This seems unlikely to me, as the ov5640_calc_sys_clk() calculates the
> system clock, which then generates the MIPI CLK.
> 
> I would really be interested to know if you could measure somehow the
> actual frequency of the clock lane, to make sure it actually
> changes according to to the driver calculations.
> 
>>> This has been verified with MIPID02 CSI-2 bridge which only work with
>>> this fixed link frequency as input to program its ui_x4 register
>>> setting, see
>>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2028171.html.
>>> All resolutions and all framerate have been tested succesfully with this
>>> setting.
>>>
>>> Initially I tried to set the link frequency according to the value
>>> computed in ov5640_calc_sys_clk() but it was only functional when
>>> resolutions/framerate was close to the 384MHz value...
>>>
>>> As OV5640 D3 engineering board has been initially developped for
>>> dragonboard, I'll dig into this and found this commit:
>>> https://lore.kernel.org/patchwork/patch/886794/
>>> which set a fixed pixel rate value to 96MHz, which match perfectly
>>> with the 384MHz value I found for link frequency...
>>>
>>> Perhaps other CSI-2 OV5640 users can comment about it and have the
>>> explanations of what I experiment...
>>> Maxime, Jacopo, do you have any idea about it ?
>>
>> I would also like to wee a comment from someone who's familiar with the
>> device. Yet I can tell a static value of 348 MHz is clearly incorrect as it
>> ignores sensor runtime configuration as well as platform configuration
>> (external clock frequency for instance).
>>
>> Generally speaking, configuring a CSI-2 receiver to expect a particular
>> frequency usually doesn't mean it's going to fail even if the transmitter
>> uses a different frequency, albeit the likelihood of it not working
>> increases as the difference grows. Could the problem be at the receiver's
>> end?
>>
>> Have you checked what kind of values ov5640_calc_pclk() returns for
>> different configurations? It would seem like that this is what the
>> LINK_FREQ (divided by lanes and multiplied by two) should be.
> 
> Not exactly. ov5640_calc_pclk() is only used when computing the
> parallel bus pixel clock not for the CSI-2 bus.
> 
> To obtain the link frequency for the MIPI interface I would consider
> the system clock frequency calculated by ov5640_calc_sys_clk(), which
> represents the bandwidth per lane in bits per second. This should then
> be divided by 2 to compensate the MIPI DDR mode [*] (no need to divide
> by the number of lanes, as this is already the bandwidth -per lane-)
> 
> For 640x480 YUYV8_2X8 (and 1024x768) with 2 data lanes and 24MHz xclk
> I have calculated the following values:
> 
> SYSCLK = 492MHz
> MIPISCLK = 256MHz
> PCLK = 61,50MHz
> 
> For 1280x720 with the same setup
> SYSCLK = 340MHz
> MIPI_CLK = 170MHz
> PCLK = 42,50 (this seems veeery low according to datasheet)
> 
> For 1920x1080
> SYSCLK = 680MHz
> MIPI_CLK = 340MHz
> PCLK = 85MHz (slightly slow according to the datasheet)
> 
> All captured images seems fine...
> 
> If you could confirm those values by probing the actual clock lane it
> would be just great.
> 

I've made some measurements probing clock lane with YUYV 16 bits 
grabbing, here are the results:

* VGA @ 30fps
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap
[ 1624.854273] ov5640 0-003c: rate=491443200, 640x480 from 1896x1080
[ 1624.859192] ov5640 0-003c: sysclk=492000000, mipi_div=2
Measured clock lane frequency: 123MHz

* 1024x768 @ 30fps
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=1024,height=768,pixelformat=YUYV --stream-mmap
[  558.833885] ov5640 0-003c: rate=491443200, 1024x768 from 1896x1080
[  558.840188] ov5640 0-003c: sysclk=492000000, mipi_div=2
Measured clock lane frequency: 124MHz

* 720p @ 30fps
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=1280,height=720,pixelformat=YUYV --stream-mmap
[ 2920.785392] ov5640 0-003c: rate=336019200, 1280x720 from 1892x740
[ 2920.794771] ov5640 0-003c: sysclk=340000000, mipi_div=1
Measured clock lane frequency: 171MHz

* 1080p @ 30fps
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
[ 1650.143701] ov5640 0-003c: rate=672000000, 1920x1080 from 2500x1120
[ 1650.149876] ov5640 0-003c: sysclk=672000000, mipi_div=1
Measured clock lane frequency: 330MHz

So it seems that formula must also take care of mipi_div:
link_frequency = sys_div / 2 / mipi_div


Unfortunately, as said previously, when updating ov5640 codebase so that 
CID_LINK_FREQUENCY returns this computed value instead of 384MHz fixed 
value, the MIPID02 bridge has some troubles and some 
resolutions/framerate are broken:

dmesg -n8
echo "format link_freq +p" > /sys/kernel/debug/dynamic_debug/control

* VGA @ 30fps => broken
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap
[ 1624.854273] ov5640 0-003c: rate=491443200, 640x480 from 1896x1080
[ 1624.859192] ov5640 0-003c: sysclk=492000000, mipi_div=2
[ 1624.924287] st-mipid02 1-0014: detect link_freq = 123000000 Hz
==> no frames sent to DCMI

* 720p @ 30fps => very slow framerate
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=1280,height=720,pixelformat=YUYV --stream-mmap
[ 1900.707822] ov5640 0-003c: rate=336019200, 1280x720 from 1892x740
[ 1900.712717] ov5640 0-003c: sysclk=340000000, mipi_div=1
[ 1900.782402] st-mipid02 1-0014: detect link_freq = 170000000 Hz
<< 0.69 fps
< 0.67 fps
< 0.67 fps

* 1080p @ 30fps => very slow framerate
v4l2-ctl --set-parm=30;v4l2-ctl 
--set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
[ 1366.550832] ov5640 0-003c: rate=336000000, 1920x1080 from 2500x1120
[ 1366.555668] ov5640 0-003c: sysclk=336000000, mipi_div=1
Frame rate set to 30.000 fps
[ 1367.105503] ov5640 0-003c: rate=672000000, 1920x1080 from 2500x1120
[ 1367.110420] ov5640 0-003c: sysclk=672000000, mipi_div=1
[ 1367.214498] st-mipid02 1-0014: detect link_freq = 336000000 Hz
<< 0.11 fps
< 0.11 fps


* 1080p @ 15fps => OK, 15fps as expected
v4l2-ctl --set-parm=15;v4l2-ctl 
--set-fmt-video=width=1920,height=1080,pixelformat=YUYV --stream-mmap
[ 1327.417545] ov5640 0-003c: rate=336000000, 1920x1080 from 2500x1120
[ 1327.422560] ov5640 0-003c: sysclk=336000000, mipi_div=1
[ 1327.527852] st-mipid02 1-0014: detect link_freq = 168000000 Hz
<<<<<<<<<<<<<<<<< 15.09 fps
<<<<<<<<<<<<<<< 15.04 fps


One could argue that this is the mipid02 bridge codebase that is wrong:
drivers/media/i2c/st-mipid02.c:
   mipid02_configure_from_rx_speed()
     [...]
     bridge->r.clk_lane_reg1 |= (2000000000 / link_freq) << 2;

but computation is inline with MIPID02 spec:

"CLOCK LANE 1 REGISTER"
Bit_no   Bit_name
7        ui_x4_clk_lane[5]
6        ui_x4_clk_lane[4]
5        ui_x4_clk_lane[3]
4        ui_x4_clk_lane[2]
3        ui_x4_clk_lane[1]
2        ui_x4_clk_lane[0]
Unit interval time multiplied by four
This signal indicates the bit period in units of
0.25 ns. If the unit interval is 3 ns, twelve (0x0C)
should be programmed. This value is used to
generate delays. Therefore, if the period is not a
multiple of 0.25 ns, the value should be rounded
down. For example, a 600 Mbit/s single lane
linkuses a unit interval of 1.667 ns. Multiplying
by four results in 6.667. In this case, a value of 6
(not 7) should be programmed.


Perhaps that someone which knows well CSI-2 interfaces could
detect what is wrong here, but personally I don't.


> However, this only work assuming the here below [*], and we're still
> missing something because RAW still doesn't work as expected :(
> 
> Anyway, clock tree madness apart, fixing the LINK_FREQ control value
> to 96MHz seems like it does not reflect what the driver actual does.
> 
> Could you try setting the control value to what the driver actually
> computes as here suggested?
> 
> Thanks
>     j
> 
> PS. I'm still confused why the have the link-frequencies property in
> DTS bindings. What is its purpose if all drivers compute or hardcode
> it?

I share this point of view, I don't know how to return a dynamically 
computed link frequency. Current drivers are exposing a single one
or a set of discrete frequencies.
For a matter of test purpose, I've done this hack:

-static const s64 link_freq_menu_items[] = {
+static s64 link_freq_menu_items[] = {
	384000000,
};

+	link_freq_menu_items[0] = _rate / 2 / mipi_div;


> 
> [*] There is a big assumption here, that the MIPI bus clock gets
> generated by two different clock outputs depending if the mode goes
> through the the scaler or not. You can see this at line 967 in the
> driver code. If mode goes though the scaler, MIPI_DIV = 2 and you get
> the bus clock from the MIPISCLK signal. If it does not go through the
> scaler MIPI_DIV = 1 and then the MIPI bus clock gets provided by the
> MIPI_CLK signal. This is the result of several attempts to decode the
> ov5640 clock tree, but it has only been tested with modes with bpp =
> 16 and 2 data lanes. As it has been recently reported, for RAW mode,
> this does not work well, so the assumption might not be correct.
> 
>>
>>>
>>>
>>>>> version 2:
>>>>>     - do not set control read only as per Hans' comment:
>>>>>       See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
>>>>>
>>>>>    drivers/media/i2c/ov5640.c | 10 ++++++++++
>>>>>    1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>>>> index 82d4ce9..e6307f3 100644
>>>>> --- a/drivers/media/i2c/ov5640.c
>>>>> +++ b/drivers/media/i2c/ov5640.c
>>>>> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
>>>>>    	struct v4l2_ctrl *test_pattern;
>>>>>    	struct v4l2_ctrl *hflip;
>>>>>    	struct v4l2_ctrl *vflip;
>>>>> +	struct v4l2_ctrl *link_freq;
>>>>>    };
>>>>>
>>>>>    struct ov5640_dev {
>>>>> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>>>>>    	return 0;
>>>>>    }
>>>>>
>>>>> +static const s64 link_freq_menu_items[] = {
>>>>> +	384000000,
>>>>> +};
>>>>> +
>>>>>    static int ov5640_set_fmt(struct v4l2_subdev *sd,
>>>>>    			  struct v4l2_subdev_pad_config *cfg,
>>>>>    			  struct v4l2_subdev_format *format)
>>>>> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>>    	case V4L2_CID_VFLIP:
>>>>>    		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>>>>>    		break;
>>>>> +	case V4L2_CID_LINK_FREQ:
>>>>> +		return 0;
>>>>>    	default:
>>>>>    		ret = -EINVAL;
>>>>>    		break;
>>>>> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>>>>>    				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
>>>>>    				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
>>>>>
>>>>> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
>>>>> +						  0, 0, link_freq_menu_items);
>>>>> +
>>>>>    	if (hdl->error) {
>>>>>    		ret = hdl->error;
>>>>>    		goto free_ctrls;
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>
>>>
>>> BR,
>>> Hugues.
>>
>> --
>> Sakari Ailus
>> sakari.ailus@linux.intel.com

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
