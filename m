Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C074415CB6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Sep 2021 13:20:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A43BC5A4F8;
	Thu, 23 Sep 2021 11:20:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E80D1C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Sep 2021 08:37:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N8P641017537; 
 Thu, 23 Sep 2021 10:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FQ16dZSaItVi4+Z7aMBiqJoswyYlb1eZGTWTZb1KD38=;
 b=lMie4IjfxcnIH3PhsY+/FQUXlOabtQLEkLKGy6wR4Y9vrkwEt08Q/n4lLDfuq3oScuxe
 hhgLcjsco+/azDG0HYHT+47il/Sh6vSdsRNYRugxIa0SuzW7/fenhxnF+xYA6EVuvHTp
 fOAkMNt0tV2Fh3Dqg1ExbOjY9LXeXIvSqUZV9exM36IxzqdvtN6Dk/rJKNcSkiUr4DfE
 bPOB1/i62PZXOOVgQSM8ZWhiRF9pxggxfJzJLYOoluK9rlzaxBJYizAhBOaR13ROrpfq
 RN1I903/vug9RrbAZ7VEXf1Fz19Uf/7OsWpt1+OWOKvxtOE3pkgAiZWo/uO8X3n7DJR7 Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b8gdra1fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 10:37:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CE44100034;
 Thu, 23 Sep 2021 10:37:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64D452248B6;
 Thu, 23 Sep 2021 10:37:18 +0200 (CEST)
Received: from lmecxl1060.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 10:37:17 +0200
To: Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <d75186a2-af03-5c81-fd33-706dcf5fe5f0@foss.st.com>
Date: Thu, 23 Sep 2021 10:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_02,2021-09-22_01,2020-04-07_01
X-Mailman-Approved-At: Thu, 23 Sep 2021 11:20:18 +0000
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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

Hi Alain

Look good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 9/20/21 5:21 PM, Alain Volmat wrote:
> When getting an access timeout, ensure that the bus is in a proper
> state prior to returning the error.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index ed977b6f7ab6..ad3459a3bc5e 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1712,6 +1712,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  			i2c_dev->msg->addr);
>  		if (i2c_dev->use_dma)
>  			dmaengine_terminate_all(dma->chan_using);
> +		stm32f7_i2c_wait_free_bus(i2c_dev);
>  		ret = -ETIMEDOUT;
>  	}
>  
> @@ -1769,6 +1770,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
>  		if (i2c_dev->use_dma)
>  			dmaengine_terminate_all(dma->chan_using);
> +		stm32f7_i2c_wait_free_bus(i2c_dev);
>  		ret = -ETIMEDOUT;
>  		goto pm_free;
>  	}
> 

-- 
--
~ Py MORDRET
--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
