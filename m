Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA748FD08
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jan 2022 13:52:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2440C5F1ED;
	Sun, 16 Jan 2022 12:52:07 +0000 (UTC)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C20FCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jan 2022 12:52:06 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id CA353100D940F;
 Sun, 16 Jan 2022 13:52:05 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id A7CE14A85B; Sun, 16 Jan 2022 13:52:05 +0100 (CET)
Date: Sun, 16 Jan 2022 13:52:05 +0100
From: Lukas Wunner <lukas@wunner.de>
To: patrice.chotard@foss.st.com
Message-ID: <20220116125205.GA18267@wunner.de>
References: <20220112144424.5278-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220112144424.5278-1-patrice.chotard@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Jan 12, 2022 at 03:44:24PM +0100, patrice.chotard@foss.st.com wrote:
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 514337c86d2c..09839a3dbb26 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -688,7 +688,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	int ret, irq;
>  
> -	ctrl = spi_alloc_master(dev, sizeof(*qspi));
> +	ctrl = devm_spi_alloc_master(dev, sizeof(*qspi));
>  	if (!ctrl)
>  		return -ENOMEM;
>  
> @@ -784,7 +784,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_noresume(dev);
>  
> -	ret = devm_spi_register_master(dev, ctrl);
> +	ret = spi_register_master(ctrl);
>  	if (ret)
>  		goto err_pm_runtime_free;
>

Unfortunately this patch is still not correct:  It introduces a
double free in the probe error path.

You need to remove this...

err_master_put:
	spi_master_put(qspi->ctrl);

...and replace all the gotos in stm32_qspi_probe() which jump
to the err_master_put label with a return statement.

Thanks,

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
