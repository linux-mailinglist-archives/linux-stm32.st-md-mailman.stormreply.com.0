Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F6387B30
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 16:34:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 360AEC57B75;
	Tue, 18 May 2021 14:34:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27D7FC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 14:34:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IEWvv8024676; Tue, 18 May 2021 16:34:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0ysXNCjViRBs+X6pa9tx/xLQTyPxEd0Td3yCcZ+fcJs=;
 b=denCPV9G4YtpdzHa7L2aDXfUUZKUyNQOCf4izEGtXvSd7jCK/mwhWz9ALqSm5ig+3Hn0
 nv1dL+yzWp/09NIuNFhL00+6s4sZDPcFsKSgSyHgrMeH6i/dc4wgQ9TlTsXdSWpjqh6o
 R6aE8C0EI7IaE/sYOeLGmvjjmDpYaiHbSX4EWKHHARcAdeblvE3wCqmTvID7dg3FAa8e
 R+r1AWpxLaI6y6r9m5Qoo0KgRiNSAsLBhjbSAv4GllFzY8epG4FMsn/h+BYP5hC7bsa/
 l5MmWqq0Lx+fsr2e3t9EE3jg+x2g2Wi5RWMrz+lWkQb77YM9acf79c08JrGifzv62USN 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsskt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 16:34:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABA6D10003D;
 Tue, 18 May 2021 16:34:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94DB922AECC;
 Tue, 18 May 2021 16:34:00 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 16:33:59 +0200
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210518134332.17826-1-patrice.chotard@foss.st.com>
 <20210518134332.17826-2-patrice.chotard@foss.st.com>
 <20210518161252.3e4f2999@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <57780f3e-b31c-7240-0ad8-063c3c6e9a43@foss.st.com>
Date: Tue, 18 May 2021 16:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518161252.3e4f2999@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_07:2021-05-18,
 2021-05-18 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/3] spi: spi-mem: add automatic poll
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



On 5/18/21 4:12 PM, Boris Brezillon wrote:
> On Tue, 18 May 2021 15:43:30 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> With STM32 QSPI, it is possible to poll the status register of the device.
>> This could be done to offload the CPU during an operation (erase or
>> program a SPI NAND for example).
>>
>> spi_mem_poll_status API has been added to handle this feature.
>> This new function take care of the offload/non-offload cases.
>>
>> For the non-offload case, use read_poll_timeout() to poll the status in
>> order to release CPU during this phase.
>> For example, previously, when erasing large area, in non-offload case,
>> CPU load can reach ~50%, now it decrease to ~35%.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>> Changes in v4:
>>   - Remove init_completion() from spi_mem_probe() added in v2.
>>   - Add missing static for spi_mem_read_status().
>>   - Check if operation in spi_mem_poll_status() is a READ.
>>
>> Changes in v3:
>>   - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
>>   - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status()
>>     and also to poll_status() callback.
>>   - Move spi_mem_supports_op() in SW-based polling case.
>>   - Add delay before invoking read_poll_timeout().
>>   - Remove the reinit/wait_for_completion() added in v2.
>>
>> Changes in v2:
>>   - Indicates the spi_mem_poll_status() timeout unit
>>   - Use 2-byte wide status register
>>   - Add spi_mem_supports_op() call in spi_mem_poll_status()
>>   - Add completion management in spi_mem_poll_status()
>>   - Add offload/non-offload case management in spi_mem_poll_status()
>>   - Optimize the non-offload case by using read_poll_timeout()
>>
>>  drivers/spi/spi-mem.c       | 85 +++++++++++++++++++++++++++++++++++++
>>  include/linux/spi/spi-mem.h | 14 ++++++
>>  2 files changed, 99 insertions(+)
>>
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index 1513553e4080..97c7a83686c7 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -6,6 +6,7 @@
>>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>>   */
>>  #include <linux/dmaengine.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/spi/spi.h>
>>  #include <linux/spi/spi-mem.h>
>> @@ -743,6 +744,90 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
>>  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
>>  }
>>  
>> +static int spi_mem_read_status(struct spi_mem *mem,
>> +			       const struct spi_mem_op *op,
>> +			       u16 *status)
>> +{
>> +	const u8 *bytes = (u8 *)op->data.buf.in;
>> +	int ret;
>> +
>> +	ret = spi_mem_exec_op(mem, op);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (op->data.nbytes > 1)
>> +		*status = ((u16)bytes[0] << 8) | bytes[1];
>> +	else
>> +		*status = bytes[0];
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * spi_mem_poll_status() - Poll memory device status
>> + * @mem: SPI memory device
>> + * @op: the memory operation to execute
>> + * @mask: status bitmask to ckeck
>> + * @match: (status & mask) expected value
>> + * @initial_delay_us: delay in us before starting to poll
>> + * @polling_delay_us: time to sleep between reads in us
>> + * @timeout_ms: timeout in milliseconds
>> + *
>> + * This function send a polling status request to the controller driver
> 
> "
> This function polls a status register and returns when
> (status & mask) == match or when the timeout has expired.
> "

Ok i will update spi_mem_poll_status description

> 
>> + *
>> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
>> + *         -EOPNOTSUPP if not supported.
>> + */
>> +int spi_mem_poll_status(struct spi_mem *mem,
>> +			const struct spi_mem_op *op,
>> +			u16 mask, u16 match,
>> +			unsigned long initial_delay_us,
>> +			unsigned long polling_delay_us,
>> +			u16 timeout_ms)
>> +{
>> +	struct spi_controller *ctlr = mem->spi->controller;
>> +	int ret = -EOPNOTSUPP;
>> +	int read_status_ret;
>> +	u16 status;
>> +
>> +	if (op->data.nbytes < 1 || op->data.nbytes > 2 ||
>> +	    op->data.dir != SPI_MEM_DATA_IN)
>> +		return (-EINVAL);
> 
> s/return (-EINVAL);/return -EINVAL;/

Ok

> 
> 
> [...]
> 
>>  /**
>> @@ -369,6 +376,13 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
>>  void devm_spi_mem_dirmap_destroy(struct device *dev,
>>  				 struct spi_mem_dirmap_desc *desc);
>>  
>> +int spi_mem_poll_status(struct spi_mem *mem,
>> +			const struct spi_mem_op *op,
>> +			u16 mask, u16 match,
>> +			unsigned long initial_delay_us,
>> +			unsigned long polling_delay_us,
>> +			u16 timeout);
> 
> s/timeout/timeout_ms/.

Ok 

> 
> With those minor things fixed
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks
Patrice


> 
>> +
>>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>>  				       struct module *owner);
>>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
