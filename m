Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436B5A7872
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 10:05:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C0AC04001;
	Wed, 31 Aug 2022 08:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE826C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 08:05:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V4PuOg001748;
 Wed, 31 Aug 2022 10:03:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Nk2MZAhvJXb3CoaTgq8LEaBG5RYc8Ufzp5+Z0j3aUnc=;
 b=TewhhTweiPPNzw3Ma2RluJ3yXIZ4wxWDXod4J7dF+nhZGsgyfTFX/EBtN+5DhYmZDM/+
 SW7NTa0OCSu1Yyw6EJbLBNhFjrj1XI2X1QOvMF1Hr3dHT2gswyp33VVdfP2KfiM/QIme
 mC4NzXiEfQQv44KBXTt8vh9Ouh+kx8XCHHFp7xTCtobfq7WKqZXOj6WpW1ZV5MX2AHFJ
 gMwPcrzvabk6J1bx9XsfU0kLDRVtGdEU50kKGEM21wtzpYBdq0nT3fPUYl5Rgn1EkPay
 TDp9oVirlrEN8RcjGzvHIGrjn+AEyVlm/Y/MLU2QmIrzm/4bY93mzQtKTXuJ6Ol8TfLD 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j9fmy5w5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 10:03:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70D4F10002A;
 Wed, 31 Aug 2022 10:03:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CEE5216EC0;
 Wed, 31 Aug 2022 10:03:50 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 31 Aug
 2022 10:03:49 +0200
Message-ID: <b6b13f40-346c-5d48-f9c3-56b49356e4e0@foss.st.com>
Date: Wed, 31 Aug 2022 10:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
 <20220830182821.47919-2-andriy.shevchenko@linux.intel.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220830182821.47919-2-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_04,2022-08-31_01,2022-06-22_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/2] spi: stm32-qspi: Refactor dual
 flash mode enable check in ->setup()
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

HI Andy

On 8/30/22 20:28, Andy Shevchenko wrote:
> gpiod_count() either returns positive number of the CS or negative
> error code. In the stm32_qspi_setup() we check that configuration
> has enough CS for the dual flash mode and SPI mode is not changing
> over the lines of the code. Taking all above into considertion,
> refactor dual flash mode enable check by dropping unneeded CS check
> and reusing local mode variable.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/spi/spi-stm32-qspi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 5858f5f9c758..9131660c1afb 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -680,8 +680,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
>  	 * Dual flash mode is only enable in case SPI_TX_OCTAL and SPI_TX_OCTAL
>  	 * are both set in spi->mode and "cs-gpios" properties is found in DT
>  	 */
> -	if (((spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL)) == (SPI_TX_OCTAL | SPI_RX_OCTAL)) &&
> -	    gpiod_count(qspi->dev, "cs")) {
> +	if (mode == (SPI_TX_OCTAL | SPI_RX_OCTAL)) {
>  		qspi->cr_reg |= CR_DFM;
>  		dev_dbg(qspi->dev, "Dual flash mode enable");
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
