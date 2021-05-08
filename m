Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04A37707F
	for <lists+linux-stm32@lfdr.de>; Sat,  8 May 2021 09:55:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B32FC59780;
	Sat,  8 May 2021 07:55:16 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DA3C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 May 2021 07:55:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 950651F44390;
 Sat,  8 May 2021 08:55:12 +0100 (BST)
Date: Sat, 8 May 2021 09:55:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Message-ID: <20210508095506.4d0d628a@collabora.com>
In-Reply-To: <20210507131756.17028-2-patrice.chotard@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] spi: spi-mem: add automatic poll
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

On Fri, 7 May 2021 15:17:54 +0200
<patrice.chotard@foss.st.com> wrote:

> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> With STM32 QSPI, it is possible to poll the status register of the device.
> This could be done to offload the CPU during an operation (erase or
> program a SPI NAND for example).
> 
> spi_mem_poll_status API has been added to handle this feature.
> This new function take care of the offload/non-offload cases.
> 
> For the non-offload case, use read_poll_timeout() to poll the status in
> order to release CPU during this phase.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> Changes in v2:
>   - Indicates the spi_mem_poll_status() timeout unit
>   - Use 2-byte wide status register
>   - Add spi_mem_supports_op() call in spi_mem_poll_status()
>   - Add completion management in spi_mem_poll_status()
>   - Add offload/non-offload case mangement in spi_mem_poll_status()
>   - Optimize the non-offload case by using read_poll_timeout()
> 
>  drivers/spi/spi-mem.c       | 71 +++++++++++++++++++++++++++++++++++++
>  include/linux/spi/spi-mem.h | 10 ++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 1513553e4080..3f29c604df7d 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -6,6 +6,7 @@
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>   */
>  #include <linux/dmaengine.h>
> +#include <linux/iopoll.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-mem.h>
> @@ -743,6 +744,75 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
>  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
>  }
>  
> +/**
> + * spi_mem_finalize_op - report completion of spi_mem_op
> + * @ctlr: the controller reporting completion
> + *
> + * Called by SPI drivers using the spi-mem spi_mem_poll_status()
> + * implementation to notify it that the current spi_mem_op has
> + * finished.
> + */
> +void spi_mem_finalize_op(struct spi_controller *ctlr)
> +{
> +	complete(&ctlr->xfer_completion);
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_finalize_op);
> +
> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: (status & mask) expected value
> + * @timeout_ms: timeout in milliseconds
> + *
> + * This function send a polling status request to the controller driver
> + *
> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> + *         -EOPNOTSUPP if not supported.
> + */
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match, u16 timeout_ms)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +	unsigned long ms;
> +	int ret = -EOPNOTSUPP;
> +	int exec_op_ret;
> +	u16 *status;
> +
> +	if (!spi_mem_supports_op(mem, op))
> +		return ret;

You should only test that in the SW-based polling path. The driver
->poll_status() method is expected to check the operation and
return -EOPNOTSUPP if HW-based polling doesn't work for this op,
no need to check things twice.

> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret)
> +			return ret;
> +
> +		reinit_completion(&ctlr->xfer_completion);
> +
> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> +						 timeout_ms);
> +
> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
> +						 msecs_to_jiffies(timeout_ms));

Why do you need to wait here? I'd expect the poll_status to take care
of this wait.

> +
> +		spi_mem_access_end(mem);
> +		if (!ms)
> +			return -ETIMEDOUT;
> +	} else {
> +		status = (u16 *)op->data.buf.in;

Hm, I don't think it's safe, for 2 reasons:

1/ op->data.buf.in might be a 1byte buffer, but you're doing a 2byte check
2/ data is in big endian in the SPI buffer, which means your check
   won't work on LE architectures.

You really need a dedicated spi_mem_read_status() function that's passed
an u16 pointer:

int spi_mem_read_status(struct spi_mem *mem,
			const struct spi_mem_op *op,
			u16 *status)
{
	const u8 *bytes = (u8 *)op->data.buf.in;
	int ret;

	ret = spi_mem_exec_op(mem, op);
	if (ret)
		return ret;

	if (op->data.nbytes > 1)
		*status = ((u16)bytes[0] << 8) | bytes[1];
	else
		*status = bytes[0];

	return 0;
}

> +		ret = read_poll_timeout(spi_mem_exec_op, exec_op_ret,
> +					((*status) & mask) == match, 20,
> +					timeout_ms * 1000, false, mem, op);
> +		if (exec_op_ret)
> +			return exec_op_ret;
> +	}
> +

I would do something like this instead:

int spi_mem_poll_status(struct spi_mem *mem,
			const struct spi_mem_op *op,
			u16 mask, u16 match, u16 timeout_ms)
{
	struct spi_controller *ctlr = mem->spi->controller;
	int ret = -EOPNOTSUPP;

	if (op->data.nbytes < 1 || op->data.nbytes > 2)
		return -EINVAL;

	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
		ret = spi_mem_access_start(mem);
		if (ret)
			return ret;

		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
						 timeout_ms);

		spi_mem_access_end(mem);
	}


	if (ret == -EOPNOTSUPP) {
                u16 status;
		int read_status_ret;

		if (!spi_mem_supports_op(mem, op))
			return -EOPNOTSUPP;

		ret = read_poll_timeout(spi_mem_read_status, exec_op_ret,
					(read_status_ret || ((status & mask) == match), 20,
					timeout_ms * 1000, false, mem, op, &status);

		if (read_status_ret)
			return read_status_ret;
	}

	return ret;
}

> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> +
>  static int spi_mem_probe(struct spi_device *spi)
>  {
>  	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
> @@ -763,6 +833,7 @@ static int spi_mem_probe(struct spi_device *spi)
>  	if (IS_ERR_OR_NULL(mem->name))
>  		return PTR_ERR_OR_ZERO(mem->name);
>  
> +	init_completion(&ctlr->xfer_completion);
>  	spi_set_drvdata(spi, mem);
>  
>  	return memdrv->probe(mem);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 2b65c9edc34e..0fbf5d0a3d31 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
>   *		  the currently mapped area), and the caller of
>   *		  spi_mem_dirmap_write() is responsible for calling it again in
>   *		  this case.
> + * @poll_status: poll memory device status
>   *
>   * This interface should be implemented by SPI controllers providing an
>   * high-level interface to execute SPI memory operation, which is usually the
> @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
>  			       u64 offs, size_t len, void *buf);
>  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
>  				u64 offs, size_t len, const void *buf);
> +	int (*poll_status)(struct spi_mem *mem,
> +			   const struct spi_mem_op *op,
> +			   u16 mask, u16 match, unsigned long timeout);
>  };
>  
>  /**
> @@ -369,6 +373,12 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
>  void devm_spi_mem_dirmap_destroy(struct device *dev,
>  				 struct spi_mem_dirmap_desc *desc);
>  
> +void spi_mem_finalize_op(struct spi_controller *ctlr);
> +
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match, u16 timeout);
> +
>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  				       struct module *owner);
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
