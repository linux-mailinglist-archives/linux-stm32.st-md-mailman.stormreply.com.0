Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B744D48C532
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 14:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 651FEC5F1F4;
	Wed, 12 Jan 2022 13:54:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2307BC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 13:54:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CAbtYb018364;
 Wed, 12 Jan 2022 14:54:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sdH0K0eSe3S08hG8n1xmryhD86m71VUW2ZVs/ElIu9U=;
 b=wnGc49ldGz4lYlfm1lDeBhRGNoC7duO7H+5A3eUCocSE0ZqXhXf3wdcDs/xlUVm+fEYc
 pgW5+z18yO1VR6NQFXKp70LEkwBofu+JxMTT4kaCB6TeSTeN5WObQNyj4b2NwduFWjNb
 jn3Ti8EK1AItDmLdX5sLfcAQUf6+qYz3jhJcceSsmvbfubyJZ4sEFiOTagVC7gSTy1+I
 7fec/xjY6JVsnNmZhQ/FhTpdhj5rE5r77FlyCOPFHHfYqpk6cTNqqVXx28Tq1YcJ9Cds
 x77boKCBbYBEkD/CjgGVIcSaz/IrVts5BFTu0kRoXn4X/kPuNxhn94467Hi6/aPGZqjx EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhssdtpuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 14:54:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0E7C10002A;
 Wed, 12 Jan 2022 14:54:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E42EF235F1B;
 Wed, 12 Jan 2022 14:54:09 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan
 2022 14:54:09 +0100
To: Lukas Wunner <lukas@wunner.de>
References: <20220106132052.7227-1-patrice.chotard@foss.st.com>
 <20220108194819.GA5467@wunner.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ba5de6f6-a4f0-4974-cc68-abcb62ebf96e@foss.st.com>
Date: Wed, 12 Jan 2022 14:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108194819.GA5467@wunner.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Update spi registering
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

Hi Lukas

On 1/8/22 8:48 PM, Lukas Wunner wrote:
> On Thu, Jan 06, 2022 at 02:20:52PM +0100, patrice.chotard@foss.st.com wrote:
>> --- a/drivers/spi/spi-stm32-qspi.c
>> +++ b/drivers/spi/spi-stm32-qspi.c
>> @@ -784,7 +784,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>>  	pm_runtime_enable(dev);
>>  	pm_runtime_get_noresume(dev);
>>  
>> -	ret = devm_spi_register_master(dev, ctrl);
>> +	ret = spi_register_master(ctrl);
>>  	if (ret)
>>  		goto err_pm_runtime_free;
>>  
>> @@ -817,6 +817,7 @@ static int stm32_qspi_remove(struct platform_device *pdev)
>>  	struct stm32_qspi *qspi = platform_get_drvdata(pdev);
>>  
>>  	pm_runtime_get_sync(qspi->dev);
>> +	spi_unregister_master(qspi->ctrl);
>>  	/* disable qspi */
>>  	writel_relaxed(0, qspi->io_base + QSPI_CR);
>>  	stm32_qspi_dma_free(qspi);
> 
> NAK, this introduces a use-after-free because the "qspi" allocation
> is freed by spi_unregister_master(), yet is subsequently accessed.
> 
> You need to convert the driver to devm_spi_alloc_master() to avoid that.
> Do it in the same patch to ease backporting.

Ok i see, spi_unregister_controller() is releasing the controller if it wasn't
 previously devm allocated. I will make usage of devm_spi_alloc_master as you suggested.

> 
> Please add a stable designation and a Fixes: tag.  Chances are the patch
> needs to be backported all the way back to the release when the driver
> was first introduced.
> 
> Thanks,
> 
> Lukas
> 
Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
