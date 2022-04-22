Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B2C50C237
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Apr 2022 00:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84498C6049A;
	Fri, 22 Apr 2022 22:22:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A6DAC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 22:22:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 94B1083C24;
 Sat, 23 Apr 2022 00:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650666178;
 bh=8pr5rZdmKbrWjXDtDGUIlrKfZlL1+FecLllF820ozws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OQLdZ6epDfvceGFjbwfiShY/gq4BPYQf2qo3r+Dar5cOzlmjO0Z4/vn/0qlrbS1Hd
 eU24ydMd5a5nXCvd1zyNtqWJDtb5UATlkoSPy7oLz5N5BgLphz2HP0dZbdOAK5G69I
 ieUnbp/WQLDJ1Nv1Cms0FqdLdUfk66PFjbMEgtdFpX5+BXSKpC1whrM372xdGJ/Vtn
 lTNBthuyOQ7CGFZ940A5OdnIBWgfvMSmcKeAxnL/QQB+TR9ZPUlx56XpqrQXeSCmX8
 qdCVlRAB0EooQ/TzVFEOKQYPnYbY9AsoX5JyKba7QzlDXqVllzw2BsaJUlqJ80r5P5
 7TO2XazDMQ+Aw==
Message-ID: <e91bcbbd-9ef5-7dcd-0d95-aed3fb45d667@denx.de>
Date: Sat, 23 Apr 2022 00:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220422161933.163347-1-marex@denx.de>
 <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] pinctrl: stm32: Keep pinctrl block
 clock enabled when LEVEL IRQ requested
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

On 4/23/22 00:15, Linus Walleij wrote:
> On Fri, Apr 22, 2022 at 6:19 PM Marek Vasut <marex@denx.de> wrote:
> 
>> V2: - Use pinctrl: stm32: tags
>>      - Add RB from Fabien
> 
> Hm I applied v1 with those changes so it should be fine I think.

Yes, there is no change to the patch, just the commit message and RB.

Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
