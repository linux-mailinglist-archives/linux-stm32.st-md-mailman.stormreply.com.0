Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FEF2B4BF3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 18:01:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13623C3FAD7;
	Mon, 16 Nov 2020 17:01:59 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF57DC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 17:01:57 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k26so19566906oiw.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 09:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+JXrZYifKdUs7FbxLSzL5FeCPiKddkCqanejgp6YUk=;
 b=Aq+p00kff1QawN8uR+gkuhJsa1iDpeeZGB8Do4hSg1hgAsrV+uYxAhwnay54YiGuRj
 OMtVl5S5TSDlCfxLKK+iqF526hsjIwAD94+dh732D5spsQH+vSjBgIqry8L+r/fAAMqB
 QU/MZEvYaudhtQ1cQF1heaTO6kyzC3ApWEdijC2j/BVHfrYy58oA+jmtnMK3pfsezPh6
 o/2QQxXl9HgvMUWyP8RJpM6ewRrjkBRuSnX+VCJue1FkVBNsxjK7pgzdYBO2enIrfjPB
 4DGsrenDhmhUD0XqXL0kn+nlpp++6L5epjVdC7KH25zvsWIkG0qJ2XuXVZ6ctE1bp+LA
 RQSw==
X-Gm-Message-State: AOAM533OgnOg9gdWVOWkAwkjFX0ikvbDNJJhdWnjllzCds14iTmFd27o
 qAShpqCf53hrpXrWaBDq+Q==
X-Google-Smtp-Source: ABdhPJxfIngqPIPPFq6gc+SDNZG2oWmf4zFtDxQiQMoBenm1qbDm6a92Xa7UhiT2+YDtpgUuD0aGRg==
X-Received: by 2002:aca:5110:: with SMTP id f16mr290638oib.94.1605546116505;
 Mon, 16 Nov 2020 09:01:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s131sm4819187oie.58.2020.11.16.09.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:01:55 -0800 (PST)
Received: (nullmailer pid 1808233 invoked by uid 1000);
 Mon, 16 Nov 2020 17:01:54 -0000
Date: Mon, 16 Nov 2020 11:01:54 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201116170154.GA1808177@bogus>
References: <20201110102552.7270-1-a.fatoum@pengutronix.de>
 <20201110102552.7270-2-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110102552.7270-2-a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: arm: stm32: add extra
 SiP compatible for lxa, stm32mp157c-mc1
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

On Tue, 10 Nov 2020 11:25:50 +0100, Ahmad Fatoum wrote:
> The Linux Automation MC-1 is built around an OSD32MP15x SiP with CPU,
> RAM, PMIC, Oscillator and EEPROM. Adjust the binding, so the SiP
> compatible is contained as well. This allows boot firmware to match
> against it to apply fixups if necessary.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> v1 -> v2:
>  - split up binding and device tree change
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
