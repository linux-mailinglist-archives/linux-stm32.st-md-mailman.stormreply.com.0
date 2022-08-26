Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D516F5A2429
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 11:21:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 999C9C640F6;
	Fri, 26 Aug 2022 09:21:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC20EC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 09:21:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q7FCEs022515;
 Fri, 26 Aug 2022 11:21:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CVBSjOH/bwtlQxmEDweF2DMTVjTpkvUK2sI9jy9nqCc=;
 b=oNuU5Uyj1VSnFR0+pfXTcPFm2jxipKb2ey6H7RtbKGYfLb/05llcdnKOkny9/BT1R+JB
 DcuH1dMsKg6cRJ0v+sTIBViWb4JZwTn7lpBiPocVSkOOWXwlaWgHLXqTYP95wxuYDY6K
 L2ihI+dsM/uE9vnZKL83IkqKhMyBazIUWCA6okh4UbZJozj4kjiYTZUMggMPaLUttkiV
 r03x44LMzwsuSaFJqQivlJOxLXi5Fx9vbSiMdmUpRLhCh4HImYjb7hPc9BhE1iPkymd0
 U1nAjerMbfr3zPAjCllMPlcxUOIHf9vf0UkuYhBlgTQZP44QbItVXzjIyN4qlnrTIGdR kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j58m5r4v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 11:21:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0D3F10002A;
 Fri, 26 Aug 2022 11:21:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBD39217B7B;
 Fri, 26 Aug 2022 11:21:40 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 11:21:40 +0200
Message-ID: <5bd8dfad-de31-a5ac-2efc-a9a3d80650f0@foss.st.com>
Date: Fri, 26 Aug 2022 11:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220826091851.1393266-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220826091851.1393266-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_04,2022-08-25_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-stm32] spi: stm32-qspi: Fix
	stm32_qspi_transfer_one_message() error path
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

Hi Mark

Patch sent with incorrect commit title, a new one is in the pipe.
Sorry for that

Patrice

On 8/26/22 11:18, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> The patch a557fca630cc: "spi: stm32_qspi: Add transfer_one_message()
> spi callback" from Aug 23, 2022, leads to the following Smatch static
> checker warning:
> 
> drivers/spi/spi-stm32-qspi.c:627 stm32_qspi_transfer_one_message()
> error: uninitialized symbol 'ret'.Fix the following Smatch static checker warning:
> 
> Fixes: a557fca630cc ("spi: stm32_qspi: Add transfer_one_message() spi callback")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/spi/spi-stm32-qspi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 92459daca95f..679fd1c34f7e 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -562,7 +562,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
>  	struct spi_transfer *transfer;
>  	struct spi_device *spi = msg->spi;
>  	struct spi_mem_op op;
> -	int ret;
> +	int ret = 0;
>  
>  	if (!spi->cs_gpiod)
>  		return -EOPNOTSUPP;
> @@ -592,8 +592,10 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
>  			dummy_bytes = transfer->len;
>  
>  			/* if happens, means that message is not correctly built */
> -			if (list_is_last(&transfer->transfer_list, &msg->transfers))
> +			if (list_is_last(&transfer->transfer_list, &msg->transfers)) {
> +				ret = -EINVAL;
>  				goto end_of_transfer;
> +			}
>  
>  			transfer = list_next_entry(transfer, transfer_list);
>  		}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
