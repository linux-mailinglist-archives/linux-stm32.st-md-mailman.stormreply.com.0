Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6773A47F5
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 19:36:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAFF2C58D5B;
	Fri, 11 Jun 2021 17:36:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92375C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 17:36:00 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 292F960E0C;
 Fri, 11 Jun 2021 17:35:47 +0000 (UTC)
Date: Fri, 11 Jun 2021 18:37:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: trix@redhat.com
Message-ID: <20210611183743.6f65100f@jic23-huawei>
In-Reply-To: <20210610214438.3161140-7-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-7-trix@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: zhangqing@loongson.cn, mholenko@antmicro.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, jiaxun.yang@flygoat.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 shorne@gmail.com, lars@metafoo.de, chenhuacai@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, gsomlo@gmail.com,
 linux-arm-kernel@lists.infradead.org, pczarnecki@internships.antmicro.com,
 lukas.bulwahn@gmail.com, tomas.winkler@intel.com, devicetree@vger.kernel.org,
 arnd@arndb.de, sean.wang@mediatek.com, ryder.lee@mediatek.com,
 linux-mediatek@lists.infradead.org, davidgow@google.com, kuba@kernel.org,
 apw@canonical.com, Soul.Huang@mediatek.com, kvalo@codeaurora.org,
 tsbogend@alpha.franken.de, jbhayana@google.com, lorenzo.bianconi83@gmail.com,
 gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 dwaipayanray1@gmail.com, joe@perches.com, shayne.chen@mediatek.com,
 davem@davemloft.net, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH 5/7] iio/scmi: fix spelling of SPDX tag
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

On Thu, 10 Jun 2021 14:44:36 -0700
trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> Remove the extra spaces.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Applied this one to the togreg branch of iio.git (initially pushed out as testing
to let 0-day have first poke at it).  Thanks,

Jonathan

> ---
>  drivers/iio/common/scmi_sensors/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/common/scmi_sensors/Makefile b/drivers/iio/common/scmi_sensors/Makefile
> index f13140a2575a4..645e0fce1a739 100644
> --- a/drivers/iio/common/scmi_sensors/Makefile
> +++ b/drivers/iio/common/scmi_sensors/Makefile
> @@ -1,4 +1,4 @@
> -# SPDX - License - Identifier : GPL - 2.0 - only
> +# SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Makefile for the IIO over SCMI
>  #

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
