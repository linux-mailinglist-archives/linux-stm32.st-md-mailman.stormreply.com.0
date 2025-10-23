Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E54BFFED7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 10:29:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5DA9C5EC43;
	Thu, 23 Oct 2025 08:29:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A08C7C5E2DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 08:29:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2C2F8C0C408;
 Thu, 23 Oct 2025 08:29:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3BE86062C;
 Thu, 23 Oct 2025 08:29:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA200102F245F; 
 Thu, 23 Oct 2025 10:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761208190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=r9GcjNdKx0l5qe7F9q2vo9g6zEhRHjHM5Fp6gH11pEQ=;
 b=Z9EtBMWuXLdFsMpNL5Is/fGSdVkHMoU8On73jz/5/ppGCGeFA/s+BGs5fNBndHP/oE871A
 Kwf77bbihCJTwF2SHIIloFW/npmFuSEW9T1aNCmWFlVk2urveiGjvVxKBzjOcUb1FuPTjc
 N1UZY1+fzrl69/hREa0jTum9igth/ny1umb8LP1B7v+4PWW18Pc8iVnihuAgBElu6Zckg7
 ZpqK34HeP6g3pp37DftoKuVKZpL/yre5EvwGMsncIEtc8X6Q9BvAHc+tTTVlK7g3aJqFTy
 SL91odbrCbiLSoeyIKOUWZKhCaCe0ibxcolKfL2yT5j0H6Q1Gqr/UAJmto0eBA==
Message-ID: <ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
Date: Thu, 23 Oct 2025 10:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
 <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
 <20251021160221.4021a302@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251021160221.4021a302@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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



On 22/10/2025 01:02, Jakub Kicinski wrote:
> On Tue, 21 Oct 2025 10:02:01 +0200 Maxime Chevallier wrote:
>> Let me know if you need more clarifications on this
> 
> The explanation was excellent, thank you. I wonder why it's designed
> in such an odd way, instead of just having current_time with some
> extra/fractional bits not visible in the timestamp. Sigh.
> 
> In any case, I don't feel strongly but it definitely seems to me like
> the crucial distinction here is not the precision of the timestamp but
> whether the user intends to dial the frequency.

Yes indeed. I don't have a clear view on wether this is something unique
to stmmac or if this is common enough to justify using the tsconfig API.

As we discuss this, I would tend to think devlink is the way, as this
all boils down to how this particular HW works. Moreover, if we use a
dedicated hwprov qualifier, where do we make it sit in the current
hierarchy (precise > approx) that's used for the TS source selection ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
