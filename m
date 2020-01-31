Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C60314E970
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 09:12:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B799FC36B0C;
	Fri, 31 Jan 2020 08:12:26 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1249C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 08:12:24 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w62so2924055pfw.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9La4XRYOPIW+wBytP9lnaX+NFvdLotLa6kVZ3qcVyN4=;
 b=J7cmKmSHNC6TnmiPZtogNOgiLc0g+IWXInr212XaYOWskNcgHZK6hp8W0xWct1wxxZ
 SsphLkZUO7WOYR5VsPzDCEgr6HWfyyhnW7D6RbD/ZYo8BTj3XDHzKJ63hEYzNL4BsnsV
 Y0h5PEvsIDkPRiZUXG04bVrlP1EbUwCzlhoP60EDJ+HFFi7GvRqup3eUacSNzgLaIj5Z
 exQLesOcBySbo1al2DKe25aE2H9NJsrDj9TxIQpt74ChaYE8xy5+VrWVDzcdgEUnDLdM
 efUvkYpOWg3djQXYsBu45XGHmOsZC29kzAIC2lwd1u5zCE47qgdsFscV9oQeQOFsStlW
 fe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9La4XRYOPIW+wBytP9lnaX+NFvdLotLa6kVZ3qcVyN4=;
 b=SMi6SV3pnTn7uwChwfzk2qpT5OHMo16HplPT1LZ0H6ozN01oncJ27KkYmUnkT52Z3z
 QV/XLtDNkOpxpNinHI6ijB01dmok3eJn64tXMhYa9E4PqFURQbLieY8HifBZEZ4dUQwi
 WvBEidMIwtXwMUwnipizLLj4QfVTHOwpqKO4j6GVHa3srykY7zUXLgFfX7FPjj8BTbK5
 NdBxxYsQjs+Z/Yad2KOkxnyn9W1TXIgCENNyXSqZg+cdAZZFpBah1lfxSwT04asbN1SP
 +eivgCQtIHhy94IEAL+HBzbg5blJ8le+JTpVq9PSZSTeEEUZ9i9V9POG77hvT/dNUNTD
 XFNg==
X-Gm-Message-State: APjAAAUlpEvNRdczdixOafTxa+mX5W2a6QhOez51Uc5BShfkN3ZfMK/y
 05NEBkhC9lZcJwDBGImEjDUuoELXY6UIxGnOygE25PsWVpQ=
X-Google-Smtp-Source: APXvYqw9xBw1IUz5duiGU37X5OkFQjh1LCDiOddMyWxVrEghnCJDNRAKQ4R2Bwf7gCgDFODfLGFCu6/0tFc2bCI/vqA=
X-Received: by 2002:a63:5a23:: with SMTP id o35mr8986507pgb.4.1580458342892;
 Fri, 31 Jan 2020 00:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jan 2020 10:12:11 +0200
Message-ID: <CAHp75Vd_CNFx8xT9yO9LA=jKjT_xnc3XotUJx4jNFKaq0bpHsg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ajay Gupta <ajayg@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] device property: change
 device_get_phy_mode() to prevent signedess bugs
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

On Fri, Jan 31, 2020 at 7:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The device_get_phy_mode() was returning negative error codes on
> failure and positive phy_interface_t values on success.  The problem is
> that the phy_interface_t type is an enum which GCC treats as unsigned.
> This lead to recurring signedness bugs where we check "if (phy_mode < 0)"
> and "phy_mode" is unsigned.
>
> In the commit 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve
> int/unit warnings") we updated of_get_phy_mode() take a pointer to
> phy_mode and only return zero on success and negatives on failure.  This
> patch does the same thing for device_get_phy_mode().  Plus it's just
> nice for the API to be the same in both places.
>

