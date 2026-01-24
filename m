Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c/RVCY8ZdGnS2AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:59:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA17BD4A
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:59:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03EC3C8F264;
	Sat, 24 Jan 2026 00:59:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3719C87EDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 00:59:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-432c0b8f114so328355f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 16:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769216396; x=1769821196;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PxQBocjBKjEC4mv4CNajitmiXw7FC5x1mC5Q0V2nZ7g=;
 b=M+07eYWI9XwIdm7egjnKRUM4cIsxNMlsYo7XnFWrCtrAnn4QQL5acCdxzAnL/gPDvs
 V1DHTiYyXN7FRiegVPdJm+K3uPCaXyN7uKYWD+oNldjz5NljiXAnww7N9bbg2peAvbUB
 85WlfKIjiH0CRMUHHJsW4aJFTrbsmyOXopSmhzU8pS5jfM+nlDYzRf3thAM3kBrqVE8k
 3+eJcydSg68KsnjasSM0fgvc2J8B0gnvHKR659Y2N1LVACNEoLqWlaZSEzONDT9xrTLp
 rCqOyzRkn19QfoUXyPE+wOHFFD4LQ99T/bx6CJCfSd4rb5R85D9a6DKqeIJQ9sf0nK5x
 xYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769216396; x=1769821196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxQBocjBKjEC4mv4CNajitmiXw7FC5x1mC5Q0V2nZ7g=;
 b=aOrM/Ai+Y8DX0oejKHaeAUimr62UxYbGOJ1ksM9wcP6Ey08d3VyRx6H9vj0PtsN46s
 tC0O0dtvWqljSBKyAgRShHvbEPE7NSH/YNMOIoh2xADEcV2ylERLpVC+72ZSred1YItJ
 bPQtUsEhmfp0K/5nAhdp7TAbhSTfI2ww64u86W/AY4jWMjJjboYY6yPXy5KJjVKmZOQo
 1BNlLK0NBDUJyARaDp7DzpiIFYMuvSM5MT+njz8y3H3oQIY95h0fbnBHxlo4IA27vxjp
 CNNUslXzm79Uphput+6J43wZbRmb1HIRHaGtpdI5q0wYaqNijLF5YJul7NkMOxXTWMpO
 VDsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtWxWWAFYKQxSG86QzHhdXfHgvwGw1Q8Td3fZRy72wm9NBzF5y1vrzTcyzU6KEy4Z8JeR024qbfeN6rw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydG47ZCzBirIaZ/2NaI6rKA4Qeedm3QvRUhufbeOyP3lkQTEtK
 jBFGWZvK5oYWfHQvvn2R0B15gzXeoNJfLCTrMworJlc5bMeclEYcMIzS
X-Gm-Gg: AZuq6aIzecRNRdd+D43HQxYmzSKpER54SASMW7QAe2zjhZQxLAFdAHFJwbZolJixSGo
 4u9C98I/7FydKhpZOhqbxQyY63u5bak1bAjpzB5R9LkCnoWAdmcbYB3Vnb+EIz97C2xsDcoRfmI
 oubiDeTZmLYha8sDX6/einPMIW8oEAIX3WPV3TpZcyL2avQ1AU+ox4eb5PEehgbNhpT0yzmW3oU
 yFvs/k10EbQnplygwtLXgAU0nAclaAEDNloeKvRBHarqryWPzj/hjGYSqRbkVHe1ahlLLFpLN5a
 jm2TMlBLooofAwEqbEe9ExEh5Z5qzbxehHSpHECvufJ8oFHpKlpTYSa/jjrm/XgcJcfpCgBfq+B
 zI5VuhRYHdAF2L/HeImx0ounCDsB4e0I7j90oe92w45CCF0Ezew/2MNKfbMoSuevwfZanSD+RzQ
 h8xQ==
X-Received: by 2002:a05:6000:420c:b0:435:b068:d3d9 with SMTP id
 ffacd0b85a97d-435bdff681emr1187921f8f.5.1769216395508; 
 Fri, 23 Jan 2026 16:59:55 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:1430:8b48:2d45:6c1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e716b6sm10616033f8f.27.2026.01.23.16.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 16:59:54 -0800 (PST)
