Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A75F0261
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 03:50:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0951C64100;
	Fri, 30 Sep 2022 01:50:03 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25709C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 01:50:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71C85B826EC;
 Fri, 30 Sep 2022 01:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D83C433D6;
 Fri, 30 Sep 2022 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664502601;
 bh=GLXUi5XMqb9SWFsCHSWdY5rauLl8NCQnmgT8/QW7ew4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qzPBI2b8OdPAPM1rPavgrFFu2C3uGkLTrjypl29DiDgI41ll/xIWpMnqHct8Z18+H
 +A2GnxzqismYXm7jKA3q7YN8Ypc5gsw73oAKuOrEeWzieWodb7SdxDrx/Ocv2Og7mI
 4ine0SqwKroX91BwdXxtDJq4F5pYJLnnnW0qbXDt+nQtmwlWWaQBlyHlex+/J/UfZy
 ZqMhv6XwBc70RQMnoKU2J5+IhVuDWeYpD87xAkg5yqRDVhqMP0+mCsnL/JdKdSYr3Z
 ZH1kufJJ2dmJhbIXPGTfbjdaTv+Rh/xclRAjsJHozB4nHJ1n5FVtZWEgBFBfuZKMwO
 7eVRNAMTEsVmQ==
Date: Thu, 29 Sep 2022 18:49:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>
Message-ID: <20220929184959.2c1458c1@kernel.org>
In-Reply-To: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [resend PATCH v6 0/4] Mediatek ethernet patches
	for mt8188
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

On Wed, 28 Sep 2022 17:23:04 +0800 Jianguo Zhang wrote:
> Jianguo Zhang (4):
>   dt-bindings: net: mediatek-dwmac: add support for mt8188
>   dt-bindings: net: snps,dwmac: add new property snps,clk-csr
>   arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
>   net: stmmac: add a parse for new property 'snps,clk-csr'

Are we supposed to drop patch 3 when applying this to net-next?
Do I understand this correctly?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
