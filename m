Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291D551D72
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 16:08:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1EA3C57183;
	Mon, 20 Jun 2022 14:08:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 210AAC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 14:08:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A749B80F88;
 Mon, 20 Jun 2022 16:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655734102;
 bh=QQNcmKoudaeAE0KDeOwf0y2ZSp7ZdBwqrQf2urCx8Qk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qf3TGyPd4h2eL+DvkBSC0ROyhpeI8cBM7LzNMpnIsH+eJyc2J84/KZhxu9SY0YIzN
 kSyQCImFfYQiLjDKUTymZiL4qi1MUKuiS2vZ4EGNCMxr/CGCAn3O2sv2m4NwZqwSC0
 mFE1ZxuoOy8m/qfH5dk5VVGtAwcy9g3OoClXjCt/y/0M922Lha2N5cU9Br7SoTwuSx
 hDkxcPS9JZR36tIX43k5tpdgymMu0YrDnVrlX1SZruXA4Soar27ronObvYBaYyuYGm
 NlQma/I89GhmpSX9CqNgvLt4SaOUfEMo0x4W1PKg6wP5axp6WRODhyMNaJrK+bmYx7
 GarMzN8ykpTHw==
Message-ID: <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
Date: Mon, 20 Jun 2022 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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

On 6/20/22 11:44, Tomi Valkeinen wrote:
> Hi,

Hello all,

>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>> Any local subdev state should be allocated and free'd using
>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>> takes care of calling .init_cfg() subdev op. Without this,
>>> subdev internal state might be uninitialized by the time
>>> any other subdev op is called.
> 
> Does this fix a bug you have?

Yes

> Wasn't this broken even before the active 
> state, as init_cfg was not called?

Yes, this was always broken. I suspect nobody tested this mode of 
operation before. In my case, I have this DCMI driver connected directly 
to MT9P006 sensor.

> In any case, I think we have to do something like this, as the source 
> subdev might depend on a valid subdev state.

Right.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
