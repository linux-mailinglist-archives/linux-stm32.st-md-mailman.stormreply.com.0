Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9655EDD2A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 14:51:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FA77C63327;
	Wed, 28 Sep 2022 12:51:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 204DFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 12:51:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C9103849E9;
 Wed, 28 Sep 2022 14:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664369487;
 bh=niFYU9JNexGdtrIEgwWXPtoMx2e+cBNGPmmVKn0J13M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R7YU3ac/gK49qktq9rmPGp64IHRMlOKKg7WA3GKBwUN1t4CjtOM1vyI44jbzihciD
 cBJqSRXsgkE6gqd/TuiTPDPCXL9RqvLroPgW+Yq/2e629dg5wb/x6YebP8ih50C0yL
 sDJ6yvdOK0glyz4dZlZHoXBNjY27dQ29ckQfrUCeniv0iPAEG8F6he6w1/QDHcF3i6
 5QDuUn4Y+cjb5inE0WXPMAOKteZAHhpMB93NHM2Zr4orDpemaP+W/uXY7EGJBx0wzv
 y9IFvIKI/Jzzl5zaeD/uPpzIXT3Zs6Lxnwl4pkKku+HB+mGEIL3KQJC8HlWnSe66Tw
 siApaUOq0+9Lg==
Message-ID: <58ce0d1b-d957-6d45-7436-a397a8426107@denx.de>
Date: Wed, 28 Sep 2022 14:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220926222003.527171-1-marex@denx.de>
 <166434910296.10148.2597210651020575227.b4-ty@linaro.org>
 <c54f15a6-b4e6-d512-654f-28819eeaab4c@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c54f15a6-b4e6-d512-654f-28819eeaab4c@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
 stm32: Fix st, fmc2_ebi-cs-write-address-setup-ns
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

On 9/28/22 09:12, Krzysztof Kozlowski wrote:
> On 28/09/2022 09:11, Krzysztof Kozlowski wrote:
>> On Tue, 27 Sep 2022 00:20:03 +0200, Marek Vasut wrote:
>>> The property st,fmc2_ebi-cs-write-address-setup-ns should really be
>>> st,fmc2-ebi-cs-write-address-setup-ns (there is underscore _ between
>>> fmc2 and ebi and there should be a dash - instead). This is a remnant
>>> from conversion of old non-upstream bindings. Fix it.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/1] dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
>>        https://git.kernel.org/krzk/linux-mem-ctrl/c/587f9891ec9661e16df7e5268543416a7d8cb547
> 
> Just a note: it's late for me in the cycle to pick up patches. I applied
> this but there is a change it will miss this merge window.

That's no problem really, it's been broken for so long and nobody 
noticed, that one cycle won't make much of a difference.

> If that
> happens, I will keep it for next cycle (no need to resend).

Nice, thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
