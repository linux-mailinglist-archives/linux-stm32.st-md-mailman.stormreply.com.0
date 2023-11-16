Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2097EE144
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 14:15:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C681EC6B44B;
	Thu, 16 Nov 2023 13:15:52 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8791AC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 13:15:51 +0000 (UTC)
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C9A56607346;
 Thu, 16 Nov 2023 13:15:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700140550;
 bh=FheqyWG5oYvdCs8XtH6cmP60r9uz+9KnrY6VzNg5O78=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=dm27RZPNxmcmHyvomtwlEgtdO2kSvRTcyqGzL8VH0w8o5o0vVlJOZ2j5Nz0H06egL
 djXzOYk/C3/Tdp+XcYP9FRTbNQ3Nepoe08B/Jc8SforDRhp1DYbfu46Th2xQV8DjO+
 FQFujPBoHELizF0oDJcFBzjD5q7fJgJpdkHZlQ+A2rHcURp+zwJALeZi9yVia4Qlvw
 Jf/NwAaaod2Wz2DgOKw7N0DOR6pNuu1hDKCk7PngXmB8d4hPw8ZOKgQYuqQ+E2ueH1
 SbIg8i5QjI0C7kevhMN5N6XYzG6navy0j9hPV15fj25yq8yrIOJfsDgPqlafTQt16T
 CyXa6LEC5tR0g==
Message-ID: <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
Date: Thu, 16 Nov 2023 15:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
In-Reply-To: <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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

On 10/30/23 00:53, Cristian Ciocaltea wrote:
> On 10/29/23 20:46, Andrew Lunn wrote:
>> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>>> RGMII-ID.
>>>
>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>>> yes, add the mdio & phy sub-nodes.
>>
>> Please could you try to get this tested. It might shed some light on
>> what is going on here, since it is a different PHY.
> 
> Actually, this is the main reason I added the patch. I don't have access
> to this board, so it would be great if we could get some help with testing.

@Emil, @Conor: Any idea who might help us with a quick test on the
BeagleV Starlight board?

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
