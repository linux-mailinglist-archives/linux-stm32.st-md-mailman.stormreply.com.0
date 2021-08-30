Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A33FBC66
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 20:26:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B71EEC5A4D9;
	Mon, 30 Aug 2021 18:26:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E63EFC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 18:26:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9BA160E98;
 Mon, 30 Aug 2021 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630348015;
 bh=8tUSjnr7H3PoBoLy0ZN0FF3bzIzyWoa6mO5HoG79dZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aGysZSQSmRhXl9MzPNSZy5H4pIPbHZfQyvZiuDdc+QmanI7H9JYXKHko8cHFaD6GT
 MY8U8DYhC2r4LUCAzNySMWidPasMQIxU1ZNATOo4bXx060x9vO0r+kXEKnXTQZLeOh
 hNvkPlVMeDSgKohJzrV4o+Ni5Ylon2DSr1QaU/k3Kf6UFhLxTXq8BXGmyqifcOY45u
 WNrXARu2Gqn0ySve1D3aoYy3pRJQxvb6o+5M9HUhl2Xfi2wDgKQzc5Tp0SUa7qfWeC
 e+zPXTbHWb8nY0948rvn59Y5LcIgIFhGNEObAIc7hlrMzW6jf6vPOQjR6HiEQ7ZQCo
 oJplxMt8qESww==
Date: Mon, 30 Aug 2021 11:26:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: zhaoxiao <zhaoxiao@uniontech.com>
Message-ID: <20210830112653.450eab49@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210830012417.14872-1-zhaoxiao@uniontech.com>
References: <20210830012417.14872-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] stmmac: dwmac-loongson: change the
 pr_info() to dev_err() in loongson_dwmac_probe()
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

On Mon, 30 Aug 2021 09:24:17 +0800 zhaoxiao wrote:
> @@ -69,6 +68,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	if (!plat)
>  		return -ENOMEM;
>  
> +
>  	if (plat->mdio_node) {
>  		dev_err(&pdev->dev, "Found MDIO subnode\n");
>  		mdio = true;
> @@ -111,6 +111,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	phy_mode = device_get_phy_mode(&pdev->dev);
>  	if (phy_mode < 0)
>  		dev_err(&pdev->dev, "phy_mode not found\n");
> +	
>  
>  	plat->phy_interface = phy_mode;
>  	plat->interface = PHY_INTERFACE_MODE_GMII;

Please remove these changes from the patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
