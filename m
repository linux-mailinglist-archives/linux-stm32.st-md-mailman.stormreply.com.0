Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F780A574
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 15:28:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 227FCC6907A;
	Fri,  8 Dec 2023 14:28:26 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC38C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 14:28:24 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c9f559b82cso24109961fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702045703; x=1702650503;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Do5YXZvpx1oH456IeLehOp7UBGB2jGfxbiAhA8fLLOw=;
 b=Vs+RYHPcvzqAjY0MUhCj9PsVxXbYrXFz17loShNH9U37PBklTGdKPyTK4ppBlxetBS
 a1v2H6O84pFXoLFjLWSyznaQiDsT68WNFQfJbVMvLy6PTpN+BIWD1GOPN0BBZpKFI+uk
 mvxsBvCO3IRpKkfgBzFxJ2hL2XIaxZWmsav2h1PbGPuFa4jaiNuUiz2pmgq5RQjOfYJk
 GT126NbonAlYqZFbB7ctFrA11/nsTL6B6thDqvV5vmw38iw0mep8rAdJ0E6pc1fZ2ign
 Vmv27umgLVSUGNmq3ghW5PH2+EfOoI5TnB9m40Znp79AoEVwNEJlJqQhJQYYx3CEu3UT
 B5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702045703; x=1702650503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Do5YXZvpx1oH456IeLehOp7UBGB2jGfxbiAhA8fLLOw=;
 b=cJznO5O5Z2X/Hi8JhI6gV9VmusTDLC9kd2NW91feBrkBHDHgNLm03Jo6FskLBnOZro
 pGgGZBwX3sHlDtKyPk1sw8zKhbIgV9PSkkWYKt08X1YAf3OlDvSeXHJ/lYTgvkwtSyAO
 eUH0nJWvDXLoP/X33bQKfOBoqrsgIU9e+kxtChhOBO21n4TvccISQqa/Au3CULlFgEbF
 TVBLnU+cqiPJ9SbV196AJchT3436xOh2/EEiky1+ur4tt9Kz+9KBuR39DISP3fXUSmM2
 UOa4hvTnwZl+CtpVVYeQXjGeAgxmmzjzuDEGVDVfqFl7XZlTAyBrf/ZRr6ah41YeRCpp
 ZdjQ==
X-Gm-Message-State: AOJu0YwyC+rEXiFTMCZgp0ItjVaGRDBD2MXeVorCohrDnLgTdwrYsvCu
 wO8rg4oiOj3XD8eeyt2EsxQ=
X-Google-Smtp-Source: AGHT+IE50woDjg19iA4GldfyfOAv1dTTmjwQ/EliunHTPN8NwGhroGYmf7AQov1vmNIbRe4tOPrYww==
X-Received: by 2002:a2e:97d3:0:b0:2ca:30a:838c with SMTP id
 m19-20020a2e97d3000000b002ca030a838cmr2470312ljj.99.1702045703253; 
 Fri, 08 Dec 2023 06:28:23 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a2e3c10000000b002c9ff0457f8sm241983lja.11.2023.12.08.06.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 06:28:22 -0800 (PST)
Date: Fri, 8 Dec 2023 17:28:20 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Jiangfeng Ma <Jiangfeng.Ma@synopsys.com>
Message-ID: <uzss3af2cklc5bx5apszoegafeaaiv7o7iwgrgrml4grkyev6p@6tme4hdb4mkn>
References: <SA0PR12MB44138E48A245378CF54D2F9ED98AA@SA0PR12MB4413.namprd12.prod.outlook.com>
 <20231208091408.071680db@device.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208091408.071680db@device.home>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Johannes Zink <j.zink@pengutronix.de>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jiangfeng Ma <Jiangfeng.Ma@synopsys.com>, James Li <James.Li1@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH] net:stmmac:stmmac_platform:Add snps,
 xpcs devicetree parsing
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

Hi Maxime, Jiangfeng

On Fri, Dec 08, 2023 at 09:14:08AM +0100, Maxime Chevallier wrote:
> Hello,
> 
> On Fri, 8 Dec 2023 07:02:19 +0000
> Jiangfeng Ma <Jiangfeng.Ma@synopsys.com> wrote:
> 
> > In order to setup xpcs, has_xpcs must be set to a non-zero value.
> > Add new optional devicetree properties representing this.
> > 
> > If has_xpcs is set to true, then xpcs_an_inband should preferably be
> > consistent with it, Otherwise, some errors may occur when starting
> > the network, For example, the phy interface that xpcs already supports,
> > but link up fails.
> 
> Can you elaborate on why you need this, and on which platform
> especially ? Usually drivers for the various stmmac variants know if
> they have XPCS or not, or can guess it based on some info such as the
> configured PHY mode (dwmac-intel).
> 
> Besides that, there are a few issues with your submission. If DT is the
> way to go (and I don't say it is), you would also need to update the
> bindings to document that property.
> 
> > The types of has_xpcs and xpcs_an_inband are unsigned int,
> > and generally used as flags. So it may be more reasonable to set them to
> > bool type. This can also be confirmed from the type of @ovr_an_inband.
> 
> And this part would go into a separate patch.

In addition to what Maxime already said having DT-bindings adjusted to
fit to the pattern implemented in the software part is a wrong way to
go. The best choice in this case is to add the DW XPCS DT-node to the
DW MAC MDIO/MI bus and then use the "pcs-handle" to inform the MAC
(mainly it's driver) of what PCS-device is actually attached to it.
The series I submitted on this week is exactly about that:
https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com/
I guess I'll need about a month or so to settle all the comments, but
the solution implemented there will be better than this one really.

-Serge(y)

> 
> Thanks,
> 
> Maxime
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
