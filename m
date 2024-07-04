Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59E927CF5
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 20:24:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74851C71282;
	Thu,  4 Jul 2024 18:24:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61149C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 18:23:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3B00B888EB;
 Thu,  4 Jul 2024 20:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720117437;
 bh=RQNlOASpYPF+FOJ9kBWM+LXgM6BznGbxCQ7+u4Z50KY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jChxk3GhUX1DznBRyaVoKVFX6wP2TCdLf0t8vvXpm5r76lpOX2V5xfc3AhkVy1HTe
 /ihUys8z5/Zod6TJvbq6NhOWe8tfGdJURFkdcZFkNgHHf1hZGRzUMZT7AxyUtNM9RX
 JIYKzi0EEV1zAQQ6Aan/CYsbuCI13/6KzMABOC3sZRUXlwY2rpB6hieBj6sjXoVi5u
 tm4kz0EgUNVOJsnh0VQ8vQSGw/X+qqykmyplrT2NAre6nLicibIWQWVL801tk7V6wY
 YmELrKnldMMiGfMgGN149t6TK17Tw93zEz0EeiPOpfVUQeTYR/rgjZkoq/y/ZNZPsQ
 6DCixR6YnFGNw==
Message-ID: <f2a1f9c0-3234-4839-b99c-dd33b8dfc268@denx.de>
Date: Thu, 4 Jul 2024 19:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240629203706.93145-1-marex@denx.de>
 <f303a45a-3844-485c-8971-f71a46b8b0fb@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f303a45a-3844-485c-8971-f71a46b8b0fb@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: omit unused pinctrl
 groups from stm32mp13 dtb files
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

On 7/4/24 6:40 PM, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 6/29/24 22:36, Marek Vasut wrote:
>> stm32mp13-pinctrl.dtsi contains nearly all pinctrl groups collected from
>> all boards. Most of them end up unused by a board and only waste binary
>> space. Add /omit-if-no-ref/ to the groups to scrub the unused groups
>> from the dtbs.
>>
>> Use the following regex to update the file and drop two useless 
>> newlines too:
>> s@^\t[^:]\+: [^ ]\+ {$@\t/omit-if-no-ref/\r&@
> 
> I understand the aim of this patch but I'm just wondering about DT 
> overlay that would need one of those configurations. IMO, in this case 
> the DT overlay will not apply.

It is always a compromise, either we will have massive ever-growing base 
DTs or DTOs would have to ship their own pinmux settings. I think I am 
fine with the later option, also that's what the MP15 is doing already.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
