Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7908493A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2019 12:16:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B186C35E02;
	Wed,  7 Aug 2019 10:16:03 +0000 (UTC)
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CC76C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Aug 2019 10:16:02 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747]
 ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
 by smtp-cloud9.xs4all.net with ESMTPA
 id vIz9hkTa7AffAvIzBh7ksg; Wed, 07 Aug 2019 12:16:01 +0200
To: Hugues Fruchet <hugues.fruchet@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <28a2a9ac-d5b9-a312-616a-620e0385cf66@xs4all.nl>
Date: Wed, 7 Aug 2019 12:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCP9LqKEIJwW0pIhFdbw6tGpB9o9mbS/qErOZQWhGe5Bzq7r6mVey37KBsvPv5vRS+rwW4N5qvZSOS4HYAHC9TbGd7KxoLiLiXGiTEb4+kK7x5xBPXQF
 BEKx6sgrIvZ0Uk2csPHS/u6dM4/EZ5RzZJMoc3sSL2Ftnd5D30a8380raWQ37PDsgqgo+XwyUsC8ecezUORYKUaiu8AlQFpK7NcZ2kqkqGNoNRUqkL5lv6/E
 6rGGcxbPLAgjVmhsp7xtoJB/0/1nhlIxo/nNlOLvN8hVjXTEb7mxhtCkYIC4PnrI0k7Uco9RR/DSvYRlVtiOp0g8QbNMcYWGmMKQMmlbdATwpMwb6+o9/PKB
 0f7OS+bm6jQC/JXUbtu66bq5e6dE+yd97Z+6+FMEUJMTDM6wT3RRAIFhkLAiFFivFkidzKEf81ZgWil9qupnniOLQrlviMaJxsrpGfXVuc/yafzDWGVoJxqP
 D3R2drlaxdCqAOIL1KqFuKS83fDDdoqFITo/xflSSwF5DDCAWnMaPTA/NzI97hMd3xRm78K1xATAN3zdgSDiuBna7qJ7k6d/keAn6jL4hVk/lTEMkAb4f45i
 2MTqZy5jWM31PmqA90PGPUrXraELt3plhtT7xGq0dbSWVDd8k3RdHKG0EZyFASMtmNcJXDWCzo/KHUDfoovEGU1MmAHiSUcGg8zzov+mAvBSslhhkZbWLqGt
 AVIwa0VN8r0=
Cc: Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] DCMI bridge support
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

Hi Hugues,

Can you provide the output of the most recent v4l2-compliance?

Use 'v4l2-compliance -s'.

Also, just to confirm, with this v4 there are no /dev/mediaX or
/dev/v4l-subdevX devices created anymore, right?

This v4 looks good to me, I just want to have these final checks
done.

Regards,

	Hans

On 7/31/19 2:56 PM, Hugues Fruchet wrote:
> This patch serie allows to connect non-parallel camera sensor to
> DCMI thanks to a bridge connected in between such as STMIPID02 [1].
> 
> Media controller support is introduced first, then support of
> several sub-devices within pipeline with dynamic linking
> between them.
> In order to keep backward compatibility with applications
> relying on V4L2 interface only, format set on video node
> is propagated to all sub-devices connected to camera interface.
> 
> [1] https://www.spinics.net/lists/devicetree/msg278002.html
> 
> ===========
> = history =
> ===========
> version 4:
>   - Also drop subdev nodes registry as suggested by Hans:
>     https://www.spinics.net/lists/arm-kernel/msg743375.html
> 
> version 3:
>   - Drop media device registry to not expose media controller
>     interface to userspace as per Laurent' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153417.html
>   - Prefer "source" instead of "sensor" and keep it in 
>     dcmi_graph_entity struct, move asd as first member
>     of struct as per Sakari' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153119.html
>   - Drop dcmi_graph_deinit() as per Sakari' suggestion:
>     https://www.spinics.net/lists/linux-media/msg153417.html
> 
> version 2:
>   - Fix bus_info not consistent between media and V4L:
>     https://www.spinics.net/lists/arm-kernel/msg717676.html
>   - Propagation of format set on video node to the sub-devices
>     chain connected on camera interface
> 
> version 1:
>   - Initial submission
> 
> Hugues Fruchet (3):
>   media: stm32-dcmi: improve sensor subdev naming
>   media: stm32-dcmi: add media controller support
>   media: stm32-dcmi: add support of several sub-devices
> 
>  drivers/media/platform/Kconfig            |   2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c | 283 +++++++++++++++++++++++++-----
>  2 files changed, 236 insertions(+), 49 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
