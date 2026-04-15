Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOEOLXcr32nOPgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 08:08:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E80F400BCC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 08:08:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE0BC35E3C;
	Wed, 15 Apr 2026 06:08:54 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB4A4C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=+ypCQYb5z2PZvIzS0gw2ULN0rjsWR7QSr55MLlXIZUs=; b=U2rZcQR6HMY/i/VBmz284fF8wv
 K7/JWqg2h4tNV4DIHyw1lwN7pzAT0uikIQ+qeybZ4UbJooIKTPttoJQPkhDR2EJr90sl1H8ggF3D2
 b6e/ytUR1FwI1dbx89qnWjjavatDJgcRxV8DVrikX7B/VM9th8tWpyU7MdzJEKJWvvc+Ce3Y2u3o3
 KbWSS70kDPh0wp3YSXvBpu0RHrndvdAn0714vAMMz78KrOoix5Sajz4e+bi+8n8v2xzsv2UY3ar/z
 puTv3aVkWXWdUu6eHr8JFlDXtHToxFLrqZVHjcZBubSH8foYL9ouYFZM6Dt9C7CusqEYqZ2dCxTdV
 bR3S9Awg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
 by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <alexander.stein@ew.tq-group.com>)
 id 1wCtQY-000C07-1D; Wed, 15 Apr 2026 08:08:42 +0200
Received: from localhost ([127.0.0.1])
 by sslproxy08.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <alexander.stein@ew.tq-group.com>)
 id 1wCtQX-0008Pj-03; Wed, 15 Apr 2026 08:08:41 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Wed, 15 Apr 2026 08:08:40 +0200
Message-ID: <8409022.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27971/Tue Apr 14 08:24:44 2026)
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next 5/6] net: stmmac: move PHY
 handling out of __stmmac_open()/release()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ew.tq-group.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ew.tq-group.com:s=default2602];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:rmk+kernel@armlinux.org.uk,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	NEURAL_SPAM(0.00)[0.416];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 3E80F400BCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle=
):
> Move the PHY attachment/detachment from the network driver out of
> __stmmac_open() and __stmmac_release() into stmmac_open() and
> stmmac_release() where these actions will only happen when the
> interface is administratively brought up or down. It does not make
> sense to detach and re-attach the PHY during a change of MTU.

Sorry for coming up now. But I recently noticed this commit breaks changing
the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
$ ip link set dev end1 mtu 1400
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
imx-dwmac 30bf0000.ethernet end1: Link is Down
imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initializatio=
n failed
imx-dwmac 30bf0000.ethernet end1: __stmmac_open: Hw setup failed
imx-dwmac 30bf0000.ethernet end1: failed reopening the interface after MTU =
change

Using the command above bisecting was straight forward.
For some reason detach and re-attaching the PHY seems necessary on this pla=
tform.
There already too much changes for simply reverting this commit.

Best regards,
Alexander

> =

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4acd180d2da8..4844d563e291 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3937,10 +3937,6 @@ static int __stmmac_open(struct net_device *dev,
>  	u32 chan;
>  	int ret;
>  =

> -	ret =3D stmmac_init_phy(dev);
> -	if (ret)
> -		return ret;
> -
>  	for (int i =3D 0; i < MTL_MAX_TX_QUEUES; i++)
>  		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
>  			dma_conf->tx_queue[i].tbs =3D priv->dma_conf.tx_queue[i].tbs;
> @@ -3990,7 +3986,6 @@ static int __stmmac_open(struct net_device *dev,
>  =

>  	stmmac_release_ptp(priv);
>  init_error:
> -	phylink_disconnect_phy(priv->phylink);
>  	return ret;
>  }
>  =

> @@ -4010,18 +4005,28 @@ static int stmmac_open(struct net_device *dev)
>  =

>  	ret =3D pm_runtime_resume_and_get(priv->device);
>  	if (ret < 0)
> -		goto err;
> +		goto err_dma_resources;
> +
> +	ret =3D stmmac_init_phy(dev);
> +	if (ret)
> +		goto err_runtime_pm;
>  =

>  	ret =3D __stmmac_open(dev, dma_conf);
> -	if (ret) {
> -		pm_runtime_put(priv->device);
> -err:
> -		free_dma_desc_resources(priv, dma_conf);
> -	}
> +	if (ret)
> +		goto err_disconnect_phy;
>  =

>  	kfree(dma_conf);
>  =

>  	return ret;
> +
> +err_disconnect_phy:
> +	phylink_disconnect_phy(priv->phylink);
> +err_runtime_pm:
> +	pm_runtime_put(priv->device);
> +err_dma_resources:
> +	free_dma_desc_resources(priv, dma_conf);
> +	kfree(dma_conf);
> +	return ret;
>  }
>  =

>  static void __stmmac_release(struct net_device *dev)
> @@ -4038,7 +4043,6 @@ static void __stmmac_release(struct net_device *dev)
>  =

>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
> -	phylink_disconnect_phy(priv->phylink);
>  =

>  	stmmac_disable_all_queues(priv);
>  =

> @@ -4078,6 +4082,7 @@ static int stmmac_release(struct net_device *dev)
>  =

>  	__stmmac_release(dev);
>  =

> +	phylink_disconnect_phy(priv->phylink);
>  	pm_runtime_put(priv->device);
>  =

>  	return 0;
> =



-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
