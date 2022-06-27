Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656255B8F8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 11:40:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE2CC03FC5;
	Mon, 27 Jun 2022 09:40:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D6DC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 09:40:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R7mAUU015017;
 Mon, 27 Jun 2022 11:40:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o7dfOl4S6u/3Ojhlka+sdSby2aZu6UTszEhV542U3es=;
 b=2rHsEkg7pZBd2U48NeKhr6YNtEF9MQiu+yZKNIfv4car7CxxqOUj2kpKq6+VP1Y2JncH
 Rw/U4iFraMvRFvqYWWjp5qiqXCAxWexH54FeQcdL0qzevVu/CXT4mZGxkavER7DjPaHk
 5jDJ6WAkyB5HXd2dZPPo8yqrSUdxnvuzdm9D+rAMX/XgRT9UAT8WDbHRDcx3MpK4FZq0
 /IhuAfRyXPyEF4clC9qC6mkh3QxREnN9pn0JvGWM10wRdK4r/tMccB0gL0d8tA5bohrd
 HHi5D38c8vuWEs8QEr6R4AC+x6E+VuFFgJcXNcLio/WxjR5FcS1S4Xu7gBdvvoDEYKOD tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwqsm8uxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 11:40:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D8AB10002A;
 Mon, 27 Jun 2022 11:40:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59286216EC3;
 Mon, 27 Jun 2022 11:40:09 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 11:40:08 +0200
Message-ID: <9f6cff45-1894-23b5-afe7-49986e65ab5d@foss.st.com>
Date: Mon, 27 Jun 2022 11:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-media@vger.kernel.org>
References: <20220618222354.478227-1-marex@denx.de>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20220618222354.478227-1-marex@denx.de>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Drop always NULL
 sd_state from dcmi_pipeline_s_fmt()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek,

Thanks for the patch.

Acked-by: Hugues Fruchet <hugues.fruchet@st.com>

BR,
Hugues.

On 6/19/22 00:23, Marek Vasut wrote:
> The second argument is always NULL, stop passing it to the function.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/media/platform/st/stm32/stm32-dcmi.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 56f4e04bc7c49..ec54b5ecfd544 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -622,7 +622,6 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
>   }
>   
>   static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
> -			       struct v4l2_subdev_state *sd_state,
>   			       struct v4l2_subdev_format *format)
>   {
>   	struct media_entity *entity = &dcmi->source->entity;
> @@ -664,7 +663,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
>   			format->format.width, format->format.height);
>   
>   		fmt.pad = pad->index;
> -		ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
> +		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
>   		if (ret < 0) {
>   			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
>   				__func__, format->format.code,
> @@ -1115,7 +1114,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>   	mf->width = sd_framesize.width;
>   	mf->height = sd_framesize.height;
>   
> -	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
> +	ret = dcmi_pipeline_s_fmt(dcmi, &format);
>   	if (ret < 0)
>   		return ret;
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
