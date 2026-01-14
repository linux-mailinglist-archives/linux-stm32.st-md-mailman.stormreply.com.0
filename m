Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03864D20F54
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 20:03:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB24BC8F273;
	Wed, 14 Jan 2026 19:02:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C61DC8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 19:02:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb95009so13527a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 11:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768417377; x=1769022177;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
 b=EH+j+MiXBYY+Q6QqTaZVwLH5fuPsPfTmWureUKz5qIkIhq1AXQk5/r80Et2H/Xey1m
 ZGeDLAGiRgQ3Sd7Aay+hR2RjdV3PqAMhQd4mdEX9IXIUYOe/xRTKoJjtIPpianBJ/wza
 +LaH+H8QWSMB/ZFsJI/FfmJ8cT2DDiGiHFl2T0BqpQ2gT3wYAPJhy72Xslix54nba0dE
 aDzxZnt2UuRvNuzb+U7m1751jK+AG4NC/ktq17DImpnaNKUPxO7KmA2KVxIfvc842cKT
 aYayDfwj54cRfCtX/SPqnwVeIbWpvfLmAnFBjE8j2vOQMM1WSZBMC7eOYOTgqvJ3WU4p
 J19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768417377; x=1769022177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
 b=IKc98dRQrAaxtMpxXfCus27Gmor11qPojJHUGX8gOxg2hXdWzvU4WwXwIkZTQvzPqi
 Ahcjx91z+ZxPN88SO0qNWE3UuAqaam0+u94EtZk6Z+EDJgBtL0IGu5w3yc+xYP5nigFP
 +RJHDv2wyIYxJVIhoF8KGLrXHooWoRCEn/gIwjnL/QmmKByLu50G5if+u7nutH+o2HQF
 muyWPdLOyODTnQvWOHRV1tKFUMVY6B6zLFS4tILOMMqKVuc0NiFKrHOYY48qbLi5NSYY
 MQn027L4GPfiqP25Ptdrg9c2JIc6MxQHOmQpwhIYgOBDcOijsb5GVNhEvBaGWkP7UanW
 tVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKBG1RNMtbsGi8WkEmz3ALt0wRYBc7oDwUxato69fXp6AD4PeuKgItF8CUZ8/tqigge2yfu+PGLzLWAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2WRCBNBi28yMkWaRphAAsZVCGzfbu7BqkV2HJ9j+nd+dYz4Kr
 4dbds38Y5RgzohQIw/f8U5L8iVyij2fu/uTU724+ltnT5u6v8vGWQgRO
X-Gm-Gg: AY/fxX75HXXdieTXLOupZGtLXLThDhbqBrmGL0I1qO87m2DxtpEHgEsXYb/FyimUO7F
 J5fa8DSFOEJY7+a5GQgqqo/MIxPRrX3xxOEaRPZiAZlN1BYc4Nmrt5h7NdkkXz2IPMbBEhdHnu3
 UvMNxlJD+U8gWzI5xSiI079kdk8U6VGe/jrr+XsY45kWTmdCokn7WN+7dCdiWwBmvh8MaeEAyEH
 GM7YIX14aWyRIgekJAnjuzLgT5m5eZJ/8TRfPfBmGQZGk5O/Oxv8WnNzwtetAMtj8BN9wm8L6v9
 gNLBChMpycA+woRY9hKx0O4OICKLAylANXh6sC4cl7MIxjdySMfY+cCwwz+fdBenzX5EHy7Fwcr
 0fJq1bYhqLtOdF1kifho1hDMpfpDyv+5D3LzcTyhK5ywnThUsEYsNDMqnOWOomc/fC0OpxKFHtf
 HeNpI=
X-Received: by 2002:a05:6402:34d3:b0:64b:5a76:792b with SMTP id
 4fb4d7f45d1cf-653ec459a3cmr1649376a12.3.1768417377014; 
 Wed, 14 Jan 2026 11:02:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65411877591sm391335a12.5.2026.01.14.11.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 11:02:56 -0800 (PST)
Date: Wed, 14 Jan 2026 21:02:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260114190253.ttrookxubevt7aku@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
 <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] phy: qcom-sgmii-eth: add
 .set_mode() and .validate() methods
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

On Wed, Jan 14, 2026 at 06:55:34PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > > using SGMII, 1000BASE-X and 2500BASE-X.
> > > 
> > > Add an implementation of the .set_mode() method, which can be used
> > > instead of or as well as the .set_speed() method. The Ethernet
> > > interface modes mentioned above all have a fixed data rate, so
> > > setting the mode is sufficient to fully specify the operating
> > > parameters.
> > > 
> > > Add an implementation of the .validate() method, which will be
> > > necessary to allow discovery of the SerDes capabilities for platform
> > > independent SerDes support in the stmmac netowrk driver.
> > 
> > s/netowrk/network/
> > 
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > 
> > Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> According to patchwork (I forgot the RFC tag on the patches) it needs
> linux/phy.h included. Plesae let me know if you'd like me to retain
> your r-b. Thanks.

Ah, ok, I thought that the SPEED_* macros are also phylib-specific like
PHY_INTERFACE_MODE_*, and hence, the phylib header would already be included,
but it seems the SPEED_* macros are provided by include/uapi/linux/ethtool.h.
Go figure...

Please keep the review tag.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
