Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAD382556
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 09:29:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27CFBC57B75;
	Mon, 17 May 2021 07:29:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A678EC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 07:29:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14H7C2Y0012348; Mon, 17 May 2021 09:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IBklEhJOoqnRyM5eXyLESodNBjnwwQeXasaYr+V1Hs8=;
 b=AXloOSyjoJBa8hQbEwYVFThW80uykJN6iVPny5RTPDvvzEuUAG2oPtk4xmHFuGF7AoJ1
 aIkKBc+W8RoTown7zPNJmSxbpGK8xeNanQ92dHzxrernkIElpge/31I8CDumzyI3a/0X
 BgvlrEqU9ZJYqvN+7EFaW4yh0DTtvF7H6JWbLPYL6ek+RhL0xfmx/66qFhs/yrAtcUd4
 XnRviqW2iaRTVxSnEz59/QU/vWOIFsV9BJw1ICHfS25lFqvMUuGDmlVxQs83ttA/N6uX
 44PybUlC573C6fw9oCoe5ZMUWbe8GjXDfzK9fxUjzfezG7CIM/4a44x9PTx2ePPGpF0c Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38k5dq34pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:29:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4D53100034;
 Mon, 17 May 2021 09:29:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4B34214D36;
 Mon, 17 May 2021 09:29:26 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 09:29:25 +0200
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210508095506.4d0d628a@collabora.com>
 <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
 <20210510112249.5613978e@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <48d8774c-9868-27e5-b8b0-fdbf99c84ba2@foss.st.com>
Date: Mon, 17 May 2021 09:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210510112249.5613978e@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_01:2021-05-12,
 2021-05-17 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] spi: spi-mem: add automatic poll
	status functions
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

Hi Boris

On 5/10/21 11:22 AM, Boris Brezillon wrote:
> On Mon, 10 May 2021 10:46:48 +0200
> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> 
>>>   
>>>> +
>>>> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
>>>> +		ret = spi_mem_access_start(mem);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		reinit_completion(&ctlr->xfer_completion);
>>>> +
>>>> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
>>>> +						 timeout_ms);
>>>> +
>>>> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
>>>> +						 msecs_to_jiffies(timeout_ms));  
>>>
>>> Why do you need to wait here? I'd expect the poll_status to take care
>>> of this wait.  
>>
>> It was a request from Mark Brown [1]. The idea is to implement
>> similar mechanism already used in SPI framework.
> 
> Well, you have to choose, either you pass a timeout to ->poll_status()
> and let the driver wait for the status change (and return -ETIMEDOUT if
> it didn't happen in time), or you do it here and the driver only has to
> signal the core completion object. I think it's preferable to let the
> driver handle the timeout though, because you don't know how the
> status check will be implemented, and it's not like the
> reinit_completion()+wait_for_completion_timeout() done here would
> greatly simplify the drivers wait logic anyway.
> 

Ok i will remove the reinit/wait_completion() as you suggested.
Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
