Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C513F460B69
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 01:06:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89178C57B6F;
	Mon, 29 Nov 2021 00:06:32 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D3FFC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 00:06:31 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso23035782otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 16:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n7jiWdngG0UcwBrnuu/tvlBhQlnLVDui7OmnoHPGsmM=;
 b=CaT/kmQ4cWamaP464QJo9XyYa84XRXnGAayl7jd9fVezyLaXDDj3nEVGTWAh+HpI0N
 FZWKQL4FZHAzeKBqPiqjGSr0d2YDFsHxDpzDZmCBvlecxYhUvBzmSq3lFAIAYoUAVTVD
 Pb7/xZ3PW24KBWL4ujsDWPcdVke+owUM5CcyAC6VFLQKnhGd2aS1JHmI0gjjNKRHXWFg
 TN6n9KCyPUmdndBCwhn9Jdg0v65BfcbV3f7kS49XNhAY7or6Lsll8A8jLQk8cFYCmmW/
 hr4iIJ4fSOtZVIXFDsQo2h5RXHmcp2Uj2xgjBDM3J5mOlesl/9bV8Re+VN/XpdclmS/W
 Q2Jg==
X-Gm-Message-State: AOAM533pZAi9bTnj17CHTmBgyWXY3jb3LFbXmRh5UPL9fr/KHvvELWZ9
 l/h/2JmiapbEy0+LJthDAQ==
X-Google-Smtp-Source: ABdhPJzkvENMcQWWQlz4Usn1CYNWFlCiuSOWS7qGLvWcjed7f6wR9VUEBkletP2d1rMLxyYCijt5xQ==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr40580429ott.62.1638144389975; 
 Sun, 28 Nov 2021 16:06:29 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
 by smtp.gmail.com with ESMTPSA id d11sm2380439otu.36.2021.11.28.16.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 16:06:29 -0800 (PST)
Received: (nullmailer pid 2856615 invoked by uid 1000);
 Mon, 29 Nov 2021 00:06:26 -0000
Date: Sun, 28 Nov 2021 18:06:26 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <YaQZgvq0fGFXXwOv@robh.at.kernel.org>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Biju Das <biju.das@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/G2L OSTM
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

On Fri, 12 Nov 2021 18:44:11 +0000, Biju Das wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2->v3:
>  * Added Geert's Rb tag.
> v1->v2:
>  * Use renesas,ostm instead od rzg2l-ostm
> ---
>  .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
