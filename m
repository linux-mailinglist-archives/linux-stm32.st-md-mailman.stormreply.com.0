Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F872C7F9
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 16:17:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8DDBC6A60F;
	Mon, 12 Jun 2023 14:17:41 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFAD8C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 14:17:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 16FDE5C012F;
 Mon, 12 Jun 2023 10:17:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Mon, 12 Jun 2023 10:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1686579460; x=1686665860; bh=aP
 w1HIovDb5iJ4pYiKtcUIbVnbrPXJ4FRPPswedoB04=; b=xlRymHB7jHhqWfKboK
 BHHqpl7IpRva7ElJrYLJVJASMlzQsmeKtxySzdMSNVsP7eM9qWcHiklcKHH8ldrR
 e2RbYqLHf7hMXK2baDiAZO8QAuN8vWyOJ8O49CSDjDDJMweOyrGHjLXFwcxKTuQZ
 Zvdd9KLvcL8IYb/BgzodMn7SnK4Mcd9ujhGQmmts2bhA677S4nrIAi3KxkQXyODo
 Xt2PNj7lyC/8YcUAO9B4oCGwFBTeTuUMoeVIkvBAJMJvtm/2SHU8d5Max+IyJjB2
 79kVFZQZ2LnrhrOI1tsi8dimV3t1/20ootFlgrgxiD16eaWycOj8gyOpkExJoaeG
 esMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1686579460; x=1686665860; bh=aPw1HIovDb5iJ
 4pYiKtcUIbVnbrPXJ4FRPPswedoB04=; b=kXCb8NjVNnVfQaNku5rC9rlj+tYCE
 FdaGelcMW8aCd0ol5JRcA3cj06/McwJhHYP5iMJXHVaraLvikWcfJFL3XuUnPf+J
 /BYOF70bL9Xx6bqTP9b+vFPtkrV8wKNR6u116mhWK6rNBw6N72HkBNqZWKQcF+BC
 WvrJTzswEm7G/9qBGrIaMgpVLn4dGH+9DMmf5A4T8axThkoHPPiZBYd+yUvHB68x
 m/lMiszjdT5Bv6TlfZiAXHYZK66n+mBC9zmsY8mV030VXvRhHM2Y6rQoqHYqJmf0
 0sda/0ZdjQiR5SRYwKyR0nvGr0D3iFQP94EhgW7tEynpyckb/20r6kPfg==
X-ME-Sender: <xms:AymHZIjn2lJtucqP8ooR0CmlmbD3XpfUMkn_7M1TJnAgC-paBlWwDQ>
 <xme:AymHZBDhjpxmEeBQy3Z6Yobz7aMaIA4ZUANBqO_qHurvdSEXB4XwWea6XgMS-zW-h
 b12jHG4SWq_j3SvdG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduhedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AymHZAGMKlkcPuUrADy3F5CyMZkm-HOzaYM0AgMch72sCXleBR1ghw>
 <xmx:AymHZJTutWTBlZcjFTGMxY6LX_FoQMoY05VLUoMHSUXiBpaEvBpVFw>
 <xmx:AymHZFxRg9o5UgK776RV8TsNgTm026ETAkIi1sxIQYOPmKKYaYQv4Q>
 <xmx:BCmHZL4WckZf90RZhXQG-JfPfmj6SjErT0aGgG875uhd06imw642Lw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 946CDB60086; Mon, 12 Jun 2023 10:17:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-492-g08e3be04ba-fm-20230607.003-g08e3be04
Mime-Version: 1.0
Message-Id: <ba58f0cb-3683-4aae-8c10-2fad2e701501@app.fastmail.com>
In-Reply-To: <7846c69b-5c2d-16d3-6079-d11a60171a69@foss.st.com>
References: <20230609120546.3937821-1-arnd@kernel.org>
 <7846c69b-5c2d-16d3-6079-d11a60171a69@foss.st.com>
Date: Mon, 12 Jun 2023 16:17:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnaud POULIQUEN" <arnaud.pouliquen@foss.st.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Cc: Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ben Levinsky <ben.levinsky@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: use correct format
	strings on 64-bit
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

On Mon, Jun 12, 2023, at 16:10, Arnaud POULIQUEN wrote:

>>  	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
>>  	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
>> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
>> +		dev_err(dev, "Unable to map memory region: %pa+%x\n",
>>  			&rsc_pa, RSC_TBL_SIZE);
>
> What about cast the RSC_TBL_SIZE define instead to ensure to be independent from
> the arch and to match with the use of RSC_TBL_SIZE?
>
> #define RSC_TBL_SIZE		((size_t)1024)

I have no objection to that, but I don't see it doing anything good either,
as this is a constant value that will always work.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
