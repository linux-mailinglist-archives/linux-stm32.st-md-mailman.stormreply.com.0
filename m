Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578233EB0E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 09:07:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6402C57B79;
	Wed, 17 Mar 2021 08:07:03 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCF00C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 21:17:45 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id B9EFC30000CC4;
 Tue, 16 Mar 2021 22:17:44 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id AC9728AAB6; Tue, 16 Mar 2021 22:17:44 +0100 (CET)
Date: Tue, 16 Mar 2021 22:17:44 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210316211744.GA25311@wunner.de>
References: <1615545286-5395-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615545286-5395-1-git-send-email-alain.volmat@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 17 Mar 2021 08:07:03 +0000
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: drop devres version of
	spi_register_master
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

On Fri, Mar 12, 2021 at 11:34:46AM +0100, Alain Volmat wrote:
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1960,6 +1960,7 @@ static int stm32_spi_remove(struct platform_device *pdev)
>  	struct spi_master *master = platform_get_drvdata(pdev);
>  	struct stm32_spi *spi = spi_master_get_devdata(master);
>  
> +	spi_unregister_master(master);
>  	spi->cfg->disable(spi);
>  
>  	if (master->dma_tx)

This introduces a use-after-free because spi_unregister_master()
drops the last reference on the spi_master allocation (which includes
the struct stm32_spi), causing it to be freed, yet the stm32_spi
struct is accessed afterwards.

You need to convert the driver to devm_spi_alloc_master() to
fix the use-after-free.  See commit 6cfd39e212de for an example.

Thanks,

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
