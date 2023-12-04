Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F80803A3E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 17:28:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 335E1C6C85F;
	Mon,  4 Dec 2023 16:28:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA185C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 16:28:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 339DCB8109D;
 Mon,  4 Dec 2023 16:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBC2C433C9;
 Mon,  4 Dec 2023 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701707315;
 bh=dKDKr3gvolScXhXGPFpnjQmlMO642TbJVWqWievKFhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3KwE9Rscpf9FC+mLKjKbovT28jw+vIXOZj6gBgjLVekxsoJi5A6Do+OBDJyEEwoJ
 zHlAohZsNUdLhgs6MwEDHj4hWPpefc2/40EtAC7c47iEUpdls0tV/r9AKQmUqSMDxy
 kT8YRNxVuKwyJ1EiRr4lJTZ9V5rwp5w/sRidaJudvLKc+do/OIx4h//55aFuPcDL4p
 r/7qq+wKSCuAUdGWVy8s8Ym/34Y0hMXVV0G/+BsJ0ZYppkuX7D8YsPS3PftmzILpIZ
 bFLPoC2HPS2Q5Q5jUvo3OpiWQXIAatEpVxO0s28C2TDKr5tZBWc/JxidPDY8fiaTr6
 l1tlf8eOICSOA==
Date: Mon, 4 Dec 2023 08:31:57 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <t36qr4ihbwf73sghpy4an6udbzbuz3nuksyvbpg6p2mfqgojnh@ktqjuwkuvigd>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204084854.31543-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: Add
 sysfs nodes for qcom ethqos
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

On Mon, Dec 04, 2023 at 02:18:54PM +0530, Sneh Shah wrote:
> Add sysfs nodes to conifigure routing of specific vlan id to GVM queue.
> GVM queue is not exposed to PVM stmmac, so TC ops can't configure routing.
> 

Perhaps I'm just not familiar enough with the details of stmmac, but can
you please describe what PVM and GVM is?

Regards,
Bjorn

> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 216 +++++++++++++++++-
>  1 file changed, 215 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..ea89045a90a1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -109,6 +109,8 @@ struct qcom_ethqos {
>  	unsigned int num_por;
>  	bool rgmii_config_loopback_en;
>  	bool has_emac_ge_3;
> +	int gvm_vlan_prio;
> +	int gvm_queue;
>  };
>  
>  static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -710,6 +712,214 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
>  }
>  
> +static ssize_t gvm_vlan_routing_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *user_buf, size_t size)
> +{
> +	struct net_device *netdev = to_net_dev(dev);
> +	struct stmmac_priv *priv;
> +	struct qcom_ethqos *ethqos;
> +	u32 prio;
> +	s8 input = 0;
> +
> +	if (!netdev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = netdev_priv(netdev);
> +	if (!priv) {
> +		pr_err("priv is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ethqos = priv->plat->bsp_priv;
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	if (kstrtos8(user_buf, 0, &input)) {
> +		pr_err("Error in reading option from user\n");
> +		return -EINVAL;
> +	}
> +
> +	if (input < 1 || input > 7) {
> +		pr_err("Invalid option set by user\n");
> +		return -EINVAL;
> +	}
> +
> +	if (input == ethqos->gvm_vlan_prio)
> +		pr_err("No effect as duplicate input\n");
> +
> +	ethqos->gvm_vlan_prio = input;
> +	prio  = 1 << input;
> +
> +	stmmac_rx_queue_prio(priv, priv->hw, prio, ethqos->gvm_queue);
> +
> +	return size;
> +}
> +
> +static ssize_t gvm_queue_mapping_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *user_buf, size_t size)
> +{
> +	struct net_device *netdev = to_net_dev(dev);
> +	struct stmmac_priv *priv;
> +	struct qcom_ethqos *ethqos;
> +	u32 prio;
> +	s8 input = 0;
> +
> +	if (!netdev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = netdev_priv(netdev);
> +	if (!priv) {
> +		pr_err("priv is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ethqos = priv->plat->bsp_priv;
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	if (kstrtos8(user_buf, 0, &input)) {
> +		pr_err("Error in reading option from user\n");
> +		return -EINVAL;
> +	}
> +
> +	if (input == ethqos->gvm_queue)
> +		pr_err("No effect as duplicate input\n");
> +
> +	ethqos->gvm_queue = input;
> +	prio  = 1 << input;
> +
> +	return size;
> +}
> +
> +static ssize_t gvm_queue_mapping_show(struct device *dev,
> +				      struct device_attribute *attr, char *user_buf)
> +{
> +	struct net_device *netdev = to_net_dev(dev);
> +	struct stmmac_priv *priv;
> +	struct qcom_ethqos *ethqos;
> +
> +	if (!netdev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = netdev_priv(netdev);
> +	if (!priv) {
> +		pr_err("priv is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ethqos = priv->plat->bsp_priv;
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	return scnprintf(user_buf, 256, "%d\n", ethqos->gvm_queue);
> +}
> +
> +static ssize_t gvm_vlan_routing_show(struct device *dev,
> +				     struct device_attribute *attr, char *user_buf)
> +{
> +	struct net_device *netdev = to_net_dev(dev);
> +	struct stmmac_priv *priv;
> +	struct qcom_ethqos *ethqos;
> +
> +	if (!netdev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = netdev_priv(netdev);
> +	if (!priv) {
> +		pr_err("priv is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ethqos = priv->plat->bsp_priv;
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	return scnprintf(user_buf, 256, "%d\n", ethqos->gvm_vlan_prio);
> +}
> +
> +static DEVICE_ATTR_RW(gvm_queue_mapping);
> +
> +static DEVICE_ATTR_RW(gvm_vlan_routing);
> +
> +static int ethqos_remove_sysfs(struct qcom_ethqos *ethqos)
> +{
> +	struct net_device *net_dev;
> +
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	net_dev = platform_get_drvdata(ethqos->pdev);
> +	if (!net_dev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	sysfs_remove_file(&net_dev->dev.kobj,
> +			  &dev_attr_gvm_queue_mapping.attr);
> +	sysfs_remove_file(&net_dev->dev.kobj,
> +			  &dev_attr_gvm_vlan_routing.attr);
> +
> +	return 0;
> +}
> +
> +static int ethqos_create_sysfs(struct qcom_ethqos *ethqos)
> +{
> +	int ret;
> +	struct net_device *net_dev;
> +
> +	if (!ethqos) {
> +		pr_err("ethqos is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	net_dev = platform_get_drvdata(ethqos->pdev);
> +	if (!net_dev) {
> +		pr_err("netdev is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = sysfs_create_file(&net_dev->dev.kobj,
> +				&dev_attr_gvm_queue_mapping.attr);
> +	if (ret) {
> +		pr_err("unable to create passthrough_en sysfs node\n");
> +		goto fail;
> +	}
> +
> +	ret = sysfs_create_file(&net_dev->dev.kobj,
> +				&dev_attr_gvm_vlan_routing.attr);
> +	if (ret) {
> +		pr_err("unable to create cv2x_priority sysfs node\n");
> +		goto fail;
> +	}
> +
> +	return ret;
> +
> +fail:
> +	ethqos_remove_sysfs(ethqos);
> +
> +	return ret;
> +}
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -812,7 +1022,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
>  	}
>  
> -	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +	ret = devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	return ethqos_create_sysfs(ethqos);
>  }
>  
>  static const struct of_device_id qcom_ethqos_match[] = {
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
