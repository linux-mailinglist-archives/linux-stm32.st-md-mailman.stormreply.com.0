Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A449673E
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jan 2022 22:19:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3767EC5F1ED;
	Fri, 21 Jan 2022 21:19:45 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CB50C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 21:19:43 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso13313302otb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 13:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rwc9GxUTej2WnJMc0e3ALPik20sHOJTxdJgSjedRgYM=;
 b=pLNgPHBPXmfwSVqbXZ5pp46SOFWUxWBeZeyr7lzKLDpJCA3MRiKTJXnJR1DpEfDZkK
 PTscbWHeHEcFW8q+OwTjfUNZLQhM6oE7muERfmlxBUT4rspUpzI1YiLAaVqB4N0nI8bN
 Z6lpYrL6wnBhMoDATk3DsoURFkZXFKMaLkK5tdGTKesBFfh1J3NLFcg45yfH4Akry3Wx
 W3O/pSc4SvQ0r18zt7zBzZa7ztyJLeMTYN/eGlktqTCPt0gzgN39WgcZWFgunUoOsaHH
 XZKsMJD6qAq07Jllt9P8kDgKe1hqkjEBqg4LMqVYk97FzP3toCPEmbeDERYJZr7sSwhU
 FTUQ==
X-Gm-Message-State: AOAM5315z6POuW3j0yhUIsqnura/ILRujJGgcZzgkGx0Lk9l459BpKOD
 QXq9wlKfu+NrBdqx6ADHng==
X-Google-Smtp-Source: ABdhPJzbNnH7DDBGJ2KNG4hBF2gFhO9Qk8NiQerrT9EGNcWyi7kzEHZbIoK+YEXVUQe0ZMgoi4p0gg==
X-Received: by 2002:a9d:57ca:: with SMTP id q10mr4195836oti.180.1642799982173; 
 Fri, 21 Jan 2022 13:19:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g2sm1614084oic.40.2022.01.21.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:19:41 -0800 (PST)
Received: (nullmailer pid 1602431 invoked by uid 1000);
 Fri, 21 Jan 2022 21:19:40 -0000
Date: Fri, 21 Jan 2022 15:19:40 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <YesjbOzh+B00dKIh@robh.at.kernel.org>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105135734.271313-2-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 srinivas.kandagatla@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-binding: mtd: nand: Document the
	wp-gpios property
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

On Wed, 05 Jan 2022 14:57:32 +0100, Christophe Kerello wrote:
> A few drivers use this property to describe the GPIO pin used to protect
> the NAND during program/erase operations.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
