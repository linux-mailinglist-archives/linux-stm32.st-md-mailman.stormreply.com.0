Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B780DBB0D4B
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Oct 2025 16:52:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B7BC3FACB;
	Wed,  1 Oct 2025 14:52:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAB94C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Oct 2025 14:52:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D35E45A1E;
 Wed,  1 Oct 2025 14:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBB8C4CEF9;
 Wed,  1 Oct 2025 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759330346;
 bh=ZLuAJtf5Ay5V3wJzzmRXG3Pw3uAXV9z6Fj6IMRT0cJE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VbLGX5a5HziGndAsvgrxLMIOrlcpzm8thMULLWEGLhtnECk4IVmzjC8XTXci/YarC
 QOyjqQFLeVq70nfhAYnh+YiN0wt9/1Slt9zCEBBnzWTSpqJKC0i88d7THX+nEE7+jn
 JNl7OskrE87jgKcrq8mPO4X5az4kxQrHy2uidsRNVXXelmpVMpbhwmxQsyRSGDvuAF
 DgiQNLkhP1J83Dtk0r+5xzmuqmvkzunT42Z4qfwu3JahHU7BPrqmM7U8FbV9YDoSz5
 Eri2WcVFLxX8kG8nfTQHoCpmw3MFlhxUXE5qWuYNoQw2NqiEZ7qH/wmsQs051iWvoF
 QyKK0wMf9/lvw==
Date: Wed, 1 Oct 2025 09:52:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20251001145223.GA226169@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e69ade3edcec4da2d5bfc66e0d03bbcb5a857021.1759169956.git.christophe.jaillet@wanadoo.fr>
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Re-use existing error
 handling path in stm32_pcie_probe()
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

On Mon, Sep 29, 2025 at 08:19:30PM +0200, Christophe JAILLET wrote:
> An error handling path is already available, so use it instead of hand
> writing the same code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The stm32 driver hasn't been merged upstream yet, so I squashed this
into it:

  https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=fd486e67e88c

Thank you!

> ---
>  drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> index 964fa6f674c8..96a5fb893af4 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
>  
>  	ret = pm_runtime_set_active(dev);
>  	if (ret < 0) {
> -		clk_disable_unprepare(stm32_pcie->clk);
> -		stm32_remove_pcie_port(stm32_pcie);
> -		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
> +		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
> +		goto err_disable_clk;
>  	}
>  
>  	pm_runtime_no_callbacks(dev);
>  
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret < 0) {
> -		clk_disable_unprepare(stm32_pcie->clk);
> -		stm32_remove_pcie_port(stm32_pcie);
> -		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		goto err_disable_clk;
>  	}
>  
>  	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
> -- 
> 2.51.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
