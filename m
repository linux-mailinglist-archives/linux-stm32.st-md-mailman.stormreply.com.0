Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAEC3420
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 14:21:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 331A2C36B0B;
	Tue,  1 Oct 2019 12:21:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CBA4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 12:21:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x91CB7xo015582; Tue, 1 Oct 2019 14:21:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=tvexJDp1NN/llsuNXSSQPqtCEvUEQbZ/KwTA58G95MM=;
 b=v9Fe1geBnD6K0l1sI3luj4DJvxLLqPKPdaFOfsxRZOeeGKJxA0fMMcpK+qH/PmXs84V6
 gjGDI77UandspB5v5RGn7WqinW8tvrZRIhG3ZcF3rWUk4Bxn4b2S6oDV5fsJjB2hd4Ap
 KME0saXzMG7Ku9jwo49puaNhXOHqoMnyGiVzqbszIeMB8abAphOLiJ18h7H1el37MGd2
 96qsfAG0UB+wvtT1d8LuS9hlMEMKfWau1T45B5eiq9Bsc3wTZlDaviMB8MZ3NG0y1TeO
 ugXIdo05KCXvOMsqBZHtpoldskyjYfiWrUubRhzeh2xLfNp+zrL5d7HDby6/kRHHD6sI 9Q== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w010upc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:21:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B72B54B;
 Tue,  1 Oct 2019 12:21:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F8D72BEC6E;
 Tue,  1 Oct 2019 14:21:18 +0200 (CEST)
Received: from [10.48.1.171] (10.75.127.49) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 14:21:17 +0200
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <wsa@the-dreams.de>
References: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <e30de80a-6ecd-a2a6-8742-8dcdd1c3253c@st.com>
Date: Tue, 1 Oct 2019 14:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_06:2019-10-01,2019-10-01 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix a race in slave
 mode with arbitration loss irq
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

Hi

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx

On 10/1/19 10:51 AM, Fabrice Gasnier wrote:
> When in slave mode, an arbitration loss (ARLO) may be detected before the
> slave had a chance to detect the stop condition (STOPF in ISR).
> This is seen when two master + slave adapters switch their roles. It
> provokes the i2c bus to be stuck, busy as SCL line is stretched.
> - the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
>   don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
>   remains set until next master xfer (e.g. when STOPIE irq get unmasked).
>   In this case, completion is generated too early: immediately upon new
>   transfer request (then it doesn't send all data).
> - Some data get stuck in TXDR register. As a consequence, the controller
>   stretches the SCL line: the bus gets busy until a future master transfer
>   triggers the bus busy / recovery mechanism (this can take time... and
>   may never happen at all)
> 
> So choice is to let the STOPF being detected by the slave isr handler,
> to properly handle this stop condition. E.g. don't mask IRQs in error
> handler, when the slave is running.
> 
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 266d1c2..3a8ab0c 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1501,7 +1501,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  	void __iomem *base = i2c_dev->base;
>  	struct device *dev = i2c_dev->dev;
>  	struct stm32_i2c_dma *dma = i2c_dev->dma;
> -	u32 mask, status;
> +	u32 status;
>  
>  	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
>  
> @@ -1526,12 +1526,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  		f7_msg->result = -EINVAL;
>  	}
>  
> -	/* Disable interrupts */
> -	if (stm32f7_i2c_is_slave_registered(i2c_dev))
> -		mask = STM32F7_I2C_XFER_IRQ_MASK;
> -	else
> -		mask = STM32F7_I2C_ALL_IRQ_MASK;
> -	stm32f7_i2c_disable_irq(i2c_dev, mask);
> +	if (!i2c_dev->slave_running) {
> +		u32 mask;
> +		/* Disable interrupts */
> +		if (stm32f7_i2c_is_slave_registered(i2c_dev))
> +			mask = STM32F7_I2C_XFER_IRQ_MASK;
> +		else
> +			mask = STM32F7_I2C_ALL_IRQ_MASK;
> +		stm32f7_i2c_disable_irq(i2c_dev, mask);
> +	}
>  
>  	/* Disable dma */
>  	if (i2c_dev->use_dma) {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
