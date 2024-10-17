Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B009A1FA0
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 12:20:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06D96C78032;
	Thu, 17 Oct 2024 10:20:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB88C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:20:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H9sYET027926;
 Thu, 17 Oct 2024 12:19:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qzkWqNr6Zah8fHLn9UTsESMYx5WWXc0P676Bj/YsVmA=; b=G8S+ypOriCAWBjdh
 DlKopcoQbmo2a9XHGHUNeiB1ISAbpfvzrycH46M3wv11dMvfApP4kI+AU3+O9Sqs
 p0Bznpfv38UTVLw1AOD30FgAWDzwwnW4BjmRuuyhFquuY/Vw12RFtl2xpVA51APs
 gfX/pOPUavTPlnX1QI6hR/7cFY8tqoCiFDooH6WfVVNQ/x6gSinpTVUc8Eb8OD2E
 jyqK+6rZKb8kVyFPafvJadJoxV46kVm/stVcG3HhB0ZiA+NrgIVmDVKhNXHvj29H
 1/rY8rsEE+qgHjqKOHVKsJzJwJmOPfJdo706Uto97LLr5dW5jRZ2iDOqI9FUHiXw
 O9hwmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427gex81y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 12:19:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F96740047;
 Thu, 17 Oct 2024 12:18:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFA63279E69;
 Thu, 17 Oct 2024 12:17:28 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 17 Oct
 2024 12:17:28 +0200
Message-ID: <16e45f70-d1d6-4cca-95b0-24d3959e50be@foss.st.com>
Date: Thu, 17 Oct 2024 12:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Mark Brown
 <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
 <20241016-arm-kasan-vmalloc-crash-v2-2-0a52fd086eef@linaro.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20241016-arm-kasan-vmalloc-crash-v2-2-0a52fd086eef@linaro.org>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: entry: Do a dummy read from
	VMAP shadow
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

On 10/16/24 21:15, Linus Walleij wrote:
> When switching task, in addition to a dummy read from the new
> VMAP stack, also do a dummy read from the VMAP stack's
> corresponding KASAN shadow memory to sync things up in
> the new MM context.
> 
> Cc: stable@vger.kernel.org
> Fixes: a1c510d0adc6 ("ARM: implement support for vmap'ed stacks")
> Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
> Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/arm/kernel/entry-armv.S | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
> index 1dfae1af8e31..12a4040a04ff 100644
> --- a/arch/arm/kernel/entry-armv.S
> +++ b/arch/arm/kernel/entry-armv.S
> @@ -25,6 +25,7 @@
>   #include <asm/tls.h>
>   #include <asm/system_info.h>
>   #include <asm/uaccess-asm.h>
> +#include <asm/kasan_def.h>
>   
>   #include "entry-header.S"
>   #include <asm/probes.h>
> @@ -561,6 +562,13 @@ ENTRY(__switch_to)
>   	@ entries covering the vmalloc region.
>   	@
>   	ldr	r2, [ip]
> +#ifdef CONFIG_KASAN_VMALLOC
> +	@ Also dummy read from the KASAN shadow memory for the new stack if we
> +	@ are using KASAN
> +	mov_l	r2, KASAN_SHADOW_OFFSET
> +	add	r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT

Hello Linus,

While ARM TRM says that if Rd is the same of Rn then it can be omitted, 
such syntax causes error on my build.
Looking around for such syntax in the kernel, this line should be :
add	r2, r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT

Regards,

Clement
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