For device property API changes
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: b9f0b2f634c0 ("net: stmmac: platform: fix probe for ACPI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a change to drivers/base/ but all the users are ethernet drivers
> so probably it makes sense for Dave to take this?
>
> Also this fixes a bug in stmmac.  If you wanted I could make a one
> liner fix for that and then write this change on top of that.  The bug
> is only in v5.6 so it doesn't affect old kernels.
>
>  drivers/base/property.c                               | 13 +++++++++++--
>  drivers/net/ethernet/apm/xgene-v2/main.c              |  9 ++++-----
>  drivers/net/ethernet/apm/xgene-v2/main.h              |  2 +-
>  drivers/net/ethernet/apm/xgene/xgene_enet_main.c      |  6 +++---
>  drivers/net/ethernet/apm/xgene/xgene_enet_main.h      |  2 +-
>  drivers/net/ethernet/smsc/smsc911x.c                  |  8 +++-----
>  drivers/net/ethernet/socionext/netsec.c               |  5 ++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  6 +++---
>  include/linux/property.h                              |  3 ++-
>  9 files changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 511f6d7acdfe..8854cfbd213b 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -863,9 +863,18 @@ EXPORT_SYMBOL_GPL(fwnode_get_phy_mode);
>   * 'phy-connection-type', and return its index in phy_modes table, or errno in
>   * error case.
>   */
> -int device_get_phy_mode(struct device *dev)
> +int device_get_phy_mode(struct device *dev, phy_interface_t *interface)
>  {
> -       return fwnode_get_phy_mode(dev_fwnode(dev));
> +       int mode;
> +
> +       *interface = PHY_INTERFACE_MODE_NA;
> +
> +       mode = fwnode_get_phy_mode(dev_fwnode(dev));
> +       if (mode < 0)
> +               return mode;
> +
> +       *interface = mode;
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(device_get_phy_mode);
>
> diff --git a/drivers/net/ethernet/apm/xgene-v2/main.c b/drivers/net/ethernet/apm/xgene-v2/main.c
> index c48f60996761..706602918dd1 100644
> --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> @@ -15,7 +15,7 @@ static int xge_get_resources(struct xge_pdata *pdata)
>  {
>         struct platform_device *pdev;
>         struct net_device *ndev;
> -       int phy_mode, ret = 0;
> +       int ret = 0;
>         struct resource *res;
>         struct device *dev;
>
> @@ -41,12 +41,11 @@ static int xge_get_resources(struct xge_pdata *pdata)
>
>         memcpy(ndev->perm_addr, ndev->dev_addr, ndev->addr_len);
>
> -       phy_mode = device_get_phy_mode(dev);
> -       if (phy_mode < 0) {
> +       ret = device_get_phy_mode(dev, &pdata->resources.phy_mode);
> +       if (ret) {
>                 dev_err(dev, "Unable to get phy-connection-type\n");
> -               return phy_mode;
> +               return ret;
>         }
> -       pdata->resources.phy_mode = phy_mode;
>
>         if (pdata->resources.phy_mode != PHY_INTERFACE_MODE_RGMII) {
>                 dev_err(dev, "Incorrect phy-connection-type specified\n");
> diff --git a/drivers/net/ethernet/apm/xgene-v2/main.h b/drivers/net/ethernet/apm/xgene-v2/main.h
> index d41439d2709d..d687f0185908 100644
> --- a/drivers/net/ethernet/apm/xgene-v2/main.h
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.h
> @@ -35,7 +35,7 @@
>
>  struct xge_resource {
>         void __iomem *base_addr;
> -       int phy_mode;
> +       phy_interface_t phy_mode;
>         u32 irq;
>  };
>
> diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
> index 6aee2f0fc0db..da35e70ccceb 100644
> --- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
> +++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
> @@ -1736,10 +1736,10 @@ static int xgene_enet_get_resources(struct xgene_enet_pdata *pdata)
>
>         memcpy(ndev->perm_addr, ndev->dev_addr, ndev->addr_len);
>
> -       pdata->phy_mode = device_get_phy_mode(dev);
> -       if (pdata->phy_mode < 0) {
> +       ret = device_get_phy_mode(dev, &pdata->phy_mode);
> +       if (ret) {
>                 dev_err(dev, "Unable to get phy-connection-type\n");
> -               return pdata->phy_mode;
> +               return ret;
>         }
>         if (!phy_interface_mode_is_rgmii(pdata->phy_mode) &&
>             pdata->phy_mode != PHY_INTERFACE_MODE_SGMII &&
> diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.h b/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
> index 18f4923b1723..600cddf1942d 100644
> --- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
> +++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
> @@ -209,7 +209,7 @@ struct xgene_enet_pdata {
>         void __iomem *pcs_addr;
>         void __iomem *ring_csr_addr;
>         void __iomem *ring_cmd_addr;
> -       int phy_mode;
> +       phy_interface_t phy_mode;
>         enum xgene_enet_rm rm;
>         struct xgene_enet_cle cle;
>         u64 *extd_stats;
> diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
> index 49a6a9167af4..2d773e5e67f8 100644
> --- a/drivers/net/ethernet/smsc/smsc911x.c
> +++ b/drivers/net/ethernet/smsc/smsc911x.c
> @@ -2361,14 +2361,12 @@ static const struct smsc911x_ops shifted_smsc911x_ops = {
>  static int smsc911x_probe_config(struct smsc911x_platform_config *config,
>                                  struct device *dev)
>  {
> -       int phy_interface;
>         u32 width = 0;
>         int err;
>
> -       phy_interface = device_get_phy_mode(dev);
> -       if (phy_interface < 0)
> -               phy_interface = PHY_INTERFACE_MODE_NA;
> -       config->phy_interface = phy_interface;
> +       err = device_get_phy_mode(dev, &config->phy_interface);
> +       if (err)
> +               config->phy_interface = PHY_INTERFACE_MODE_NA;
>
>         device_get_mac_address(dev, config->mac, ETH_ALEN);
>
> diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
> index e8224b543dfc..95ff91230523 100644
> --- a/drivers/net/ethernet/socionext/netsec.c
> +++ b/drivers/net/ethernet/socionext/netsec.c
> @@ -1994,10 +1994,9 @@ static int netsec_probe(struct platform_device *pdev)
>         priv->msg_enable = NETIF_MSG_TX_ERR | NETIF_MSG_HW | NETIF_MSG_DRV |
>                            NETIF_MSG_LINK | NETIF_MSG_PROBE;
>
> -       priv->phy_interface = device_get_phy_mode(&pdev->dev);
> -       if ((int)priv->phy_interface < 0) {
> +       ret = device_get_phy_mode(&pdev->dev, &priv->phy_interface);
> +       if (ret) {
>                 dev_err(&pdev->dev, "missing required property 'phy-mode'\n");
> -               ret = -ENODEV;
>                 goto free_ndev;
>         }
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index d10ac54bf385..aa77c332ea1d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -412,9 +412,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
>                 *mac = NULL;
>         }
>
> -       plat->phy_interface = device_get_phy_mode(&pdev->dev);
> -       if (plat->phy_interface < 0)
> -               return ERR_PTR(plat->phy_interface);
> +       rc = device_get_phy_mode(&pdev->dev, &plat->phy_interface);
> +       if (rc)
> +               return ERR_PTR(rc);
>
>         plat->interface = stmmac_of_get_mac_mode(np);
>         if (plat->interface < 0)
> diff --git a/include/linux/property.h b/include/linux/property.h
> index d86de017c689..2ffe9842c997 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -12,6 +12,7 @@
>
>  #include <linux/bits.h>
>  #include <linux/fwnode.h>
> +#include <linux/phy.h>
>  #include <linux/types.h>
>
>  struct device;
> @@ -368,7 +369,7 @@ enum dev_dma_attr device_get_dma_attr(struct device *dev);
>
>  const void *device_get_match_data(struct device *dev);
>
> -int device_get_phy_mode(struct device *dev);
> +int device_get_phy_mode(struct device *dev, phy_interface_t *interface);
>
>  void *device_get_mac_address(struct device *dev, char *addr, int alen);
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
