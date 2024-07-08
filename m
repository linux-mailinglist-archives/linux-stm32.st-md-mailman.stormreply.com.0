Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCC92A3B4
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 15:34:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0794EC6DD96;
	Mon,  8 Jul 2024 13:34:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFEF0C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 13:34:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468CKG7F014260;
 Mon, 8 Jul 2024 15:33:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pQZd32lrwSdbK0qtBZuTFC92e7n3xKS/AFWQ/E+TqbY=; b=c/wXRHcTxFs5gH/5
 YRtl8gvXgiXGdQCjMn2vHnt20BZYsH8+1B4JFmJoUANjxUIdM7xm0GZyyKiBKswQ
 /3se3CkImCgtX8gixqqWJUzujsRFrrzjWuo1QLDkop+tfH7J1N5dSnZRuYYBnCSm
 MZp0+S6J93IZ5iGg0hzZJz9aWRYPsw5gskZrNqU5B/kobtwIltPLeeG7Z4zGsyr4
 8IlVofsitziA7SMrfrXzSEfGn7/0uw8RM7Sl0tAxzT+24mQmHmQoiuNGoljwicZx
 6RN+90bLmqmPAerLHrfRkDI2+LGfDFTUSp3UyDL5kyMLBzpbxgdgehemST71Cx9n
 kWzQoQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whfq3jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2024 15:33:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C364740044;
 Mon,  8 Jul 2024 15:33:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3A1D223644;
 Mon,  8 Jul 2024 15:32:36 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jul
 2024 15:32:35 +0200
Message-ID: <9d60f79c-6cf3-eb6c-57ae-e6ea391fa618@foss.st.com>
Date: Mon, 8 Jul 2024 15:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 <yannick.fertre@foss.st.com>
References: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
Cc: mcoquelin.stm32@gmail.com, tzimmermann@suse.de,
 Abaci Robot <abaci@linux.alibaba.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Remove unnecessary .owner for
 lvds_platform_driver
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



On 7/1/24 08:23, Jiapeng Chong wrote:
> Remove .owner field if calls are used which set it automatically.
> 
> ./drivers/gpu/drm/stm/lvds.c:1213:3-8: No need to set .owner here. The core will do it.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9457
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/stm/lvds.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index 2fa2c81784e9..06f2d7a56cc9 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1210,7 +1210,6 @@ static struct platform_driver lvds_platform_driver = {
>   	.remove = lvds_remove,
>   	.driver = {
>   		.name = "stm32-display-lvds",
> -		.owner = THIS_MODULE,
>   		.of_match_table = lvds_dt_ids,
>   	},
>   };

Hi Jiapeng,
Applied on drm-misc-next.
Many thanks,
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
