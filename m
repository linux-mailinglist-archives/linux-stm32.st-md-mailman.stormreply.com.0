Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736455B8F6
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 11:39:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00950C04004;
	Mon, 27 Jun 2022 09:39:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 466F3C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 09:39:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R7pePR028625;
 Mon, 27 Jun 2022 11:39:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rPJFRt06lrEarKeDs4jzYcKMWn4BxPdtFSY7r42pV/k=;
 b=z9rCJwSeVUeaT+6cXeZ+TBSUz1Pw/F07YuQa6bvN/zhmOPYHrRJLrQs6ojNnClLjWtoc
 0wOxa1v8KyI3NuoKccyU3/L6k1CT0YtSx3Xv44V26mSV/c3AkSL8mgaF/OyYkVZIQpOX
 zOUASCMo397QAvYd7atSFC2GJO3CGcLjjPY6T+0OcDToPsHNmWVX8LwptAnI9fsQWCKM
 S9PjuKG0logdqKu4gHcAfqnBFAV2256s9JI+nUyVABRNrDOUJ8/xJjjkzmFbRKJqjsUP
 0tlp3LDJFHtFCDTrcL2ePjvFbV8WX6rut3jwCKhmkrPUsmvzg2HeJ1VBmqKmvSaattlu 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq10g4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 11:39:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBEA310002A;
 Mon, 27 Jun 2022 11:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3D802138D4;
 Mon, 27 Jun 2022 11:39:11 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 11:39:11 +0200
Message-ID: <38af38b8-48ea-cfd9-6532-856b594735ca@foss.st.com>
Date: Mon, 27 Jun 2022 11:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-media@vger.kernel.org>
References: <20220618222317.478187-1-marex@denx.de>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20220618222317.478187-1-marex@denx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Fill in remaining
	Bayer formats
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

Please note that we have not tested parallel setup with more than 8 bits 
with this driver because of lack of hardware support.
Which board are you using ?
Are the whole 12 bits of the MT9P006 parallel bus wired on your board ?

Best regards,
Hugues.

On 6/19/22 00:23, Marek Vasut wrote:
> Fill in 10, 12, 14 bit Bayer formats into the DCMI driver.
> Those are useful e.g. when MT9P006 sensor is connected.
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
>   drivers/media/platform/st/stm32/stm32-dcmi.c | 48 ++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 09a743cd70040..5f08ba47ea96b 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1631,6 +1631,54 @@ static const struct dcmi_format dcmi_formats[] = {
>   		.fourcc = V4L2_PIX_FMT_SRGGB8,
>   		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
>   		.bpp = 1,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SBGGR14,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGBRG14,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SGRBG14,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_SRGGB14,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.bpp = 2,
>   	},
>   };
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
