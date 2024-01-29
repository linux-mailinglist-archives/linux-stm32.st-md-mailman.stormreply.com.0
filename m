Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE18413AD
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 20:42:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBB0C6B463;
	Mon, 29 Jan 2024 19:42:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43DE9C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706557367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6eMGjFNAQFg5AWGDSpwZ9ve2g+VcHkXFxxu/Em8ANwU=;
 b=DLFYAyQzRdXRAHhWesRAk805k39+emCeV4TUrCnfEFu4UH1EflXeV8ZHkb+kJEL3EYrGdE
 AhHPsI2eXsjE6Zy44er4cDhIuqchMIKiLTyr4rdxsnPq8kT+kynu5oELCDqM7Z/uyDSFd4
 ex5QEOMuFcStx2JEJP14lOwlulZVyno=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-s-Yz8gczNqKI4UPTyXiyqQ-1; Mon, 29 Jan 2024 14:42:45 -0500
X-MC-Unique: s-Yz8gczNqKI4UPTyXiyqQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-7ce706ba435so1005221241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 11:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706557365; x=1707162165;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6eMGjFNAQFg5AWGDSpwZ9ve2g+VcHkXFxxu/Em8ANwU=;
 b=v2z+a4H9FTM7JP3UtSj01Z2wbAm1svcjZr07D4v6Act4Dq7/dvZHodj2tCxj6b20lY
 o7V6gbrsMs04EU3A5XZLshvvijjuQGBiKavU8jRcQpJ1C2f2R7rYNA6CpKSSkR/cl4tA
 W0ZO19YRbZBNWhE0Zf5iXfv7SgXwlvbJywkJvMTunmPkV35mkWk+UF2ZgpXii6GZiW6l
 9JFo5q0aMu403hMuMtRLuIlW5mrUd1r+GvcpEYZyg4m2O9hPdF5rhXoam4M1bYw4efq9
 Zc6n1qmhTfA6VYvKa5k3Bwdi6lLpTPCtX+MjdFZ5hw0gkFX5fl6mHoWqNhtBORS/oTJt
 1XHw==
X-Gm-Message-State: AOJu0YwBMKljzRNhp8JiCJDLhuoUInW4TdcHsa2QKiuq9AbzS7SUP/5v
 KVWB2Ka/ihmGpIEhWql9wA7RzVtDXFauJ5k14UvIR8wRONnSlfCV2OBlDjHj5A16KcvM6ER2VGR
 OUoARzIInaI41tZ3ZLRZNUdzy0Rj4JD/F3+OzoBx7y/NE6Xx/2uIkvMtAJwgkB2Uuxz83KAYV4n
 3Ykg==
X-Received: by 2002:a05:6122:905:b0:4b6:d44e:2897 with SMTP id
 j5-20020a056122090500b004b6d44e2897mr2411920vka.33.1706557365392; 
 Mon, 29 Jan 2024 11:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEThEh8Xkd7t3M3A0o/6ZDNQQdUgWUrOE1Coe2POYUY14FwHFSt1AWYC4c9IpcRASFz/2t94Q==
X-Received: by 2002:a05:6122:905:b0:4b6:d44e:2897 with SMTP id
 j5-20020a056122090500b004b6d44e2897mr2411868vka.33.1706557364144; 
 Mon, 29 Jan 2024 11:42:44 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 pj2-20020a0562144b0200b0068c445b747bsm2266170qvb.59.2024.01.29.11.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 11:42:43 -0800 (PST)
Date: Mon, 29 Jan 2024 13:42:41 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <jnwylhbparw4uwci3epbd7th4izt3rnd3uzrnm5mdunm55kdoh@yyp4dprfh3sl>
References: <20240127130327.22443-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240127130327.22443-1-quic_snehshah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for pm ops
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

