Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40581054EC
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 15:58:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B676BC36B0B;
	Thu, 21 Nov 2019 14:58:19 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2585AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 14:58:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w11so3194233ote.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 06:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7EIsUYwJkB766iLScM9zDv7o8KxiAB6USuY8ETmVybU=;
 b=MHOKag96ZIurMppuC9WWD4td59nDnfBed2P22EIiA25NJDZfrS4ZgK2HuSVJ9apLPQ
 tPkwIldsf/LdU43AkT3whrauA/RL/Cs8QINW3pq6GjxwMSm+8iBhuJxOscVKzBMcpT1b
 xkHg6XWbrkAvgOO5vfNgx0kx2iTX2RVklMZ9SnabpAbiblX0OMrnHCCZALI/JNu05ThF
 +Ila0CS8ZyyXtBohsPRTKxKGvis21KTxWVQjlAy6TNAfwERzLcYJrN2yXbtNhA6NhbA8
 ZdNIJQzSw+M51/2MCxisJVMT3+fmL8TOW9qm0hXuupstXdWLM4sLc+DzSJ95Qym5SXnw
 VfKQ==
X-Gm-Message-State: APjAAAV7oA5Gf1MRM3WCIC2h4b6+WzV+SWsVUys4Jc3ezW47IUPxH4iR
 qiUeymZenHI17KzbYhccYA==
X-Google-Smtp-Source: APXvYqzCaXK7A81tARs+0Mx+z8Ukzrqn/rzZHEMewuSJwm726s/GHLxW8FN20eTgJW6E10YMzqCV4g==
X-Received: by 2002:a9d:7399:: with SMTP id j25mr7203672otk.155.1574348296793; 
 Thu, 21 Nov 2019 06:58:16 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n5sm957812oie.16.2019.11.21.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 06:58:15 -0800 (PST)
Date: Thu, 21 Nov 2019 08:58:15 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20191121145815.GA4284@bogus>
References: <20191121095225.26775-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121095225.26775-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: remoteproc: convert
 stm32-rproc to json-schema
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

On Thu, 21 Nov 2019 10:52:25 +0100, Arnaud Pouliquen wrote:
> Convert the STM32 remoteproc bindings to DT schema format using
> json-schema
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 131 ++++++++++++++++++
>  .../bindings/remoteproc/stm32-rproc.txt       |  63 ---------
>  2 files changed, 131 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
