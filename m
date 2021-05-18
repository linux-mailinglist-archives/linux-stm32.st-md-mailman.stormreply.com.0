Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBA3877E0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 13:40:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45D05C5978A;
	Tue, 18 May 2021 11:40:44 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BFE5C59785
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 11:40:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B4561F42F6C;
 Tue, 18 May 2021 12:40:41 +0100 (BST)
Date: Tue, 18 May 2021 13:40:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Message-ID: <20210518134037.0e5839b0@collabora.com>
In-Reply-To: <20210518093951.23136-2-patrice.chotard@foss.st.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
 <20210518093951.23136-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Tue, 18 May 2021 11:39:49 +0200
<patrice.chotard@foss.st.com> wrote:

> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: (status & mask) expected value
> + * @initial_delay_us: delay in us before starting to poll
> + * @polling_delay_us: time to sleep between reads in us
> + * @timeout_ms: timeout in milliseconds
> + *
> + * This function send a polling status request to the controller driver
> + *
> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> + *         -EOPNOTSUPP if not supported.
> + */
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match,
> +			unsigned long initial_delay_us,
> +			unsigned long polling_delay_us,
> +			u16 timeout_ms)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +	int ret = -EOPNOTSUPP;
> +	int read_status_ret;
> +	u16 status;
> +
> +	if (op->data.nbytes < 1 || op->data.nbytes > 2)
> +		return -EINVAL;

We should also make sure this is a read operation.

> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret)
> +			return ret;
> +
> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> +						 initial_delay_us, polling_delay_us,
> +						 timeout_ms);
> +
> +		spi_mem_access_end(mem);
> +	}
> +
> +	if (ret == -EOPNOTSUPP) {
> +		if (!spi_mem_supports_op(mem, op))
> +			return ret;
> +
> +		if (initial_delay_us < 10)
> +			udelay(initial_delay_us);
> +		else
> +			usleep_range((initial_delay_us >> 2) + 1,
> +				     initial_delay_us);
> +
> +		ret = read_poll_timeout(spi_mem_read_status, read_status_ret,
> +					(read_status_ret || ((status) & mask) == match),
> +					polling_delay_us, timeout_ms * 1000, false, mem,
> +					op, &status);
> +		if (read_status_ret)
> +			return read_status_ret;
> +	}
> +
> +	return ret;
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
