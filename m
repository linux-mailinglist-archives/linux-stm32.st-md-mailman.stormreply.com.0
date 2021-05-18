Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C271338781A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 13:53:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77A68C5978A;
	Tue, 18 May 2021 11:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0093BC59785
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 11:53:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IBq3mn019842; Tue, 18 May 2021 13:53:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rnQepYFJcyJCE9twPAkTY2JUj6Kp++JK5bHc3yI5qiY=;
 b=aa5ZJXEgrVf7BGPkrpv/vp3Lxd8eDwGLhSMBCV8C10Ev/XLyrF3oi11Y+xpFNxrfCnG9
 4OWbReH0jzAgSKs2UVuS7mq0bWKF+Ce3f/wiX9mkjzOsFrC/uhX0XLRv6K5IRfLJSk9q
 mfHMPOnwwoUVjtvXT0Kp1R4J/2OrA4hvWxv9GA729FZ5eGdJGDXPQx2eMwoqsXFhUF8v
 Xf7jMoJ33W17qt2u3nCf3PVDHt8PntT2LSYuEGmF6SSXJR0cmlzcgrsR3nqppqQktUHZ
 mjDwMsZyG8QjbjjjnaMXBtfVPKbaNikMkTeYgNMmazbTKvfq7BJVeDVBcCOEGcCQgTGB mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38m4672y22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 13:53:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F1AE10002A;
 Tue, 18 May 2021 13:53:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27DA82237B7;
 Tue, 18 May 2021 13:53:48 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 13:53:47 +0200
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
 <20210518093951.23136-4-patrice.chotard@foss.st.com>
 <20210518133940.7b14addc@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <21f71739-f08c-4375-398e-7b730d4c1cea@foss.st.com>
Date: Tue, 18 May 2021 13:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518133940.7b14addc@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] spi: stm32-qspi: add automatic
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

Hi

