Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEBFD3C1AB
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11DF7C36B3C;
	Tue, 20 Jan 2026 08:18:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B475C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 08:18:49 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b86ff9ff9feso58630966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768897128; x=1769501928;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TJbdw+xcDYuOTpLf6yNuSRnoYdJpj1gSQsdBtW0Vq6o=;
 b=iJTB8qiJZ42pZH0kgTIb1onDNvlwct5Rgyawv5RZHgxI2LGi5zPG/ISZMhN1PVVEkL
 Faoh/tKWMb0C+UCwChz/ORoVBuyWQD42h+MvM4jgyHVsneRaSJDLKDsmPsKRwe4Ecgy6
 wWXUZpqFU26srTPT3MYOVerOBVpldGwv9eqWXYFw7xmDHPcAydFWcHgVLXS30pRvqeAe
 0kQHgZVw3uhtJZ8uriF9i5SGaffeDnbJu1sUBbAHIg1/cr9x1bXCnP+BP3aAKvPsFlun
 tZYTFOoR6E4OxH3YAn6bdyqC5cZmOgqiAEjO4yRjvywnPO10c4jM0XwhSgxztnBJ6rFK
 qiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897128; x=1769501928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJbdw+xcDYuOTpLf6yNuSRnoYdJpj1gSQsdBtW0Vq6o=;
 b=SnNevV3k6rDrmRyRz+BYwP9I+iztWrvDVfT2Kxuv6T3syOCceE/guGPIv05gA9G1K1
 iLSyLXOu64RssST5CNmu72Gw7/fM5TI0iRRhgR2AnlSxe7g1L162bbuAFek2rdZLSUcl
 N28uBzAW2bpjgzk0hf8qltuljc2im5KoXYPITBV1uasBEiSj9Re6G2FBP8ib/ySg28IE
 SCSaJyu7dlm15TuPUhv8veKbO/zK55kjWlS8AaQmTWYwvr3A3FcTrdT/5RTbXJaKoVyq
 Ab4qI0kubosYmZsHFDIuC0FaTWg9PwJYp1ok3J6M3c15raLWEUm9h93Fu2fFmDefWfmG
 SvLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEToP4ysEZ4Wmuc2Pbqu+yR/M16iQqAj0de+Q1+CKAtQ6R0qF0IAW7ln4xTClt0N10Kxp5DNbeVlRYOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxeqsz9hohOa0WwpLyjkZFQpFyrl1PzFVlL54khsnk8M+pisr4U
 C1RwKSYAxriN3YCsj2PMWY1odJBAi0pdjd4Y0Tjfdta1io5RzE+Bbn+b
X-Gm-Gg: AY/fxX5KQCgM7n5SGR5P1JemIwqJSPjIXwuZSy7tOIGFzgRzoxxAB+7tJS8KZ3SK/yS
 jupkZLbNMUXAzwwlXL0s6oGnOKwWb3Pwf7vd6KpH8Q8sQMVTvmiD/uOkn81YTjVsYkbIPPhHfJP
 z4dOcBqJxvWwEtxDBiG8kmn1TZilSjEHyKl+M2ovb0z8svhMF1hcjxGluVBuEXceVrwqDR0mZoq
 dEXLnSPjtdSRJkC1Wu4GWBKudd4AG6y7T1/Uu6ACPWBPBeeu74c+Nci0h1+OSL3Dmriowu90ZKl
 srUIpVaEtXE+mnC9ZwKoBxXsRFjs2aqZ3CtQgtSLonJS4D+7T2QX1o3eqQB5+DGCy4gMdtxn9Ws
 UuAzFFkGwi00FQmlEBY98XthTdCOOs5yD7XnKj8949NVkMmpt7Df8MMtXmQr2IKpQgqnkDPKzYj
 LljEc=
X-Received: by 2002:a17:907:3c8a:b0:b87:6f58:a844 with SMTP id
 a640c23a62f3a-b8792b3a359mr743051066b.0.1768897127986; 
 Tue, 20 Jan 2026 00:18:47 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795c38208sm1344223966b.71.2026.01.20.00.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:18:47 -0800 (PST)
Date: Tue, 20 Jan 2026 10:18:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260120081844.7e6aq2urhxrylywi@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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

