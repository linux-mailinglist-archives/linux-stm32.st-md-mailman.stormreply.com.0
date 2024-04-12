Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC68A29D7
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 10:54:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D576C6B47E;
	Fri, 12 Apr 2024 08:54:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BF30C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 08:53:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43C8RL2t009700; Fri, 12 Apr 2024 10:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=WjFgtosidiIyq2Zmcjtu8dtER2lY9hSTMSWSMhZ3Xas=; b=3q
 2TCxFt8NbxX6zobRUXOLJRewuDgTt1BN3myoUYyhH9sDhS0f5EqUIsnxCc4vyRK1
 e5RnWZgq0T6Qxn4IHCk9Q+MqpzuHzkcy35F+6OhcfwpcL9GBACuzt3fXeVlruiya
 tuNV3dtKagQfB4J5uFWJmBEMxZmVMHmK3SFRcwpNoZmEsMVsboWDPnwQLIR5eCNZ
 LQJzJ6n0C9qg+jqZPOV6icC49jOXQbtm0Irqq8+tUGQ7Kn01yuReBSGF7KmJOuZY
 vSdcaNjGoHN4VcAZ1atP4hoJMmPn8NKIk2totehDNSByEPo4zuhwCgl/Vquf2eUx
 gUvLjF+/e0bMCUhSRSTQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xaw9d86vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 10:53:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 70A6D40044;
 Fri, 12 Apr 2024 10:53:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80195210729;
 Fri, 12 Apr 2024 10:53:07 +0200 (CEST)
Received: from [10.48.86.69] (10.48.86.69) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 12 Apr
 2024 10:53:07 +0200
Message-ID: <abf316f7-f0c6-4eb3-aee2-fc5413d7c18b@foss.st.com>
Date: Fri, 12 Apr 2024 10:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
X-Originating-IP: [10.48.86.69]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_05,2024-04-09_01,2023-05-22_02
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Hi Dan,

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
Thank you.

Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
