Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC4362133
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 15:39:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86831C57B79;
	Fri, 16 Apr 2021 13:39:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90A1BC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 13:39:56 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C1AD80040;
 Fri, 16 Apr 2021 15:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618580395;
 bh=DN06i9gmQHIuoZz210y9kvpT4840BC3hd/m62B1VvN4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TajBG8AI4SLYPrzCwKsT9w5k5ZfUP7vUfNeyfML+GHI4gifEehnvEYV6QSDze/0s8
 s3TG+HINLPIUP4gk+vEl1ay/3aDDak9fIicnzEZEn3sUd6u+TSquKaRDzX5Qh+bxfI
 Lyynlu+JZtUpf0iDNGvd7rUYLJnInG2DMjsui9X3ltNwm6Mm3Xw/FlBdcHIiAE2RwK
 Ka46HdHB3uUFQrur1kG02lB6UBIKpr08Ezwz/gN2PTGBATHbQNk4LPv6D7D1T5erzN
 E88SnY85kaDmkwfu3s4fOeU+uPOfWuCv/NoEbZabDcifnDbq/AO3VwDDLrsHIdamGD
 +8EsmuqBZ0XlA==
To: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-3-marex@denx.de>
 <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
Date: Fri, 16 Apr 2021 15:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 2/7] clk: stm32mp1: The dev is always NULL,
 replace it with np
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

On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
> Hi Marek,

Hello Gabriel,

> I have a patch-set in progress using $dev (convertion into module driver).
> 
> https://patchwork.kernel.org/project/linux-clk/list/?series=421767
> 
> Then rebase of your patch, [PATCH 4/7] clk: stm32mp1: Add parent_data to 
> ETHRX clock, can be done easily.

I suspect the aforementioned patchset will have to be reworked, since 
the current approach to push SCMI onto every system and renumerate the 
clock has been rejected, because it caused DT ABI break and boot 
problems on many systems.

btw please don't top-post.

> Best regards
> Gabriel
> 
> On 4/8/21 8:57 PM, Marek Vasut wrote:
>> Instead of passing around $dev to all the registration functions, which
>> is always NULL, pass around struct device_node pointer $np. This way it
>> is possible to use of_clk_hw_register*() functions and/or register clock
>> with associated $np pointer.
[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
