Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623939BBD3
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jun 2021 17:27:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D23AC57B6B;
	Fri,  4 Jun 2021 15:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D494C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=zEOGLELAotxFe8keo94CwRJObWeO1jWMUHLzFzUPC9M=; b=HMC8aAzvTE/km1vWl6Zjsq0InJ
 jjLCXFaub81w1mHxlV8xDcIyCKZ3fWHxxoi4AGBzWyoFCZC7jtfwCxmqD+YS+vQahLDUjlozxZAo4
 6hg6Pd1Xz33i5ItCw1MNd/ea13C3lAjx+B84J/cU6z+5VjbCZoAjKQK9FkwWp/yoQxoZGzypWBltX
 lLX5GZopgODrLSciIRA00zYep2ww9jzuz7dHOrm4bDdDO1Q8TYvMhP7s/vJrpX2RB+VJJrlIM8K/D
 SJ+PZLjGv3E5yW5xqP00GPqaN316Yo/yobY7dojtFhAW1zUA496lBsYTYUMAswFFGpixVwn/OFgW/
 wE5UAdpw==;
Received: from [2601:1c0:6280:3f0::ce7d]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBix-00E9tx-Lo; Fri, 04 Jun 2021 15:27:03 +0000
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210604075009.25914-1-patrice.chotard@foss.st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <49902b8a-c16a-423a-d528-3d35cac402bc@infradead.org>
Date: Fri, 4 Jun 2021 08:27:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604075009.25914-1-patrice.chotard@foss.st.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix W=1 build warning
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

On 6/4/21 12:50 AM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Fix the following compilation warning using W=1 build:
> arm-linux-gnueabi-ld: drivers/spi/spi-stm32-qspi.o: in function `stm32_qspi_poll_status':
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

This is a build error, not a warning. The complete message is:

ld: drivers/spi/spi-stm32-qspi.o: in function `stm32_qspi_poll_status':
spi-stm32-qspi.c:(.text+0x661): undefined reference to `spi_mem_supports_op'


Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


thanks.

> ---
>  drivers/spi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index f4481fe48bf0..e71a4c514f7b 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -806,6 +806,7 @@ config SPI_STM32_QSPI
>  	tristate "STMicroelectronics STM32 QUAD SPI controller"
>  	depends on ARCH_STM32 || COMPILE_TEST
>  	depends on OF
> +	depends on SPI_MEM
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
>  	  This driver does not support generic SPI. The implementation only
> 


-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
