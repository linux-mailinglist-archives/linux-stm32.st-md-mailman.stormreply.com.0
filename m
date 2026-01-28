Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CjxMIIBemn31QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 13:30:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D866A143F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 13:30:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14ADAC555BE;
	Wed, 28 Jan 2026 12:30:58 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 708C3C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 12:30:57 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 002151A1B8C;
 Wed, 28 Jan 2026 13:30:57 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DD1241A1B7F;
 Wed, 28 Jan 2026 13:30:56 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BF73520364;
 Wed, 28 Jan 2026 13:30:55 +0100 (CET)
Date: Wed, 28 Jan 2026 13:30:56 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <aXoBgO+qRRmB1yVM@lsv051416.swis.nl-cdc01.nxp.com>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
 <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, s32@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linaro-s32@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,linaro.org,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linaro-s32@linaro.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5D866A143F
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:54:01PM +0300, Dan Carpenter wrote:
> On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
> Originally, accessing this register was done in a sort of ad-hoc way,
> but we want to use the syscon interface to do it.
> 
> This is a little bit ugly because we have to maintain backwards
> compatibility to the old device trees so we have to support both ways
> to access this register.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v5: Return an error if regmap_write() fails
> v4: no change
> v3: no change
> v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..af594a096676 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -11,12 +11,14 @@
>  #include <linux/device.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_address.h>
>  #include <linux/phy.h>
>  #include <linux/phylink.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/stmmac.h>
>  
>  #include "stmmac_platform.h"
> @@ -32,6 +34,8 @@
>  struct s32_priv_data {
>  	void __iomem *ioaddr;
>  	void __iomem *ctrl_sts;
> +	struct regmap *sts_regmap;
> +	unsigned int sts_offset;
>  	struct device *dev;
>  	phy_interface_t *intf_mode;
>  	struct clk *tx_clk;
> @@ -40,11 +44,17 @@ struct s32_priv_data {
>  
>  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  {
> -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	int ret = 0;
> +
> +	if (gmac->ctrl_sts)
> +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	else
> +		ret = regmap_write(gmac->sts_regmap, gmac->sts_offset,
> +				   S32_PHY_INTF_SEL_RGMII);
>  
>  	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int s32_gmac_init(struct device *dev, void *priv)
> @@ -125,10 +135,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  				     "dt configuration failed\n");
>  
>  	/* PHY interface mode control reg */
> -	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> -	if (IS_ERR(gmac->ctrl_sts))
> -		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
> -				     "S32CC config region is missing\n");
> +	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +					"nxp,phy-sel", 1, &gmac->sts_offset);
> +	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
> +		return PTR_ERR(gmac->sts_regmap);
> +	if (IS_ERR(gmac->sts_regmap)) {
> +		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> +		if (IS_ERR(gmac->ctrl_sts))
> +			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
> +					     "S32CC config region is missing\n");
> +	}
>  
>  	/* tx clock */
>  	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
> -- 
> 2.51.0
> 

Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks.
/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
