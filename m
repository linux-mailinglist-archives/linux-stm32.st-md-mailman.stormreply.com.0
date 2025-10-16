Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2447BE1E9E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:26:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5917EC57194;
	Thu, 16 Oct 2025 07:26:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B157CC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:26:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 367DB4E410F3;
 Thu, 16 Oct 2025 07:26:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F17706062C;
 Thu, 16 Oct 2025 07:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC9F1102F22AA; 
 Thu, 16 Oct 2025 09:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760599560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FHZj/DgqA8o4wPCtAZaC2EX3z/hRb2lVa/qz3oUIQRY=;
 b=nhdy/LOFyku5r+RwonmgR91X0cHcHLcLhRrjVm5kKUxu2v9THrznH6afS9BZkAmFUncu5e
 OynM1Ju3DnbJRv+4/9sklTJe8eGxLry2C//BG8Tx9gI0VwR+h9dj/g2Jc1vBXmPz72yAPT
 6qv3iHGKZCXL4h4MkZXL3CnZy/OoHw0cQ9v6KrvXwLeGCOZEPMx2Gu4PUcLFZSsuMBjnmT
 o7N6jWIXgY8nlfU5UbRkcvMvBh0J/dBvwgyYQDhVLrbAgMyjQfVGPKCPWsuWqo4K98x7Kg
 iAKm8zzQMXqzzPnarxCkuH8bn0lXohtGhpo6oJG/KQGm6/LXPiO3W1stqwijag==
Message-ID: <ade8145a-b236-4190-8289-2a44c6df0fa4@bootlin.com>
Date: Thu, 16 Oct 2025 09:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: rearrange
	tc_init()
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



On 15/10/2025 18:10, Russell King (Oracle) wrote:
> To make future changes easier, rearrange the use of dma_cap->l3l4fnum
> vs priv->flow_entries_max.
> 
> Always initialise priv->flow_entries_max from dma_cap->l3l4fnum, then
> use priv->flow_entries_max to determine whether we allocate
> priv->flow_entries and set it up.
> 
> This change is safe because tc_init() is only called once from
> stmmac_dvr_probe().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 97e89a604abd..ef65cf511f3e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -262,10 +262,10 @@ static int tc_init(struct stmmac_priv *priv)
>  	unsigned int count;
>  	int ret, i;
>  
> -	if (dma_cap->l3l4fnum) {
> -		priv->flow_entries_max = dma_cap->l3l4fnum;
> +	priv->flow_entries_max = dma_cap->l3l4fnum;
> +	if (priv->flow_entries_max) {
>  		priv->flow_entries = devm_kcalloc(priv->device,
> -						  dma_cap->l3l4fnum,
> +						  priv->flow_entries_max,
>  						  sizeof(*priv->flow_entries),
>  						  GFP_KERNEL);
>  		if (!priv->flow_entries)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
