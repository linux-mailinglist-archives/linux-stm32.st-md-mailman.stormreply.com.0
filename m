Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83915514A3
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 11:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 892CAC5662F;
	Mon, 20 Jun 2022 09:44:08 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90BF3C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:44:07 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0092B883;
 Mon, 20 Jun 2022 11:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655718246;
 bh=bwhdDDIn0wE1jCXQa2c1jI5Ynk/nP/b2jXFdZNQ4YcM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a/7AT3DzSlrIME+rcykB4O5vb++KQcLnWQxb3+04dWw7PUKXwH/G9A+0PqAecM4uc
 /wpUIUf2UbCw9INfSWRaiFXE8d6miOAj8rk/ek0OOv5QfOE72FE4GQomp4p1PbAdgR
 PPy4AQpCEHcNSlTGNDquvmnCBnxXj7m6Rk4+sy1k=
Message-ID: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
Date: Mon, 20 Jun 2022 12:44:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Switch to
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

Hi,

On 19/06/2022 02:16, Laurent Pinchart wrote:
> Hi Marek,
> 
> CC'ing Tomi to get his opinion.
> 
> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>> Any local subdev state should be allocated and free'd using
>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>> takes care of calling .init_cfg() subdev op. Without this,
>> subdev internal state might be uninitialized by the time
>> any other subdev op is called.

Does this fix a bug you have? Wasn't this broken even before the active 
state, as init_cfg was not called?

In any case, I think we have to do something like this, as the source 
subdev might depend on a valid subdev state.

It's not very nice to have the drivers using __v4l2_subdev_state_alloc, 
though. But if non-MC drivers are not going away, and if they are going 
to be calling ops in other subdevs with V4L2_SUBDEV_FORMAT_TRY, they 
need to pass a valid subdev state...

I don't see a better way right away, so I think this is fine.

Do we need a v4l2_subdev_call_state_try(), similar to 
v4l2_subdev_call_state_active()? It would handle allocating the state, 
calling the op and freeing the state.

  Tomi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
