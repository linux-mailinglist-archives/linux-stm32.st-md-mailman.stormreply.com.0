Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB983C8BA8
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E475C597B0;
	Wed, 14 Jul 2021 19:27:13 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C05A4C597AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:27:11 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id a11so2722047ilf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 12:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RzPhtbgpbxnOvk9KnY8WTPdMhffL639krC2aO6F+axU=;
 b=KqXbwzkXPmAj3LTl4+nBfkmyfxlVl+i8vKVDfHrwPy5GtvZLCrwvgXvHcQa2sboFae
 NamTLZVvQRSHRDU26nfARHdevRHFc6cRpj/XQ4hsWSKGmrXsmin96vyrlUkrx94gMB/G
 kYFzpAI5uZJCZXajfp1fr/+vGLmJj9IniTvjj851syyjyK4DF9qTXcuVgdG/lXwIZCNn
 xWd8t3SleqvFoLZxbD+J9P5r+Gk1n7aDhut8qJlTGNMoXJsTXG/rPv4zLV3zhl6PMMIq
 W5L8YVClbCjuh4hlzUM1wX5SpQZZyRg5J8NXeaBG/kS1RaBxtoL+efZsTRDRkZpCzvm/
 58OA==
X-Gm-Message-State: AOAM530YRq6YmAZZlcTMlOkFmXkEICeFJBWLMxXB4GDIp8Qrx7vE8JxF
 /jI3n4d6BVuSt6xKOOqeJw==
X-Google-Smtp-Source: ABdhPJym1dGtLhVjJOsI52JP8TEA6Em+rrrz6Bg6Vyph2weEybKYkuer9VVBZkwLRLrDFITR1rJA+g==
X-Received: by 2002:a05:6e02:5ad:: with SMTP id
 k13mr7656353ils.284.1626290830593; 
 Wed, 14 Jul 2021 12:27:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f4sm1722768ile.8.2021.07.14.12.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:27:09 -0700 (PDT)
Received: (nullmailer pid 3078602 invoked by uid 1000);
 Wed, 14 Jul 2021 19:27:05 -0000
Date: Wed, 14 Jul 2021 13:27:05 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210714192705.GA3078178@robh.at.kernel.org>
References: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
 <20210624093959.142265-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624093959.142265-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: dma: add alternative
 REQ/ACK protocol selection in stm32-dma
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

On Thu, 24 Jun 2021 11:39:58 +0200, Amelie Delaunay wrote:
> Default REQ/ACK protocol consists in maintaining ACK signal up to the
> removal of REQuest and the transfer completion.
> In case of alternative REQ/ACK protocol, ACK de-assertion does not wait the
> removal of the REQuest, but only the transfer completion.
> Due to a possible DMA stream lock when transferring data to/from STM32
> USART/UART, this new bindings allow to select this alternative protocol in
> device tree, especially for STM32 USART/UART nodes.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
