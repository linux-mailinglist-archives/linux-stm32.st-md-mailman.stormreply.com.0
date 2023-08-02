Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6176C91E
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 11:14:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28339C6A5FB;
	Wed,  2 Aug 2023 09:14:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B501C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 09:14:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3728S4iq015448; Wed, 2 Aug 2023 11:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=selector1; bh=UktlgZBqEUso5HQ/4lJ3W
 OPb8ljEy4QVZS8fnvcd8hs=; b=izp/JrqrZsW5iI3RsteGEhZJ2JQJ1cIzIr+4G
 ruWZUS3w5gKA8G+0ae1Gyrp5kpANNnVluTPlEX6rJogkN1GSGwdp4CkGrmhCeT0Y
 42csRnib8iN76pU0CxGE4RaVTfk6R03Hil30WpQo14Xg04GI6FvkCP0LqFctxzKF
 Kg5phZ4DUt9RzIsi3lGJSBxIqlOYINVxmYPeAve+GkMy9WklZziFqwvCnpS90t3a
 2iX92TDGU+SOPXAmHKzarFdeDU9JV7DUmQNcW3Ixrl2AMjxrZUB0W7KZ94CMqG7z
 dyixCtm7f1jWA9WoFBsYB82C6hFyB5otnwRx5DjHNJHjbweHQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s7g7nsq4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 11:13:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3A2B100085;
 Wed,  2 Aug 2023 11:13:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A83FA237D70;
 Wed,  2 Aug 2023 11:13:38 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 2 Aug
 2023 11:13:38 +0200
Date: Wed, 2 Aug 2023 11:13:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Message-ID: <20230802091330.GA2156918@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Ruan Jinjie <ruanjinjie@huawei.com>,
 pierre-yves.mordret@foss.st.com, andi.shyti@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731112755.1943630-1-ruanjinjie@huawei.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_04,2023-08-01_01,2023-05-22_02
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
 handle for platform_get_irq()
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

Hi Ruan,

thanks for your patch.

On Mon, Jul 31, 2023 at 07:27:55PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e897d9101434..579b30581725 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2121,12 +2121,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	phy_addr = (dma_addr_t)res->start;
>  
>  	irq_event = platform_get_irq(pdev, 0);
> -	if (irq_event <= 0)
> -		return irq_event ? : -ENOENT;
> +	if (irq_event < 0)
> +		return irq_event;
>  
>  	irq_error = platform_get_irq(pdev, 1);
> -	if (irq_error <= 0)
> -		return irq_error ? : -ENOENT;
> +	if (irq_error < 0)
> +		return irq_error;
>  
>  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
>  						    "wakeup-source");
Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards
Alain
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
