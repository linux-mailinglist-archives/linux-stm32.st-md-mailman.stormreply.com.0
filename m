Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C04C49887
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Nov 2025 23:26:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A11C60460;
	Mon, 10 Nov 2025 22:26:59 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28289C5A4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 22:26:58 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7a59ec9bef4so3880987b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762813616; x=1763418416;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
 b=a+OdGmXQw5vlz4okmcCbQ2t7loueALm2iInTmqRXBSvjqAf/og6XS3ilxvHzfVr0ab
 vHEtWPBIjlUpRYvNdmKBtnW4QHETJtS8IwWJJckSgrvW3hBW+Uz2rnSkK8nGMRUTZ55J
 lUrxAMwzgtD4RFFoYZWyQtfYdFR0rJzzD3B3cDIGX0LH4BRNVAMaNcgy9PG9FpLD1UER
 GH9gWNO533JDA02UZhBo66c8ByzdrX+2/ch2w/W3imPxoH8jn+6NACBTt/Pl+mMqS8Po
 H8l+yIxPd6XvYhjv+maq4NdY+G5VqpgWiUjob6fHUO9EmewD9nsRUCq1H2XgfEtwkW9u
 xz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762813616; x=1763418416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
 b=bhgtkFJgQuxxUJW9f/gYJcPfa1agkG0FWOxds06gNh7nUdwLlELkVEUZ8LZPyU+zi/
 b1BS5FN4wV13i16BUwFLoSAZHvUZPD2vxQ3zXP2Rf6qKS4TmoUz0g36c5cRL7W/YgSC0
 0VPtJW9SaMo+eUqOQZIpEIarAorP7+A7ecimjRUApUz+skc2qkfC+DaXekb1agOhzXnm
 IEDpUEVRuJQHc5ACg0OnQQuX4t3szYtDYACXqgh/IZq001wzwR0lOIFS6G9MKFyGpOGe
 Jj3LGhTrMjuKwdVQfCigAVRHpegtAiLAXLuT8KoBm7AaL7G2V81fiQ6mkghOmIEGdwH/
 oyBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQrHSKIGPcJSaaljgoaiTG6eSxnCNKjMVfXWQ4Y6W3Yjxi9jgO3s9qMFx6ndMjpiyllNGqfOLeiXTppA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyrz1hM07vGsFf7dPkJOg5oeNBcCvuWCclD/MGMH2dIxeRkYxyW
 tAoawygEQflkKJX4UAYWsUe0MdPkA7wrlCtEXgdeekHuoPlIXGzrNCWw
X-Gm-Gg: ASbGncsXJWE0QU9kgsjyAC1Mmto5cH6w+/Bmc+So1AJXqIGPNeqVvD//2H4tUyD04zl
 K5sl+zR/VFhjFoUMWPTzejiGfV6Q50mjQ67V4uIfVUcBDC0eRPcHp+F8P/STUxt1fho2EJkGjId
 Ag8yGuFkom2KeT78pnHkhTLh/B4xGZHHDL0FDL0UqATUyFloN4v7FrGoAYh2QkTYVq1FQ2acU5s
 6B3aY9GAlFX4oJCXZI5MHPwQ9yIDeVI0ymALPkZK7nujy/jC/jN1WZ7zcG+jaUiQnEHM6Ma0ACs
 ozEzb+7DRKi/kdFBZA41LLw8eI6JvUKXSgj9ofh/oBdU3yF9PiaEsTHq1UBoqN0qb5GirHJFQ6z
 w2/C2eQhULTqz4fkWxhTsjD+JeK1oRF/TkPa45YqVfPFHu80fqf60dbnKfdBFTGGUwDm3eCPZVv
 gL6RnO6XyumQ==
X-Google-Smtp-Source: AGHT+IEk3kYn28lJz/C+AXXcRWMVZ9b5FI05N3tJpVXS4fy3dE0avtehbQZNj/cOBXS8KtnzWEvWzw==
X-Received: by 2002:a05:6a20:e605:b0:357:be83:d026 with SMTP id
 adf61e73a8af0-357be83d02fmr681099637.35.1762813616432; 
 Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f8c880c5sm13710401a12.6.2025.11.10.14.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Date: Tue, 11 Nov 2025 06:26:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Simon Horman <horms@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <g2tqvcw7ocewzbqy7txz6sumdxeelhl4jk2s3btnnijyt572di@nrfcac6grpvn>
References: <20251107111715.3196746-1-inochiama@gmail.com>
 <20251107111715.3196746-4-inochiama@gmail.com>
 <aRJGZjgTgcjZgIqe@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRJGZjgTgcjZgIqe@horms.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Chen Wang <unicorn_wang@outlook.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy
 interface filter
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

On Mon, Nov 10, 2025 at 08:09:10PM +0000, Simon Horman wrote:
> On Fri, Nov 07, 2025 at 07:17:15PM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> 
> ...
> 
> > @@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay) {
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> > +			return -EINVAL;
> 
> I'm sorry if this is a false positive. Because, more so than Russell [1], I
> confused about how about the treatment of phy_interface. But it seems that
> there is a miss match between the use of phy_fix_phy_mode_for_mac_delays()
> above and the binding.
> 
> The call to phy_fix_phy_mode_for_mac_delays() above will return
> PHY_INTERFACE_MODE_NA unless phy_interface is PHY_INTERFACE_MODE_RGMII_ID
> or PHY_INTERFACE_MODE_RGMII_RXID.
> 
>   phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> 						bool mac_txid, bool mac_rxid)
>   ...
> 	if (mac_rxid) {
> 		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> 			return PHY_INTERFACE_MODE_RGMII_TXID;
> 		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
> 			return PHY_INTERFACE_MODE_RGMII;
> 		return PHY_INTERFACE_MODE_NA;
> 	}
>   ...
> 
> Looking at phy_modes(), unsurprisingly, the following mappings occur:
> * "rgmii" -> PHY_INTERFACE_MODE_RGMII
> * "rgmii-id" -> PHY_INTERFACE_MODE_RGMII_ID
> * "rgmii-rxid" -> PHY_INTERFACE_MODE_RGMII_RXID
> * "rgmii-txid" -> PHY_INTERFACE_MODE_RGMII_TXID
> 
> And in the binding, patch 1/3 of this series, only phy-mode rgmii-txid or
> rgmii-id is allowed.
> 

rgmii-txid is a mistake and should be rgmii-rxid. This is because
the mac of SG2042 add rx delay, and the phy can only add tx delay or
no delay. So the phy-mode can only be rgmii-id or rgmii-rxid. I will
fix it in the next version.

> But if rgmii-txid is used, PHY_INTERFACE_MODE_RGMII_TXID will be passed to
> phy_fix_phy_mode_for_mac_delays(), which will return PHY_INTERFACE_MODE_NA.
> 
> Again, I'm confused about the mapping in phy_fix_phy_mode_for_mac_delays().
> But there does seem to be some inconsistency between the binding and
> the driver implementation here.
> 

I think this inconsistency begin with the change for ethernet-controller
binding.
https://lore.kernel.org/all/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

And this function serves as an helper so the driver can only add
the delay once.

> Flagged by Claude Code with https://github.com/masoncl/review-prompts/ 
> 
> [1] https://lore.kernel.org/all/aPSubO4tJjN_ns-t@shell.armlinux.org.uk/
> 
> ...

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
