Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC1BD7E91
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D1EEC29099;
	Tue, 14 Oct 2025 07:30:46 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC0E1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Oct 2025 00:26:24 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0Q50l873552;
 Fri, 10 Oct 2025 19:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760142366;
 bh=R/p3aeZ2469/VM/d0M9zdk0kPze0+6RFg7wHHi/c7B0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=hDH8fMnLgbrB7LY0TQ3tcyNLCT4MT2KL3fZvuefzeNZtAkw8uovEQYun2vfA5zu4w
 a/SxisuUxhrcbzY2RlpyIuu2/J0vNyvWBDQyMZhwCSSFvbNc0QSZwtT2nR/sigzwUg
 ijSyUGBEe2Zd69Lg0WzAypRs/Rgs5wioZQFvieyI=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0Q5I02575496
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Oct 2025 19:26:05 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:26:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0Q4s02432767;
 Fri, 10 Oct 2025 19:26:04 -0500
Message-ID: <a8a35f8f-e962-4a2d-ac56-46306c0c1658@ti.com>
Date: Fri, 10 Oct 2025 19:26:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:45 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/7] remoteproc: core: Removed unused
	headers
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
> There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
> so remove from the included headers.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f7d21e99d171667d925de769db003c4e13fe8fe8..8004a480348378abef78ad5641a8c8b5766c20a6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -17,8 +17,6 @@
>   #define pr_fmt(fmt)    "%s: " fmt, __func__
>   
>   #include <asm/byteorder.h>
> -#include <linux/crc32.h>
> -#include <linux/debugfs.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -30,14 +28,12 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of_platform.h>
> -#include <linux/of_reserved_mem.h>
>   #include <linux/panic_notifier.h>
>   #include <linux/platform_device.h>
>   #include <linux/rculist.h>
>   #include <linux/remoteproc.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/virtio_ids.h>
>   #include <linux/virtio_ring.h>
>   
>   #include "remoteproc_internal.h"
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
