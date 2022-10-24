Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4B60A958
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 15:19:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1753C03FC6;
	Mon, 24 Oct 2022 13:19:16 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 258C1C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 13:19:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 011D42B066F0;
 Mon, 24 Oct 2022 09:19:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Mon, 24 Oct 2022 09:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1666617549; x=1666624749; bh=dNk4I7ELz1
 Q72dRob/8j+4seSTYFKAZT/RUPASjRJ5c=; b=q+NqZuUcR73y8BnZPPG5dx1Zsk
 6km9xLqa6tEkJrornmVIrbgVsoTaG0EQRj//U3P/qs5FFUR0kQj3xsDpIMDiHNAP
 KHymuWr00P67rJl6tNZNMaSvfwBvDXs8mjOeO+DtIb91LFvy9u7IqPZlLBHzDqVY
 OqQ+UV/5sGJOiUEzmGUI9NOmwTaSDzu4RgOGbpc9QTg1ReluTq9aBn60FamJs6vN
 DKIJe0X1BrhoAYInvyHnNd5GZdOejs+w4Suvb5ImKHNqRwAYBvpipR0/HvaVLckd
 CHTLMlrLH5H5bEpdNq1ZJ2ZVvg8gjN0DzzHIiqNjzW420ViiiKKJHNZdB8zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666617549; x=1666624749; bh=dNk4I7ELz1Q72dRob/8j+4seSTYF
 KAZT/RUPASjRJ5c=; b=uYEImk9/JaoBLZkHmS4JMUN51UUW3Adz4NZ33zTXfhfn
 X2zc+bMCIXUEr4nNHo354GqKRASijikTpJx4FFU+epgcfr8J1IPlgZPNpNiYVB9M
 w8ihE4tr46Zh/a1sL2xOLJxavoW+rkvJ5mUtViAoLX1JGrLBO17yVcJcaCCL+4DZ
 U79zEm+ybsbN3XMbJe7XZH2qegoAJbChw5mNkbbe1D33ukaTT9FYQuJEpTpQ+3Cm
 dcgc9DJADBfxr4sonBlprzuNuFtddjyQxgp5OFhdXtZwXkncp0R9eBa1XvUUpv5H
 Fai3j/IlJ8ZfnHiUrjBdKzUP8vcWG93GWsi2JgpEew==
X-ME-Sender: <xms:zZBWY4d6hZdrWDWBmQnXOunjtmGBLNtVOGtYlcpUAkqGnIq3nQ_ULg>
 <xme:zZBWY6ORVL4inZtEZ347UGYnYKlOyas-DedRgWZhgJSTlHghoiUBMTH5Vdl7j2SlB
 orGRM2A45E3sznwkiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zZBWY5jMfpgYOekZ5Xiy1zZWPWGF2N1SaGbKcsqvIIsAoksVTelYew>
 <xmx:zZBWY98Y0Yr03VdtjC58Vfn64oQoe8znN7FH4bLecym0d8-7ie150w>
 <xmx:zZBWY0u1N4N4cR6ZhhO6MwuQK8N3p7TbkgEiIMvu0C2hnaFTg0G-QA>
 <xmx:zZBWY2px7fOBs4XObZs9jNKaCaM5g4TthCLLA4wr0bUEo7pzc_VBCiqJhiU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3DDB5B60086; Mon, 24 Oct 2022 09:19:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <e5aa233d-526b-45ab-9acb-ab792b8686bc@app.fastmail.com>
In-Reply-To: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221024130035.GA1645003-robh@kernel.org>
Date: Mon, 24 Oct 2022 15:18:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On Mon, Oct 24, 2022, at 15:00, Rob Herring wrote:
> On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
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
> [...]
>
>>  Documentation/arm/index.rst                   |    1 -
>>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>>  Documentation/arm/samsung/overview.rst        |   13 -
>
> What about?:
>
> Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
> Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
> Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt

Good catch!

I've removed these three now and and will add the removal to
the same patch, also the related
samsung,s3c2412-clock.txt and samsung,s3c2443-clock.txt
files.

> Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

samsung,s3c2412-nand is apparently still used on s3c6400,
and the driver is selectable on that platform, so I think
that should remain in there until we remove s3c64xx in 2024,
even if it is not referenced by the dts files in the kernel.

> Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Similarly, the driver is used on the crag6410 board
(without DT), and probably just works with the DT based
boards if one adds a node to s3c64xx.dtsi.

I've also checked if any of the other removed drivers
matches of_device_id[] strings to see if there are more
bindings to kill off, but I don't see any that have
now become obsolete. It did point me to pxa2xx_ac97_dt_ids,
which Robert already complained about, this apparently
is still used with dts files outside of mainline.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
