Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC8812FC
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 09:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8078CC35E04;
	Mon,  5 Aug 2019 07:19:54 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0CDC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 16:10:35 +0000 (UTC)
Received: from p508fd160.dip0.t-ipconnect.de ([80.143.209.96]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hta7x-00041C-8t; Fri, 02 Aug 2019 18:09:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 02 Aug 2019 18:09:56 +0200
Message-ID: <2422935.Q2t5okTyEj@phil>
In-Reply-To: <20190802132809.8116-10-yuehaibing@huawei.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
 <20190802132809.8116-10-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:19:53 +0000
Cc: gary.hook@amd.com, clabbe.montjoie@gmail.com, linux-arm-kernel@axis.com,
 jamie@jamieiles.com, linux-stm32@st-md-mailman.stormreply.com,
 jesper.nilsson@axis.com, linux-samsung-soc@vger.kernel.org,
 herbert@gondor.apana.org.au, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, agross@kernel.org,
 thomas.lendacky@amd.com, antoine.tenart@bootlin.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, kgene@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH -next 09/12] crypto: rockchip - use
	devm_platform_ioremap_resource() to simplify code
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

Am Freitag, 2. August 2019, 15:28:06 CEST schrieb YueHaibing:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

looks like nice and simple improvement
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks
Heiko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
