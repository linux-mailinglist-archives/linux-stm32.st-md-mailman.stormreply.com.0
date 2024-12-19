Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8109F8204
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 18:36:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88B28C78027;
	Thu, 19 Dec 2024 17:36:11 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97267C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 17:36:04 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D4E531140166;
 Thu, 19 Dec 2024 12:36:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Thu, 19 Dec 2024 12:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734629763;
 x=1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=
 YPzuIoaDiSpZYJkh2n3/LpZwJ3Qyv0dhBC5pzmq7f9kkSVaSBm6TmJ9h3sM8zJsJ
 fg5D/BZXAdnkPuewHFtcStcYOfdZ4XjrBHHN2HoVoqWjaX8PE6f2fmPZ1Mrnd2mc
 KFLHFCcz92WI1Iep3YkosX9ORHRxoJ6uln0w4r66GltrAQ1yZWoVKcqRiV79uPCk
 YfMH7PWtsNs+QRExzJxowaP1NxPV1l9E+UCnse90m+xL2c6HUV1IRrkcf8HbLvB+
 UKRrkU6cyFP+5xM6pWGIUBTw5uRjBRd5IA6gH88jm4/n7kE+3EnBrulLZXHu85UP
 sIWJvVgcKytOFZcBHhji/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734629763; x=
 1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=U
 zdnWXAWCe6KM5NqiN4EpRODxTop7JWW3cP7JNEOqZPjMXUHc8ftDE67KPbOBKEtQ
 ahe3VIlj8uEcb0+hTxIpb8iDZbEOwaZJyWdWF2WVqBjuWaAnzAPVh7iUjjKO3kon
 Oe3oI6PrRUSxya4XWVRrZl0unUxavngzI0irIzGROkVNqw/3agIGWjoNrPHLxhTP
 9U3y5p0aICsvS1ZadpiJ2Fq1SxIUaHVX5Ke6yuzwCix8aCH4tVDPgGFPNVLpEYkS
 pmgCnXxcnMUjYSJ87dXWXdYlUZ4o0jhb4LYACodrFurC1doKDEg0DTYVL9JN8tXp
 UOQenmJ13hvM5ESB0cCOQ==
X-ME-Sender: <xms:gllkZ8IzIr1GOq4dhOtiaswaPEXPhFpWD-vvetnXUz4BRX2rAA0iWw>
 <xme:gllkZ8Jx3nwyOqsNEVOD2wzzD3rqhcUKiTALk3kcXaYOEOsfaXbjs_on3fEw0DYZC
 xcJPXGNLOso6me-fV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
 uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
 igrdhorhhgrdhukhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhho
 shhsrdhsthdrtghomhdprhgtphhtthhopehprghtrhhitggvrdgthhhothgrrhgusehfoh
 hsshdrshhtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhm
 rghilhdrtghomhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
 ohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopeihoh
 grnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheplhhinhhugidqshht
 mhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:gllkZ8sTIxduK_5QK7eI7Le7J6ZDjBwwhAs4BRLwzcrpkJPKyg8tDw>
 <xmx:gllkZ5Y7v-tnLgpqrZOgqQ7SoaDvmU3gJemn-Q84cNZH_2vY7fIygg>
 <xmx:gllkZzbngG4eIUW0vd2_45NgebXn6yCAj7DBYsAmDmiKqOjTtA0BLQ>
 <xmx:gllkZ1CSS1cFIGlPd3o-y0gd0nJv29lVI9rF5SE0iNUgOS-MOPGzUw>
 <xmx:g1lkZwSzZ6XoDoQAShssJy-o93Id7cf2Fwx2clVd0HC9EkjKlv7ZgkJM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A5A862220072; Thu, 19 Dec 2024 12:36:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 18:35:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Message-Id: <7c6dc57c-f33b-4a4b-9423-01ee2933f759@app.fastmail.com>
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: config: stm32: Disable useless
	flags
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

On Thu, Dec 19, 2024, at 18:29, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> *** BLURB HERE ***
>
> Patrice Chotard (7):
>   ARM: configs: stm32: run savedefconfig for STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
>     defconfig
>   ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig

I would structure these the other way round: you can combine patches
2-7 and just explain why you do those changes in one commit. 


For the things that have changed by themselves, you do need a lot
more explanation, so we can see that you have checked that these
don't accidentally break stuff. You can probably still do them
in a single patch, but it would be nicer to have one patch
per option that has become unavailable, changing all defconfig
files that need the same change.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
