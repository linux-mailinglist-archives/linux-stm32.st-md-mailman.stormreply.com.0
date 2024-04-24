Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0DE8B0A9F
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 15:15:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 602E4C7128C;
	Wed, 24 Apr 2024 13:15:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24899C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 13:15:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OBsNvJ019281;
 Wed, 24 Apr 2024 15:15:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3KiGlLEEMBqAQpnigw8VFdSst9zFsrKpxO0S8JeWSSY=; b=nD
 xQOumJpyT0pxzog09VN71zHwYTX7Wp/UNR7PPUKJKlYpZn663KYtY0bjStUo8j2y
 YkKYiWzT8TZJA41J5Z8nhvSHqOe/mIYzjDU4hMPsgVE/QmU//1WeYEYEkDLvjLpZ
 CLsSJqrPotWo5tHgJFYoet/OwS5eK9rpG8MLb7Gis4r8gwwlFX4LG6i02hna8s+G
 0Q+Ql4eJrUB4JcBIpp3tJ67xAhIe6y6hFz284dpGSBylysbfR3inOPBuRi0cNmKX
 vB7SMQ7ayuajBuWZuFrJCfn6JnIFCbxw79/Zza2jr5qfxraWB62veDm62yYXZbV/
 VY3zBi6MXiPQXUVk/yvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cngpmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 15:15:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B2994002D;
 Wed, 24 Apr 2024 15:15:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A76DC21ED4A;
 Wed, 24 Apr 2024 15:14:38 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 15:14:38 +0200
Message-ID: <53a82587-2f1b-45df-b507-11810ad1b533@foss.st.com>
Date: Wed, 24 Apr 2024 15:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>
References: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_10,2024-04-24_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] bus: stm32_firewall: fix off by one in
 stm32_firewall_get_firewall()
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

Hi Dan

On 4/12/24 10:25, Dan Carpenter wrote:
> The "nb_firewall" variable is the number of elements in the firewall[]
> array, which is allocated in stm32_firewall_populate_bus().  So change
> this > comparison to >= to prevent an out of bound access.
> 
> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/bus/stm32_firewall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index decb79449047..2fc9761dadec 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -53,7 +53,7 @@ int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *f
>   			return err;
>   		}
>   
> -		if (j > nb_firewall) {
> +		if (j >= nb_firewall) {
>   			pr_err("Too many firewall controllers");
>   			of_node_put(provider);
>   			return -EINVAL;

Applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
