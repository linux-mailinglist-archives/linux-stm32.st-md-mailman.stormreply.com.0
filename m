Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCD3E90FE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 14:28:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35388C5A4CD;
	Wed, 11 Aug 2021 12:28:37 +0000 (UTC)
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E53C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 12:28:33 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
 rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86113c2646ba-64866;
 Wed, 11 Aug 2021 20:28:22 +0800 (CST)
X-RM-TRANSID: 2ee86113c2646ba-64866
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.26.114] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46113c265114-3fc53;
 Wed, 11 Aug 2021 20:28:22 +0800 (CST)
X-RM-TRANSID: 2ee46113c265114-3fc53
To: Mark Brown <broonie@kernel.org>
References: <20210811115523.17232-1-tangbin@cmss.chinamobile.com>
 <20210811115846.GC4167@sirena.org.uk>
 <7ddb13ee-2ca6-bf8d-2a83-9896d29176c5@cmss.chinamobile.com>
 <20210811121955.GD4167@sirena.org.uk>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <d0fa7aa5-b64b-7d4a-a80d-ec2f6dec5712@cmss.chinamobile.com>
Date: Wed, 11 Aug 2021 20:28:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210811121955.GD4167@sirena.org.uk>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: spdifrx: Delete unnecessary
 check in the probe function
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

Hi Mark:

On 2021/8/11 20:19, Mark Brown wrote:
> On Wed, Aug 11, 2021 at 08:09:00PM +0800, tangbin wrote:
>> On 2021/8/11 19:58, Mark Brown wrote:
>>> On Wed, Aug 11, 2021 at 07:55:23PM +0800, Tang Bin wrote:
>>>> The function stm32_spdifrx_parse_of() is only called by the function
>>>> stm32_spdifrx_probe(), and the probe function is only called with
>>>> an openfirmware platform device. Therefore there is no need to check
>>>> the device_node in probe function.
>>> What is the benefit of not doing the check?  It seems like reasonable
>>> defensive programming.
>> I think it's unnecessary, because we all know than the probe function is
>> only trigger if
>> the device and the driver matches, and the trigger mode is just Device Tree.
>> So the device_node
>> must be exist in the probe function if it works. That's the reason why I
>> think it's redundant.
> I see why it is redundant, I don't see what problem this redudnancy
> causes.

Maybe not, just be redundant. If you think that's ok, just drop this patch.

I'm sorry to trouble you.

Thanks

Tang Bin



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
