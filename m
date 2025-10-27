Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF7C0EF70
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:31:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0845C6047D;
	Mon, 27 Oct 2025 15:31:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9005C5A4D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:31:11 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-290a3a4c7ecso54151675ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761579070; x=1762183870;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n+DsN4jdZOSZ5kOtvEnVeEW6g+UQqLuSnwSLzBPvWmk=;
 b=WaAU4A5f0n9NIKGGkF6CLvJq/XW3kpO36CDIHei/CaHJ+lz457Z4kkJZS/YHNLYAKB
 65mX3xDgQ7s3vSbVRqlRtoAeya0IBk015YBqFRPjcmXHhsp10JdiQOCiNqOqnOc2fPQO
 shyu02zkZdl2ENPIgxHmxXTkBPpov/luGVHQIpcOCC5Niwtuna3BcJH4jVufiis81Yb4
 9phf2t9BJxCKam9RL/kdT8aPBHGB1r7b5o6n+YLTQ1VnzCc7QdZEMx1NnOXCeN8BQZVU
 KB2ykZSHH+tBYTHRK1iCVwaihIv+PMunvjJsEIVSeGeXr5dPcMQnnGXVFssZ0TzpfYoL
 wEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579070; x=1762183870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+DsN4jdZOSZ5kOtvEnVeEW6g+UQqLuSnwSLzBPvWmk=;
 b=vYlOKr1DyNQsxeMyCQxZ36/DpfTCUfRQWbOCFnta04FpIbrLJ72QgGItSLIs2Es7T7
 AiLi9Q0XCffGrDJ1rkwqxemKqYg8uWDdS8vV7YLHAwFtZAOf8zXp9gjsxrRr9LsKy3Rm
 mhVvWaWWbSAB46ZvX9ZXnOGTffIGPenaKjCMdBxx6XnByLKXywG2FIYzswC1i8VTfmiP
 eDMUmL5ZXp9u6U9LE5tZKxjHPdyUHQ6Cu/dvHNHpcsXfx5ymZ/y3sIQqlvFuxgbVYCYk
 puijlZ6VG2MGprh8v5zSwLbI1559lriaKP0LmZntKUkk9fSvQUM6i5GsoLZbjuMCqy4c
 9dug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR5PS/DRQSb5jqoF88WudX8nfDbimc+q+9wYYXRTxpaQwtrqzYmB+O8ZJ5VNL/9HEOoXB5jSF8X5X7tQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4QozYWosv9rdZTSbihL0c3pUmuCActm70/C8n3Gis4lU92gdh
 Ornxh2JHCX4v+7xSiTgikcsaYBCZjpsyLxspNxT+dQWhBbyuK4ZPbKVEvmA197gmr8A=
X-Gm-Gg: ASbGnctjHJo4IFCuhTyLJ9Ji0K1a6bTul3YOOPrRP1W1wI4ZupL0ruDhWv6nK9mGQ7s
 2NmMOwPGsLSSqQb8X4GWjWWuqYjo2Sz5XMnYqDmlj/Cjp+m0gbdrZDZN3W9pk04naGKfv00+16P
 b58btN9TwxAtNBqDiSD2JAKzR/obbwP8rNhzVNC/Trl0THymRg9tWkKWKGjp/jHaqsDSbSEOvx5
 7FFM37VPdgs16Q3iKKOMi+rjhMpwm+0YB1tiN/PBXJnRiFXNbGCGfO+eec+Xlsz+b6Tl41PbBCK
 W1I2vIkKaYWfQGQD2C/pHRIZk1bwaekWBeoAPxngJIYL9XhLCqcy94+h507yokiO2JznwWND5NE
 tiSHJOBBXNARMSGTFXnhHlBs9zywkzXm4KCUYJ1w4sMF4K/+1sjNEJJABew9pTFhI6n0TDqXNey
 Ydjrb3QV+kuRY8vA==
X-Google-Smtp-Source: AGHT+IEP4FsWGs0UlCG38/MmB7iYt/IImDnHvF1ET52ZGM8b5MM8tWTghb1WNjJHrfHPnwqQpuudRg==
X-Received: by 2002:a17:903:b50:b0:264:a34c:c6d with SMTP id
 d9443c01a7336-294cb3ecbc3mr3384865ad.37.1761579069792; 
 Mon, 27 Oct 2025 08:31:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6669:f9ca:a6a4:f3ec])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed807dbasm8970788a91.12.2025.10.27.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:31:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 09:31:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Message-ID: <aP-QOnTuiEcx9nQK@p14s>
References: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/4] remoteproc: core: misc update
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

On Thu, Oct 16, 2025 at 07:47:57PM +0800, Peng Fan wrote:
> This patchset is a misc update of remoteproc_core.c.
> Patch 1: Drop a pointless initialization to variable ret
> Patch 2-3: Cleanup the included headers
> Patch 4: Remove export of rproc_va_to_pa
> 
> I am also reviewing the rproc->lock usage and thinking whether we
> need to add a lockdep_assert_held for some functions that should have
> lock held. But not sure.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Drop patch 4: Use cleanup API. Because there is a deadlock issue
>   reported, need review the lock usage before the cleanup.
> - Drop patch 6 & 7: Use bitfield for bool
> - Add A-b from Andrew
> 
> Changes in v2:
> - Add patch 6 "remoteproc: stm32: Avoid directly taking address of auto_boot"
>   to address stm32_rproc.c build issue
> - Link to v1: https://lore.kernel.org/r/20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
>       remoteproc: core: Sort header includes
>       remoteproc: core: Removed unused headers
>       remoteproc: core: Remove unused export of rproc_va_to_pa
>

I have applied this set.

Thanks,
Mathieu
 
>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> ---
> base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
> change-id: 20251016-rproc-cleanup-v3-330464eee32e
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
