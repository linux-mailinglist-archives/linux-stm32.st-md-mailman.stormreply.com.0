Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8242AC804
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 23:06:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BB79C3FAE2;
	Mon,  9 Nov 2020 22:06:39 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2931DC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 22:06:35 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id o25so11103543oie.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Nov 2020 14:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i9CYxp8f4C7Qq6SYSSR28yA93AEFy8eV1cl3dQuGN50=;
 b=TYIjdbhvAcKpH9g3VokHyqKarf4HP7NJksQGBHB4yv3CoWiECR36G3SZzd5eDUQO8I
 /WpAM7XerJLfGEtPew2lOOGHMsThf/QWvAH922hVUPrFfcXGHyZnxlA/SokCU0qAg+Z8
 la+VHC9QeZzdnIrINR8sF0Cqsll5veNeQ1eh4jJ224PsVv+dFu7/eG+pEMkqb22v7aHq
 uDzoBuFoWoBezN695kFMQB7xjdOnBsQkoUZDtne+ncSWyt/LJQdrnss2sRhnHLbnnWuX
 GabeEfwzL465DW/09hyddkdGDvn7NhDKNmJ4R3Zlg+bsDmoruWr0//QWD5HmFhcrTSrS
 dPxw==
X-Gm-Message-State: AOAM5339oklQfvDN9wyGv75vNJsPMyunr8BpYBqzSJFkbx/WNZjdQk7T
 sdE+0fv8AVpUB/wiQHFJMA==
X-Google-Smtp-Source: ABdhPJy6fVd4OPqnB05e+bCpk3vzkFsqfjKFcpqCyFJxeB1uElfiomiLZwazSekOLaedpBGO1dF2xQ==
X-Received: by 2002:aca:a988:: with SMTP id s130mr896967oie.172.1604959594575; 
 Mon, 09 Nov 2020 14:06:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v18sm2642870oie.57.2020.11.09.14.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 14:06:34 -0800 (PST)
Received: (nullmailer pid 1839717 invoked by uid 1000);
 Mon, 09 Nov 2020 22:06:32 -0000
Date: Mon, 9 Nov 2020 16:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20201109220632.GA1839673@bogus>
References: <20201108221438.310406-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201108221438.310406-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Patrick Delaunay <patrick.delaunay@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: Add compatible
 strings for DH SoMs and boards
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

On Sun, 08 Nov 2020 23:14:38 +0100, Marek Vasut wrote:
> Document devicetree compatible strings of the DH SoMs and boards.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml      | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
