Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 277CE348D52
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 10:47:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A06A2C57B5E;
	Thu, 25 Mar 2021 09:47:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA74C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 09:24:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P9DKPB024503; Thu, 25 Mar 2021 10:24:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8pyUWRkcU1YplhF4/J3PtEVHgtW/bvj0k4wn5bDDy44=;
 b=PPuwlGTwlFpXlOdCf4FK6RZjZD3EteCa+xM+bLH+y6obM9Omubl2dGSogqfzfLtUQTnW
 fjZ41GD/7ualtXDViTA+u4dLfn+FvOGAJdeGqOgMTmh5aJqJOYkT7cV/I+QGnBF1Y6+8
 wAbmgKmlJwokNo/yb+b50W3y8dr7LmaLpyzmBwETv+ERuJcYOEULVMc0w1ODbkuzohzW
 z/Nw9fxIAhGJf0knnDjsKyvjVSN1ZwmbScG5ftKOypHeybHq67NiFjzlXdJAPuHyBy1m
 xby9w941fUZ3nrUXuIcj1LCuhIANK5DCfwyh0Czpuxb4JZOWHdDQetFofcHizxcNPlJD 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37fb17p32b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:24:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF343100034;
 Thu, 25 Mar 2021 10:24:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC7D622AC2E;
 Thu, 25 Mar 2021 10:24:13 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 10:24:12 +0100
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, <coquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, <p.zabel@pengutronix.de>,
 <linux-i2c@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
 <AS8PR10MB4504462766AFA3E151121462C6629@AS8PR10MB4504.EURPRD10.PROD.OUTLOOK.COM>
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <39f76c98-2f83-76ee-a1a3-3db0dcdc70ca@foss.st.com>
Date: Thu, 25 Mar 2021 10:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AS8PR10MB4504462766AFA3E151121462C6629@AS8PR10MB4504.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_02:2021-03-24,
 2021-03-25 signatures=0
X-Mailman-Approved-At: Thu, 25 Mar 2021 09:47:57 +0000
Cc: rdunlap@infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c-stm32f4: Mundane typo fix
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


On 3/25/21 10:19 AM, Pierre Yves MORDRET wrote:
> 
> s/postion/position/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 937c2c8fd349..4933fc8ce3fd 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
>  	default:
>  		/*
>  		 * N-byte reception:
> -		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
> +		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
>  		 * In that way, ACK will be sent as soon as the current byte
>  		 * will be received in the shift register
>  		 */

Hi All,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

> --
> 2.30.1
> 

Regards
-- 
--
~ Py MORDRET
--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
