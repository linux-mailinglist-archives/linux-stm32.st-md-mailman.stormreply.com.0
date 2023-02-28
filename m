Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 443086A5E31
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Feb 2023 18:28:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E074AC6A5EA;
	Tue, 28 Feb 2023 17:28:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1DCAC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Feb 2023 17:28:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31SDbjhD009965; Tue, 28 Feb 2023 18:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5sU1MYw+h2bs1Kph7VN54clioQ5rOSLy/OOrJb/uFh4=;
 b=OyPmh8DgcXRNN/QBmFY7y6jcAOMIMksQSBwfdnKZhgzKmV5+KYYz/LIdu1WMTAs+mP5h
 X9BuyUD7neC/nkXnCl+fxwF4vihksf6lAdc8mIR/m2E3rP868x7qVQ+izCoTzf0P3rf/
 cyjmvghBIif9RZxgCZAC9PxWcYWaizDhTdkH8aXLWVLY8QKJOUSSFWLNZhSCCGaGn0sb
 QdNpxVEwvD0E8x2ft4iLx9V7TDnf22uB4iSQr9FCtVqZbb/PfmbAr15Eu1eKZzOC5sEA
 hN5vlnQ1Xy6bVOvVMi9z1UI5e8lg1P638xh2IijenuBv7K5AdvSbCsc6JJFtoqaXuVHg FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ny8mr3a3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Feb 2023 18:28:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9AAB410002A;
 Tue, 28 Feb 2023 18:28:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93D942291A1;
 Tue, 28 Feb 2023 18:28:23 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Feb
 2023 18:28:22 +0100
Message-ID: <27b9e057-bdd7-b4e6-445c-8da700423600@foss.st.com>
Date: Tue, 28 Feb 2023 18:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
 <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_15,2023-02-28_03,2023-02-09_01
Cc: kishon@kernel.org, error27@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, linux-phy@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32-usphyc: add 200 to 300 us
 delay to fix timeout on some machines
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

On 2/27/23 16:13, Michael Grzeschik wrote:
> An minimum udelay of 200 us seems to be necessary on some machines. After
> the setup of the pll, which needs about 100 us to be locked there seem
> to be additional 100 us to get the phy really functional. Without this
> delay the usb runs not functional. With this additional short udelay
> this issue was not reported again.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 

Hi Michael,

Thank you for the updates,

Fell free to add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Best Regards,
Fabrice

> ---
> v1 -> v2: - changed the mdelay to udelay_range(200, 300), like suggested by fabrice
>           - moved the delay to pll enable so it will only be triggered once
> 
>  drivers/phy/st/phy-stm32-usbphyc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index 5bb9647b078f12..dd469f57fba7eb 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -317,6 +317,9 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
>  
>  	stm32_usbphyc_set_bits(pll_reg, PLLEN);
>  
> +	/* Wait for maximum lock time */
> +	usleep_range(200, 300);
> +
>  	return 0;
>  
>  reg_disable:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
