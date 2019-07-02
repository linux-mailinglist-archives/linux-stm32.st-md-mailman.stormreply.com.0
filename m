Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2665D3D9
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 18:05:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19925C6FAE9
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 16:05:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EC38C6FAE7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 16:05:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62Fuw61030898; Tue, 2 Jul 2019 18:05:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Gv8n01/kBVlf7RCnuKc035bJ+prAX5fBSZIeFogqO0Y=;
 b=UeeVHpsqzhJo5dalvREnkx+f0cyhh0XxSmE2hOzqEjj4vPQNpzN44dR+e4KVZCbGjOVm
 SrEskEH2JWxa+ffN125ztSBQxmZLvB1Tj0qPUiVxZkw+y9hUQiaQSNh9xsAEWo9m56OT
 GjVNqldPm2YNGVvQNfYA/llh+oMHO0Muaee+xpY6hGYrOjLjQlvIhGrC5CvDg/IzFjRt
 lzuzRb5NePrlHmxAE9FZg52ZLOqyOR9SzhRu+wLceg5T0boQrTqvji+LX79fso71ow/5
 0ujfX0V+TYNjYleiTpjQJ4eKMk3Y775Fb87pgICos0qV7B2eK23//w610BnWjjl99Wzn tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvhw44j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 18:05:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64EBA34;
 Tue,  2 Jul 2019 16:05:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 104C44DDA;
 Tue,  2 Jul 2019 16:05:47 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 18:05:46 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 18:05:46 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard
 <maxime.ripard@bootlin.com>, Jacopo Mondi <jacopo@jmondi.org>
Thread-Topic: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Thread-Index: AQHVLQJlOjCpwYSvfEindPL7LJBZs6a3ZHgA
Date: Tue, 2 Jul 2019 16:05:46 +0000
Message-ID: <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
In-Reply-To: <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <C21B5DD38A0804489BBFFBC360264F22@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
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

Hi Sakari,

On 6/27/19 6:05 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
>> Add support of V4L2_CID_LINK_FREQ, this is needed
>> by some CSI-2 receivers.
>>
>> 384MHz is exposed for the time being, corresponding
>> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
>>
>> This setup has been tested successfully with ST MIPID02
>> CSI-2 to parallel bridge.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
> 
> Thanks for the patch.
> 
> The driver calculates the sensor configuration based on its configuration,
> and this needs to be reflected in the link frequency: it's not a static
> value. See e.g. ov5640_calc_sys_clk().
> 

I know this code, but for a reason I don't understand yet, this seems
to not have effects on the CSI-2 link frequency.

This has been verified with MIPID02 CSI-2 bridge which only work with
this fixed link frequency as input to program its ui_x4 register 
setting, see 
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2028171.html.
All resolutions and all framerate have been tested succesfully with this 
setting.

Initially I tried to set the link frequency according to the value 
computed in ov5640_calc_sys_clk() but it was only functional when 
resolutions/framerate was close to the 384MHz value...

As OV5640 D3 engineering board has been initially developped for 
dragonboard, I'll dig into this and found this commit:
https://lore.kernel.org/patchwork/patch/886794/
which set a fixed pixel rate value to 96MHz, which match perfectly
with the 384MHz value I found for link frequency...

Perhaps other CSI-2 OV5640 users can comment about it and have the 
explanations of what I experiment...
Maxime, Jacopo, do you have any idea about it ?


>> version 2:
>>    - do not set control read only as per Hans' comment:
>>      See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
>>
>>   drivers/media/i2c/ov5640.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index 82d4ce9..e6307f3 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
>>   	struct v4l2_ctrl *test_pattern;
>>   	struct v4l2_ctrl *hflip;
>>   	struct v4l2_ctrl *vflip;
>> +	struct v4l2_ctrl *link_freq;
>>   };
>>   
>>   struct ov5640_dev {
>> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>>   	return 0;
>>   }
>>   
>> +static const s64 link_freq_menu_items[] = {
>> +	384000000,
>> +};
>> +
>>   static int ov5640_set_fmt(struct v4l2_subdev *sd,
>>   			  struct v4l2_subdev_pad_config *cfg,
>>   			  struct v4l2_subdev_format *format)
>> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>   	case V4L2_CID_VFLIP:
>>   		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>>   		break;
>> +	case V4L2_CID_LINK_FREQ:
>> +		return 0;
>>   	default:
>>   		ret = -EINVAL;
>>   		break;
>> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>>   				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
>>   				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
>>   
>> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
>> +						  0, 0, link_freq_menu_items);
>> +
>>   	if (hdl->error) {
>>   		ret = hdl->error;
>>   		goto free_ctrls;
>> -- 
>> 2.7.4
>>
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
