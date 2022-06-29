Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01124560041
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 14:39:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A59BFC5F1EE;
	Wed, 29 Jun 2022 12:39:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C066C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 12:39:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A84183C96;
 Wed, 29 Jun 2022 14:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656506387;
 bh=LIPOVh1YMmNB627FkwWK8FBNfvCEoeGmN/umIjoCr3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N9JQ4n48xRFj2gejuje2F8kSHSZcLtA4BjBVXC9Mhiyyk0wuSp2krZhlX7ZTifdak
 ZUxS2LoCiDTZsSsFBOmfdyIm8Rbeh50ZrqiKzJpgzu4iOwFFsR9+eB3G0Y8zNNDXCp
 nwOyWlNgkRmjbEi2dV+CWc2HTXPFPN5n0tD4Tpzkm3SGVDTNcowQt2MwkrZZIMGpfk
 2SIoucCMRu4KRJ8v1bzoUJTvEUt/1ZCykWrPhExlRARExLmv/GT2TJyBq07rT/zyn9
 LdV/8CKMBLRaF39i0AuLf+gZEJ83z9YTPZaZFnEHWRK29urImFWHbZzSbHzaLfipm9
 21/2y7d3yr7uw==
Message-ID: <a2e45188-54d2-1ef2-1d21-cf60d47aeb43@denx.de>
Date: Wed, 29 Jun 2022 14:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <32f04271-4a9a-3291-cf36-ead0383db9ca@ideasonboard.com>
 <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
 <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
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

On 6/29/22 14:26, Tomi Valkeinen wrote:

[...]

>>> Perhaps the best way to solve this is just to remove the underscores
>>> from __v4l2_subdev_state_alloc, and change all the drivers which create
>>> temporary v4l2_subdev_states to use that (and the free) functions. And
>>> also create the helper macro which can be used in those cases where the
>>> call is simple (the state is not modified or accessed by the caller).
>>
>> As long as we prevent any new driver from using that API, that's fine
>> with me.
> 
> An alternative would be to keep the v4l2_subdev_state as a local 
> variable (allocated in the stack), and add a new function, 
> v4l2_subdev_state_local_init() or such. The function would initialize 
> the given state, expecting the allocatable fields to be already 
> allocated (state->pads, which in the above cases points to another local 
> variable, i.e. stack).
> 
> This would prevent the need of a free call, which, while not complex as 
> such, might cause a bigger amount of changes in some cases to handle the 
> error paths correctly.
> 
> Of course, if the above-mentioned macro works, then that's the easiest 
> solution. But that won't work for all drivers.

Don't you think a driver fix shouldn't involve "rework the subsystem" 
requirement to be applicable ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
