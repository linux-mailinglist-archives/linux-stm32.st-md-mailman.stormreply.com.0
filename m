Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DF365D3F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 18:25:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDA3DC5719E;
	Tue, 20 Apr 2021 16:25:42 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48DB7C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 16:25:40 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id v6so11689310oiv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 09:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EeQe7vEnG67KPQg0lR868BaS1pRsahDJ52u7yGoOIf0=;
 b=LXK+/+GnkJ1c5SIV+QvDz+z7jCAQ7MLk2ZMGlUUnwzsoIM2Id5oW8hrLk/XxyoH8Qs
 ULOY+g99vTZ6Ps1t4HfBZfHrvA3TMSeFevBKNu2zmqv0aFUSCcAvlnkAV4adfBjMmD96
 KOagRPlPujmCYEEElD2paGlUKqSX0yW3vxOhpdrxiI0z4JP54H//zQ48PWUyblfPc5vd
 AzREQb45YUut/JL2JFnPbr/6wZJVIymh6fFBTQJC1Vsc0t/6yHMgG3Qo0rfEfytm+Ed7
 LuGleBKJNe8Tl7RnOnA/rVMxs+JibmMpFCPFGZYaJ2QmqRSmnbHB/QgyiTiudOGbugR7
 NHMg==
X-Gm-Message-State: AOAM532wnc56dg9tNs1AuegTOIetV1dRzkP6HSe+iLX8mq/pPfxKOUlT
 kB4J3jLBzdzE+Y/6nu+uEw==
X-Google-Smtp-Source: ABdhPJzgfvYhhWypZWv9BkoR9/L6J6emx80gLwedJVtCyNP8ChA2qYniQsFYhvhuNKb6Hk8HsxUiDg==
X-Received: by 2002:aca:ed12:: with SMTP id l18mr3777648oih.24.1618935939098; 
 Tue, 20 Apr 2021 09:25:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m5sm480849ots.13.2021.04.20.09.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:25:38 -0700 (PDT)
Received: (nullmailer pid 3432350 invoked by uid 1000);
 Tue, 20 Apr 2021 16:25:37 -0000
Date: Tue, 20 Apr 2021 11:25:37 -0500
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <20210420162537.GA3432298@robh.at.kernel.org>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
 <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Etienne Carriere <etienne.carriere@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH v3 10/11] dt-bindings: clock: stm32mp1 new
 compatible for secure rcc
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

On Mon, 19 Apr 2021 11:38:51 +0200, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Introduce new compatible string "st,stm32mp1-rcc-secure" for
> stm32mp1 clock driver when the device is configured with RCC
> security support hardened.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
