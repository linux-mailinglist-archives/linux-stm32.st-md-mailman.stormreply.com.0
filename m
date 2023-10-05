Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 696377B9CCC
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 13:47:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09C55C6C835;
	Thu,  5 Oct 2023 11:47:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2AD5C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 11:47:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 395AZB2Z025382; Thu, 5 Oct 2023 13:46:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=4xkLY2sFZ6bAzP0C1Okvtq5k6MsL61eKVQtjQb/uCzI=; b=ih
 YJGuaoo6cj7jDjv8uH+x/yHLAIAYkgZMQObGOUiuNk1/TqYdrHiovCWuZw64s+rh
 x/a9xMB1yUcVzidue2x3rz3sAPaSSscGSZw8nOQj+SkUtnTf6J91iUPeE5JhqVyH
 8AdXjupa7lH5IgiQ9sUDFQZXT/5SdNstWBZAHRsmnHnQKhekScWINLECzhgc6oA9
 twXbm+xtMTeT3Bn7rdsh8zklNFhgyItrygbhaXLqkU/nN6QBJzsXTFOOxXWy1X0d
 vBvWEgUvR5mbwWhNEi4BwNCu3syuhstUFx2AiuuUi/kEADr9kLJnMQ3hoAFwgNZf
 2s6m4Xb/hrFLoh0IBW9w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thuh409b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 13:46:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF7D010005C;
 Thu,  5 Oct 2023 13:46:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B19E124AAD8;
 Thu,  5 Oct 2023 13:46:32 +0200 (CEST)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:46:31 +0200
Message-ID: <a4ae0d0a-2a80-45d7-9527-928e26fef4ef@foss.st.com>
Date: Thu, 5 Oct 2023 13:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231004103720.3540436-1-hugues.fruchet@foss.st.com>
 <20231005-bleach-unknotted-9b11443959b1@spud>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20231005-bleach-unknotted-9b11443959b1@spud>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [RFC 0/6] VP8 H1 stateless encoding
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

Hi Conor,

My fault, mistake on "to" when sending mail, please ignore this serie 
there are no bindings/DT in it.
Sorry for disturbance.

Best regards,
Hugues.

On 10/5/23 12:59, Conor Dooley wrote:
> On Wed, Oct 04, 2023 at 12:37:14PM +0200, Hugues Fruchet wrote:
>> Hi all,
>>
>> Here is an RFC to support VP8 encoding using Hantro H1 hardware
>> of STM32MP25 SoCs (Verisilicon VC8000NanoE IP).
>> This work is derived from work done to support Rockchip RK3399
>> VPU2 in RFC [1] with a reshuffling of registers to match H1
>> register set.
>>
>> This has been tested on STM32MP257F-EV1 evaluation board using
>> GStreamer userspace [2]:
>> gst-launch-1.0 videotestsrc num-buffers=500 ! video/x-raw,width=640,height=480 \
>> ! v4l2slvp8enc ! queue ! matroskamux ! filesink location=test_vp8.mkv
>>
>> For the sake of simplicity I have embedded here the RFC [1] before the
>> changes related to this exact RFC, all rebased on v6.6 + STM32MP25
>> hardware codecs support [3].
> 
> I don't see any bindings etc here, what is it that you think I would
> care about looking at in this RFC series?
> 
> Thanks,
> Conor.
> 
>>
>> [1] https://lwn.net/ml/linux-media/20230309125651.23911-1-andrzej.p@collabora.com/
>> [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3736
>> [3] https://patchwork.kernel.org/project/linux-media/list/?series=789861
>>
>> Best regards,
>> Hugues.
>>
>>
>> Andrzej Pietrasiewicz (2):
>>    media: uapi: Add VP8 stateless encoder controls
>>    media: hantro: add VP8 encode support for Rockchip RK3399 VPU2
>>
>> Hugues Fruchet (4):
>>    media: hantro: add h1 vp8 encode support
>>    media: hantro: add VP8 encode support for STM32MP25 VENC
>>    media: hantro: h1: NV12 single-plane support
>>    media: hantro: add NV12 single-plane support for STM32MP25 VENC
>>
>>   drivers/media/platform/verisilicon/Makefile   |    3 +
>>   drivers/media/platform/verisilicon/hantro.h   |   10 +
>>   .../platform/verisilicon/hantro_boolenc.c     |   69 +
>>   .../platform/verisilicon/hantro_boolenc.h     |   21 +
>>   .../media/platform/verisilicon/hantro_drv.c   |   15 +-
>>   .../platform/verisilicon/hantro_h1_jpeg_enc.c |   42 +-
>>   .../platform/verisilicon/hantro_h1_regs.h     |   71 +-
>>   .../platform/verisilicon/hantro_h1_vp8_enc.c  | 1589 +++++++++++++++++
>>   .../media/platform/verisilicon/hantro_hw.h    |   93 +
>>   .../media/platform/verisilicon/hantro_v4l2.c  |    5 +-
>>   .../media/platform/verisilicon/hantro_vp8.c   |  118 ++
>>   .../verisilicon/rockchip_vpu2_hw_vp8_enc.c    | 1574 ++++++++++++++++
>>   .../platform/verisilicon/rockchip_vpu2_regs.h |    1 +
>>   .../platform/verisilicon/rockchip_vpu_hw.c    |   23 +-
>>   .../platform/verisilicon/stm32mp25_venc_hw.c  |   35 +-
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |   13 +
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    5 +
>>   include/media/v4l2-ctrls.h                    |    2 +
>>   include/uapi/linux/v4l2-controls.h            |   91 +
>>   include/uapi/linux/videodev2.h                |    3 +
>>   20 files changed, 3755 insertions(+), 28 deletions(-)
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.c
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.h
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
>>   create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.c
>>
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
