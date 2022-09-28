Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE05EDD6A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 15:03:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31463C63327;
	Wed, 28 Sep 2022 13:03:37 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BF8EC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 13:03:35 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EBAD660036A;
 Wed, 28 Sep 2022 14:03:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664370215;
 bh=QTkmnZfDvZ/mxFD41uorhVv9pmaNcBMChA47HDWMmlo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HAf2xSvWQW3fkmlTPrU8uPmlSJSSUVgnE+d+UN8sojt/d1DU8XvFBrsMIBdpgecnv
 94XCpGQYSixf9ikw17q1zdPkbKKoC6WOdQD79Mw1c+4WmHhHukIyJr9lmv040S5Ng+
 ES1nYHjPebgmtItBZAzfgEu1LtFKugK2cply+Ilt080KifFfiHtDeXvxfAUTIuEN1z
 bx3E5W+GdnHDDxP3HvKt7pkiKLSCrRDKYYHz5VT8O1D7s+EFpOPjoyxHsnKAYBasrB
 1K/faNNPiEFH/N92O9Y9YlR4zkuhueXsZi4j/lbUehDgYjstUZA8mnqnpobtH0wZSx
 uNwYBOALDdstw==
Message-ID: <9d25bf35-dd88-70f1-6876-b8c99ae7b4a5@collabora.com>
Date: Wed, 28 Sep 2022 15:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
 <20220928092308.26019-4-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928092308.26019-4-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [resend PATCH v6 3/4] arm64: dts: mediatek:
 mt2712e: Update the name of property 'clk_csr'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 28/09/22 11:23, Jianguo Zhang ha scritto:
> Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
> the property name in the binding file.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
