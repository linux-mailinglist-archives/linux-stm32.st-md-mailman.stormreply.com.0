Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD038781E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 13:54:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FEEDC5978A;
	Tue, 18 May 2021 11:54:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0376FC59785
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 11:54:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IBqpAw008916; Tue, 18 May 2021 13:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Id8V+VmnM7brmaxa/q+zvAhp1/pxcDklhF17NerD2JM=;
 b=Nwrg7d5vLZCdXsjz20CwSGR6VLC2plCOGIBh6S0w/WLLEU7vNCWO9Xm0MqAyi2xyb5PJ
 MsP6qQkm83/yzX9iA2OD67IgGa5CMTiWRSqT1M7VBrybMAi/50ibv2b/UrV+JmXbwlvN
 teDVB13vW46GVsm7WjLkFxp9lGVa320IzyMVKzj/Z65xLx3RE2lBLNNR1cjIqKUvmJbJ
 UHLVZE0g9gUhbr1gSk3kIh6hxf5SHDWnF3/m4Lpm9H1RRMxo4gR5UaXWnymbxr6MlHCM
 lHnMaqeXm11tQOIRpNYolIYCdBHSq8PbxTISm8sc4wDHutcUKal1STtjk+ow+qEuwqvu oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38km7pqct9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 13:54:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0FAD100034;
 Tue, 18 May 2021 13:54:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD0002237BB;
 Tue, 18 May 2021 13:54:27 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 13:54:26 +0200
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
 <20210518093951.23136-2-patrice.chotard@foss.st.com>
 <20210518134037.0e5839b0@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <865b01c8-12ff-cce6-557f-178effbc39a4@foss.st.com>
Date: Tue, 18 May 2021 13:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518134037.0e5839b0@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] spi: spi-mem: add automatic poll
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



On 5/18/21 1:40 PM, Boris Brezillon wrote:
> On Tue, 18 May 2021 11:39:49 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
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
>> +	if (op->data.nbytes < 1 || op->data.nbytes > 2)
>> +		return -EINVAL;
> 
> We should also make sure this is a read operation.

Ok , i will add a check here

Thanks
Patrice
> 
>> +
>> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
>> +		ret = spi_mem_access_start(mem);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
>> +						 initial_delay_us, polling_delay_us,
>> +						 timeout_ms);
>> +
>> +		spi_mem_access_end(mem);
>> +	}
>> +
>> +	if (ret == -EOPNOTSUPP) {
>> +		if (!spi_mem_supports_op(mem, op))
>> +			return ret;
>> +
>> +		if (initial_delay_us < 10)
>> +			udelay(initial_delay_us);
>> +		else
>> +			usleep_range((initial_delay_us >> 2) + 1,
>> +				     initial_delay_us);
>> +
>> +		ret = read_poll_timeout(spi_mem_read_status, read_status_ret,
>> +					(read_status_ret || ((status) & mask) == match),
>> +					polling_delay_us, timeout_ms * 1000, false, mem,
>> +					op, &status);
>> +		if (read_status_ret)
>> +			return read_status_ret;
>> +	}
>> +
>> +	return ret;
>> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
