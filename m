Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83313639D79
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Nov 2022 23:05:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260D3C65E59;
	Sun, 27 Nov 2022 22:05:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A69C6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Nov 2022 22:05:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2C65885031;
 Sun, 27 Nov 2022 23:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1669586719;
 bh=6zaI66jEeO2Fjsy03JP69qs+QC38B9jJX0DMJRTYeDY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zyWoJ1W6DsrSoQzl66yxjLFXzMSS3NxxZxHvZqJwdDGZc9YItyJJ0Q3FTpfFw0wcy
 +ZR+oCg5KxewS7r+f9KbBkGVray26YrNUPbtoQDo8+8sWWJzK5AwoNbU4lDlhDwgop
 ceSp83O6XaAlNK6HvDsbZqLnAfPUPznbzSdD/awzRTZSA6cvQozViCIZ2MdxXUOLwC
 qkhfNsEzrtl1fHQlCxN+QhlHpSzCnaXfHr+HIJhbbrRqz0C4G0oacpEMptsIMZem8w
 UA+Ceff/+edn7l+ueMN6mELbE1BJCgYHW+K8ne+0oy+bjggyiQRZQWjA+AB7K1GNUW
 +LQmo3YDd1f4w==
Message-ID: <f54b0c3f-07c5-32bb-b64f-b2986c35d7c3@denx.de>
Date: Sun, 27 Nov 2022 23:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20221027225020.215149-1-marex@denx.de>
 <20221028212838.GA2286583-robh@kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221028212838.GA2286583-robh@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] [RFC] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

On 10/28/22 23:28, Rob Herring wrote:
> On Fri, Oct 28, 2022 at 12:50:18AM +0200, Marek Vasut wrote:
>> Add trivial bindings for driver which permits exposing syscon backed
>> register to userspace. This is useful e.g. to expose U-Boot boot
>> counter on various platforms where the boot counter is stored in
>> random volatile register, like STM32MP15xx TAMP_BKPxR register.
> 
> Generic bindings always start trivial until they get appended one
> property at a time...
> 
> What happens when you have more than 1 field and/or more than 1
> register?

If it is a continuous register array, the user can use the size field to 
describe such register array here.

If it is a sparse register array, multiple nvmem-syscon nodes would be 
needed. I haven't seen anything which would require one node for sparse 
register arrays, like boot counter distributed across multiple 
non-continuous registers or such.

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nvmem-syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tamp@5c00a000 {
>> +        compatible = "st,stm32-tamp", "syscon", "simple-mfd";
> 
> This is very common, but personally I think "syscon" and "simple-mfd"
> should be mutually exclusive. "simple-mfd" is saying the children have
> no dependency on the parent, yet the child nodes need a regmap from the
> parent. Sounds like a dependency.

So what exactly should be changed here?

>> +        reg = <0x5c00a000 0x400>;
>> +
>> +        nvmem-syscon {
>> +            compatible = "nvmem-syscon";
>> +            reg = <0x14c 0x4>;
> 
> How does one identify this is the bootloader's boot count?

The user has to know where the boot counter is stored (by hardware 
path). I wouldn't attempt to assign any complex logic here, since the 
boot counter could be implemented in various ways. Besides, this may not 
even be a boot counter, but some other variable exposed to user space. 
Maybe a unique node name can be used to discern the different 
nvmem-syscon nodes representing different variables if needed.

> How does the
> bootloader know it can write to this?

The bootloader implementer selected the bootcounter register based on 
hardware knowledge .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
