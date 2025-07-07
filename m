Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B7AFB0EB
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jul 2025 12:15:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 670E5C3F92E;
	Mon,  7 Jul 2025 10:15:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC401C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jul 2025 10:15:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676FZb1022788;
 Mon, 7 Jul 2025 12:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 M+uhJcJDTeJCAUeixIicqUqHNPuuMmXwRPR3UP1fAmM=; b=qa/jqMjNzLnoNdla
 J8gS5RL+QKKO2XkLCjN1Dd1OFZalOvLdthzFGzbzKNCrkE5b+Ck8ShWM9wT3Hcgk
 fyKnJggAL2QWHo/tQpb4DWqE+1O6KxhnJZJPllEqH/KtQ54t6G7qdb3HinT2xvYK
 7cm/3L2Dhe84flz9gvspRWEVXDcz5AJLAVa4it5nqaU1zsjuk9FoC+WN47Pzt8H/
 q76kIXGyHHPxiBYBSbCQvnl2aXetkDNUnMcp/K6iqGshBxLlfgAMIZxxEP1fWexI
 rTOlSIEGxIUVt1DhjqJLUUbVPbjejAuyPa+egSUHsCKJVyHQGleIjiG5qTqBXGr9
 4dKz0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfm84re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jul 2025 12:14:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E636440056;
 Mon,  7 Jul 2025 12:13:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C7BEAC4AF2;
 Mon,  7 Jul 2025 12:12:18 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 12:12:17 +0200
Date: Mon, 7 Jul 2025 12:12:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250707101211.GA984919@gnbcxd0016.gnb.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] Fix STM32 I2C dma operations
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Cl=E9ment,

On Fri, Jul 04, 2025 at 10:39:13AM +0200, Cl=E9ment Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v4:
> - Patch[1]: Remove all `chan_dev` variable occurrencies
> - Patch[2]:
>     - Refine commit message
>     - Use the dma_callback to factorize the code
> - Patch[3]: Refine commit message
> - Link to v3: https://lore.kernel.org/r/20250630-i2c-upstream-v3-0-7a23ab=
26683a@foss.st.com
> =

> Changes in v3:
> - Add Alain Volmat's "Acked-by" on patch 1 and 2
> - Link to v2: https://lore.kernel.org/r/20250627-i2c-upstream-v2-0-8c1452=
3481dc@foss.st.com
> =

> Changes in v2:
> - Fix the dev used in dma_unmap also in the error path of
>   `stm32_i2c_prep_dma_xfer`
> - Add a dma_unmap_single also in the ITs error handler
> - Add Alain Volmat's "Acked-by" on patch 3
> - Link to v1: https://lore.kernel.org/r/20250616-i2c-upstream-v1-0-42d3d5=
374e65@foss.st.com
> =

> ---
> Cl=E9ment Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
> =

>  drivers/i2c/busses/i2c-stm32.c   |  8 +++---
>  drivers/i2c/busses/i2c-stm32f7.c | 56 +++++++++++++++++++++-------------=
------
>  2 files changed, 33 insertions(+), 31 deletions(-)
> ---

Thanks for this new version of the serie.
This all looks good to me. My Acked-by are already set since v3 so
nothing more from me.

Regards,
Alain

> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250527-i2c-upstream-e5b69501359a
> =

> Best regards,
> --  =

> Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
