Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8137129B
	for <lists+linux-stm32@lfdr.de>; Mon,  3 May 2021 10:48:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA5CCC59782;
	Mon,  3 May 2021 08:48:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E95EC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 May 2021 08:48:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1438lkB7080174;
 Mon, 3 May 2021 03:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620031666;
 bh=2sQqkvqoWSu0Be+0DA0CekeNUeEG5WtHbZ2Q/6J+kok=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=mtv9TTR2a99Y7DBPpY1HKNAovtatOO4GfUm9uSfGr0CUQmK9XXvFGINuBTv9H/hoi
 q8A/vZbSmmJn9STxT8rXMinG7/rxVeB6cXMHMe1lmHc+oK/xB8Xy907m8FFgM7JhGM
 +eCRkeFDRsgrtyc81GakB9rM8ns/g/Gywv+3PkfI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1438lkMl101911
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 May 2021 03:47:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 3 May
 2021 03:47:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 3 May 2021 03:47:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1438ljMP045012;
 Mon, 3 May 2021 03:47:45 -0500
Date: Mon, 3 May 2021 14:17:44 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20210503084742.7cp77snyohkdwwvv@ti.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210430185104.377d1bc6@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430185104.377d1bc6@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] spi: spi-mem: add automatic poll
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

On 30/04/21 06:51PM, Boris Brezillon wrote:
> On Mon, 26 Apr 2021 16:39:32 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
> > From: Christophe Kerello <christophe.kerello@foss.st.com>
> > 
> > With STM32 QSPI, it is possible to poll the status register of the device.
> > This could be done to offload the CPU during an operation (erase or
> > program a SPI NAND for example).
> > 
> > spi_mem_poll_status API has been added to handle this feature.
> > 
> > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> >  drivers/spi/spi-mem.c       | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/spi/spi-mem.h |  8 ++++++++
> >  2 files changed, 42 insertions(+)
> > 
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index 1513553e4080..43dce4b0efa4 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -743,6 +743,40 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
> >  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
> >  }
> >  
> > +/**
> > + * spi_mem_poll_status() - Poll memory device status
> > + * @mem: SPI memory device
> > + * @op: the memory operation to execute
> > + * @mask: status bitmask to ckeck
> > + * @match: status expected value
> > + * @timeout: timeout
> > + *
> > + * This function send a polling status request to the controller driver
> > + *
> > + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> > + *         -EOPNOTSUPP if not supported.
> > + */
> > +int spi_mem_poll_status(struct spi_mem *mem,
> > +			const struct spi_mem_op *op,
> > +			u8 mask, u8 match, u16 timeout)
> > +{
> > +	struct spi_controller *ctlr = mem->spi->controller;
> > +	int ret = -EOPNOTSUPP;
> > +
> > +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> > +		ret = spi_mem_access_start(mem);
> 
> You should probably check that op is a single byte read before
> accepting the command.

Please do not discriminate against 8D-8D-8D flashes ;-)

> 
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);
> 
> You also need some sort of ->poll_status_is_supported() to validate
> that the controller supports the status polling for this specific op (I

I don't think a separate function is needed for checking if the poll 
status op is supported. Return value of -EOPNOTSUPP should be able to 
signal that. This can also be used to check if Octal DDR capable 
controllers are able to poll using 2-byte reads.

> can imagine some controllers having a limit on the number of dummy
> cycles/address bytes). I guess you could just fall back on SW-based
> status polling if ctlr->mem_ops->poll_status() returns -ENOTSUPP.
> 
> > +
> > +		spi_mem_access_end(mem);
> > +	}
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> > +
> >  static int spi_mem_probe(struct spi_device *spi)
> >  {
> >  	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index 2b65c9edc34e..5f78917c0f68 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> > @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
> >   *		  the currently mapped area), and the caller of
> >   *		  spi_mem_dirmap_write() is responsible for calling it again in
> >   *		  this case.
> > + * @poll_status: poll memory device status
> >   *
> >   * This interface should be implemented by SPI controllers providing an
> >   * high-level interface to execute SPI memory operation, which is usually the
> > @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
> >  			       u64 offs, size_t len, void *buf);
> >  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
> >  				u64 offs, size_t len, const void *buf);
> > +	int (*poll_status)(struct spi_mem *mem,
> > +			   const struct spi_mem_op *op,
> > +			   u8 mask, u8 match, u16 timeout);
> >  };
> >  
> >  /**
> > @@ -369,6 +373,10 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
> >  void devm_spi_mem_dirmap_destroy(struct device *dev,
> >  				 struct spi_mem_dirmap_desc *desc);
> >  
> > +int spi_mem_poll_status(struct spi_mem *mem,
> > +			const struct spi_mem_op *op,
> > +			u8 mask, u8 match, u16 timeout);
> > +
> >  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
> >  				       struct module *owner);
> >  

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
