Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF184143C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 21:26:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44690C6B463;
	Mon, 29 Jan 2024 20:26:56 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCEFCC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 20:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 326DDCE170E;
 Mon, 29 Jan 2024 20:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2B0C433F1;
 Mon, 29 Jan 2024 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706560013;
 bh=30G65tljw/tJBwMTFx2tDliaqMNSFJuAgSbb75kyu5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=al9pC9Lu3KFW10x9B84NrzhDsftSFRDCJZ0f3O/jzI/eb9sjfyWFaMSOobqxSCUaH
 UVu6DQ4qTzeXkGPklD+uAcJreG3DAwPLVdo1vZa4v7hZWKmoJmzDkH+HHHH/k+xYta
 NGIF0zRhcWr+9W/tOu+bMwc6GFKLsnx9cNGAgmbY90ov4GcNJkE5eXxbvH8w/AkBDx
 YSvi5C4ql1aCk+IaK2Tu47nLOjnos9InsBbzXrlzeaUUbrD7addpi2fmi3VkfheLvb
 9Z2w4jf1AXfTQdW3emp13eROLa+d4GyOwWEW2j70g5yfWMUlvj8n6ZbKIoHQwd1JHK
 qOw8pp+udcLcQ==
Date: Mon, 29 Jan 2024 12:26:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20240129122651.4b3c7b8e@kernel.org>
In-Reply-To: <f113c4b6-a074-4566-b69b-f25c9590d23f@collabora.com>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
 <20240126191319.1209821-2-cristian.ciocaltea@collabora.com>
 <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
 <e29ae12b-5823-4fba-8029-e8e490462138@collabora.com>
 <56f3bd3c-c099-405b-837b-16d8aeb4cc4b@lunn.ch>
 <8c4cfc54-bd23-4d56-a4ae-9f3dd5cedb59@collabora.com>
 <e99e72b3-e0f6-4a80-82c8-bd60c36d180a@lunn.ch>
 <f113c4b6-a074-4566-b69b-f25c9590d23f@collabora.com>
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

On Mon, 29 Jan 2024 20:51:43 +0200 Cristian Ciocaltea wrote:
> > Well, b4 can do that:
> > 
> > https://b4.docs.kernel.org/en/latest/contributor/trailers.html
> > 
> > But i've no idea if the netdev tooling actual does.  
> 
> Jakub, please let me know how should we proceed further!
> 
> The problem is that we ended up with a RESEND to include a missing R-b
> tag from Rob, but afterwards we also got this new R-b from Krzysztof
> here.  If it's not possible for you to collect both tags, I could
> prepare a v5 to avoid having another RESEND.

First off, have another read of our rules:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
:)

IMHO forwarding the review tag to a newer version of the set yourself
(like I just did) is fine. None of the tooling I know checks if that
the person posting the tag matches the From:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
