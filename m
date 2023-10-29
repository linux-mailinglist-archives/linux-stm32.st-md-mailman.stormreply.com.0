Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D07DAED7
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Oct 2023 23:50:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC52CC6B44B;
	Sun, 29 Oct 2023 22:50:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3CDEC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mItQr9Lnr2C07koQ7ptJcY2nYrj1Tv7N3viIjaS79mo=; b=O4z6s+bSQrfPzDDmeay9WJaB3d
 6DyWIwTIhL7JZOJeso/nzNcfcqgwCRchXJOb28e+/nsHaW9AG4w2iw0aYs/b//6B7COSqtYePpmZE
 ejpmJpVx3mLK0a39nksWbIFKIj6n6mS3qFBR1PKPntGjDw4R8tVaHA3jZWq87tDvjXtE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qxEbw-000T7f-KV; Sun, 29 Oct 2023 23:50:24 +0100
Date: Sun, 29 Oct 2023 23:50:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <e837e707-5b01-4b7b-8362-0dc62883fdba@lunn.ch>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-12-cristian.ciocaltea@collabora.com>
 <f379a507-c3c1-4872-9e4f-f521b86f44d4@lunn.ch>
 <f05839c0-7a78-4616-bedc-6a876b7f4bb3@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f05839c0-7a78-4616-bedc-6a876b7f4bb3@collabora.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 11/12] riscv: dts: starfive:
 visionfive-v1: Enable gmac and setup phy
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

On Mon, Oct 30, 2023 at 12:41:23AM +0200, Cristian Ciocaltea wrote:
> On 10/29/23 20:45, Andrew Lunn wrote:
> > On Sun, Oct 29, 2023 at 06:27:11AM +0200, Cristian Ciocaltea wrote:
> >> The StarFive VisionFive V1 SBC has a Motorcomm YT8521 PHY supporting
> >> RGMII-ID, but requires manual adjustment of the RX internal delay to
> >> work properly.
> >>
> >> The default RX delay provided by the driver is 1.95 ns, which proves to
> >> be too high. Applying a 50% reduction seems to mitigate the issue.
> > 
> > I'm not so happy this cannot be explained. You are potentially heading
> > into horrible backwards compatibility problems with old DT blobs and
> > new kernels once this is explained and fixed.
> 
> It seems the visionfive-v2 board also required setting some delays, but
> unfortunately no details were provided:
> 
> 0104340a67b1 ("riscv: dts: starfive: visionfive 2: Add configuration of
> mac and phy")

That board also uses a YT8531 PHY. Its possible this is somehow to do
with the PHY. Which is why testing with the Microchip PHY is
important. That should answer the question is it a SoC or a PHY
problem.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
