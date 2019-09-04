Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83781A83A2
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 15:21:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8B70C24023;
	Wed,  4 Sep 2019 13:21:04 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) (using TLSv1.2 with cipher RC4-SHA (112/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A92F6C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1567602978; x=1599138978;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dVPgUqN88hiyFCDUl2n0H4GWl7kQ/LvDY+M8i0q+25Y=;
 b=VZ3WoOwZpRNbBzyask86p+s4bzhM8s3rmsabMlkwyJH3M21cXVQCp8uw
 wTHlnw8VLhZerNNEdVY59ltyzNsefsAk0t6RL2XdWQBV4jcjYOxAWB1x5
 rLSrxKCRKFhsCPtzFe4rAzF2EfZr+EJ8mF79yr+8z7QKIPk+FoNiHNa48 Y=;
X-IronPort-AV: E=Sophos;i="5.64,467,1559520000"; d="scan'208";a="700658012"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Sep 2019 13:16:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3E81BA215A; Wed,  4 Sep 2019 13:16:11 +0000 (UTC)
Received: from EX13D01EUB001.ant.amazon.com (10.43.166.194) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Sep 2019 13:16:10 +0000
Received: from [10.88.66.45] (10.43.160.149) by EX13D01EUB001.ant.amazon.com
 (10.43.166.194) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Wed, 4 Sep
 2019 13:15:54 +0000
To: YueHaibing <yuehaibing@huawei.com>, <miquel.raynal@bootlin.com>,
 <rui.zhang@intel.com>, <edubezval@gmail.com>, <daniel.lezcano@linaro.org>,
 <amit.kucheria@verdurent.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
 <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <mmayer@broadcom.com>, <computersforpeace@gmail.com>,
 <gregory.0xf0@gmail.com>, <matthias.bgg@gmail.com>, <agross@kernel.org>,
 <heiko@sntech.de>, <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <marc.w.gonzalez@free.fr>, <mans@mansr.com>, <jun.nie@linaro.org>,
 <shawnguo@kernel.org>, <phil@raspberrypi.org>, <gregkh@linuxfoundation.org>,
 <david.hernandezsanchez@st.com>, <horms+renesas@verge.net.au>,
 <wsa+renesas@sang-engineering.com>, <linux-pm@vger.kernel.org>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-14-yuehaibing@huawei.com>
From: Talel Shenhar <talel@amazon.com>
Message-ID: <228fdf20-9f3a-4809-6fed-448e2bb349d3@amazon.com>
Date: Wed, 4 Sep 2019 16:15:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904122939.23780-14-yuehaibing@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.149]
X-ClientProxiedBy: EX13D08UWC003.ant.amazon.com (10.43.162.21) To
 EX13D01EUB001.ant.amazon.com (10.43.166.194)
Precedence: Bulk
X-Mailman-Approved-At: Wed, 04 Sep 2019 13:21:03 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 ronenk@amazon.com, bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next 13/15] thermal: thermal_mmio: use
 devm_platform_ioremap_resource() to simplify code
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
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

Thanks.

Talel.

On 9/4/19 2:29 PM, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-By: Talel Shenhar <talel@amazon.com>
> ---
>   drivers/thermal/thermal_mmio.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
