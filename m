Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C4B422D8
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 16:01:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28005C3FACE;
	Wed,  3 Sep 2025 14:01:07 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 821E2C3FACD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 14:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3F9E40AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1756908064; bh=CUBTmrJzlHEyvioYPG6dRMuebJKjGgnlUmA+FpZYTdw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d1rLcnuJ70Bdcnd6BGrhB8gji9pR6Y1PLBLs0vnsBUjGXNK2OHn7M66gh49hk8Qux
 2DX7OQsSV6eNQ3JtadwQ0LWkDIOPDiUQcfs+2D7MisdpCDCB3JEQIpgockV/ezsYb1
 FEGjyF7taom2AH737SHRdoktAuhWHKl2q8j3VK4sQsmQBWZQSR+CmlQGEUkX6aM9se
 XTUB3sYlhhQ4/Yu9ZAs8WpNbyEy7z9KFDuadUYjzfqA20SQdA80La5sXba8V6bsR9f
 TLHcz3S5H7KiobgLXhpDOstfwiBhHLtki6e5O+p085XJbaQHQz216IVSeJAYg+RpD8
 HtDLhd0x+bSow==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C3F9E40AD8;
 Wed,  3 Sep 2025 14:01:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Akshaykumar Gunari
 <akshaygunari@gmail.com>, mcoquelin.stm32@gmail.com
In-Reply-To: <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
 <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
Date: Wed, 03 Sep 2025 08:01:02 -0600
Message-ID: <87plc7zlcx.fsf@trenco.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND] docs: arm: stm32: fix typo
	"busses" -> "buses"
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

Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:

> Hi
>
> On 8/7/25 16:51, Akshaykumar Gunari wrote:
>> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
>> architecture documentation.
>> 
>> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
>> ---
>>   Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>>   Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>> 
>
> Applied on stm32-next.

I had already done so (and copied you) on August 12.  I can drop my
copy, I suppose, if that's how you want to do it?

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
