Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B44FD356
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 11:33:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 526ECC60495;
	Tue, 12 Apr 2022 09:33:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E607EC5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 09:33:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23C7gt62028744;
 Tue, 12 Apr 2022 11:32:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UICnyf3oPsQTzRC0I9H7zVlnLQiOcv6ykqLEagOPP+A=;
 b=IZiYzbQebMHtNJebYRpmBh7Lqy92kJ9sBKCGLq14bPG5DvZMzlvjveRPSsU/fG8nFkZc
 d7L+1c5QT0rmaKfaygh6U3kvSXCAm2v8IxvHHnXgIMxkt+03qgjPomdHlCyq9vhxHMUQ
 TYbBnYgDgnja+vR7iGrAVCMwaYCKnEC0b0/S2uP76yfzcYWdeNlsCkO7v7PhVPbQEVSP
 cnVRGjd3hOfOyY59a3X7inTOlAz/lsdR0LRsbEPxvnKKjmYZO0JCg8oVGdj0RIapw7Tx
 u8uJpNiaBIOLA8CMZzlU3E58cl+T1Yl98ZwOJgrGZK6M0b5KOj23WKUy8wUz2VU/XQ+J qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74y6cgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 11:32:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4773100038;
 Tue, 12 Apr 2022 11:32:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC121216833;
 Tue, 12 Apr 2022 11:32:55 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 12 Apr
 2022 11:32:54 +0200
Message-ID: <8daae353-911c-3102-756f-1f0448704355@foss.st.com>
Date: Tue, 12 Apr 2022 11:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: <cgel.zte@gmail.com>, <broonie@kernel.org>
References: <20220412070906.2532091-1-chi.minghao@zte.com.cn>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220412070906.2532091-1-chi.minghao@zte.com.cn>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-12_03,2022-04-11_01,2022-02-23_01
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: spi-stm32-qspi: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

On 4/12/22 09:09, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/spi/spi-stm32-qspi.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index ffdc55f87e82..b3586521d08e 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -463,11 +463,9 @@ static int stm32_qspi_poll_status(struct spi_mem *mem, const struct spi_mem_op *
>  	if (!spi_mem_supports_op(mem, op))
>  		return -EOPNOTSUPP;
>  
> -	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(qspi->dev);
> +	ret = pm_runtime_resume_and_get(qspi->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	mutex_lock(&qspi->lock);
>  
> @@ -490,11 +488,9 @@ static int stm32_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(qspi->dev);
> +	ret = pm_runtime_resume_and_get(qspi->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	mutex_lock(&qspi->lock);
>  	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes)
> @@ -536,11 +532,9 @@ static ssize_t stm32_qspi_dirmap_read(struct spi_mem_dirmap_desc *desc,
>  	u32 addr_max;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(qspi->dev);
> +	ret = pm_runtime_resume_and_get(qspi->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	mutex_lock(&qspi->lock);
>  	/* make a local copy of desc op_tmpl and complete dirmap rdesc
> @@ -583,11 +577,9 @@ static int stm32_qspi_setup(struct spi_device *spi)
>  	if (!spi->max_speed_hz)
>  		return -EINVAL;
>  
> -	ret = pm_runtime_get_sync(qspi->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(qspi->dev);
> +	ret = pm_runtime_resume_and_get(qspi->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	presc = DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
>  
> @@ -851,11 +843,9 @@ static int __maybe_unused stm32_qspi_resume(struct device *dev)
>  
>  	pinctrl_pm_select_default_state(dev);
>  
> -	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	writel_relaxed(qspi->cr_reg, qspi->io_base + QSPI_CR);
>  	writel_relaxed(qspi->dcr_reg, qspi->io_base + QSPI_DCR);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
