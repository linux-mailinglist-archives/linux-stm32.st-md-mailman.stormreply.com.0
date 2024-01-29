Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE858414D0
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 22:04:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63A7C6B476;
	Mon, 29 Jan 2024 21:04:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B492AC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 21:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 803A6CE17C8;
 Mon, 29 Jan 2024 21:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A83FC43399;
 Mon, 29 Jan 2024 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706562271;
 bh=XDN/zIhlQxTNPGPKvJfrKfrDPmIin/uSBcSP0Tsu0yY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YblNVKavSXi8rgGT1xsktmVVJKTR+Z6woc4IBj6FaYb8zhPGwCSHXipE1+a2dZO91
 RNBou8glk8TSuv/Z+FHplscPy4MHwIgb6O8nGQGGdOOXbQQig362CBEriQMatrrHbK
 /662rwz80lYbn99z6PM/lV2/W0InWNzZ8Zvu7a/5SWdRt4Q8g4Wk21lHFEx2rFuDdJ
 ojNmXpBBBmtjAS74X4/PJlU14Ybn/eR84VLpXliR0gCTXiRIEsYY3F6+ddKkymn8PY
 efTxrtQkXL+wFM9iTnqJ3NzyiRl1zP8c1W76cBeQvPDxVVUIf61rGUpCdm/ZNHAXQR
 LMfccwKmRHKbw==
Date: Mon, 29 Jan 2024 13:04:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20240129130429.34094446@kernel.org>
In-Reply-To: <1fa5aeee-a205-438a-a0fa-54643ffa41d0@collabora.com>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
 <20240126191319.1209821-2-cristian.ciocaltea@collabora.com>
 <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
 <e29ae12b-5823-4fba-8029-e8e490462138@collabora.com>
 <56f3bd3c-c099-405b-837b-16d8aeb4cc4b@lunn.ch>
 <8c4cfc54-bd23-4d56-a4ae-9f3dd5cedb59@collabora.com>
 <e99e72b3-e0f6-4a80-82c8-bd60c36d180a@lunn.ch>
 <f113c4b6-a074-4566-b69b-f25c9590d23f@collabora.com>
 <20240129122651.4b3c7b8e@kernel.org>
 <1fa5aeee-a205-438a-a0fa-54643ffa41d0@collabora.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

On Mon, 29 Jan 2024 22:57:11 +0200 Cristian Ciocaltea wrote:
> > First off, have another read of our rules:
> > https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
> > :)  
> 
> Oh, net/net-next suffix is required, will make sure to add it next time!
> 
> The 24h period restriction is still applicable for a RESEND that is
> meant to quickly fix a previous submission issue?

Yes, reposting too quickly often leads to reviewers looking at 
the wrong version.

> > IMHO forwarding the review tag to a newer version of the set yourself
> > (like I just did) is fine. None of the tooling I know checks if that
> > the person posting the tag matches the From:  
> 
> Hmm, I didn't actually test, but according to the link Andrew posted
> above, for b4 it might be necessary to make use of the
> `--sloppy-trailers` flag:
> 
> "Accept trailers where the email address of the sender differs from the
> email address found in the trailer itself."

Hah, interesting. Using a corporate address for the tag but ML-friendly
account for sending the email is quite common. I'm surprised. In any
case, our tools don't do this. I think it's kinda pointless unless the
tool can also prove provenance of the tags already in the patch...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
