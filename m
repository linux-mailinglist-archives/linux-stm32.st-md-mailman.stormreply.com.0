Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21081BC7C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 17:59:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBF6C6B477;
	Thu, 21 Dec 2023 16:59:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E23C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 16:59:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47FBDE0006;
 Thu, 21 Dec 2023 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1703177940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64g4WXHsmtstsXFWVKn4+jC7SrQnUgEAndJzQ+FYA9s=;
 b=oIaXa8H9AfHKgs3Zfmu8VPmK09bSKs+HtjTMOjRenfZ44LykxNabiA4r4NX3YJW/++hQjx
 R86criDYih8pJkoQ5c5pKQPtbZAwBRYmHtQkR8Rq64WHSmvIGOqJ4iMUUkeYPXKc631cnr
 LbFO7vYXlg9qkgzIsrJ0ueQOqpt8D5vB4NCCLYycBrDJnFtRXk//pfK2JajnoeANTfVLOA
 WHbOI70ihS71u57Zl9ZIuestgOaqYj00AhO0kLyvNAWyg7G7oI4FuBsJdaZ9vEVpSWRtJs
 Dq558tUtybtDXPh3o0iuR4w7bEsUcKvqYCfJ9enC7Vtyipz8vuZy1o120z0xVQ==
Date: Thu, 21 Dec 2023 17:58:57 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20231221175857.6d2874ff@device-28.home>
In-Reply-To: <vvlnwiobrgcwuam6lkud2np5xqocj6asjf627j3gekkhm4hfp5@vhdd47fyortm>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <vvlnwiobrgcwuam6lkud2np5xqocj6asjf627j3gekkhm4hfp5@vhdd47fyortm>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

Hello Andrew,

On Thu, 21 Dec 2023 08:30:49 -0600
Andrew Halaney <ahalaney@redhat.com> wrote:

[...]
> 
> Note, I'm struggling to keep up with the standards at play here, so if
> someone else who's a bit more wise on these topics has an opinion I'd
> listen to them. I find myself rewatching this presentation from
> Maxime/Antoine as a primer on all of this:
> 
>     https://www.youtube.com/watch?v=K962S9gTBVM

:)

> If anyone's got any recommended resources for me to read in particular I
> am all ears.

I think Russell and Andrew did a good job clarifying some quirks with
all these standards :

https://elixir.bootlin.com/linux/latest/source/Documentation/networking/phy.rst#L229

There are some more info in Andrew's LPC talk here :
http://vger.kernel.org/lpc_net2018_talks/phylink-and-sfp-slides.pdf

(more phylink related though)

But I agree that this is hard to fully grasp, there are so many
variants everywhere, some standard, some ad-hoc standards, etc.

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
