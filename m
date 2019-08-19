Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CD91F36
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2019 10:43:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA64C35E01;
	Mon, 19 Aug 2019 08:43:20 +0000 (UTC)
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABEDBC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2019 08:43:19 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id zdFuhLYKWDqPezdFxhnQeg; Mon, 19 Aug 2019 10:43:19 +0200
To: Hugues Fruchet <hugues.fruchet@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
Date: Mon, 19 Aug 2019 10:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfH+ohgSwKLOrkTCl8qsJ7Y57Hym1F4F9FyCoyVRp/fBrw7CsqXSSkud9Lcf/tqU+l68nNtkRppyvDraao0dc4GoqELCakj53fmo0M9Xtt+xZB/ZAMN9/
 6llV9015cHgtvqEwpxTEWRgxKzhtBL2OT8JR9Ls2JJ6CEETn5xfOHl0278TnlfQq3CrK+WlqvopZ65Z1/gko+rJUnnTTYx83lu48dLzTfGHGFVNrxzKcdO5z
 IjNy1J5RQGb10psoVY1YXoBZH6GyoIAaP2WLonYyM6eYqy9o97MMfYicolvwFJ/HmBVW4SBSGOHuS08UNvnUNpfZZlK6Dz0xjbwE/hHhbyREyKqfBDBKqkwG
 gP7AF1fGzRetJTkYJfl+8Y20ohRW7IZ6YSHFOV4twVIfVqFjNaoNG0ax01yaOhUYSKCW9e9Qc5+CJv/lcV+sOUZnqyg0PY9uWpoQ9rChkqOmtiY0J4QHDIrF
 3gw5+h+hq8Gq8RkChTvY5s9NrcTByHSTsrw1oTaaF0PXdcF/2sqgx+KrucLdy5JwzpY/y6gcHLhg3fB+jOYm6XERNz0JU8TCOzxL73Mcu/YfZZz8IUDiwuNT
 cU/3DMUtDsuQsCxI3QCFDYm/
Cc: Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 0/4] DCMI bridge support
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

On 8/19/19 10:41 AM, Hugues Fruchet wrote:
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
> version 7:
>   - minor fix on 80 char trace message

v6 is already in a pending PR. I don't really want to make a new
PR just for a 80 char warning.

It can always be done in a follow-up patch.

Regards,

	Hans

> 
> version 6:
>   - As per Sakari remark: add a FIXME explaining that this
>     version only supports subdevices which expose RGB & YUV
>     "parallel form" mbus code (_2X8)
>   - Add some trace around subdev_call(s_fmt) error & format
>     changes to debug subdev which only expose serial mbus code
>   - Conform to "<name>":<pad index> when tracing subdev infos
> 
> version 5:
>   - Remove remaining Change-Id
>   - Add Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
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
> Hugues Fruchet (4):
>   media: stm32-dcmi: improve sensor subdev naming
>   media: stm32-dcmi: trace the supported fourcc/mbus_code
>   media: stm32-dcmi: add media controller support
>   media: stm32-dcmi: add support of several sub-devices
> 
>  drivers/media/platform/Kconfig            |   2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c | 318 +++++++++++++++++++++++++-----
>  2 files changed, 268 insertions(+), 52 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
