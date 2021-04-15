Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE603613EB
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 23:11:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CBEBC57B79;
	Thu, 15 Apr 2021 21:11:23 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16F93C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 21:11:19 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so23872427otk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hzANp36iuVSG+0nY48Uw2kEyuGobYOFTvaDygpInvZk=;
 b=Ixn21zrcVDrIGwO09B0nH+6DtroKP4uZbaRXEIy3v3qHyhEQ6nZUqkYUaFfZ1Mxty5
 W2lZ66X7WGwk/xbUp8Uxx9F5aKrhn2Mm58Cfg6ZE9s45GFsv0C0q6u8U6z4RgjGaLoOT
 fwJHpOVkrGzpegIowPmd957XONMYt7brKrhdm3nBXYpR9OZQPSQmvoGzUxXn5t1IUHBJ
 i1xiIO8hwC4uxk60yzotQ9PyIR0GWL615+AdukemDmCTqxknNU3Y5DeaBbt6mp/5KiCm
 iXo68c/6sF7wjo6v9b4vkrC6Oj8JJzX5PbWLUdu1q5xxfdO0kgTFpxjUgGrmSE7FHoja
 TPeA==
X-Gm-Message-State: AOAM533bBt33loGPDMZXmO09Jy7FFGMpVh7KN8nMeKfK8KjPj90ojvof
 4DYeB0VPDhpjv0n7WUbUpg==
X-Google-Smtp-Source: ABdhPJx7M8OzPKhmXFXFq1RjJQv7cP2sRuHIZ80t44v8vBHwbXLUTAvz5SMUj6P2J2lxw9VvegLoJw==
X-Received: by 2002:a9d:de5:: with SMTP id 92mr922710ots.25.1618521078811;
 Thu, 15 Apr 2021 14:11:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k44sm775632ool.33.2021.04.15.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 14:11:18 -0700 (PDT)
Received: (nullmailer pid 1889333 invoked by uid 1000);
 Thu, 15 Apr 2021 21:11:17 -0000
Date: Thu, 15 Apr 2021 16:11:17 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210415211117.GA1889278@robh.at.kernel.org>
References: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
 <20210413143141.12919-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413143141.12919-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: phy: add vbus-supply
 optional property to phy-stm32-usbphyc
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

On Tue, 13 Apr 2021 16:31:40 +0200, Amelie Delaunay wrote:
> This patch adds vbus-supply optional property to phy sub-nodes using
> connector node.
> A regulator for USB VBUS may be needed for host mode.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v2:
> - add connector vbus-supply property as suggested by Rob
> ---
>  .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
