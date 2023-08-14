Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A317784737
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58795C6DD64;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2BA8C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=2P1CtK0EpHYNB0bkUEbNbkfg4BjOcYJ3BMKesAvDyvc=; 
 t=1691999789; x=1693209389; b=oBSxXltF6cKu5d1KDBfuaDfOZs1dyrJT2DDk/xeiT39ZKEE
 JIwSPMykbvmCtJzIGSyWHDt6GkQfnoY7q6vTH28LFYP2DXoE205F+ZQn4TLk58vKbjgb5udOO6ASr
 tUeuY5/rK9XkdJ7Q0vZpwXM4iYODipsnI0K8oO7dmXpQKiz7cKTdUNuzemBE7AwPxMeeVakUHlmkJ
 gQJQJhiW3r9BN+V1qRfARMJSeHT/Utx+kUyNqudkY4rAWZZTRTb84yoMQttyr+J2Ukzyvnrm/W861
 ZQ8SStJgmGxpkROdfhEPziqwneNLZFPHtAoghpsB0kF1v0k3llpGvQuuuNJPtFMQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qVSQ8-006VTj-1d; Mon, 14 Aug 2023 09:55:24 +0200
Message-ID: <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Ratheesh Kannoth <rkannoth@marvell.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 09:54:56 +0200
In-Reply-To: <20230814060411.2401817-1-rkannoth@marvell.com>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: jolsa@kernel.org, joabreu@synopsys.com, linux-hyperv@vger.kernel.org,
 error27@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
 alexanderduyck@fb.com, ast@kernel.org, andrii@kernel.org,
 ryder.lee@mediatek.com, edumazet@google.com, grygorii.strashko@ti.com,
 sdf@google.com, thomas.petazzoni@bootlin.com, gerhard@engleder-embedded.com,
 kys@microsoft.com, horatiu.vultur@microchip.com, wei.liu@kernel.org,
 mw@semihalf.com, sstabellini@kernel.org, shradhagupta@linux.microsoft.com,
 daniel@iogearbox.net, oleksandr_tyshchenko@epam.com,
 linux-rdma@vger.kernel.org, martin.lau@linux.dev, longli@microsoft.com,
 decui@microsoft.com, linux@armlinux.org.uk, UNGLinuxDriver@microchip.com,
 kvalo@kernel.org, xen-devel@lists.xenproject.org, sbhatta@marvell.com,
 shenwei.wang@nxp.com, xiaoning.wang@nxp.com, linux-imx@nxp.com,
 simon.horman@corigine.com, linux-wireless@vger.kernel.org, kuba@kernel.org,
 mengyuanlou@net-swift.com, yisen.zhuang@huawei.com, richardcochran@gmail.com,
 linux@roeck-us.net, p.zabel@pengutronix.de, jgross@suse.com,
 hkelam@marvell.com, jdelvare@suse.com, maciej.fijalkowski@intel.com,
 hawk@kernel.org, gakula@marvell.com, haiyangz@microsoft.com,
 sean.wang@mediatek.com, jaswinder.singh@linaro.org, kpsingh@kernel.org,
 jiawenwu@trustnetic.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 matthias.bgg@gmail.com, michael.chan@broadcom.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-hwmon@vger.kernel.org, haoluo@google.com, salil.mehta@huawei.com,
 pabeni@redhat.com, leon@kernel.org, song@kernel.org, lorenzo@kernel.org,
 ilias.apalodimas@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 lgirdwood@gmail.com, Mark-MC.Lee@mediatek.com, vladimir.oltean@nxp.com,
 aleksander.lobakin@intel.com, linyunsheng@huawei.com, broonie@kernel.org,
 yang.lee@linux.alibaba.com, sgoutham@marvell.com, mcoquelin.stm32@gmail.com,
 wei.fang@nxp.com, shayne.chen@mediatek.com, saeedm@nvidia.com,
 davem@davemloft.net, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH v1 net] page_pool: Cap queue size to 32k.
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

On Mon, 2023-08-14 at 11:34 +0530, Ratheesh Kannoth wrote:
> Clamp to 32k instead of returning error.
> 
> Please find discussion at
> https://lore.kernel.org/lkml/
> CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
> namprd18.prod.outlook.com/T/
> 

I'm not the one who's going to apply this, but honestly, I don't think
that will work as a commit message for such a change ...

Sure, link to it by all means, but also summarize it and make sense of
it for the commit message?

johannes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
