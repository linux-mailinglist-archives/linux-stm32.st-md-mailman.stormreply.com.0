Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E295C937
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 11:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C616C71287;
	Fri, 23 Aug 2024 09:29:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCCE2C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 09:29:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-530e062217eso2048609e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724405354; x=1725010154;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HJZgnLkJ3O5ij2lr4uMh4xPM1CMCZfKHy3jKVr/xmOI=;
 b=Gv3o7djyWl/Eoof4T7jNHIAV5rKHsvQBnP5DDvu6uUaehbRj1+wc/Qx2XRHyREpGM4
 91mg3sTcz1Ge0BI+UxzSRfSWrAhlDhMNSd7ye/ZsyHRpx/tRVQmGceNkRhmgvPDcMRlw
 zEVVp8XvnBjrPVG3OuvUwOKxAFr28jMq3TYx8+nJHvff/XCAMJPRflg5yU3/yIvlv07r
 m5t4X6rXflmhByPsPDUI7EmNWy2ULST0Z01r0Sacj/nKiO92hD9Lz6W1MZXd4w5kgHda
 Lv9RRwwdr/uXDTMkSOSqakDcucNJNxcOU/BRIBux4sy//renA6enMrYTcjAbX2S3muuB
 cLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724405354; x=1725010154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJZgnLkJ3O5ij2lr4uMh4xPM1CMCZfKHy3jKVr/xmOI=;
 b=YFnQPSd6cXZgo94T53aV+FgZAs/HKcDbJquiGcVzOo9wZvuNXJ+xO/qzaTeFgugQDR
 mwhkPq4pgazUfMZn0PtxYN8az7F5t7FutRc+iU9UVO0AdNHhlhc2yOibEK19FV040NZi
 F6MVVZmJoMAv9TmgikCeSmjXMrsX5SmNhJPuNeiHKQ3XxUdpTHRGdGXyPp1DSxTZwxBt
 gcFQxtotlmMXIGgZmiIzV+sCuisPoeGGAycREOMzbxOXpgziO5Gvgdg66a17es5LSOUN
 fhRAPyfWjPOIU+SCkrtMFdLlVWPactr5Ryn68/fwgxEGnqJO8LMNwAslDLvUWX24PTxH
 z2kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVweL9BgQnxmHXyFG9XrP+1cgp13P2KbM5k/jXyHlmA+6dNTEKD4mW0VJ0JB0lYrn3pI68HEP3kjtp9/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdJ4CUdQ1t8Dgx0dJf2FXI4oDQvoAB9gTyAz1T0AdIn4ddlhLh
 S5RF3imf2LW112sDGoZOSrMS/OsXOtnZVe/YxfW77zb028T3tifq
X-Google-Smtp-Source: AGHT+IHqOXJOWHb79RTihzE3on1iV74tjWvNfm3tTmK51dxtJorj4SeUP8Xl+KghIyqpPSU2ZAidYw==
X-Received: by 2002:a05:6512:ba2:b0:533:3223:df91 with SMTP id
 2adb3069b0e04-53438773a9emr1245520e87.24.1724405353307; 
 Fri, 23 Aug 2024 02:29:13 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea5d9e6sm494618e87.226.2024.08.23.02.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 02:29:12 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:29:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <6q4pcpyqqt6mhj422pfkgggvwu7jhweu5446y6prcjgjql6xeq@jztt7z4fr6rg>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-7-pstanner@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822134744.44919-7-pstanner@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 6/9] ethernet: stmicro: Simplify PCI
	devres usage
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

Hi Philipp

