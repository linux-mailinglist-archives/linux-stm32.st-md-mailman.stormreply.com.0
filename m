Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75A4902FA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 08:38:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CE69C5C83D;
	Mon, 17 Jan 2022 07:38:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1774EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 07:38:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GMK1XY032410;
 Mon, 17 Jan 2022 08:37:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/SNGdY3EQVSNuahotUyAeXgj55tr+Btw2r79mHMIAqs=;
 b=1n5+bzmuzkeFRtr/AHIYVezYaItONZpCk3sXbbJCAqqNMboi4El2Yq7X3PgS7AvNb3GU
 k2yOQ0w8dA1DCssdFBIxlxf0Vip4mftOdyOk5oN1h7kgZcYetaQstLa4Lmo8/+fMnUqf
 b6m1s8ceQzS9FaJBKYAxHKi7sTlznjkf6B+WCLSeRLN6vdn6vWmRIM+MJnIR+Mum5V9D
 m88IEaHa7IWtRCfykPkaP4w9Y20uB4G2ZkTtUQrxgXH/Y0333WuSh0VaNLODQzQ/gmgN
 uUrJWkBg9wtlR85nLKM0bg0abvthzetMYcs+hwU6G3nHcpuKWhJ7Y5xy7waEya6yAPDQ Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmq5g2vph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:37:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FED7100034;
 Mon, 17 Jan 2022 08:37:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E0B820DD0E;
 Mon, 17 Jan 2022 08:37:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan
 2022 08:37:45 +0100
To: Lukas Wunner <lukas@wunner.de>
References: <20220112144424.5278-1-patrice.chotard@foss.st.com>
 <20220116125205.GA18267@wunner.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b07ba47f-2709-6b10-2332-7a0d163401bc@foss.st.com>
Date: Mon, 17 Jan 2022 08:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220116125205.GA18267@wunner.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32-qspi: Update spi registering
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

On 1/16/22 1:52 PM, Lukas Wunner wrote:
> On Wed, Jan 12, 2022 at 03:44:24PM +0100, patrice.chotard@foss.st.com wrote:
>> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
>> index 514337c86d2c..09839a3dbb26 100644
>> --- a/drivers/spi/spi-stm32-qspi.c
>> +++ b/drivers/spi/spi-stm32-qspi.c
>> @@ -688,7 +688,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>>  	struct resource *res;
>>  	int ret, irq;
>>  
>> -	ctrl = spi_alloc_master(dev, sizeof(*qspi));
>> +	ctrl = devm_spi_alloc_master(dev, sizeof(*qspi));
>>  	if (!ctrl)
>>  		return -ENOMEM;
>>  
>> @@ -784,7 +784,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>>  	pm_runtime_enable(dev);
>>  	pm_runtime_get_noresume(dev);
>>  
>> -	ret = devm_spi_register_master(dev, ctrl);
>> +	ret = spi_register_master(ctrl);
>>  	if (ret)
>>  		goto err_pm_runtime_free;
>>
> 
> Unfortunately this patch is still not correct:  It introduces a
> double free in the probe error path.

Argh yes, my bad.

> 
> You need to remove this...
> 
> err_master_put:
> 	spi_master_put(qspi->ctrl);
> 
> ...and replace all the gotos in stm32_qspi_probe() which jump
> to the err_master_put label with a return statement.
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
