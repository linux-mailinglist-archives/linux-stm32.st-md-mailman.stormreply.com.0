Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E9BD7E8E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 396B8C3FAD2;
	Tue, 14 Oct 2025 07:30:46 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3092C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Oct 2025 00:23:24 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0N9ov352732;
 Fri, 10 Oct 2025 19:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760142189;
 bh=Gs6qK5+p3+mYOcv7SCRNDUh2R8gzPWwIwpg7xpxkKsw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=UDS8fZlBxEsB2jli/iOgJW0q030CbdVsCa1gWQME6bX/V/vP6qf/N7Vy8XnQp1ZzP
 3DCQVT/smPzCUP9GcJ3CcVxO5M7BfQqNA5nFkIr3PDA7pKVCsiHg9UOQSdFW4t1s1+
 1fkiCOjPTZxA6C7MK0ILvQy7taThXe/tyzKatgl8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0N8if2574113
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 10 Oct 2025 19:23:09 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 19:23:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:23:08 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0N85I2429934;
 Fri, 10 Oct 2025 19:23:08 -0500
Message-ID: <0ebb5709-2588-491e-b05c-63aa8609d67c@ti.com>
Date: Fri, 10 Oct 2025 19:23:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-2-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-2-7cecf1bfd81c@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:45 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/7] remoteproc: core: Sort header
	includes
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
> Reordered the header includes in drivers/remoteproc/remoteproc_core.c
> to follow alphabetical order to simplify future maintenance.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 29bbaa349e340eedd122fb553004f7e6a5c46e55..f7d21e99d171667d925de769db003c4e13fe8fe8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -16,29 +16,29 @@
>   
>   #define pr_fmt(fmt)    "%s: " fmt, __func__
>   
> +#include <asm/byteorder.h>
> +#include <linux/crc32.h>
> +#include <linux/debugfs.h>
>   #include <linux/delay.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
>   #include <linux/device.h>
> -#include <linux/panic_notifier.h>
> -#include <linux/slab.h>
> -#include <linux/mutex.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/elf.h>
>   #include <linux/firmware.h>
> -#include <linux/string.h>
> -#include <linux/debugfs.h>
> -#include <linux/rculist.h>
> -#include <linux/remoteproc.h>
> -#include <linux/iommu.h>
>   #include <linux/idr.h>
> -#include <linux/elf.h>
> -#include <linux/crc32.h>
> +#include <linux/iommu.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/of_platform.h>
>   #include <linux/of_reserved_mem.h>
> +#include <linux/panic_notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/rculist.h>
> +#include <linux/remoteproc.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
>   #include <linux/virtio_ids.h>
>   #include <linux/virtio_ring.h>
> -#include <asm/byteorder.h>
> -#include <linux/platform_device.h>
>   
>   #include "remoteproc_internal.h"
>   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
