Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3E5EFF84
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:57:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67560C64100;
	Thu, 29 Sep 2022 21:57:13 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE37BC640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:57:11 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id d64so2969240oia.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=x+Q9SkY/t8f6YCH6b1kEoFXwBT3u+UL9IwDrAo5lr0M=;
 b=6WM0MvIPDx3kcaqdN5UU1jzpj5VzC6F/6EwlUD8pq7S9v763T2SRU8O6idROqEwL1J
 KwF7ZUb6oFt8kipccUzUITsfbZtQViiJ4gLDAUjzxcPkBSVZLdkAVOpqTfj9AjDbn34x
 ZYyDuxo1KVJw+rMReGVKSRbRA506a0VLY5vFklqhqOXp2q8sv0YndmFOTsh1C7Mdas+d
 CS4lK3I7j1gLVTdELvhOvTdskpJGv691nMzVTgJ53mVboai3kkW47gmNI9QGM6ZyNPtV
 3nw89JEUTbM5CLYCfHPy8amNchBJkBRdwfWeFEZYLmeqAjHdJ/m1qDGut7HBSGwPiUK/
 bf1g==
X-Gm-Message-State: ACrzQf2Y6qikmFENlPPA7biWihR7nLjuXqd1hINSSmrbb6TeXUJSDQlT
 Gn6Iw4VGzRSMUfJxJbw9xQ==
X-Google-Smtp-Source: AMsMyM7nqwzi2KeUvC7ZWXcSo2fp12eGC/DnbC7wxOpemGUYP4RxavxcmcHP5Ksd8yZ1YKQYH5BBrA==
X-Received: by 2002:a05:6808:1583:b0:350:597e:8f17 with SMTP id
 t3-20020a056808158300b00350597e8f17mr2637957oiw.296.1664488630799; 
 Thu, 29 Sep 2022 14:57:10 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q19-20020a9d6313000000b0065c3bb3c72esm202464otk.14.2022.09.29.14.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:57:10 -0700 (PDT)
Received: (nullmailer pid 2775743 invoked by uid 1000);
 Thu, 29 Sep 2022 21:57:09 -0000
Date: Thu, 29 Sep 2022 16:57:09 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448862913.2775698.5920003910831747959.robh@kernel.org>
References: <20220926212958.505561-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926212958.505561-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: Add
 compatible string for DH electronics DHCOR Testbench board
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

On Mon, 26 Sep 2022 23:29:57 +0200, Marek Vasut wrote:
> Add DT compatible string for DHCOR Testbench board, which is a testbench
> for testing of DHCOR SoM during manufacturing. This is effectively a
> trimmed down version of AV96 board with CSI-2 bridge, HDMI bridge, WiFi,
> Audio and LEDs removed and used as GPIOs instead.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
