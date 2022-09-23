Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C85E7683
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 11:10:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B1EC03FE0;
	Fri, 23 Sep 2022 09:10:54 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D94C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 09:10:53 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 64B1C6602038;
 Fri, 23 Sep 2022 10:10:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663924252;
 bh=5dQSl61o3/d45Zc6JtCNy5byEWYtp/sXtn/FPR8mee0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TcjIIpAmezqk2QInoHN7/joAu1zk07/Kfi7cH9ft9WKzxDKDSNEldxLKkANAX6gGy
 HAeHai4DWD0fqncMVAK1e3wiBRq2xtkmBGERLqjeGmOyFFn2TisGGgqCCuIFpLJRDu
 1i62xgUq8U/9aDBXM4sYqRWTb+smoi/nXRFqVTZmNgaD4Ra1969DyhAckqLVWb9Uvj
 3MRMA/JRsEEwGP6M0saTXuzRpkbM6g91Q37wHAtjLF+eAgMp2blQalZvvPRWvO8/Cw
 Bs+WK5Lq5/QhU4m4l8Kzj191h86d8vUG/fGPYsFnq20sxUB+XG/NAzs7whejtpteYg
 3QH9MNcbetMIg==
Message-ID: <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
Date: Fri, 23 Sep 2022 11:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220923052828.16581-5-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] net: stmmac: Update the name of
	property 'clk_csr'
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

Il 23/09/22 07:28, Jianguo Zhang ha scritto:
> Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
> the property name in the binding file.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 9f5cac4000da..18f9952d667f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -444,7 +444,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>   	 * or get clk_csr from device tree.
>   	 */
>   	plat->clk_csr = -1;
> -	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
> +	of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr);

This is going to break MT2712e on old devicetrees.

The right way of doing that is to check the return value of of_property_read_u32()
for "snps,clk-csr": if the property is not found, fall back to the old "clk_csr".

Regards,
Angelo

>   
>   	/* "snps,phy-addr" is not a standard property. Mark it as deprecated
>   	 * and warn of its use. Remove this when phy node support is added.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
