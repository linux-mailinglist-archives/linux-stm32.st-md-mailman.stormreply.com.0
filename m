Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFC6EDD80
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Apr 2023 10:00:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08491C69065;
	Tue, 25 Apr 2023 08:00:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3C92C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 08:00:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3CF061E7F;
 Tue, 25 Apr 2023 08:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B19AC4339B;
 Tue, 25 Apr 2023 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682409635;
 bh=cDv3M/1s+tjOQjJbPUGblM4x/VHbLIoWAfEO3RoBZLM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t8tVDcisi1Ua1xsK0eh4wXd6TRl8zqRR065VHttovC11XtMZF6D/4bba5k+B9QVcD
 wosEZN7on9/BZBObgZeW4zV919V5Z45lRsX9k7Fm3mqp0kUE89nHF/t0zlqhvF9+dB
 2h6Dz3k0IgtGd470zSwjfCJivMhODaPf9YsDcjkg014i+ABYaNR22jfQS6VgIFy5WX
 vVhV9/8kPwppHz662OIcc0AhHtcKwYVCwvnfRzqmvB8PESp/To9CcsNdaTVKSHAQ9+
 fTB2q5Cbai6xwkIifbnmNyaVCEpLHdO8kzBQU4MtjB0kPYGm2MS/weEHAZC22lIJik
 7OelZpaQThsmg==
Message-ID: <7fe274df-6bcd-5993-d6cc-8fbcef435866@kernel.org>
Date: Tue, 25 Apr 2023 10:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

On 25/04/2023 00:10, Rob Herring wrote:
>> I had some problem with gmail and sending mail too much users. I put Rob
>> and You and all the various list to try to workaround the "gmail spam
>> protection"
>>
>>> I am pretty sure we were discussing such split idea in the past and it
>>> did not get traction, but I cannot recall the exact discussion.
>>>
>>
>> I think the main issue here is how to handle bot and how problematic is
>> to merge this. As written in the cover letter the final version of this
>> should be a big series of 50+ patch with every commit specific to each
>> oem. In theory we should be able to merge the different oem separately
>> and try to at least start the categorization.
>> Another idea I got to at least have a "migration path" is to convert
>> every dts in the dts/ directory to a symbolic link that target the dts
>> in the correct oem. But I assume that would fix only part of the problem
>> and git am will still be problematic.
> 
> I have a script[1] that does the conversion written the last time this
> came up. Just have to agree on directory names. I think the easiest
> would be for Arnd/Olof to run it at the end of a merge window before
> rc1.
> 
> I'm very much in favor of this happening especially before *any*
> overlays are added to add to the mess (it's probably already
> happened).
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/

This is the thread I was thinking about. Looks good for me (the original
script with exynos->samsung).

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
