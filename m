Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0EC2DCB
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 09:10:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BA72C36B0B;
	Tue,  1 Oct 2019 07:10:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A200C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 07:10:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x917AX0Y016964; Tue, 1 Oct 2019 09:10:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=pOPCPe7TD98TjMLQMWtDzzXnRWgJwMhoU21tYTK3+oE=;
 b=nCPPdoIAWmY+E3PbFphqiQxVifYVDuBTXtC5iPxIU5allVbyAEFfITnniTgis2ajDjkc
 LcD3ftoHW4m2CBJlLzotb3awNS3nZ/WHGSzkwFw868CNfwA9SoJ+dZQ4b/RZ7iGkC/zs
 AsS2SPxHV2W5PqwRXi/xY0g9y4UHKP4AKNn5i2ScXSB9LKX3yDPrnwJCrMjQdB6WZ3nq
 UYf6wy9yoSsMnZ1Jbro6OL0vgMZeLMkBmiEpf6GwtisJm1RJsl5GNa20w/nqI57K4rdV
 4jFReLcBKpWmfWE3JqZxoMsxQmHgq1ChJESJyrcMyMva1cEZAAdmBQfqIZhKfApNhG2P dg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdgq2kw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 01 Oct 2019 09:10:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4334F4C;
 Tue,  1 Oct 2019 07:10:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 596492AB7C3;
 Tue,  1 Oct 2019 09:10:15 +0200 (CEST)
Received: from [10.48.1.171] (10.75.127.44) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 09:10:14 +0200
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <wsa@the-dreams.de>
References: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <144ffb23-a56e-c60f-8c50-802921755835@st.com>
Date: Tue, 1 Oct 2019 09:10:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_03:2019-09-30,2019-10-01 signatures=0
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

Hi,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx

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
