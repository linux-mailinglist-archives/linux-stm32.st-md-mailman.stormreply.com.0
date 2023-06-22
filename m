Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E17398A6
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 09:57:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB38BC65E4F;
	Thu, 22 Jun 2023 07:57:26 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C43B8C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 07:57:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 08C2E5C00B2;
 Thu, 22 Jun 2023 03:57:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 22 Jun 2023 03:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1687420645; x=1687507045; bh=Gk
 KZ59lQ593WQfkM2Ne32UUdJV1b5jkhK8Vh4H1Zzd8=; b=3QIUvH519S7xyxVwHe
 t4OjA4EnxuqZcAvkAAyjlbzZGsvXllDD/qPYz/3rUESwqTHTgA3RLkvg2r1pQefz
 +8f1GWsbXk3MiZw8s+XFTPTVvcP7e+p6jN5dN7ZXoeMj/CJf4KRJHNJfT4v/DURC
 uWiu+mEgGx+sN62dmZw4bkUc1VNLPdIp1JVuBbK6OpdHNnJ54Ecum70/3u2XSXKW
 Ry6XMjlpls2wy2lL59sxfZtHWrCTemuRgq28HFLQEAQLEQj/0F6T1dL0Z5cVvzDo
 Jm2u04mOjkA9oBZXFdbPSiOEfPYnE4Iw2GCbDvFA7AnhV7TgRezHSeZMwf/YVw14
 TDyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687420645; x=1687507045; bh=GkKZ59lQ593WQ
 fkM2Ne32UUdJV1b5jkhK8Vh4H1Zzd8=; b=BPSsm07+RlhpSIFyYJ4wNWomqf3Zy
 0LEnJ5+TGP099pVOZDS/NIDaL0iX4oYy3jP8lv6nL4TKOBqIzgq0v8qBI2pYUdyE
 rK4TbM3cl0ZAl4noq2NIAuT+97JUvDSOJAGJo2jAxKt2M+DBSvrbRYvXdg3EqAwP
 WW6O36IIzQdykvbVWv6kvVPVeZ3w9wDJnXa3MFATVSQ0QMDTu8L8s9VjJ5ZccFwj
 DF6LM/O8So01hgbs5gB2AC9Kjbgi606nbw8Iwwm7xt8KOYPvpqNHABR6CoNgsFXq
 5jIoJ1lTbx7A/93MjueHqD1ZGBTF62Jie4rN7E7ZRceaaboo2xhsmrs1A==
X-ME-Sender: <xms:5P6TZAnLvQmm-88vFK30Qq-3F3-RBrJYNCa5ajPBSQ-hENzahoWllQ>
 <xme:5P6TZP2ke-wfLwwI6WDkhAdluGe0w1mT4pf8iV_VjsU3e0PeMvxMDBcp8sE7Tp1Pf
 Tglq4z9b2A0xQuhGpk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegtddguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
 feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5P6TZOrlfD17IHkZf9NvgbSqKsIORpiR3O-4CTYXB9wxDiXSexpTNw>
 <xmx:5P6TZMmMWYkJtNmEmbQazf6cQP-n404fDkUOfVf0FD-1znuODexKRg>
 <xmx:5P6TZO1LLUOSnybP5kWX1LEq-hF0lNl69UWYhcJHzmT2gabZtmW4DQ>
 <xmx:5f6TZB34Fpjv_gKy09J7s47__5-Q8NL-Vrq5-k3HIudombGwGYVQHg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4D1E3B60086; Thu, 22 Jun 2023 03:57:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <6d7d1f99-02e3-4e13-ae50-96e8b38a6bb0@app.fastmail.com>
In-Reply-To: <6d3c01d0-c809-b420-335f-551c98956493@foss.st.com>
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
 <20230602132859.16442-5-alexandre.torgue@foss.st.com>
 <24e9c526-4128-4e63-8d28-c4ef1647f886@roeck-us.net>
 <6d3c01d0-c809-b420-335f-551c98956493@foss.st.com>
Date: Thu, 22 Jun 2023 09:57:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Arnaud POULIQUEN" <arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/10] arm64: introduce STM32 family on
	Armv8 architecture
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

On Thu, Jun 22, 2023, at 09:50, Alexandre TORGUE wrote:
> On 6/22/23 02:57, Guenter Roeck wrote:
>> 
>> On Fri, Jun 02, 2023 at 03:28:53PM +0200, Alexandre Torgue wrote:
>>> Add a dedicated ARCH_STM32 for STM32 SoCs config. First STM32 Armv8 SoC
>>> family is the STM32MP25 which is composed of STM32MP251, STM32MP253,
>>> STM32MP255, STM32MP257 SoCs.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>> 
>> This patch (or patch series) results in the following build error when
>> trying to build arm64:allmodconfig.
>> 
>> Building arm64:allmodconfig ... failed
>
> Should be fixed by this patch:
>
> https://lore.kernel.org/linux-arm-kernel/9ebb9a5a-7bc8-da67-529f-5193b9352b23@infradead.org/T/

I added that patch to my the soc/newsoc branch now.

    Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
