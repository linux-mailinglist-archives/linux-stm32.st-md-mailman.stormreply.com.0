Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD55EFF73
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 23:55:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4EA9C64100;
	Thu, 29 Sep 2022 21:55:51 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 795A9C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 21:55:50 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 c17-20020a4aa4d1000000b0047653e7c5f3so1031776oom.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 14:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Yjnh8HSMJ5NiBKFIpfMId4PU3/mtLaI+EqNPvdW0CQQ=;
 b=RoJLmEe+d6SUn3K/0S/YX4rvBKanCLTyIlFNTHJxe861tjG2Yo2ZdzcxzCRlBZ5g/0
 hs8VEaJDDZnJhCB8XriWfdFPYd/g3I0Ci1gZ0SVxXS91e08MpZodeO1ziZ3lEQpoTzKx
 XkixWPOlGckJlHlgwdL1hjYDO+VJrrOFTtR03VsVwiASV3LalPLXiSTCsYrsB4Aau9zg
 qKRjuPRsXrL5ikxdWgV/1C6QaZrygbdCGfHrll45SqBKBbVYl8gK6np0LQVQimuANI21
 lLNG4vsOEp/N9yXUnshj1M9mOJ9TmvaxJrVxsBS9oyVMv5wGC6qVegKWwYsCIYEURDEh
 g4JQ==
X-Gm-Message-State: ACrzQf3tBXIH7LLSKmer82fQCBMXn338hbZs6TeSD8KXyspInQ4PBz7B
 qV3wJZGBIdwdYqY1WcZaTZwKE1dZtg==
X-Google-Smtp-Source: AMsMyM4M1XBF1QGETsNby8kbRTgmjV7LBFn+/hSYRl6r0HUxIY48AkJb/RN1U2lKLw9Cav3QZIW02A==
X-Received: by 2002:a05:6830:10c4:b0:655:b8bc:3ffd with SMTP id
 z4-20020a05683010c400b00655b8bc3ffdmr2224176oto.59.1664488549196; 
 Thu, 29 Sep 2022 14:55:49 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w19-20020a4aca13000000b0044afd53b102sm131391ooq.36.2022.09.29.14.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:55:48 -0700 (PDT)
Received: (nullmailer pid 2773651 invoked by uid 1000);
 Thu, 29 Sep 2022 21:55:48 -0000
Date: Thu, 29 Sep 2022 16:55:48 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448854740.2773578.2114251650376941195.robh@kernel.org>
References: <20220926204631.381702-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926204631.381702-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
 stm32-i2c: Document interrupt-names property
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

On Mon, 26 Sep 2022 22:46:31 +0200, Marek Vasut wrote:
> Document interrupt-names property with "event" and "error" interrupt names.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
