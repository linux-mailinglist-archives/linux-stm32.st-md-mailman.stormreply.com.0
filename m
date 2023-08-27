Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF205789ABD
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 03:05:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62516C6B455;
	Sun, 27 Aug 2023 01:05:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5A1DC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 01:05:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso31654011fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 18:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693098329; x=1693703129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wh08RvjtMadNV8YyJ9pJe6FtKaLPWrZmhvyrDo+tDiY=;
 b=frkaAwktoorcXwQ2lF0D4PouETVI7MnarulLVDj54omSxdzlMT/d5DfMOCYYM3uVbD
 KdI9s+TvWDyPw7dIGBxQjkHq8amEsK5D6wcd/fWDXsrukkSjeBQrNyOm2VTp9T0VSwJ+
 Nt0x7ePCJhUssJBuO3t4sl1dh4pVkW6zMfTsnSs0HQbx6b3GaHoM7g2bniZScSiy4tI0
 K6p8XVOknpAoUjjK0k9KlX0q+qwr0+74SJGoHmwm91DoZW6HcbMUFEYldPGWXUgwRQRa
 E1MuX5EziEJ+DoI79D+uLfeneuyCPvneGiyQZ+U7ZJF7t4HKF+KvRtFkpzn4m9FPVAC2
 eC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693098329; x=1693703129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh08RvjtMadNV8YyJ9pJe6FtKaLPWrZmhvyrDo+tDiY=;
 b=L5aBGxjoq3kbwV5Ses8DWdw/pFh/t49Iw0rau6i8XGoKX967dzApoORgWPay5LJZ4G
 CJiOef1yQOh189keQetyLqbnh9ffMHhUb5UabW3mVNxZ6//BpI81kwx5Mx/gN64c6jUX
 X+xYvVYn0n8kX4g4EJr/gvVRM/+8RFR71z36QjnBeBk8h3/K2molP5xzDabaK35XeaHr
 NPJeZrSoXT2lXI84P+/MoIGtHyZ7ISTSJSuSUnG1/U+g3nU9a77ZPDhNqTL0OuOGlBv9
 Tjpvcli1SC7Aqi/uTCLOf9b3CAX4/LeKlgeT/isr7/dzp1ptptpFnKTQ9sSgaBRI9RgY
 rchw==
X-Gm-Message-State: AOJu0Yxq/VJiPnY2lXQwxF4onnkkGOdAQozSRQkBn3RQ1ekNDp7llcvo
 kEPBFCwakIgpCHt1x/uqfTI=
X-Google-Smtp-Source: AGHT+IH0UZuuaxknJzE6dFxZoiFGxR4nMxrJELQhqMeeO4NGfTXq2f+Ep7uv2zM0/BtVTCJzV2giSg==
X-Received: by 2002:a2e:9699:0:b0:2bc:d6d8:fd35 with SMTP id
 q25-20020a2e9699000000b002bcd6d8fd35mr10569761lji.47.1693098328914; 
 Sat, 26 Aug 2023 18:05:28 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a2e8199000000b002b702dfb510sm1000375ljg.39.2023.08.26.18.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 18:05:28 -0700 (PDT)
Date: Sun, 27 Aug 2023 04:05:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <q325fnweuebsmjrsfi3xfnttetgjmjsssvlscgq6lftg6acjsh@zkku2kmtpbmk>
References: <ZOXmWLB4TKGKvkiE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOXmWLB4TKGKvkiE@shell.armlinux.org.uk>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Synopsys XGMII MAC and USXGMII interfaces
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

On Wed, Aug 23, 2023 at 11:58:32AM +0100, Russell King (Oracle) wrote:
> Part 2 of the discussion...
> 
> A similar issue applies to PHY_INTERFACE_MODE_USXGMII, but is reversed.
> USXGMII supports 10M, 100M, 1G, 2.5G, 5G and 10G. Phylink allows all of
> these because that's what the appropriate standard says. dwxgmac2
> initialises config register settings for speeds from 10M up to 10G.
> However, the PHY_INTERFACE_MODE_USXGMII switch() block in
> stmmac_mac_link_up() only handles 2.5G, 5G and 10G. Shouldn't it handle
> the other speed cases - it looks like the MAC does support them.

AFAICS yes, it should.

> 
> The initialisation done by dwxgmac2_setup() does setup control register
> masks for everything from 10M to 10G, so on the face of it, it looks
> like a mistake in stmmac_mac_link_up().

Right.

> 
> If it's something outside of the MAC that doesn't support these speeds
> when operating as USXGMII, then that needs to be handled.

Based on what USXGMII is mentioned on just a single Synopsys PCS/PHY
page on the Synopsys site I guess that DW XGMAC doesn't know anything
about the USXGMII interface. As I explained in my comment to part 1 it
just exposes a multi-protocol port(s) capable of working as XGMII,
GMII or MII. Then XPCS consumes/supplies the data from/to the
activated interface and performs a respective data encoding/decoding.
On the lowest level DW PMA/PHY does the serdes-ing. See the brief
description on the Synopsys 10G PHY page (on the "Downloads and
Documentation" menu):
https://www.synopsys.com/dw/ipdir.php?ds=dwc_multi_protocol_10g_phy
it has two layers:
- Multi-protocol PCS
- Multi-protocol PHY
both are designed to provide USXGMII and SGMII interfaces. 

> 
> The other weird thing is that when using PHY_INTERFACE_MODE_USXGMII
> with XPCS, XPCS supports 1G, 2.5G and 10G ethtool link modes, but not
> 5G. So combining the implementation in stmmac_mac_link_up(), that
> means only 2.5G and 10G can actually be functional. Is that a fair
> assessment of the USXGMII situation with stmmac?

AFAICS assessment seems quite fair. If USXGMII is an external
interface then these ethtool link modes are just irrelevant. Despite
of the XLGMII case I don't just see of how USXGMII mode could be used
as an internal MAC-PCS. Since it's an external interface then the
actual link modes are supposed to be retrieved from an external PHY.
Seeing STMMAC driver doesn't support an external PHY attached if XPCS
performs C73 auto-negotiation, then the xpcs_usxgmii_features array
should have been filled with all the USXGMII-speed-compatible link
modes.

-Serge(y)

> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
