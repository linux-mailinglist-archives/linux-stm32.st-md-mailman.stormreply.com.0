Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705B56C191
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Jul 2022 00:15:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E91A6C640F4;
	Fri,  8 Jul 2022 22:15:57 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A888C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 22:15:56 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id b1so21710ilf.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Jul 2022 15:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sNAXLwnHlgZL+RRPcwyuf08NpY2oRUI/xPRVTLc8Kv4=;
 b=wxBL2DQfNCc3/lJMGpw1dW06imrI63WbBuAwV2kLAm14fCVtaS14WLZmuZl9DvFLdE
 yxt1VPjrCjGBeySvUF7EcybhpRHpKxjB7wOHoev+WRyGK7q+YXmPuKvAdu/Ghl068sVL
 8sSNUnBMuOlfUKGjlOUFlhtgHKQm332ktXxJm4KBT9gtmw2Ag88vj0gsv+j7eye13UpQ
 XfwaRYxYYpoXxmLmL8l+JQuhJ0BQp9Cv1jaApXBw7u7MsDU524mByc9AsqSJlAELpcZc
 ivgRNfvAr+Th5Fr2m4BSK9svpL0iSwcRmFxjXumcAWhC9FEF7cN13/8XRwPbUIUdOhKO
 s2pg==
X-Gm-Message-State: AJIora9dwNKzD2CGY7cdeXC8YPhD9Ca/SnZGCXe9ak4oZwsASqgrizkS
 EDkrwFxrSrB2NEz08GJ63Q==
X-Google-Smtp-Source: AGRyM1sTh/9Jg+iKmfYd7WSDHoFeviiLxTHvbNq5LkBdkESc3E6BkRI9GjzwzexP1vAAvU154ityyQ==
X-Received: by 2002:a92:d705:0:b0:2dc:583:f588 with SMTP id
 m5-20020a92d705000000b002dc0583f588mr3459501iln.158.1657318555415; 
 Fri, 08 Jul 2022 15:15:55 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
 by smtp.gmail.com with ESMTPSA id
 e39-20020a022127000000b0032e49fcc241sm18560635jaa.176.2022.07.08.15.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 15:15:55 -0700 (PDT)
Received: (nullmailer pid 1575582 invoked by uid 1000);
 Fri, 08 Jul 2022 22:15:54 -0000
Date: Fri, 8 Jul 2022 16:15:54 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20220708221554.GA1575535-robh@kernel.org>
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
 <20220707074402.2429786-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707074402.2429786-2-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, wsa@kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: i2c: st,
 stm32-i2c: add entry for stm32mp13
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

On Thu, 07 Jul 2022 09:44:01 +0200, Alain Volmat wrote:
> Add the new compatible for the stm32mp13.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
