Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA69EEC89
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 16:35:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D2D2C78006;
	Thu, 12 Dec 2024 15:35:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346EDC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 15:35:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCAVPJv011897;
 Thu, 12 Dec 2024 16:35:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9c+ZQ2nN+RzQbM3dUetK/hYw3NM5s3P4yw/14c5dtxA=; b=2qJrl9YBhg/OBgMc
 FJRu1WLNsTBqyRl+z0b2p6+8+B0HtXvp+PgODmFKHa6fz/KG+Ps9MrZNGiB1i1zY
 ILVRbJvBKEqrpAUwjNpqpJjRsXt9R9Iq6AlPZZIU7aN2WnLtPeFUpjqs+1Zlv/pt
 HVGiLceSqXXcVIeHFivCwAu2pD+iqgKV7hZFmfc5ODM9RJV3Lx+p0Cg+21Y1Xbcb
 J9rL/GXS7LLbD39BAwg3nzdaLzHRCNl+XRunEMMRJsyPo4Q7wxz0a0kM4IbgDnyv
 iGlfb4wPoCME2N6/bff4pEvDLxroIQC/0EAzIrRow6r/c/7u71prYrx3qZ8ADQcP
 wtb3Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9ywuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 16:35:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49C7540047;
 Thu, 12 Dec 2024 16:34:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 608B42839DA;
 Thu, 12 Dec 2024 16:32:15 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 16:32:15 +0100
Message-ID: <d8eb157e-2f35-45a4-ba3e-cb296ced0a80@foss.st.com>
Date: Thu, 12 Dec 2024 16:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: guanjing <guanjing@cmss.chinamobile.com>, <mcoquelin.stm32@gmail.com>
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] firewall: remove misplaced semicolon
 from stm32_firewall_get_firewall
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

Hi

On 11/9/24 06:50, guanjing wrote:
> Remove misplaced colon in stm32_firewall_get_firewall()
> which results in a syntax error when the code is compiled
> without CONFIG_STM32_FIREWALL.
> 
> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
> Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
> ---
>   include/linux/bus/stm32_firewall_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> index 18e0a2fc3816..5178b72bc920 100644
> --- a/include/linux/bus/stm32_firewall_device.h
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
>   #else /* CONFIG_STM32_FIREWALL */
>   
>   int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
> -				unsigned int nb_firewall);
> +				unsigned int nb_firewall)
>   {
>   	return -ENODEV;
>   }

Applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
