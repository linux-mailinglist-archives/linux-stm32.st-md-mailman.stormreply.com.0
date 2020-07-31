Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA31234C98
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 23:01:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F20FEC36B36;
	Fri, 31 Jul 2020 21:01:08 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57405C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:01:04 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w12so19370741iom.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=he4Igwk/67gpHkuDjdC4uwLoo0dcwQMpUF2WbhaQetQ=;
 b=Imz7XwLhUIrpGLv/yRCMXMBpw2v+9W56Vt21gp/y3qKYZG7hbXDRUwuPgrBjwM071u
 aGJyWNLJzrzHdioqPhCwVx1BDwZqDGa/5Qyn8VmU1P6voD1WL5IqmTOTUuZ1DARdaDra
 wXXN8S4DZzIw/eKeC3V87GQk6hba2+xMg1TAlXAJim7y94rhc6BkLCiarWi6DGzb3FRy
 0Xty1JacWvjP14je6Dh1+4ovVTdgEO92DFXWJ2fqj6kT6SpZC9OXe8qOofJppvVgvfV/
 OeEmcOgslawTHMEpWLPZ/5RqZ8EwiOEDMt3Giex1Kx8g26/EERlWxdmczWgszuyxMnvT
 ysOA==
X-Gm-Message-State: AOAM531eHUSXqcwbkLFfw/dC+tvE0XyRdp3z6aN+ogH3cvIwwIGPql1d
 gPuTJHR71CSRFzWyRatBrA==
X-Google-Smtp-Source: ABdhPJz5zr86vUbd/1/OTctwlFOTcHcbn6YLc+aqmoYZ/vLEcG0zrUaemo2J6QRDaidL9t05GtmCPA==
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr5445855ioh.173.1596229262610; 
 Fri, 31 Jul 2020 14:01:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q14sm4883075ioi.48.2020.07.31.14.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:01:01 -0700 (PDT)
Received: (nullmailer pid 778932 invoked by uid 1000);
 Fri, 31 Jul 2020 21:00:59 -0000
Date: Fri, 31 Jul 2020 15:00:59 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200731210059.GA778876@bogus>
References: <20200728074602.14218-1-amelie.delaunay@st.com>
 <20200728074602.14218-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074602.14218-2-amelie.delaunay@st.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/3] dt-bindings: usb: dwc2: add
 optional usb-role-switch property
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

On Tue, 28 Jul 2020 09:46:00 +0200, Amelie Delaunay wrote:
> This patch documents the usb-role-switch property in dwc2 bindings, now
> that usb-role-switch support is available in dwc2 driver.
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
