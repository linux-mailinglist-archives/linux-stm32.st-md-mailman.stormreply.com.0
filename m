Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCDF4422B2
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 22:32:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F02AC5A4FF;
	Mon,  1 Nov 2021 21:32:28 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 168EDC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 21:32:26 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 n13-20020a9d710d000000b005558709b70fso20716087otj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 14:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hCy5/rdH3EP/f0UY0j7JtyNiYST+yJ1udugsOF/LEYE=;
 b=UpNeQUrhbAbccxOc4UGqEJ+rJlgltpqhPK3gONPU+3VqcjKWUm/VCR07nrIm+0FSxo
 ud8pFfy0VoSS4x/tQh0VEZx3GhgtLHhBWaE/KTjZOVNnZcIj+m/xFL5s+phLescSn4TY
 b8Hr0gId1logkazmNglHBXGFZoOgRFqXMm9ZSG3jAbun2CoVvrFDSYvL4qk2oKLcBFEQ
 3RtAOodvoUIFeYwmG+haCtWMeoDjvg83kGj+/H/dmh6dCjCo+93hV87XTjw7QP71NaTV
 WfDdqpOQyWk3cElAKPAVYs1UUUq50lQiYYbzna26gAAZ6XW7p4/oiiWKriwqT+LSDxmT
 tM9w==
X-Gm-Message-State: AOAM531Fr8Y0VgeG4utdVAmtzZyTiLSK/RhuZQxlNaIL+L5HmVuoLHDh
 v1EO8Fhube4Ui5sDSj6+DA==
X-Google-Smtp-Source: ABdhPJzbfKMCsIhJntczuawzfOIxUC7Vv7zBS5V4IJzEi/WktKP+H/BlI4ncV/CpLisSsb9yeh0KIg==
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr18743852otb.369.1635802345210; 
 Mon, 01 Nov 2021 14:32:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 90sm4352796otj.70.2021.11.01.14.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 14:32:24 -0700 (PDT)
Received: (nullmailer pid 1101334 invoked by uid 1000);
 Mon, 01 Nov 2021 21:32:23 -0000
Date: Mon, 1 Nov 2021 16:32:23 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YYBc59SlC+reg1T9@robh.at.kernel.org>
References: <1635336752-14796-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1635336752-14796-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: usb: dwc2: document the
 port when usb-role-switch is used
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

On Wed, 27 Oct 2021 14:12:32 +0200, Fabrice Gasnier wrote:
> Document the "port" property, which is used with "usb-role-switch"
> to describe the bus connector.
> Definition is inspired from mediatek,mtu3.yaml.
> 
> This fixes some errors seen when running "make dtbs_check":
> ... 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: ... Documentation/devicetree/bindings/usb/dwc2.yaml
> 
> Note: add dependencies so that 'usb-role-switch' without port is valid or
> both must be present.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2:
> Rob's review comments:
> - drop reference to graph.txt
> - drop unneeded quotes
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
