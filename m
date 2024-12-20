Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D159F9765
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 18:07:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 263EDC7801F;
	Fri, 20 Dec 2024 17:07:14 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20981C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 17:07:07 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D0B412540140;
 Fri, 20 Dec 2024 12:07:05 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 12:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734714425;
 x=1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=
 cVwnjnieistFLbwIZ2ck2NZjatfgBOiKFR/kAQQ4K+FKRlL8KQQbjhZhOWU069zs
 +zgIU3AbXP9+gkyt95dE3SIBNNA3kvw4E6UfF6OherufYWAvX0YKfApKCxp2i6zQ
 77g1yeVh0zAyGNG0wE9mzRntgkKspASoDW22pp6IITndzi2lTJ4HKwNs5nqoii3w
 4+HCH21yGGTdbQnKhCQRJ8uTM84A67EBk6bF2z8ez9dzxMBOu+tSLlYPfnH3AMRd
 YFaO1Joe4dFYu/kUD9v5QjDF3u4hCIvbGv8Ior03+1p2/LvTO+X2ZwJGkdDw3QD0
 lNjjkbwJvjrkXka7ONY9IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734714425; x=
 1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=d
 CQGlbiemfZDolaPsSx6dIh3Zy2pEsHaBs/FZwjo7AmR7XFj4fZqn3BZLQdNw1iJT
 17ecwD/VcWs3jAAGF/y28KdkqdfS4RvC91W+gHU+NxdA07uf0Jy1dTliDTv2nve9
 uIN7IaraXNbD84wpTAQ3BQJ6F1LxqG79Bbx/yyD4aTv6AAzTy5aClB4clbt5FO2P
 bNAyX/j7Lb8biFooKHhqg6Y0ij1PqAFSytVswDMlf4cy7sk1Ilc7uzBMTfsTA/H2
 IUCSKaTPdpIAUeqgmK189ibMDmyW7sZqRv3FHL7xXnUDc4+A64Hmfa+y7OiZoAn+
 hI4XcznclYJ9zInqBynoQ==
X-ME-Sender: <xms:OaRlZ84R-kzFHFhkxsWwmtvoGpFX4liL6es0xQYwIJnB1iBIbzOgzg>
 <xme:OaRlZ97EVsjrhU7qvxO6iZHcXvuiYymsnzpAg2IH0XFadKew3I4Osk_NFfVU8vMWX
 Y7ShD4EnHxq3ihh1a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugi
 drohhrghdruhhkpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhs
 shdrshhtrdgtohhmpdhrtghpthhtohepphgrthhrihgtvgdrtghhohhtrghrugesfhhosh
 hsrdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
 rhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtohephihorg
 hnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehlihhnuhigqdhsthhm
 fedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-ME-Proxy: <xmx:OaRlZ7ee2TnH3FQ-LBboFcEmjH5NZAZmDHibOgB9dxwBhty6GDqMuw>
 <xmx:OaRlZxJq2G0x78tz8ranjIqb-HRx0z0Sc6uSXruoYjFja-nwQBHW3g>
 <xmx:OaRlZwIaTdUokn6guHcSSJk27WlOZv8Gly2XG0BNutc7tLGd2upGwQ>
 <xmx:OaRlZyx78E0kyHNq3r1UCyOgvVimBZkit4uOjMFCSjSgFHOvsIbixA>
 <xmx:OaRlZ9AwFtxX37i_8NvGG0tbPEz9bSRIyR74VdXQgqSEXJjnaCvnOuU3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 15B872220073; Fri, 20 Dec 2024 12:07:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 18:06:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Message-Id: <c48b7e84-5287-4da0-84a0-7747581f49d0@app.fastmail.com>
In-Reply-To: <20241220125506.3157268-5-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <20241220125506.3157268-5-patrice.chotard@foss.st.com>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] ARM: configs: stm32: Remove
 useless flags in STM32 defconfig
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

On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> As stm32_defconfig is dedicated to STM32 MCUs, disable
> CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.
>
> Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
> CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
> image size for these platforms which embed a low amount of memory.
>
> Tested on STM32F746-DISCO board which embeds 8MB of memory.

Out of curiosity, what is the smallest memory configuration that
you see people using on stm32f7/h7 these days? I know we had
configs that kind-of worked on 2MB in the past, but I assume there
has been a lot of bloat since.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
