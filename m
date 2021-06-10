Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3F3A303C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 18:09:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B552C57B7A;
	Thu, 10 Jun 2021 16:09:45 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43675C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 16:09:43 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id h9so2669913oih.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 09:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GhsPTw5SnruFBaMx+M1r90LoKZoI0cqIaAa/EWKANFU=;
 b=bjzfOCeXI7ho4RfIA6bvn8K86J9VO+JcnAyzIl94mDWOZNshAc7uzSQy/7q27T9A/m
 D8WUvx9BRiTbf0QCkP+7L+BtKts0n0sdXtRssZCTIDOmS10sxOjIXPdq2NZGjRWnFIyX
 w1bJnA0pYN/lEHMZuWnEJLPeGTUA9Wh3p5fuGX6hIKNcyppEDELQqwP6nI88hRIoxggk
 kRN1F9EXtJVTVVOqLB7s+Yfm+YJ2GN8X+DFfY03Uw1LcJZEtVjavViTjKSh5j5CzoDM4
 YZapJ1fgu6NohoZpz/NH8W5bvraoFhmwO5V7TlcTDcq758kV2ZRVVRnJjCy3ofhHNve6
 upYQ==
X-Gm-Message-State: AOAM533EJhRAzbmc+lV/L5HUpdsvttzz7J3JtcP777bEv2MwcvBkbhdW
 JnwAuzK6k/tNqqETtCodqw==
X-Google-Smtp-Source: ABdhPJzijwvKaGNoxrqiumLhAiSoTM8eRnIU14P7RCNKjv9VMAPg2uOgjRkqg1TCeOQoy7kCTCAb7Q==
X-Received: by 2002:aca:4b93:: with SMTP id y141mr10926946oia.86.1623341382059; 
 Thu, 10 Jun 2021 09:09:42 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id k14sm606556ooi.21.2021.06.10.09.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:09:41 -0700 (PDT)
Received: (nullmailer pid 1898690 invoked by uid 1000);
 Thu, 10 Jun 2021 16:09:36 -0000
Date: Thu, 10 Jun 2021 11:09:36 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210610160936.GA1898277@robh.at.kernel.org>
References: <20210602203608.419192-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602203608.419192-1-marex@denx.de>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Sam Ravnborg <sam@ravnborg.org>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ch@denx.de
Subject: Re: [Linux-stm32] [PATCH V5 1/2] dt-bindings: display: bridge:
 lvds-codec: Document pixel data sampling edge select
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

On Wed, 02 Jun 2021 22:36:07 +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> V5: Move the pclk-sample into port@0 endpoint
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
