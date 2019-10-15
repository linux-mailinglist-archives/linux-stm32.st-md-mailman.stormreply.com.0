Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C5D7CF1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 19:09:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE28C36B0B;
	Tue, 15 Oct 2019 17:09:21 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69C00C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 17:09:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 67so17597238oto.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 10:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JHMlVw4tvcimgqLNE6cW+4izJ5ZEdiASsMVMnyNWIFE=;
 b=PpMxvgFBzuLmPGZ6pKBVGrjGBQslkXry45cm/5zb2vEesG9F+bqe5mtmZzrlzwZipQ
 mrWrr/FIyxyybvtUG2gGxv2Hpv19gX0MrHON2Gep9RYk5oTxdcv1vG8umsfY0A1t9MP+
 Ji+HoKM/h38ABq1QJtUsfNnAGZCVvwVxCmsMiwDB09N9l9Kr1aTpQYPIUppXSyLhE3ts
 klnaEKQ//rS8ECdf9EhGqULpuWt1fbF+OZ01FiJ93g2tEvxefW9aLbCaJv3AP3h0f4Od
 DKazDDkJ3qrRo4WjoNkcL4JrGdEJhO07W5KvMJ/BjRGv0oXY2Gwu/SgHdwWokoAYWAXZ
 MLNg==
X-Gm-Message-State: APjAAAXVOHvDoOJ2UVmDVuOSJ2w0+G059CMEZKjwlkOvFzprarpPiyVR
 7XB8/ZSbUhW/q/371vrwxQ==
X-Google-Smtp-Source: APXvYqy2X9I15W25gmPVuvvFHsnO6LRLZtuacdrohlwkKPnx10p92ZlfGBeUKRra5d48a54FxaB9Kg==
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr22943854otj.246.1571159359034; 
 Tue, 15 Oct 2019 10:09:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o184sm6585474oia.28.2019.10.15.10.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:09:18 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:09:17 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191015170917.GA8078@bogus>
References: <20191015123151.14828-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015123151.14828-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@st.com, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] dt-bindings: display: Convert stm32
 display bindings to json-schema
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

On Tue, 15 Oct 2019 14:31:51 +0200, Benjamin Gaignard wrote:
> Convert the STM32 display binding to DT schema format using json-schema.
> Split the original bindings in two yaml files:
> - one for display controller (ltdc)
> - one for DSI controller
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v4:
> - describe interruptions items
> - remove unit address from port property
> - remove dma-ranges (DT patches send too)
> 
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - add panel property
> - fix identation
> - remove pinctrl-names: true
> - remove pinctrl-[0-9]+: true
> - rework ports block to include port@0 and port@1
> - use const for #adress-cells and #size-cells
> - add additionalProperties: false
>  .../devicetree/bindings/display/st,stm32-dsi.yaml  | 151 +++++++++++++++++++++
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 144 --------------------
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml |  81 +++++++++++
>  3 files changed, 232 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
