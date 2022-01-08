Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF74885AE
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jan 2022 20:48:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 943A3C5F1FA;
	Sat,  8 Jan 2022 19:48:20 +0000 (UTC)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C542FC5F1E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jan 2022 19:48:19 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 18E122800B3D2;
 Sat,  8 Jan 2022 20:48:19 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 090432F5D0F; Sat,  8 Jan 2022 20:48:19 +0100 (CET)
Date: Sat, 8 Jan 2022 20:48:19 +0100
From: Lukas Wunner <lukas@wunner.de>
To: patrice.chotard@foss.st.com
Message-ID: <20220108194819.GA5467@wunner.de>
References: <20220106132052.7227-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106132052.7227-1-patrice.chotard@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Jan 06, 2022 at 02:20:52PM +0100, patrice.chotard@foss.st.com wrote:
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -784,7 +784,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_noresume(dev);
>  
> -	ret = devm_spi_register_master(dev, ctrl);
> +	ret = spi_register_master(ctrl);
>  	if (ret)
>  		goto err_pm_runtime_free;
>  
> @@ -817,6 +817,7 @@ static int stm32_qspi_remove(struct platform_device *pdev)
>  	struct stm32_qspi *qspi = platform_get_drvdata(pdev);
>  
>  	pm_runtime_get_sync(qspi->dev);
> +	spi_unregister_master(qspi->ctrl);
>  	/* disable qspi */
>  	writel_relaxed(0, qspi->io_base + QSPI_CR);
>  	stm32_qspi_dma_free(qspi);

NAK, this introduces a use-after-free because the "qspi" allocation
is freed by spi_unregister_master(), yet is subsequently accessed.

You need to convert the driver to devm_spi_alloc_master() to avoid that.
Do it in the same patch to ease backporting.

Please add a stable designation and a Fixes: tag.  Chances are the patch
needs to be backported all the way back to the release when the driver
was first introduced.

Thanks,

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
