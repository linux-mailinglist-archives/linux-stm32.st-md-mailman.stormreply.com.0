Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BF784738
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78143C6DD67;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFAA2C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 08:46:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5842C635A5;
 Mon, 14 Aug 2023 08:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9824C433C7;
 Mon, 14 Aug 2023 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692002760;
 bh=B3y8EHsDG3ckVBJqhMu+4wNcutKVET22OPIzB3BHlZ0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=IAwz4csbyfvh6Sc60rY3F4KQBQhcpuI6oJ+2qyYb1X2EbPWPD3nk515LAGsCCsdua
 /RrfgQ8LZe60yxmHXmLqV2iNhQXTZt2yJNHTUAdt5j2LnL1x91+2f5crAXVuXr7I+M
 4yclnHX6puLJ4n3dhyx6fFlKoAJrUyCEJEOmcFpwYcb5oz6hDBAECRGUtxHoU2pTIO
 MFGXP339tDE3ExQFau5AQwyOMqlNhNAVCuVXJbJGJti/5BtYxFL5HOtTmPoxvb3ZI5
 /6NUgd6v072+ZFgYjyLs9xp0kxcFYsd108Ld5M+KyiFrmZ+S1cmRAt8Vy6EnHsgF6C
 14tNDLeY82NTw==
Message-ID: <cceef8a4-6f38-bfd4-4f77-5dffa558b287@kernel.org>
Date: Mon, 14 Aug 2023 10:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Ratheesh Kannoth <rkannoth@marvell.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
 <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
 <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: "jolsa@kernel.org" <jolsa@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "error27@gmail.com" <error27@gmail.com>,
 "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "alexanderduyck@fb.com" <alexanderduyck@fb.com>,
 "ast@kernel.org" <ast@kernel.org>, "andrii@kernel.org" <andrii@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "sdf@google.com" <sdf@google.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "horatiu.vultur@microchip.com" <horatiu.vultur@microchip.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "mw@semihalf.com" <mw@semihalf.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "longli@microsoft.com" <longli@microsoft.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Subbaraya Sundeep Bhatta <sbhatta@marvell.com>,
 "shenwei.wang@nxp.com" <shenwei.wang@nxp.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "simon.horman@corigine.com" <simon.horman@corigine.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>,
 "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "jgross@suse.com" <jgross@suse.com>, Hariprasad Kelam <hkelam@marvell.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "maciej.fijalkowski@intel.com" <maciej.fijalkowski@intel.com>, hawk@kernel.org,
 Geethasowjanya Akula <gakula@marvell.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "jiawenwu@trustnetic.com" <jiawenwu@trustnetic.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "john@phrozen.org" <john@phrozen.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "michael.chan@broadcom.com" <michael.chan@broadcom.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "haoluo@google.com" <haoluo@google.com>,
 "salil.mehta@huawei.com" <salil.mehta@huawei.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "leon@kernel.org" <leon@kernel.org>,
 "song@kernel.org" <song@kernel.org>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "Mark-MC.Lee@mediatek.com" <Mark-MC.Lee@mediatek.com>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>,
 "linyunsheng@huawei.com" <linyunsheng@huawei.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "yang.lee@linux.alibaba.com" <yang.lee@linux.alibaba.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "wei.fang@nxp.com" <wei.fang@nxp.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "saeedm@nvidia.com" <saeedm@nvidia.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "nbd@nbd.name" <nbd@nbd.name>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v1 net] page_pool: Cap queue
	size to 32k.
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



On 14/08/2023 10.05, Ratheesh Kannoth wrote:
>> From: Johannes Berg <johannes@sipsolutions.net>
>> Subject: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
>>> Please find discussion at
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_l
>>>
>> I'm not the one who's going to apply this, but honestly, I don't think that will
>> work as a commit message for such a change ...
>> Sure, link to it by all means, but also summarize it and make sense of it for
>> the commit message?
> 
> Why do you think it will not work ?. There is a long discussion about pros and cons of different approaches by
> Page pool maintainers in the discussion link.  However I  summarize it here, as commit message, it will
> Lead to some more questions by reviewers.
> 

I agree with Johannes, this commit message is too thin.

It makes sense to give a summary of the discussion, because it show us
(page_pool maintainers) what you concluded for the discussion.

Further more, you also send another patch:
  - "[PATCH net-next] page_pool: Set page pool size"
  - 
https://lore.kernel.org/all/20230809021920.913324-1-rkannoth@marvell.com/

That patch solves the issue for your driver marvell/octeontx2 and I like
than change.

Why did you conclude that PP core should also change?

--Jesper
(p.s. Cc/To list have gotten excessive with 89 recipients)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
