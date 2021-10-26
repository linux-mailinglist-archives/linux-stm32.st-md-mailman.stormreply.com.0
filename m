Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D543B613
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 17:50:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61998C5719C;
	Tue, 26 Oct 2021 15:50:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61647C06B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 15:50:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QFCEqe015340; 
 Tue, 26 Oct 2021 17:50:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7SmDFUSVTJc6gIboFqRZL9sKdd+gL2b7ycoA8OY5yt0=;
 b=ta8zWYEwI1d9XDIyPUFgtxWZ6yCFHN7mfZVd4dq8x+PxBBU3HsEpbwZt5YogTFs17ezb
 II9PWCR+ZARca3pDBxmVypNeRPNJ1uNXoMmgs3K4MyDfRbqmSgOpQzbGQHn5QY+ujBSA
 K6Oi5jhn0dfu7db4alUdNmiPmDcXtNnIzptNj4slmjq6OhjzpGWgl8/mqOES8jpGPVfN
 krQqFur3CFcHmVOU+jpgkXTJ6CfN1HVrDJy4J2qLORha4Brh29XfcQZivkio8leDt48P
 kPEwEknR2vbCf+um1VSLe5dZmk0WLyFVokACsX6K416wyoI0+mI+UK7id2Tynv7+rmkt qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bxm40r967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:50:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0A0F100034;
 Tue, 26 Oct 2021 17:50:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8EA8221DC0;
 Tue, 26 Oct 2021 17:50:48 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 26 Oct
 2021 17:50:48 +0200
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <vkoul@kernel.org>,
 <kishon@ti.com>
References: <1635172265-26219-1-git-send-email-fabrice.gasnier@foss.st.com>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <0d889ca2-2538-ea17-5bfd-a3d137115223@foss.st.com>
Date: Tue, 26 Oct 2021 17:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635172265-26219-1-git-send-email-fabrice.gasnier@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_04,2021-10-26_01,2020-04-07_01
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: adopt dev_err_probe for
	regulators
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Fabrice,

Thanks for your patch.

On 10/25/21 4:31 PM, Fabrice Gasnier wrote:
> Change stm32-usbphyc driver to use dev_err_probe(), to benefit of
> devices_deferred debugfs in case of probe deferral.
>  > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/phy/st/phy-stm32-usbphyc.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index 7df6a63..115be0e 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -672,17 +672,15 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
>   
>   	usbphyc->vdda1v1 = devm_regulator_get(dev, "vdda1v1");
>   	if (IS_ERR(usbphyc->vdda1v1)) {
> -		ret = PTR_ERR(usbphyc->vdda1v1);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get vdda1v1 supply: %d\n", ret);
> +		ret = dev_err_probe(dev, PTR_ERR(usbphyc->vdda1v1),
> +				    "failed to get vdda1v1 supply\n");
>   		goto clk_disable;
>   	}
>   
>   	usbphyc->vdda1v8 = devm_regulator_get(dev, "vdda1v8");
>   	if (IS_ERR(usbphyc->vdda1v8)) {
> -		ret = PTR_ERR(usbphyc->vdda1v8);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get vdda1v8 supply: %d\n", ret);
> +		ret = dev_err_probe(dev, PTR_ERR(usbphyc->vdda1v8),
> +				    "failed to get vdda1v8 supply\n");
>   		goto clk_disable;
>   	}
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
