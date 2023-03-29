Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D776CCFAE
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 03:57:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A266C69069;
	Wed, 29 Mar 2023 01:57:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFF2C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 01:57:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C32AB81EBC;
 Wed, 29 Mar 2023 01:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E95C433EF;
 Wed, 29 Mar 2023 01:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680055041;
 bh=Ht1onyfcmzOw2qKX1pJ8D5vEoEK4zHwhkFnjwVJVLG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dTjfxYX88Y0GCwguIOU1z+LJD7YjITgEt48phbqGQKQ0v7xyRPUlWTGG8ljYZGMPx
 0/x+CHkbC2HY8yFmHVsbqndOTDL9ByGVqxLl5kIcAIJ07W8qkrfxenDnG02z9jXb+u
 wV2AVnB88zfjoRmbnN5IAOwoihywT6e3CPTesZchHWA/NGIKggHkutdwnfwqI7HSgN
 JjCcMNvpZTTGEdKJGCSu8gvk3QFYEeiQ78wiStgkfqmlgF1jolj31mAn7D0CJHwZ3k
 IxIrVltQ/5gkNK2cmhSvvF/EiHa8lg5j29FiLgRu3cDDK86Hm39L/zdsGXriOLWaRF
 OBtsV1EKoVnsQ==
Date: Tue, 28 Mar 2023 18:57:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: linux@armlinux.org.uk
Message-ID: <20230328185720.6239e4a7@kernel.org>
In-Reply-To: <20230324081656.2969663-2-michael.wei.hong.sit@intel.com>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
 <20230324081656.2969663-2-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: phylink: add
 phylink_expects_phy() method
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

On Fri, 24 Mar 2023 16:16:54 +0800 Michael Sit Wei Hong wrote:
> Provide phylink_expects_phy() to allow MAC drivers to check if it
> is expecting a PHY to attach to. Since fixed-linked setups do not
> need to attach to a PHY.
> 
> Provides a boolean value as to if the MAC should expect a PHY.
> returns true if a PHY is expected.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

Russell, looks good?

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 1a2f074685fa..5c2bd1370993 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1586,6 +1586,19 @@ void phylink_destroy(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_destroy);
>  
> +/**
> + * phylink_expects_phy() - Determine if phylink expects a phy to be attached
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Fixed-link mode does not need a PHY, returns a boolean value to check if
> + * phylink will be expecting a PHY to attach.
> + */
> +bool phylink_expects_phy(struct phylink *pl)
> +{
> +	return pl->cfg_link_an_mode != MLO_AN_FIXED;
> +}
> +EXPORT_SYMBOL_GPL(phylink_expects_phy);
> +
>  static void phylink_phy_change(struct phy_device *phydev, bool up)
>  {
>  	struct phylink *pl = phydev->phylink;
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index c492c26202b5..637698ed5cb6 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -574,6 +574,7 @@ struct phylink *phylink_create(struct phylink_config *, struct fwnode_handle *,
>  			       phy_interface_t iface,
>  			       const struct phylink_mac_ops *mac_ops);
>  void phylink_destroy(struct phylink *);
> +bool phylink_expects_phy(struct phylink *pl);
>  
>  int phylink_connect_phy(struct phylink *, struct phy_device *);
>  int phylink_of_phy_connect(struct phylink *, struct device_node *, u32 flags);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
