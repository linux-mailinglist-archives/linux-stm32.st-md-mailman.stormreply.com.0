Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222F292F65
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Oct 2020 22:27:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DCA3C424B9;
	Mon, 19 Oct 2020 20:27:26 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC6D6C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 20:27:24 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w141so1454574oia.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 13:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dq2Q4wYlvZqon/jVNhQ6O79+BXokYsSiy5rj/1RzZb4=;
 b=mKwvyTZX0eFEPD22jM1G6SD5Q/kFye9sOcdA+myXbLLYL0QbAQMNtqREhUnP3vWZOR
 qmdPTYwMCL9xOBIkpjddwLgku+n9uWbaWN6nB0zcXST1O67HzrGn3LKdTGLcAGLgOyU2
 g874bISe6rpvfVxK5VVU4n0RjyGAawIRWGXdhTqHqSmYIIXpX+KuFFRax/eSD9hmKc0f
 qfLT3bUF7t63HooYFtJ2ONlUxe/c4JieWM8KLueYzEZsh/WBq86WuEct0+wsp7HvL3eo
 BiWvf9IfTa7uT2Cm10SJVgILxB0XWtW2AgPVVikhsZXuvBv0O93ejOxrjDEzHHVJrEr5
 7duQ==
X-Gm-Message-State: AOAM530ODYyoszEPbjuJkP9HrB7/39uYWfXIwtpkYh9Ye3pcII+q2b9h
 1QGsd0ZBpepZlmYGOqFwIQ==
X-Google-Smtp-Source: ABdhPJzWni2g3t1tjZxHgWy35dH8tTRUz7MIVaD7VeH4QWgQVVCUj74G5lDSAoDqhFF6NQoH+g+YaA==
X-Received: by 2002:aca:1012:: with SMTP id 18mr850373oiq.30.1603139243601;
 Mon, 19 Oct 2020 13:27:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b1sm187822otq.80.2020.10.19.13.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:27:22 -0700 (PDT)
Received: (nullmailer pid 3550080 invoked by uid 1000);
 Mon, 19 Oct 2020 20:27:22 -0000
Date: Mon, 19 Oct 2020 15:27:22 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20201019202722.GA3550050@bogus>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
 <20201014125441.2457-4-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-4-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dt-bindings: remoteproc:
 stm32_rproc: update syscon descriptions
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

On Wed, 14 Oct 2020 14:54:40 +0200, Arnaud Pouliquen wrote:
> Align other syscon descriptions with st,syscfg-m4-state and
> st,syscfg-rsc-tbl descriptions by suppressing the cells
> description.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml      | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