On Tue, Jan 20, 2026 at 05:04:53AM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > net: stmmac: add stmmac core serdes support
> > 
> > This commit adds SerDes PHY support to the stmmac core driver, moving it
> > from platform glue into the integrated PCS driver. The SerDes is managed
> > through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> > for the power state.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > index 2f826fe7229b..4d1902f3a58f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > 
> > [ ... ]
> > 
> > > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > > {
> > > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > > +	struct stmmac_priv *priv = spcs->priv;
> > > +	int ret;
> > >
> > > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > > +	ret = dwmac_serdes_power_on(priv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > > +		if (ret)
> > > +			return ret;
> >                         ^^^^^^^^^^
> > 
> > If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> > a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> > there's no corresponding dwmac_serdes_power_off() call before returning
> > the error.
> > 
> > Looking at phylink_major_config(), it appears to discard the return
> > value from phylink_pcs_enable(), so the caller won't know to call
> > pcs_disable() to clean up the power state.
> 
> This AI analysis is incorrect.
> 
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
after calling pcs_disable(), though?

I had to deal with the same issue when preparing patches that integrate
SerDes support into the Lynx PCS.

I had these patches (please pardon the unadapted commit messages for the
present situation):

-- >8 --
Subject: [PATCH] net: phylink: handle return code from phylink_pcs_enable()

I am trying to make phylink_pcs_ops :: pcs_enable() something that is
handled sufficiently carefully by phylink, such that we can expect that
when we return an error code here, no other phylink_pcs_ops call is
being made. This way, the API can be considered sufficiently reliable to
allocate memory in pcs_enable() which is freed in pcs_disable().

Currently this does not take place. The pcs_enable() method has an int
return code, which is ignored. If the PCS returns an error, the
initialization of the phylink instance is not stopped, but continues on
like a train, most likely triggering faults somewhere else.

Like this:

$ ip link set endpmac2 up
fsl_dpaa2_eth dpni.1 endpmac2: configuring for c73/10gbase-kr link mode
fsl_dpaa2_eth dpni.1 endpmac2: pcs_enable() failed: -ENOMEM // added by me
Unable to handle kernel paging request at virtual address fffffffffffffff4
Call trace:
 mtip_backplane_get_state+0x34/0x2b4
 lynx_pcs_get_state+0x30/0x180
 phylink_resolve+0x2c0/0x764
 process_scheduled_works+0x228/0x330
 worker_thread+0x28c/0x450

Do a minimal handling of the error by clearing pl->pcs, so that we lose
access to its ops, and thus are unable to call anything else (which
would be invalid anyway).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/phylink.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 32ffa4f9e5b2..a8459116b701 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1315,8 +1315,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		}
 	}
 
-	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed)
-		phylink_pcs_enable(pl->pcs);
+	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed) {
+		err = phylink_pcs_enable(pl->pcs);
+		if (err < 0) {
+			phylink_err(pl, "pcs_enable() failed: %pe\n",
+				    ERR_PTR(err));
+			pl->pcs = NULL;
+			return;
+		}
+	}
 
 	err = phylink_pcs_config(pl->pcs, pl->pcs_neg_mode, state,
 				 !!(pl->link_config.pause & MLO_PAUSE_AN));
-- >8 --

-- >8 --
Subject: [PATCH] net: phylink: suppress pcs->ops->pcs_get_state() calls after
 phylink_stop()

I am attempting to make phylink_pcs_ops :: pcs_disable() treated
sufficiently carefully by phylink so as to be able to free memory
allocations from this PCS callback, and do not suffer from faults
attempting to access that memory later from other phylink_pcs callbacks.

Currently, nothing prevents this situation from happening:

$ ip link set endpmac2 up
$ ip link set endpmac2 down
$ ethtool endpmac2
Unable to handle kernel paging request at virtual address 0000100000000034
Call trace:
 __mutex_lock+0xb8/0x574
 __mutex_lock_slowpath+0x14/0x20
 mutex_lock+0x24/0x58
 mtip_backplane_get_state+0x44/0x24c
 lynx_pcs_get_state+0x30/0x180
 phylink_ethtool_ksettings_get+0x178/0x218
 dpaa2_eth_get_link_ksettings+0x54/0xa4
 __ethtool_get_link_ksettings+0x68/0xa8
 linkmodes_prepare_data+0x44/0xc4
 ethnl_default_doit+0x118/0x39c
 genl_rcv_msg+0x29c/0x314
 netlink_rcv_skb+0x11c/0x134
 genl_rcv+0x34/0x4c

However, the case where "ethtool endpmac2" is executed as the first
thing (before the interface is brought up) does not crash. What's
different is that second situation is that phylink_major_config() did
not run yet, so pl->pcs is still NULL inside phylink_mac_pcs_get_state().
In plain English, "as long as the PCS is disabled, the link is naturally
down, no need to ask".

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/phylink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a8459116b701..f78d0e0f7cfb 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2527,6 +2527,7 @@ void phylink_stop(struct phylink *pl)
 	pl->pcs_state = PCS_STATE_DOWN;

 	phylink_pcs_disable(pl->pcs);
+	pl->pcs = NULL;
 }
 EXPORT_SYMBOL_GPL(phylink_stop);

-- >8 --
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
