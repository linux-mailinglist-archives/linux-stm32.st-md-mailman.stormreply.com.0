Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D5C3F26CF
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Aug 2021 08:32:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 295A3C58D7A;
	Fri, 20 Aug 2021 06:32:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78742C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Aug 2021 06:32:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17K6QVIh021334; Fri, 20 Aug 2021 08:32:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=VlO4/Ljo2tdrHraB5iL9pG/9mCpzVfNYC9kEXsTA9pU=;
 b=M/eGuxXTBbwIB0IfxJiGgmpuJKljQ2ikzH93elP8+W0PRq+BDPar/tAGF4bGLQBY6o5R
 uXa1HllyhfLbrfGnZhsi6U1bTFIFSuRywqR+s9hqzAhYtKIAJ/uuY0yQaiyMmMiR3rUL
 NjOQC+hJGsnmtFRQj/ha2Z/ubWYek3ZBd854wOMhNdYNHjZsDzmEB4cxC5n1U3+A4Qr9
 qOX7s/3erlZnt8ydS1VUvWueARqtcNFp77YCt2WE6q9HRgLSwCtH2TpteoKc0DoGhKA8
 M/wkR2Y0XqIqCdkY81ji7yV4R/gBqeu0z+pjQHntB8+NLgFlERifHy7h6R0b9C5HGVSt Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3aj2j1sbj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 08:32:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E2AA10002A;
 Fri, 20 Aug 2021 08:32:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3BBCF20F6E2;
 Fri, 20 Aug 2021 08:32:08 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 20 Aug
 2021 08:32:07 +0200
Date: Fri, 20 Aug 2021 08:32:02 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: CGEL <cgel.zte@gmail.com>
Message-ID: <20210820063202.GA21711@gnbcxd0016.gnb.st.com>
Mail-Followup-To: CGEL <cgel.zte@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jing yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20210820031952.12746-1-jing.yangyang@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820031952.12746-1-jing.yangyang@zte.com.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-20_02:2021-08-20,
 2021-08-20 signatures=0
Cc: jing yangyang <jing.yangyang@zte.com.cn>, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH linux-next] spi-stm32: fix Coccinelle
	warnings
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

Hi,

thanks for the patch. We've had this issue reported previously with a patch
provided at
(https://lore.kernel.org/linux-spi/20210713191004.GA14729@5eb5c2cbef84/).
I've put my reviewed-by so it should make its way to the linux-next soon.

Regards,
Alain

On Thu, Aug 19, 2021 at 08:19:52PM -0700, CGEL wrote:
> From: jing yangyang <jing.yangyang@zte.com.cn>
> 
> WARNING !A || A && B is equivalent to !A || B
> 
> This issue was detected with the help of Coccinelle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/spi/spi-stm32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 14ca7ea..cc4a731 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -912,8 +912,8 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
>  		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
>  			stm32h7_spi_read_rxfifo(spi);
>  		if (!spi->cur_usedma ||
> -		    (spi->cur_usedma && (spi->cur_comm == SPI_SIMPLEX_TX ||
> -		     spi->cur_comm == SPI_3WIRE_TX)))
> +			(spi->cur_comm == SPI_SIMPLEX_TX ||
> +			spi->cur_comm == SPI_3WIRE_TX))
>  			end = true;
>  	}
>  
> -- 
> 1.8.3.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
