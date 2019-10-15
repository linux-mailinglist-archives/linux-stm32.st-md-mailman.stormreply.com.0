Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7ED7656
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 14:20:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B50DC36B0B;
	Tue, 15 Oct 2019 12:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2A48C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 12:19:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9FCFfur020735; Tue, 15 Oct 2019 14:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GY+Z3B65hMOM3krVOFPaOVbaCL0W6CEn6gdWPrTcNGY=;
 b=wT13RZFHBJiJAsVW+eHMLBZ6iLAGOs6M+M4pgUjoeqkgh8IlFUkFEhN69cRJE5JGkSjK
 HmIBFufIHqjRhS7mpBUurahLVCtQ0gckdXJ4f3qdt8lhi+5N0v1EpzS3DjRadMIsBtKi
 urA2v46AjAzThSd1rgeWf8cfdSyGoBMyZnFMp1SOFwC6olJqR7N/cpUfzcXSte5uHtfo
 qR5PZMQd3Y5d04ZG7CWYE426JgN3q3b6Cee/2ngxzdRW8L/wgy5Z4wMAcztuQinSM2Zj
 ehL/rjetibrsYZoARIEHI3GWf74zMoAQeHpj6M04GUn7Au00aBcb/FzsSHeanYEcGDzx BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kx02w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2019 14:19:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BC22100034;
 Tue, 15 Oct 2019 14:19:49 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E528E2C7936;
 Tue, 15 Oct 2019 14:19:49 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 14:19:49 +0200
Received: from [10.48.0.192] (10.48.0.192) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 15 Oct 2019 14:19:49 +0200
To: <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
References: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <fec77eaa-0d6c-73c1-2e06-9d55dfa0f426@st.com>
Date: Tue, 15 Oct 2019 14:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_05:2019-10-15,2019-10-15 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix first byte to send
	in slave mode
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

On 9/30/19 5:28 PM, Fabrice Gasnier wrote:
> The slave-interface documentation [1] states "the bus driver should
> transmit the first byte" upon I2C_SLAVE_READ_REQUESTED slave event:
> - 'val': backend returns first byte to be sent
> The driver currently ignores the 1st byte to send on this event.
> 
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> 
> [1] https://www.kernel.org/doc/Documentation/i2c/slave-interface
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---

Hi Wolfram, all,

Gentle reminder on this patch.

Thanks in advance !
Best Regards,
Fabrice

>  drivers/i2c/busses/i2c-stm32f7.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 266d1c2..0af9219 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1192,6 +1192,8 @@ static void stm32f7_i2c_slave_start(struct stm32f7_i2c_dev *i2c_dev)
>  			STM32F7_I2C_CR1_TXIE;
>  		stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, mask);
>  
> +		/* Write 1st data byte */
> +		writel_relaxed(value, base + STM32F7_I2C_TXDR);
>  	} else {
>  		/* Notify i2c slave that new write transfer is starting */
>  		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