Date: Sat, 24 Jan 2026 02:59:51 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260124005951.fbkvd2girdqtfxe7@skbuf>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDrM-00000005fQR-0rmB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vjDrM-00000005fQR-0rmB@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 05/14] net: stmmac: add stmmac
 core serdes support
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,redhat.com,kernel.org,gmail.com,lists.infradead.org,davemloft.net];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: 71EA17BD4A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:53:44AM +0000, Russell King (Oracle) wrote:
> Rather than having platform glue implement SerDes PHY support, add it
> to the core driver, specifically to the stmmac integrated PCS driver
> as the SerDes is connected to the integrated PCS.
> 
> Platforms using external PCS can also populate plat->serdes, and the
> core driver will call phy_init() and phy_exit() when the administrative
> state of the interface changes, but the other phy methods will not be
> called.
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> --
> rfc->v1: avoid calling phy_get_mode() with NULL serdes PHY
> v2: add cleanup when dwmac_serdes_set_mode() fails, because AI allegedly
>   knows better than the author and phylink maintainer, even though this
>   will result in dwmac_serdes_power_off() being called multiple times
>   and producing a kernel warning. But if it makes AI happy, then it must
>   be a good thing. It'll also make Vladimir happy.

These gratuitous passive-aggressive comments about what makes me happy,
based on twisted interpretations of conversations, are best kept to yourself.

I remember Jakub's request was only to add a note in the commit message
about the reason behind the lack of cleanup, not to add cleanup which
will be executed twice:
https://lore.kernel.org/netdev/20260120153248.0636f1e9@kernel.org/

I only expressed dissatisfaction with the phylink_pcs calling convention
as it is today, and searched for ways to make the calls balanced. I also
didn't make any suggestion to make the code worse by performing the
SerDes power down twice, just subscribed to Jakub's request to leave a
comment why your v1 is the way that it is:
https://lore.kernel.org/netdev/20260122112913.svzaie4eywk5nc32@skbuf/

Getting over that dissatisfaction and working within the framework of
the existing calling convention, but also inserting the comment that I
was looking to see, I believe that functionally correct code would look
like this (applies on top of your entire v2 patch set):

-- >8 --
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
index d46a071bc383..c4465dca6b93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
@@ -59,12 +59,27 @@ int dwmac_serdes_power_on(struct stmmac_priv *priv)
 {
 	int ret;
 
+	/* Because the dwmac_integrated_pcs_disable() call path is eventually
+	 * invoked irrespective of the dwmac_integrated_pcs_enable() return
+	 * code, we risk either underflowing the SerDes phy->power_count or
+	 * leaving the lane powered on, depending on the cleanup choice and the
+	 * point of failure. Keeping separate track of the lane power on state
+	 * is a band aid until phylink offers balanced pcs_enable() and
+	 * pcs_disable() calls.
+	 */
+	if (priv->plat->serdes_powered_on)
+		return 0;
+
 	ret = phy_power_on(priv->plat->serdes);
-	if (ret)
+	if (ret) {
 		dev_err(priv->device, "failed to power on SerDes: %pe\n",
 			ERR_PTR(ret));
+		return ret;
+	}
 
-	return ret;
+	priv->plat->serdes_powered_on = true;
+
+	return 0;
 }
 
 int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
@@ -95,10 +110,17 @@ void dwmac_serdes_power_off(struct stmmac_priv *priv)
 {
 	int ret;
 
+	if (!priv->plat->serdes_powered_on)
+		return;
+
 	ret = phy_power_off(priv->plat->serdes);
-	if (ret)
+	if (ret) {
 		dev_err(priv->device, "failed to power off SerDes: %pe\n",
 			ERR_PTR(ret));
+		return;
+	}
+
+	priv->plat->serdes_powered_on = false;
 }
 
 void dwmac_serdes_exit(struct stmmac_priv *priv)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 6097f4b6dd12..e62bba38ab60 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -225,6 +225,7 @@ struct plat_stmmacenet_data {
 	 */
 	phy_interface_t phy_interface;
 	struct phy *serdes;
+	bool serdes_powered_on;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct fwnode_handle *port_node;
-- >8 --
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
