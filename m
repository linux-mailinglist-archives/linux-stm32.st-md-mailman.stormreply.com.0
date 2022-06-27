Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FF55B8E8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 11:14:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83728C04004;
	Mon, 27 Jun 2022 09:14:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8595FC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 09:14:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R77mKx030465;
 Mon, 27 Jun 2022 11:14:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=c0hMGJqdtW1P/9G6KQP6HGb5BGnTwgzfRXy1YsV7/a4=;
 b=LTSfnm5by6SEDNucRUN2HMUHIwDiRii29jui5WWSHunD13I2iesUfhH2VSBkYBTJdSc3
 oDYdTHIFQNmmy9xfUjNf4P2xhL6NaW3wFc+/4kwcZ8nohNbHePvzpUH6gqR4B4DVueUm
 xLOEh4cxSGzO2wXF9yZulRfanLYWWRobpzmssvv8rJXKPlQz8tflGaXcRcXINaqez+2v
 3q8lMaVG2rAZOiJWklYvaTC/fwxoleju7Iu2yHF3YHtEQGsQpHJdlWTOzG7oQ2Sjsi5H
 g5P2g1frAsAeuwgZvH3i/Ei8aB/1efm9od9dYFppPS4m75O+Q5RAYj9tDhIRB/PAPpnL YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwqsm8pau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 11:14:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 696B410002A;
 Mon, 27 Jun 2022 11:14:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6477E21682C;
 Mon, 27 Jun 2022 11:14:09 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 11:14:08 +0200
Message-ID: <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
Date: Mon, 27 Jun 2022 11:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Switch to
	__v4l2_subdev_state_alloc()
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


On 6/20/22 16:06, Marek Vasut wrote:
> On 6/20/22 11:44, Tomi Valkeinen wrote:
>> Hi,
> 
> Hello all,
> 
>>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>>> Any local subdev state should be allocated and free'd using
>>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>>> takes care of calling .init_cfg() subdev op. Without this,
>>>> subdev internal state might be uninitialized by the time
>>>> any other subdev op is called.
>>
>> Does this fix a bug you have?
> 
> Yes

Which bug did you encounter exactly ?
This is strange that we have not yet encounter any problems around that 
through our tests campaigns... or we have to enforce with a new test, so 
better to know what your problem was exactly.

> 
>> Wasn't this broken even before the active state, as init_cfg was not 
>> called?
> 
> Yes, this was always broken. I suspect nobody tested this mode of 
> operation before. In my case, I have this DCMI driver connected directly 
> to MT9P006 sensor.

As far as I see, MT9P006 sensor is a 12 bits parallel interface sensor.
I don't see the difference with our OV5640 used in parallel mode which 
is a mainline config on our side, so one more time I wonder what the 
problem was.

> 
>> In any case, I think we have to do something like this, as the source 
>> subdev might depend on a valid subdev state.
> 
> Right.
> 
> [...]

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
