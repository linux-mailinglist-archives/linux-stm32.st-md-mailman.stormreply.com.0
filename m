Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A284B608F57
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Oct 2022 21:48:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A25EC64105;
	Sat, 22 Oct 2022 19:48:43 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FD9DC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Oct 2022 19:48:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AD1458012A;
 Sat, 22 Oct 2022 15:48:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Sat, 22 Oct 2022 15:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1666468121; x=1666475321; bh=UGS1Mg1RbR
 rjg7l/C4uODk6tRvKSFxQmBze4CDiRUok=; b=R769R20cvAUvCJzdLxBnDkwPBp
 EbTpyCnh90ePwkW/W271GgnujcaxKPNlKUZTD1QiMzbOX6UUmX5GBGQy5YnoG3Hz
 7bIbm4GGSebbV6RK2kBgjxCEhVjRMxNaLgKsw+7i5e4f4W2C2HsQFTmKv8S+gZdE
 jcEJHfdX99rjFuuQuzOPTEkJYLvC3gJ1f7jx+9U6cwktdP6NSfqNvxTgarEWxD1c
 GFRrikCndHmtZnFVFspin0GH0nBuno9DFl/vX1YEuWJJ1DmabcJBI+QgW+pFl13L
 PUlTUh21czWS+IFSiTNJyGJ4p7ipLzCb7UJepNPQ1EVgfsLevgq5To41FFEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666468121; x=1666475321; bh=UGS1Mg1RbRrjg7l/C4uODk6tRvKS
 FxQmBze4CDiRUok=; b=DZdlxJQ1/OPf/Y6KDYWPfdC+mu56NzIOlbXghWxjCj9D
 9CPMuzFO6wSIpYXaVVKO5ogBmtK5zrRUpai6gPg5qF7aq51p1Tf8zgVV+aEGQIpg
 Le7lvLJR+05feR3Q+7owk4RsmE3rzpsqGg/UOGa7xGgp5BzvreC3G8OxhZ0WzoTZ
 kHVkLu1P+KTSJm4dYCrODRLVTVeSHwuFqAuyI9eyO0UD5B3tL3/NipBn2AFumQvr
 +xjvFjLrJEOmbNOFedB+o0knlGPPR7li0EwNxPvDXhDL0DJhj4plmQqEZJg8uEWZ
 ljUtVQj8llXCVqwnpTmY8Mpk0y+FjFMyLlNEuZEfiA==
X-ME-Sender: <xms:GElUY9vt3ItviEp5AJXQjYcX0YyV47YTITTgtkGjjNw0aSie0vzYkg>
 <xme:GElUY2cknoJTeDpYvjbC4RFS-FtPGbyfFDbbyjNFIChdDqrc0xYFVavFYI99vu8kl
 0KtHqNspAg1e6vBhwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedttddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GElUYwxiXoqPMILm1SZ_32__qu1Q5l_zrlV4KYN9jBrAlex9SwSKIg>
 <xmx:GElUY0PzOcbbrTlSQkCZ5j1lrS1Cnv1p6FZXhLQlA1lHQyiDXRQGng>
 <xmx:GElUY9-JQg9pRkXJG00aarf_3pC2T4jG_plPdMl-YxzKsRcEtsxZ9g>
 <xmx:GUlUYyKFp-5FR5wwM3xl6nutJeKlKU0pfMGHX_pxDvaIG8i-amMB_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90C24B60086; Sat, 22 Oct 2022 15:48:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7c4531b8-a296-4ea3-9564-b094704d10b2@app.fastmail.com>
In-Reply-To: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date: Sat, 22 Oct 2022 21:48:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
 linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/21] ARM: s3c: clean out obsolete
	platforms
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

On Sat, Oct 22, 2022, at 17:18, Krzysztof Kozlowski wrote:
> On 21/10/2022 16:22, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The s3c24xx platform was marked as deprecated a while ago,
>> and for the s3c64xx platform, we marked all except one legacy
>> board file as unused.
>> 
>> This series removes all of those, leaving only s3c64xx support
>> for DT based boots as well as the cragg6410 board file.
>> 
>> About half of the s3c specific drivers were only used on
>> the now removed machines, so these drivers can be retired
>> as well. I can either merge the driver removal patches through
>> the soc tree along with the board file patches, or subsystem
>> maintainers can pick them up into their own trees, whichever
>> they prefer.
>
> Just to be sure - do you expect me to ack the series, or rather as usual
> pick them up?

I think in this case it is easier if I pick them up with your
Ack along with the other platforms I posted, as there are
some minor conflicts between Makefile/Kconfig changes where
I remove adjacent lines.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