On Sat, Jan 27, 2024 at 06:33:27PM +0530, Sneh Shah wrote:
> Add qcom ethqos specific runtime and system sleep pm ops.
> As part of system sleep qcom ethqos needs to disable all clocks.
> This ops will be extended further with qcom specific features.

This last sentence sounds like this series is incomplete, I'd avoid such
wording if its untrue. Upstream typically won't accept things that are
building infrastructure for patches that will "eventually be posted".

You state in your commit what the code does (really it replaces the
stmmac_pltfrm_ops with its own), but only gloss over the why. I'd lead
with the "why". i.e. I'd say something like
"net: stmmac: dwmac-qcom-ethqos: Turn clocks off/on during suspend/resume"

Since there's already a handler installed for PM ops, I'd explain why
you need to change to new ones as well.

> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 51 ++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..cba601ee9e01 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -720,6 +720,55 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
>  }
>  
> +static int qcom_ethqos_runtime_suspend(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	return stmmac_bus_clks_config(priv, false);
> +}
> +

This perfectly matches the stmmac_runtime_suspend() function installed
originally. I don't see why you couldn't at a minimum reuse
that function instead of writing your own.

> +static int qcom_ethqos_runtime_resume(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	return stmmac_bus_clks_config(priv, true);
> +}

Same idea as the stmmac_runtime_suspend() comment above!

> +
> +static int qcom_ethqos_suspend(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret;
> +
> +	if (!ndev || !netif_running(ndev))
> +		return -EINVAL;
> +
> +	ret = stmmac_suspend(dev);

ret here is ignored.

> +
> +	return stmmac_bus_clks_config(priv, false);
> +}
> +
> +static int qcom_ethqos_resume(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret;

unused ret.

> +
> +	if (!ndev || !netif_running(ndev))
> +		return -EINVAL;
> +
> +	stmmac_bus_clks_config(priv, true);

Probably should check this.

> +
> +	return stmmac_resume(dev);
> +}

Both the new system sleep ops installed here basically match the
stmmac_pltfrm_suspend/resume() functions that were already installed.
The only difference I'm noting is that you want to call
stmmac_bus_clks_config() in your implementation, whereas the originals call
the exit()/init() callbacks if they exist in the platform driver.

I would say "let's just make a exit()/init() callback for Qualcomm", but
looking further... (see below)

> +
> +const struct dev_pm_ops qcom_ethqos_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_ethqos_suspend, qcom_ethqos_resume)
> +	SET_RUNTIME_PM_OPS(qcom_ethqos_runtime_suspend, qcom_ethqos_runtime_resume, NULL)
> +};
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -838,7 +887,7 @@ static struct platform_driver qcom_ethqos_driver = {
>  	.probe  = qcom_ethqos_probe,
>  	.driver = {
>  		.name           = "qcom-ethqos",
> -		.pm		= &stmmac_pltfr_pm_ops,
> +		.pm		= &qcom_ethqos_pm_ops,

You effectively remove the stmmac_pltfr_noirq_suspend()/resume()
callbacks here, which do the stmmac_bus_clks_config() via
pm_runtime_force_suspend() etc during late suspend/early resume.

I do see this if statement, but I believe !device_may_wakeup() is true here,
so the clocks should get killed.

	static int __maybe_unused stmmac_pltfr_noirq_suspend(struct device *dev)
	{
		struct net_device *ndev = dev_get_drvdata(dev);
		struct stmmac_priv *priv = netdev_priv(ndev);
		int ret;

		if (!netif_running(ndev))
			return 0;

		if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
			/* Disable clock in case of PWM is off */
			clk_disable_unprepare(priv->plat->clk_ptp_ref);

			ret = pm_runtime_force_suspend(dev);
			if (ret)
				return ret;
		}

		return 0;
	}

Right now I'm of the opinion that this patch shouldn't really change
much based on that digging. Please let me know if I'm missing something
but it appears to me this should already be working.

>  		.of_match_table = qcom_ethqos_match,
>  	},
>  };
> -- 
> 2.17.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
