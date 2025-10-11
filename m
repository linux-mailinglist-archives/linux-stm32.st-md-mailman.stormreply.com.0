Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A09BD7E97
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78C73C05858;
	Tue, 14 Oct 2025 07:30:46 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC151C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Oct 2025 00:35:09 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0YtIi794953;
 Fri, 10 Oct 2025 19:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760142895;
 bh=lIlfbEXPKt6sFk0wdJ6sW30Wwfmnzd3I5ezJv51ZMpc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Vc0kXCQ5Rz1TVfpOAJpHmtbvKNWhQUlguWbHupq5Bxjf95E5vmI/dP6zXPfDQ6JNV
 or5C1Q/6jEX3QlvnzVb7tvEx4CTWvieGCqa6CUuwBunGQ6v2ZQkZq7+/vhcZhrXhZa
 cNPgLEC2HQeBhiLz9V1+Mo7EYFPuzHPPlpRCqwlU=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0Ytwi2048387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Oct 2025 19:34:55 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 10 Oct
 2025 19:34:54 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 10 Oct
 2025 19:34:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:34:54 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0Ysdu2442119;
 Fri, 10 Oct 2025 19:34:54 -0500
Message-ID: <8161147a-532c-403c-bc29-05ce39987c8d@ti.com>
Date: Fri, 10 Oct 2025 19:34:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-5-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-5-7cecf1bfd81c@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:45 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 5/7] remoteproc: core: Remove unused
 export of rproc_va_to_pa
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

On 10/10/25 7:24 AM, Peng Fan wrote:
> commit 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
> memory pool") added an export for rproc_va_to_pa. However, since its
> introduction, this symbol has not been used by any loadable modules. It
> remains only referenced within remoteproc_virtio.c, which is always built
> together with remoteproc_core.c.
> 
> As such, exporting rproc_va_to_pa is unnecessary, so remove the export.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dd859378f6ff6dec2728980cc82d31687aa7a3dc..383479d624c89da1c481adc956a169c03b793bcc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -156,7 +156,6 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr)
>   	WARN_ON(!virt_addr_valid(cpu_addr));
>   	return virt_to_phys(cpu_addr);
>   }
> -EXPORT_SYMBOL(rproc_va_to_pa);
>   
>   /**
>    * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
