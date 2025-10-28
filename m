Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46402C14581
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 12:26:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43129C628D0;
	Tue, 28 Oct 2025 11:26:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40347C628CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 11:26:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 44650C0BE9D;
 Tue, 28 Oct 2025 11:26:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 702EE606AB;
 Tue, 28 Oct 2025 11:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA45E102F23B7; Tue, 28 Oct 2025 12:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761650808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=uLE0eTiI6TFyVoJFE00DU2l+ZzaA7D7Dyj0PBL3xFBY=;
 b=yYdtv9h5uVkWuAPwLtXjyYlPWVrzUpwiuyAJcIxNZS3FnWiI8ct9+zIZaKSdyGWZdZP7Zq
 6Dy6UfGWkGAJ6vFf6UrdpipfXfA+/6y0JZjGcBXy1n08RfqyODVLfzUarGcsQWBSNy6Eq6
 ShVX2TJDnIWddhfA0wJRrTJmaZNtRt7CbZRMqp+pBfjTC+obK/NtCiqbCJwfebKY6zOXzG
 8a1/owtEn59F7gvrHb+ZdptxURxJG459LLZXNevh9GK7QhH5hFvT4z5jM8IQmEt2I1K6d0
 QT1GSDByFzGwmPhP8J2WgmRwdnFbGX8WtLq8Fn5+PYxER96BAEyr833Ax30ZIA==
Message-ID: <c2686441-7201-470f-b1b5-063c347bea2e@bootlin.com>
Date: Tue, 28 Oct 2025 12:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
 <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
 <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Alexis Lothor__ <alexis.lothore@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: add support
 specifying PCS supported interfaces
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

On 28/10/2025 11:35, Russell King (Oracle) wrote:
> On Tue, Oct 28, 2025 at 11:16:00AM +0100, Maxime Chevallier wrote:
>> Hello Russell,
>>
>> On 25/10/2025 22:48, Russell King (Oracle) wrote:
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Maybe this needs a commit log, even a small one ? :(
> 
> Thanks for giving Jakub a reason to mark this "changes required." :D
> I'm not really expecting this to be merged as-is. So why didn't I
> post it as RFC? Too many people see "RFC" as a sign to ignore the
> patch series. Some people claim that "RFC" means it isn't ready and
> thus isn't worth reviewing/testing/etc. I say to those people... I
> can learn their game and work around their behaviour.

Yeah this series needs to be tested and discussed, I am rounding up all
my stmmac platforms in my ever-growing pile of HW as I'm building my
own test farm, but all the glue stmmac boards I have are the ones that
are fairly well maintained (imx-dwmac, dwmac-stm32, sdwmac-socfpga...).
I don't have any stmmac that use the integrated PCS :(

> 
> Yes, it will need a better commit log, but what I'm much much more
> interested in is having people who are using the integrated PCS (in
> SGMII mode as that's all we support) to test this, especially
> dwmac-qcom-ethqos folk.

Let's hope we can get some test indeed :/ 

Maxime

> The 2.5G support was submitted by Sneh Shah, and my attempts to make
> contact have resulted in no response.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