On Thu, Aug 22, 2024 at 03:47:38PM +0200, Philipp Stanner wrote:
> stmicro uses PCI devres in the wrong way. Resources requested
> through pcim_* functions don't need to be cleaned up manually in the
> remove() callback or in the error unwind path of a probe() function.
> 
> Moreover, there is an unnecessary loop which only requests and ioremaps
> BAR 0, but iterates over all BARs nevertheless.
> 
> Furthermore, pcim_iomap_regions() and pcim_iomap_table() have been
> deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
> 
> Replace these functions with pcim_iomap_region().
> 
> Remove the unnecessary manual pcim_* cleanup calls.
> 
> Remove the unnecessary loop over all BARs.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Thanks for the series. But please note the network subsystem
dev-process requires to submit the cleanup/feature changes on top of
the net-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

Just recently a Yanteng' (+cc) series
https://lore.kernel.org/netdev/cover.1723014611.git.siyanteng@loongson.cn/
was merged in which significantly refactored the Loongson MAC driver.
Seeing your patch isn't based on these changes, there is a high
probability that the patch won't get cleanly applied onto the
net-next tree. So please either rebase your patch onto the net-next
tree, or at least merge in the Yanteng' series in your tree and
rebase the patch onto it and let's hope there have been no other
conflicting patches merged in into the net-next tree.

-Serge(y)


> ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 25 +++++--------------
>  .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 18 +++++--------
>  2 files changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 9e40c28d453a..5d42a9fad672 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -50,7 +50,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_resources res;
>  	struct device_node *np;
> -	int ret, i, phy_mode;
> +	int ret, phy_mode;
>  
>  	np = dev_of_node(&pdev->dev);
>  
> @@ -88,14 +88,11 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  		goto err_put_node;
>  	}
>  
> -	/* Get the base address of device */
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> -		if (ret)
> -			goto err_disable_device;
> -		break;
> +	memset(&res, 0, sizeof(res));
> +	res.addr = pcim_iomap_region(pdev, 0, pci_name(pdev));
> +	if (IS_ERR(res.addr)) {
> +		ret = PTR_ERR(res.addr);
> +		goto err_disable_device;
>  	}
>  
>  	plat->bus_id = of_alias_get_id(np, "ethernet");
> @@ -116,8 +113,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  
>  	loongson_default_data(plat);
>  	pci_enable_msi(pdev);
> -	memset(&res, 0, sizeof(res));
> -	res.addr = pcim_iomap_table(pdev)[0];
>  
>  	res.irq = of_irq_get_byname(np, "macirq");
>  	if (res.irq < 0) {
> @@ -158,18 +153,10 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> -	int i;
>  
>  	of_node_put(priv->plat->mdio_node);
>  	stmmac_dvr_remove(&pdev->dev);
>  
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		pcim_iounmap_regions(pdev, BIT(i));
> -		break;
> -	}
> -
>  	pci_disable_msi(pdev);
>  	pci_disable_device(pdev);
>  }
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> index 352b01678c22..f89a8a54c4e8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -188,11 +188,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>  		return ret;
>  	}
>  
> -	/* Get the base address of device */
> +	/* Request the base address BAR of device */
>  	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
>  		if (pci_resource_len(pdev, i) == 0)
>  			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
> +		ret = pcim_request_region(pdev, i, pci_name(pdev));
>  		if (ret)
>  			return ret;
>  		break;
> @@ -205,7 +205,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>  		return ret;
>  
>  	memset(&res, 0, sizeof(res));
> -	res.addr = pcim_iomap_table(pdev)[i];
> +	/* Get the base address of device */
> +	res.addr = pcim_iomap(pdev, i, 0);
> +	if (!res.addr)
> +		return -ENOMEM;
>  	res.wol_irq = pdev->irq;
>  	res.irq = pdev->irq;
>  
> @@ -231,16 +234,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>   */
>  static void stmmac_pci_remove(struct pci_dev *pdev)
>  {
> -	int i;
> -
>  	stmmac_dvr_remove(&pdev->dev);
> -
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		pcim_iounmap_regions(pdev, BIT(i));
> -		break;
> -	}
>  }
>  
>  static int __maybe_unused stmmac_pci_suspend(struct device *dev)
> -- 
> 2.46.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