On 5/18/21 1:39 PM, Boris Brezillon wrote:
> On Tue, 18 May 2021 11:39:51 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> STM32 QSPI is able to automatically poll a specified register inside the
>> memory and relieve the CPU from this task.
>>
>> As example, when erasing a large memory area, we got cpu load
>> equal to 50%. This patch allows to perform the same operation
>> with a cpu load around 2%.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Changes in v3:
>>   - Remove spi_mem_finalize_op() API added in v2.
>>
>> Changes in v2:
>>   - mask and match stm32_qspi_poll_status() parameters are 2-byte wide
>>   - Make usage of new spi_mem_finalize_op() API in stm32_qspi_wait_poll_status() 
>>
>>  drivers/spi/spi-stm32-qspi.c | 83 ++++++++++++++++++++++++++++++++----
>>  1 file changed, 75 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
>> index 7e640ccc7e77..01168a859005 100644
>> --- a/drivers/spi/spi-stm32-qspi.c
>> +++ b/drivers/spi/spi-stm32-qspi.c
>> @@ -36,6 +36,7 @@
>>  #define CR_FTIE			BIT(18)
>>  #define CR_SMIE			BIT(19)
>>  #define CR_TOIE			BIT(20)
>> +#define CR_APMS			BIT(22)
>>  #define CR_PRESC_MASK		GENMASK(31, 24)
>>  
>>  #define QSPI_DCR		0x04
>> @@ -53,6 +54,7 @@
>>  #define QSPI_FCR		0x0c
>>  #define FCR_CTEF		BIT(0)
>>  #define FCR_CTCF		BIT(1)
>> +#define FCR_CSMF		BIT(3)
>>  
>>  #define QSPI_DLR		0x10
>>  
>> @@ -107,6 +109,7 @@ struct stm32_qspi {
>>  	u32 clk_rate;
>>  	struct stm32_qspi_flash flash[STM32_QSPI_MAX_NORCHIP];
>>  	struct completion data_completion;
>> +	struct completion match_completion;
>>  	u32 fmode;
>>  
>>  	struct dma_chan *dma_chtx;
>> @@ -115,6 +118,7 @@ struct stm32_qspi {
>>  
>>  	u32 cr_reg;
>>  	u32 dcr_reg;
>> +	unsigned long status_timeout;
>>  
>>  	/*
>>  	 * to protect device configuration, could be different between
>> @@ -128,11 +132,20 @@ static irqreturn_t stm32_qspi_irq(int irq, void *dev_id)
>>  	struct stm32_qspi *qspi = (struct stm32_qspi *)dev_id;
>>  	u32 cr, sr;
>>  
>> +	cr = readl_relaxed(qspi->io_base + QSPI_CR);
>>  	sr = readl_relaxed(qspi->io_base + QSPI_SR);
>>  
>> +	if (cr & CR_SMIE && sr & SR_SMF) {
>> +		/* disable irq */
>> +		cr &= ~CR_SMIE;
>> +		writel_relaxed(cr, qspi->io_base + QSPI_CR);
>> +		complete(&qspi->match_completion);
>> +
>> +		return IRQ_HANDLED;
>> +	}
>> +
>>  	if (sr & (SR_TEF | SR_TCF)) {
>>  		/* disable irq */
>> -		cr = readl_relaxed(qspi->io_base + QSPI_CR);
>>  		cr &= ~CR_TCIE & ~CR_TEIE;
>>  		writel_relaxed(cr, qspi->io_base + QSPI_CR);
>>  		complete(&qspi->data_completion);
>> @@ -319,6 +332,24 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
>>  	return err;
>>  }
>>  
>> +static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi,
>> +				       const struct spi_mem_op *op)
>> +{
>> +	u32 cr;
>> +
>> +	reinit_completion(&qspi->match_completion);
>> +	cr = readl_relaxed(qspi->io_base + QSPI_CR);
>> +	writel_relaxed(cr | CR_SMIE, qspi->io_base + QSPI_CR);
>> +
>> +	if (!wait_for_completion_timeout(&qspi->match_completion,
>> +				msecs_to_jiffies(qspi->status_timeout)))
>> +		return -ETIMEDOUT;
>> +
>> +	writel_relaxed(FCR_CSMF, qspi->io_base + QSPI_FCR);
>> +
>> +	return 0;
>> +}
>> +
>>  static int stm32_qspi_get_mode(struct stm32_qspi *qspi, u8 buswidth)
>>  {
>>  	if (buswidth == 4)
>> @@ -332,7 +363,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
>>  	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>>  	struct stm32_qspi_flash *flash = &qspi->flash[mem->spi->chip_select];
>>  	u32 ccr, cr;
>> -	int timeout, err = 0;
>> +	int timeout, err = 0, err_poll_status = 0;
>>  
>>  	dev_dbg(qspi->dev, "cmd:%#x mode:%d.%d.%d.%d addr:%#llx len:%#x\n",
>>  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> @@ -378,6 +409,9 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
>>  	if (op->addr.nbytes && qspi->fmode != CCR_FMODE_MM)
>>  		writel_relaxed(op->addr.val, qspi->io_base + QSPI_AR);
>>  
>> +	if (qspi->fmode == CCR_FMODE_APM)
>> +		err_poll_status = stm32_qspi_wait_poll_status(qspi, op);
>> +
>>  	err = stm32_qspi_tx(qspi, op);
>>  
>>  	/*
>> @@ -387,7 +421,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
>>  	 *  byte of device (device size - fifo size). like device size is not
>>  	 *  knows, the prefetching is always stop.
>>  	 */
>> -	if (err || qspi->fmode == CCR_FMODE_MM)
>> +	if (err || err_poll_status || qspi->fmode == CCR_FMODE_MM)
>>  		goto abort;
>>  
>>  	/* wait end of tx in indirect mode */
>> @@ -406,15 +440,46 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
>>  						    cr, !(cr & CR_ABORT), 1,
>>  						    STM32_ABT_TIMEOUT_US);
>>  
>> -	writel_relaxed(FCR_CTCF, qspi->io_base + QSPI_FCR);
>> +	writel_relaxed(FCR_CTCF | FCR_CSMF, qspi->io_base + QSPI_FCR);
>>  
>> -	if (err || timeout)
>> -		dev_err(qspi->dev, "%s err:%d abort timeout:%d\n",
>> -			__func__, err, timeout);
>> +	if (err || err_poll_status || timeout)
>> +		dev_err(qspi->dev, "%s err:%d err_poll_status:%d abort timeout:%d\n",
>> +			__func__, err, err_poll_status, timeout);
>>  
>>  	return err;
>>  }
>>  
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
> Don't you have special constraints on the op that can be passed to poll
> status request (does it support more than 1byte of status?)? If not, I
> think you should at least call spi_mem_supports_op().

We don't have special constraints, the STM32 QSPI supports up to 32bits status.

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
>> +
>>  static int stm32_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>  {
>>  	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>> @@ -527,7 +592,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
>>  	flash->presc = presc;
>>  
>>  	mutex_lock(&qspi->lock);
>> -	qspi->cr_reg = 3 << CR_FTHRES_SHIFT | CR_SSHIFT | CR_EN;
>> +	qspi->cr_reg = CR_APMS | 3 << CR_FTHRES_SHIFT | CR_SSHIFT | CR_EN;
>>  	writel_relaxed(qspi->cr_reg, qspi->io_base + QSPI_CR);
>>  
>>  	/* set dcr fsize to max address */
>> @@ -607,6 +672,7 @@ static const struct spi_controller_mem_ops stm32_qspi_mem_ops = {
>>  	.exec_op	= stm32_qspi_exec_op,
>>  	.dirmap_create	= stm32_qspi_dirmap_create,
>>  	.dirmap_read	= stm32_qspi_dirmap_read,
>> +	.poll_status	= stm32_qspi_poll_status,
>>  };
>>  
>>  static int stm32_qspi_probe(struct platform_device *pdev)
>> @@ -661,6 +727,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	init_completion(&qspi->data_completion);
>> +	init_completion(&qspi->match_completion);
>>  
>>  	qspi->clk = devm_clk_get(dev, NULL);
>>  	if (IS_ERR(qspi->clk)) {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
