Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77739301D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 15:50:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B41FC5718D;
	Thu, 27 May 2021 13:50:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05AD7C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 13:50:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RDgLGR013480; Thu, 27 May 2021 15:50:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Vvo4lmC0J+8Th7Lx+/tE/cI6WkohGoJEOy5+1hxoZ54=;
 b=2w7kU1wz6fEl5jbBTPmB5FhF0/iaP7K3N3mjGQ+m7HOIXNR0T1nhW6ytDEcYIdY9E5Bk
 ijMaU/XmQggmuR86nlIqgorOKd9tn1lKGvnRe1m1xENWs2DRbTrBfFyhpvdQ7KjpHKOh
 nodb//LT0fuTYVNz5RxGE3lIgLH3TsysHJOjWT8nBj52AOKNZeEuUIlkNtTseVUBp6q9
 4POBk4pmR+xb6CXkcZk9ylgLCNj43XaFPQiI7j04WBFYdVKkxgA8mBmzcpPjNUt8Pt2y
 11jbwWynch5DHZa08VDD4fHY0k15AKIRY9mRmvHLUJU/zsLEp0/E+V5sbbLS8tIMBufE uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr49qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 15:50:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4473100034;
 Thu, 27 May 2021 15:50:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A73EA228134;
 Thu, 27 May 2021 15:50:25 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 15:50:24 +0200
To: Pratyush Yadav <p.yadav@ti.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210527100015.abxcroi23zyvcyzk@ti.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <3baf8f02-f290-91d1-af56-62181651c61a@foss.st.com>
Date: Thu, 27 May 2021 15:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527100015.abxcroi23zyvcyzk@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_06:2021-05-26,
 2021-05-27 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] mtd: spinand: add spi nand mtd resume handler
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

Hi Pratyush

On 5/27/21 12:00 PM, Pratyush Yadav wrote:
> On 26/05/21 05:30PM, patrice.chotard@foss.st.com wrote:
>> From: Christophe Kerello <christophe.kerello@foss.st.com>
>>
>> After power up, all SPI NAND's blocks are locked. Only read operations
>> are allowed, write and erase operations are forbidden.
>> The SPI NAND framework unlocks all the blocks during its initialization.
>>
>> During a standby low power, the memory is powered down, losing its
>> configuration.
>> During the resume, the QSPI driver state is restored but the SPI NAND
>> framework does not reconfigured the memory.
>>
>> This patch adds spi nand mtd PM handlers for resume ops.
>> SPI NAND resume op re-initializes SPI NAND flash to its probed state.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  drivers/mtd/nand/spi/core.c | 56 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
>> index 17f63f95f4a2..6abaf874eb3f 100644
>> --- a/drivers/mtd/nand/spi/core.c
>> +++ b/drivers/mtd/nand/spi/core.c
>> @@ -1074,6 +1074,61 @@ static int spinand_detect(struct spinand_device *spinand)
>>  	return 0;
>>  }
>>  
>> +static void spinand_mtd_resume(struct mtd_info *mtd)
>> +{
>> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
>> +	struct nand_device *nand = mtd_to_nanddev(mtd);
>> +	struct device *dev = &spinand->spimem->spi->dev;
>> +	int ret, i;
>> +
>> +	ret = spinand_reset_op(spinand);
>> +	if (ret)
>> +		return;
>> +
>> +	ret = spinand_init_quad_enable(spinand);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to initialize the quad part (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to updtae the OTP (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
> 
> Since you have reset the flash, this cache is invalid. You should reset 
> the cache and re-populate it before using it in any way.

I got your point, i will take it in account in v3 (v2 has already been send but need rework)

> 
>> +
>> +	ret = spinand_manufacturer_init(spinand);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to initialize the SPI NAND chip (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	/* After power up, all blocks are locked, so unlock them here. */
>> +	for (i = 0; i < nand->memorg.ntargets; i++) {
>> +		ret = spinand_select_target(spinand, i);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to select the target (err = %d)\n",
>> +				ret);
>> +			return;
>> +		}
>> +
>> +		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to unlock block (err = %d)\n",
>> +				ret);
>> +			return;
>> +		}
>> +	}
>> +}
>> +
> 
> Most of these seem to be copied from spinand_init(). I think it is 
> better to create a common function that can be called from both 
> spinand_init() and spinand_mtd_resume(). This way when someone adds 
> something new to the init procedure, like support for some other modes, 
> they won't have to remember to update it in two places.

Agree, it was already part of the v2

> 
>>  static int spinand_init(struct spinand_device *spinand)
>>  {
>>  	struct device *dev = &spinand->spimem->spi->dev;
>> @@ -1167,6 +1222,7 @@ static int spinand_init(struct spinand_device *spinand)
>>  	mtd->_block_isreserved = spinand_mtd_block_isreserved;
>>  	mtd->_erase = spinand_mtd_erase;
>>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
>> +	mtd->_resume = spinand_mtd_resume;
> 
> Is it possible that the userspace can use this mtd device before the 
> resume is finished? Is there a way to temporarily "pause" or unregister 
> an mtd device?

Honestly, i don't know.

Thanks
Patrice

> 
>>  
>>  	if (nand->ecc.engine) {
>>  		ret = mtd_ooblayout_count_freebytes(mtd);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
