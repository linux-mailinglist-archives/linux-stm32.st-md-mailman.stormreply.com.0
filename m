Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6126F7DAEDD
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Oct 2023 23:53:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CA1BC6B44B;
	Sun, 29 Oct 2023 22:53:59 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D8FCC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 22:53:58 +0000 (UTC)
Received: from [192.168.1.90] (unknown [188.24.143.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5344666072BB;
 Sun, 29 Oct 2023 22:53:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620037;
 bh=vm9aJnhq63RdAaCsogNW1tU6wc1DMvmWq3qynSp9OGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZlS35BI0RXrQj/Gnyaf64juE825VEBdfX4SYCJizDZFvT5KuXISWLctywXd80qzuC
 /WGuacRkxqmWk5ftBuaGxLpx/Yi+7iInpcYkuBmmI1yJVxhwQJutYlMtAEb54C6GTm
 NXW+e5p2TQNAHOMyTwCv4742iRyQfKm+GffBe8OlU7tskNnujIke4QYrmA4ohjPNRn
 TmjagXC3BYwMItuBM4bNDPZXSDLkLOtlPOxyh3Rf0HyBJasYMbr7fLRVG8fBvg8jJx
 u7+aIQaPU2c/5qxCB/Wb1fKKy0XmH/1JNCQ4MqOGDrUiqtvrx8kr2lkc8F1PwWDDa9
 iTgFfFHJJ0OUw==
Message-ID: <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
Date: Mon, 30 Oct 2023 00:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
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

On 10/29/23 20:46, Andrew Lunn wrote:
> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>> RGMII-ID.
>>
>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>> yes, add the mdio & phy sub-nodes.
> 
> Please could you try to get this tested. It might shed some light on
> what is going on here, since it is a different PHY.

Actually, this is the main reason I added the patch. I don't have access
to this board, so it would be great if we could get some help with testing.

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
