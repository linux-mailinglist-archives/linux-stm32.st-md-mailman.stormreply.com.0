Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE285CE4DB
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 16:14:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7191C36B0C;
	Mon,  7 Oct 2019 14:14:32 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4BEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 14:14:30 +0000 (UTC)
Received: from localhost (unknown [144.121.20.163])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B623614218221;
 Mon,  7 Oct 2019 07:14:27 -0700 (PDT)
Date: Mon, 07 Oct 2019 16:14:26 +0200 (CEST)
Message-Id: <20191007.161426.108032588372697075.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <b59904022c2f96aca956aa693040faf0dddeb802.1570454078.git.Jose.Abreu@synopsys.com>
References: <b59904022c2f96aca956aa693040faf0dddeb802.1570454078.git.Jose.Abreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 07 Oct 2019 07:14:28 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix sparse warning
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Mon,  7 Oct 2019 15:16:08 +0200

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8b76745a7ec4..40b0756f3a14 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4207,6 +4207,7 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
>  static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  {
>  	u32 crc, hash = 0;
> +	__le16 pmatch = 0;
>  	int count = 0;
>  	u16 vid = 0;
>  
> @@ -4221,11 +4222,11 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  		if (count > 2) /* VID = 0 always passes filter */
>  			return -EOPNOTSUPP;
>  
> -		vid = cpu_to_le16(vid);
> +		pmatch = cpu_to_le16(vid);
>  		hash = 0;
>  	}
>  
> -	return stmmac_update_vlan_hash(priv, priv->hw, hash, vid, is_double);
> +	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
>  }

I dunno about this.

The original code would use the last "vid" iterated over in the
for_each_set_bit() loop if the priv->dma_cap.vlhash test does not
pass.

Now, it will use zero in that case.

This does not look like an equivalent transformation.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
