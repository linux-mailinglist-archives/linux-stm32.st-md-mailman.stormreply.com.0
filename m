Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C45BF387CCC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 17:49:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E2D2C57B75;
	Tue, 18 May 2021 15:49:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78772C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 15:48:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IFdFL9004337; Tue, 18 May 2021 17:48:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x8rk4SF8kUA9lhdRyqORx0Hd48/7Wmd859uaIYQogP8=;
 b=kv4K43tO4C1zplxFDnyeWJau3vyR+Z596aA0Q7/dnzf8URn32MUzKeBxueu7VK+Kj2gM
 VCbYRSJMEa27L58x/BifhZmKeQC5v7kSpNwuxi+VvaxbUsArah1PtynF74fSlyI+2NqC
 E+dufxOxh1Ywwd8DT8D+utAvmUECxCdtFfJ0nfASR34hEmU2C1SKi89vb+vapSYN7LEv
 dLMZZUDbW4k+sM7BfGSj18NFdDPFC+WxvLr6Rrf/WaICczsfvmogOciJAi5FncHJ6k2u
 3wWtbru2Jq6X+j/y0MR7+82odg+1rRWkg//WySUFID1G4055o/0M4miblz3vTl3LUore dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunt66k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 17:48:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A90C10002A;
 Tue, 18 May 2021 17:48:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3508F231DCF;
 Tue, 18 May 2021 17:48:49 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 17:48:48 +0200
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210518134332.17826-1-patrice.chotard@foss.st.com>
 <20210518134332.17826-4-patrice.chotard@foss.st.com>
 <20210518163707.0e6bd120@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e0abdaf9-0f30-91a3-7cd4-c0e4140d6aa4@foss.st.com>
Date: Tue, 18 May 2021 17:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518163707.0e6bd120@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_08:2021-05-18,
 2021-05-18 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/3] spi: stm32-qspi: add automatic
	poll status feature
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



On 5/18/21 4:37 PM, Boris Brezillon wrote:
> On Tue, 18 May 2021 15:43:32 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
>> +static int stm32_qspi_poll_status(struct spi_mem *mem, const struct spi_mem_op *op,
>> +				  u16 mask, u16 match,
>> +				  unsigned long initial_delay_us,
>> +				  unsigned long polling_rate_us,
>> +				  unsigned long timeout_ms)
>> +{
>> +	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>> +	int ret;
>> +
> 
> The spi_mem_supports_op() call is still missing.

Yes, i forgot it

Thanks
Patrice

> 
>> +	ret = pm_runtime_get_sync(qspi->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(qspi->dev);
>> +		return ret;
>> +	}
>> +
>> +	mutex_lock(&qspi->lock);
>> +
>> +	writel_relaxed(mask, qspi->io_base + QSPI_PSMKR);
>> +	writel_relaxed(match, qspi->io_base + QSPI_PSMAR);
>> +	qspi->fmode = CCR_FMODE_APM;
>> +	qspi->status_timeout = timeout_ms;
>> +
>> +	ret = stm32_qspi_send(mem, op);
>> +	mutex_unlock(&qspi->lock);
>> +
>> +	pm_runtime_mark_last_busy(qspi->dev);
>> +	pm_runtime_put_autosuspend(qspi->dev);
>> +
>> +	return ret;
>> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
