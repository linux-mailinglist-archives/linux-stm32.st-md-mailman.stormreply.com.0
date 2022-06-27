Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78855B959
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 13:30:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0459FC04004;
	Mon, 27 Jun 2022 11:30:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD04C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 11:30:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C7A6C83C70;
 Mon, 27 Jun 2022 13:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656329430;
 bh=PNJWeluzCFC9fqpkPX1hueWxRzJxtppdWn2vMDgtqVo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CX2LJjcpznGAa8VOWJF2DVYDku4/vBrvAw7aFP5BIMpfXZWho1Tv2Gwgks4Y9lKZj
 Kvohc3LTldK9Qq7ngliBJ+GBOuSY69eP1J07uYJHaSYJo2TETEmUsut5MVBnS4rGn5
 VAZ2h5QO80Ra2BBUCelZWXZDEx3My44KTc0IRxolkdIZeqVZcCVuglCJtm+phDfw6v
 kqLWsSVSL1ApkMDx+B7+zWHybHKcNkl1+gQIXXuj13oPDGJvc8H5Mx6d4BgwC2aPzb
 EItwg10yWbLBswty/k73cIKmzxuYX8Cw8B6CBeSvI7RCuw42V6wxk0T5XlzZxHnAiU
 yAKHYZK+ahZ7Q==
Message-ID: <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
Date: Mon, 27 Jun 2022 13:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Alain Volmat <alain.volmat@foss.st.com>,
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

On 6/27/22 11:14, Hugues FRUCHET wrote:
> Hi Marek,

Hi,

>>>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>>>> Any local subdev state should be allocated and free'd using
>>>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>>>> takes care of calling .init_cfg() subdev op. Without this,
>>>>> subdev internal state might be uninitialized by the time
>>>>> any other subdev op is called.
>>>
>>> Does this fix a bug you have?
>>
>> Yes
> 
> Which bug did you encounter exactly ?

The DCMI driver does set_fmt subdev call on the sensor driver instance.

The mt9p031 sensor driver set_fmt depends on crop rectangle to be 
initialized _before_ set_fmt subdev call is made. Currently this 
initialization is done in open callback, which is too late, so when the 
DCMI does set_fmt subdev call, it operates on uninitialized private data.

There is patch to mt9p031 driver which move the initialization to the 
right place in .init_cfg:
[PATCH v2] media: mt9p031: Move open subdev op init code into init_cfg

However, the .init_cfg is not called by DCMI right now. For that to be 
called in the right place, __v4l2_subdev_state_alloc() must be added, 
hence this patch.

You won't trigger the problem on OV5640 because that one driver does not 
implement .init_cfg v4l2_subdev_ops .

> This is strange that we have not yet encounter any problems around that 
> through our tests campaigns... or we have to enforce with a new test, so 
> better to know what your problem was exactly.

You need a sensor driver which implements struct v4l2_subdev_ops 
.init_cfg and then have something in set_fmt depend on the 
initialization done in the .init_cfg callback . Then you would see the 
problem.

>>> Wasn't this broken even before the active state, as init_cfg was not 
>>> called?
>>
>> Yes, this was always broken. I suspect nobody tested this mode of 
>> operation before. In my case, I have this DCMI driver connected 
>> directly to MT9P006 sensor.
> 
> As far as I see, MT9P006 sensor is a 12 bits parallel interface sensor.
> I don't see the difference with our OV5640 used in parallel mode which 
> is a mainline config on our side, so one more time I wonder what the 
> problem was.

See above.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
