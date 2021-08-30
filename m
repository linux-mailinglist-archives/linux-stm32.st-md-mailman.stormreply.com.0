Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148073FBC6E
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 20:30:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB0D8C5A4D9;
	Mon, 30 Aug 2021 18:30:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA2B4C5A4D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 18:30:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2496560E98;
 Mon, 30 Aug 2021 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630348221;
 bh=iGr981xcSnijXF8G9kE3OksIBLXLhE2eR5tL5v52HjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l1ZiIQeR7nvunSoOQ4SXApPYwqDnc72r9/FdvCmYTj7KFqgjQGKoe0nBXqP/7wrJm
 T2vR9JOyUYu1yWPVpBq43A87FDgWNr4Qs/o57VMVl5qiFcn8fiDk9+3rvA1XkJ5oNa
 qbyOmTewCYKeZ6nRrbPoQ1E1xticbSXc5o1/zWlRx9s8WYfiF1olW9oITP5RBsBPbo
 Lpf7Z8nSDSP9WeOFPE7R6x+TxxT5E+98jOi+OewB2hWeJBQbPfleuHzD3YqPtpseE+
 OUi/llEcmM03U3WsuCagLGEm7T3Y2IzFmis9g4HU08aFmT6rCzDd6cX6lzAuuwIf6I
 8YMkhETsaUg6Q==
Date: Mon, 30 Aug 2021 11:30:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qing Zhang <zhangqing@loongson.cn>
Message-ID: <20210830113020.3ea992a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210830052913.12793-1-zhaoxiao@uniontech.com>
References: <20210830052913.12793-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Cc: zhaoxiao <zhaoxiao@uniontech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: dwmac-loongson:add the return
	value
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

On Mon, 30 Aug 2021 13:29:13 +0800 zhaoxiao wrote:
> Add the return value when phy_mode < 0.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 4c9a37dd0d3f..ecf759ee1c9f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -109,8 +109,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  		plat->bus_id = pci_dev_id(pdev);
>  
>  	phy_mode = device_get_phy_mode(&pdev->dev);
> -	if (phy_mode < 0)
> +	if (phy_mode < 0) {
>  		dev_err(&pdev->dev, "phy_mode not found\n");
> +		return phy_mode;
> +	}
>  
>  	plat->phy_interface = phy_mode;
>  	plat->interface = PHY_INTERFACE_MODE_GMII;

Qing Zhang, does the change look correct to you?

Is it better to assume GMII and continue like the code is currently
doing?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
