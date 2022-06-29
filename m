Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8B55FE14
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 13:04:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48ACCC628A4;
	Wed, 29 Jun 2022 11:04:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 016ECC628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 11:04:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AB874801C3;
 Wed, 29 Jun 2022 13:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656500680;
 bh=Itm2HcTS0UVX0IwR2cN/zN3rDcTcHySEnwbQlGTUGvE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QWsrGxA6yKjNj+CN6I/xPwkYnROQoLKwfd5Srsnq11iN0gIm7LwDeA643vS6fKuh/
 6STbhwSRX2slI7UnmbUOT940hulObf+w2F8qYjI5zRFRoLxDbGBxxzU0tB0qwtZcsm
 M0/bc4HrluHnnZhHBveFaIwLNUHEoBaJeSYFSvNVh5bobIKd1fzG+yYrbWXaIxHAsh
 +GJS56xgCScKjcY4Qz/z1TU5g5VSdBT6usTjq+Jqn+CKj91N72IT6ZD+0o9BFYvHzj
 9xtVPGFycsmDpa6vPHoOcmRF6A3V9hpDyVsyB/3yqVFahASvTvWyngtBCApQ0Jym07
 VCttic8lmeFHg==
Message-ID: <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
Date: Wed, 29 Jun 2022 13:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

On 6/29/22 11:41, Hans Verkuil wrote:
> Hi Marek, Tomi, Laurent,

Hi,

[...]

>>   drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
>>   1 file changed, 37 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
>> index c604d672c2156..c68d32931b277 100644
>> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
>> @@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>>   			struct dcmi_framesize *sd_framesize)
>>   {
>>   	const struct dcmi_format *sd_fmt;
>> +	static struct lock_class_key key;
>>   	struct dcmi_framesize sd_fsize;
>>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>> -	struct v4l2_subdev_pad_config pad_cfg;
>> -	struct v4l2_subdev_state pad_state = {
>> -		.pads = &pad_cfg
>> -		};
>> +	struct v4l2_subdev_state *sd_state;
>>   	struct v4l2_subdev_format format = {
>>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>>   	};
>>   	bool do_crop;
>>   	int ret;
>>   
>> +	/*
>> +	 * FIXME: Drop this call, drivers are not supposed to use
>> +	 * __v4l2_subdev_state_alloc().
>> +	 */
>> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
>> +	if (IS_ERR(sd_state))
>> +		return PTR_ERR(sd_state);
>> +
> 
> I've been reading the discussion for the v1 patch, and I seriously do not like this.
> 
> My comments are not specifically for this patch, but for all cases where
> __v4l2_subdev_state_alloc is called.
> 
> It is now used in 4 drivers, so that's no longer a rare case, and the code isn't
> exactly trivial either.
> 
> I think a helper function might be beneficial, but the real problem is with the
> comment: it does not explain why you shouldn't use it and what needs to be done
> to fix it.
> 
> My suggestion would be to document that in the kerneldoc for this function in
> media/v4l2-subdev.h, and then refer to that from this comment (and similar comments
> in the other drivers that use this).

Would it be OK if I left the core rework/documentation to Tomi as a 
subsequent patch to this one ?

> And another question: are more drivers affected by this? Is it possible to
> find those and fix them all?

Probably, I only ran into it with the DCMI so far.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
