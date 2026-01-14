Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C19D20E12
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 19:47:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78B52C8F273;
	Wed, 14 Jan 2026 18:47:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86948C8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 18:47:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64b6f22bc77so13374a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768416430; x=1769021230;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
 b=eGdsW79ai/q+utmkEhALIaO2QioIJ+6UbTAPUkOTCTMmCX6Usobk3bTOg9ZWsyI70D
 wbHWTWflWtnM43Xg0UGtvAAjYMDHSK2nZqVJZawQ7oGK3KIq4/H4a/8qt/bNmum1yQsH
 PfJDsDr7wAjUzuE+uQCtpQtHCpoYUb7B18lAFLdwi3qaXsIS2fqINSMDYpwv5mmdD4Gy
 WF0HbpSriIlKu00kHnWjEwy/bemt6yRbJhw2hCnaKmiiWhm13Iyh+LedAGRSTvwIdEhE
 xHwnXRARFN32tMw8T7oRPczXXBO55iLgw3vUfc8DMe8aLsgZHBXoaLgPJCZcTw6I+U8j
 6aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768416430; x=1769021230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
 b=oyJh7J7yep3Tw1chnM8WHdEcilBrvlaR4ufJce9HtRSkPNHBLJo6O9rVWSzgnzdOlk
 SxUa02xzRH8m0FiVI1gZoDFqESSYEdHnpVv3m08HSnHrSN05/iO4kKLHf/DNYKOLB2aZ
 GMHjmktyhMHSrNFql+6zS+1BeKrsHo/0g/XQ1fr42e4wdxDKTKCQPOmnG3dAK3qTWFG4
 8rw03DuHcV0vGq+8tTouXSsryWiESWAntPlCRBONIr03AyEuNgMF6j1dZE7xorXrzWQF
 iCNxYS6SYAKjctaxMnFPaQLyyi5RMfJazVDeiGsGleV1WOHoCs6G3tNnhqmAU+I8aaVv
 8TnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPNoPoqRJhPv+F0RpStyWRBPYWBW20uIk+jjwZGd4O+CK4CFGbpV6rQW77TmrEXnqwslXQHue9ro4ybA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygCemQLJ/49MgMavTSTagyxV5+ucs18HPsuuac72XS5ojrrKDQ
 oMk+DmJRDQLq9p6O/xUcf4SExAepez+nG1JbBrFpnlFY9ZM2FL0sH4Hq
X-Gm-Gg: AY/fxX7RhPp839n380fplSkP4B/+po+2kovDUCxuM9FtndWBfEYLlckm60DBFPpNUsO
 18HjYgRzqsvpukQ6iBVOg8bViQTftd1h5n3U8RJLGOh7S9I3NW+mlPjAwpuQWtnlMm2O9teFiV6
 nMEG6Q3VG5T68OOgIt8F/PpGoA9VHEt1ONmk1HpFR1YWcypL5dwxnsjetqT02vZRw+93ExseA+1
 +TuONFqnQpslWmA0KTbXQBYPd/duZy1aaocKze5D1Uw/5ij9uFIhbTvi6LgWCDTcPqcxbrFyJHe
 5xEKYUSwaHDsetB6dGyR5gyK/w61FXyXFZP27wpVGBca+BlqI97xtO9bOKIwfUmAhreZwHQdevA
 jQkFrXYv89Sox6wa4aZq3GCby9d3AXHGBOPF0mVki/r2aS88Kr4OqC+nX918DdxBxrit1YZaOIy
 ERufs=
X-Received: by 2002:a05:6402:1ed6:b0:64d:46f:320 with SMTP id
 4fb4d7f45d1cf-653ec47b906mr1748710a12.7.1768416429553; 
 Wed, 14 Jan 2026 10:47:09 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65411882043sm327189a12.11.2026.01.14.10.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 10:47:08 -0800 (PST)
Date: Wed, 14 Jan 2026 20:47:05 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260114184705.djvad5phrnfen6wx@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
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

On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> using SGMII, 1000BASE-X and 2500BASE-X.
> 
> Add an implementation of the .set_mode() method, which can be used
> instead of or as well as the .set_speed() method. The Ethernet
> interface modes mentioned above all have a fixed data rate, so
> setting the mode is sufficient to fully specify the operating
> parameters.
> 
> Add an implementation of the .validate() method, which will be
> necessary to allow discovery of the SerDes capabilities for platform
> independent SerDes support in the stmmac netowrk driver.

s/netowrk/network/

> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
