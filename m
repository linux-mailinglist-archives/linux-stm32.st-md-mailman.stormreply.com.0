Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78529B32DB8
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Aug 2025 08:15:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B214FC36B38;
	Sun, 24 Aug 2025 06:15:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 049A8C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Aug 2025 06:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=XJNcRjw5toGkbDMbVP0D+FBSoxAKho17jgy82++k1Xw=; b=zRzQdU/ElHgDkQb/6td8iVgBxb
 Hyew4QJUr+v3M4NGpFQT1qnb7wngqSWRm+Cq/sl3UKgjvMdkfgPJjZMPypDUXhrBOFzYaihOaOeeW
 qugmI0ZH7FmBj+73ljS/5Km2eN7UKpkuTtClcyVnJXVUrR+Et7qcSCpVJJ1sfx66rZ+J+l0hhqdXU
 WWTA2emDMJOAzZNpaT7WwQVys3eK2zDPXIdmcFAw2O7JVsUlb+/SEIv6uoQjeI8zQL/1Lf1lp5wzo
 DMqog+DtwaSucqUzROuIdjHcg47SN1cGZnzRePV6XId49A5qBiDcSSGiBC9cZeu0/ShMUFU/6FRtb
 5NEJQQJw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uq40G-00000005lAr-3R3b; Sun, 24 Aug 2025 06:14:56 +0000
Message-ID: <277661e8-dd75-475e-b798-b384a66c7a93@infradead.org>
Date: Sat, 23 Aug 2025 23:14:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix
 stmmac_simple_pm_ops build errors
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



On 8/20/25 7:30 AM, Russell King (Oracle) wrote:
> The kernel test robot reports that various drivers have an undefined
> reference to stmmac_simple_pm_ops. This is caused by
> EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
> and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
> which still defines the struct non-static.
> 
> Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
> means we always define stmmac_simple_pm_ops, and it will always be
> visible for dwmac-* to reference whether modular or built-in.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a55e43804670..fa3d26c28502 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8024,8 +8024,9 @@ int stmmac_resume(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(stmmac_resume);
>  
> -EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend,
> -			     stmmac_resume);
> +/* This is not the same as EXPORT_GPL_SIMPLE_DEV_PM_OPS() when CONFIG_PM=n */
> +DEFINE_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend, stmmac_resume);
> +EXPORT_SYMBOL_GPL(stmmac_simple_pm_ops);
>  
>  #ifndef MODULE
>  static int __init stmmac_cmdline_opt(char *str)

-- 
~Randy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
