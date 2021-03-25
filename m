Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F3349260
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 13:49:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0216C57B5E;
	Thu, 25 Mar 2021 12:49:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5052BC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 12:49:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PChLdv032518; Thu, 25 Mar 2021 13:46:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=EsJHfVuK6OPv47dlPTn33o0Xtea7CvUSJM49t+zRfMo=;
 b=nJrfBvdzjGVJbwnP7SVX7HgdWRcC8ULtQLKpdNmZjnl6TrWyX5oLx/qOpI7ady4/G/k3
 FMq1M/waiSpEdMjK0+z4vLG7pf3eRcBIy34BPershUqNKWwSP5ctoqkR01JkBOPIRtZh
 +oGdbLdjfwA5B/++cqGsXVNsMOb3VVYk1z6ZygrV2VK6DMyqDEAD2UoB7SMfYXBR9Kqs
 vPNWZbkJfNRF1Lht+3NXwEXPmqW4H12IEkjK0NHyxTaXQvsocxWLkGoM/8yx4Z09KXj+
 1eIHCJG3dEduZJFpePLn/viGz0N45Unl7++eTfIbslYMqqK1MEilnYv13tzF2rAffggZ kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37fb17q769-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 13:46:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6582100034;
 Thu, 25 Mar 2021 13:46:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C69DA256DE1;
 Thu, 25 Mar 2021 13:46:55 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 13:46:55 +0100
Date: Thu, 25 Mar 2021 13:46:47 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Tian Tao <tiantao6@hisilicon.com>
Message-ID: <20210325124647.GA29312@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>,
 pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Remove useless error message
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

Hello,

Thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Thu, Mar 25, 2021 at 08:04:32PM +0800, Tian Tao wrote:
> Fix the following coccicheck report:
> 
> drivers/i2c/busses/i2c-stm32f7.c:2032:3-10 : platform_get_irq :
> line 2032 is redundant because platform_get_irq() already prints an error
> 
> Remove dev_err() messages after platform_get_irq() failures.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 162a3b0..9fbcbd1 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2035,12 +2035,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	phy_addr = (dma_addr_t)res->start;
>  
>  	irq_event = platform_get_irq(pdev, 0);
> -	if (irq_event <= 0) {
> -		if (irq_event != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
> -				irq_event);
> +	if (irq_event <= 0)
>  		return irq_event ? : -ENOENT;
> -	}
>  
>  	irq_error = platform_get_irq(pdev, 1);
>  	if (irq_error <= 0)
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
