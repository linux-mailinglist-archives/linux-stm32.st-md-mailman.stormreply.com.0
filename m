Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77682A9641
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 13:38:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9619FC3FAD4;
	Fri,  6 Nov 2020 12:38:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E899C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 12:38:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6CWDh1007442; Fri, 6 Nov 2020 13:38:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Z2IyiKmIdicBN1fS/q2Z1fS62XG35jrjOsFuxs54I0o=;
 b=KLmJpoxPKuwbCXb/jWwp0MjXtK9N99qcuSHc/Fz9yTgk7wJnSIfSX7P5bPZRHgilvGzV
 7uvpmLed7PvFiqADSLZvESBJMKZTyJwYD29L9a05NH2nWiun84wFH6/9iXlKiKLJXaiz
 vgYJmWMsHgeNpKyiQpsWsxioFUuDEZqv3abE9AyKsjzctWnOs9+9g8fykI5Z6i4MXDKM
 haiguUJXXT/o8n7wyDdX/FvneEqz8CES9RlSYcHGR39tQvfp9xIc2IHlZAszOk7KqPtc
 WFfzJhdlxty06XQVgxAOX+cawbaXvQXCOwkZV5iHGh28syQ05aiAal//SqvfPX+8GDUc Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywre8gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 13:38:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62E6610002A;
 Fri,  6 Nov 2020 13:38:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5374724B1EE;
 Fri,  6 Nov 2020 13:38:17 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 13:38:16 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Fri, 6 Nov 2020 13:38:16 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [Linux-stm32] [PATCH] spi: stm32-qspi: fix reference leak in
 stm32 qspi operations
Thread-Index: AQHWtDmz6MKUU4gkmEa+zPydz6wV2w==
Date: Fri, 6 Nov 2020 12:38:16 +0000
Message-ID: <76ebfa03-59d0-ed49-fa9b-87d9dd9f21f7@st.com>
References: <20201106015357.141235-1-zhangqilong3@huawei.com>
In-Reply-To: <20201106015357.141235-1-zhangqilong3@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <C7EA6F945EEFDC439A295C979EE767E4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_04:2020-11-05,
 2020-11-06 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: fix reference leak in
 stm32 qspi operations
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

Hi Zhang

On 11/6/20 2:53 AM, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to pm_runtime_put_noidle will result in
> reference leak in two callers(stm32_qspi_exec_op and
> stm32_qspi_setup), so we should fix it.
>
> Fixes: 9d282c17b023a ("spi: stm32-qspi: Add pm_runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/spi/spi-stm32-qspi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index a900962b4336..947e6b9dc9f4 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -434,8 +434,10 @@ static int stm32_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(qspi->dev);
>  		return ret;
> +	}
>  
>  	mutex_lock(&qspi->lock);
>  	ret = stm32_qspi_send(mem, op);
> @@ -462,8 +464,10 @@ static int stm32_qspi_setup(struct spi_device *spi)
>  		return -EINVAL;
>  
>  	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(qspi->dev);
>  		return ret;
> +	}
>  
>  	presc = DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
