Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E441E6CD7
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 22:49:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1474C36B22;
	Thu, 28 May 2020 20:49:52 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1988AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 20:49:52 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id 9so273030ilg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 13:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nSZ/8oTeGMv6mm5ev1BizJPaVqmDK8O3m6OqeHoCqSM=;
 b=q9DkkADeEfd/R0H3/F4F+s2FkAv2df3n6X6rbKtezmCpHHpZfttF4fD3RqqH1bDaB5
 v754OIN3Y50GyPcxzW6PXG7C3UBjpVE67mcm5QtbtYlkogDZuYJOD2/mu+lUtRTvDCyz
 rbyXT0B9l38f44e3sCuv7UMzYQb5rE9aijjL1nKWwJ//Kqksmwg6ZyC0aIg6NELl1EAt
 JPqdyFVnHOGVZNYGpKiQhlE+Kxutma9yOSTUaJQA6cDsC0ZCSK+XuqHQaG6CGvpkppH/
 G0kyLds5BiYAhGNaQNmYSHWwH5QfvhYMJEGpTxnN5tjuE/ifIoIgsdVwDK7dsURL500g
 V/Dg==
X-Gm-Message-State: AOAM531WfeoFBomBCMzyJ5dhF4IqGc2zrK1j1BCRJHM9Vgx2PActvO8q
 /Z4CM+b38vvskyExuhHZ4Q==
X-Google-Smtp-Source: ABdhPJw7/NSMKWDXcM8J2GXfV1LVjCAv7PFbVY4HduH122XtdzecNPaZbBNJXvaB2WOxTkpJtUWWXQ==
X-Received: by 2002:a92:de02:: with SMTP id x2mr4659376ilm.267.1590698990861; 
 Thu, 28 May 2020 13:49:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 129sm2825664ioy.0.2020.05.28.13.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 13:49:49 -0700 (PDT)
Received: (nullmailer pid 652010 invoked by uid 1000);
 Thu, 28 May 2020 20:49:47 -0000
Date: Thu, 28 May 2020 14:49:47 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20200528204947.GA651938@bogus>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-6-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589800165-3271-6-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch,
 sboyd@kernel.org, sam@ravnborg.org, linux-clk@vger.kernel.org,
 mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH v4 5/8] dt-bindings: display: panel: Add
 ilitek ili9341 panel bindings
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

On Mon, 18 May 2020 19:09:22 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Add documentation for "ilitek,ili9341" panel.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
