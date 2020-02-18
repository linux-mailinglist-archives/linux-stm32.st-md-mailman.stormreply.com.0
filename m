Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD911634CC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 22:24:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22748C36B0B;
	Tue, 18 Feb 2020 21:24:25 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E247C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 21:24:21 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q81so21692200oig.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 13:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wtMHXyFhYbqyTVO0vF6Kcqe6OQmnz/7Cal/xbWgxM1k=;
 b=bjuvFoxNutK/Fov+7NZTHJ9F3arpLA7/63WHC8VHx+oYbT24Ni/eyenOJvtNA9gS38
 kzQ+cUGKhAVzvs+gtgoUC9XoT9gwLEri70cYL+53jNGTQrOA4Jwq+hUC2174DGEGscnX
 CWgGXbx6ftGi5pwH6jb7RdLKnsZqtqOVugd67QTQEbZ+WFYqfbTJiaerb0gf0aDSos3D
 CVZgfYEcZprHdjLWIUmDJ5qFG71H+2OdKNdxxm5jWRIIBxa3mpH38i8VVyEdXAm35tve
 sNdjmyF+FFaYdsQSMUzgDUOdgQKeSvnd1SG+beJ2keyAqEwd9cumMjssFSOvsI6EadRo
 YP1w==
X-Gm-Message-State: APjAAAVAUa5etn+hR21X5QCQnnNEYVkhHp3ZPAi43qH3HrQYNqhD+D86
 xZr+aKvo1VSt83q7I3fgTQ==
X-Google-Smtp-Source: APXvYqzRApOAzxWTuj6FxZU0qh45JNaX3foVD2D6h/wVsRSCi4UeCotVaoEUHsPi9xiZdnGVL+n19A==
X-Received: by 2002:aca:c1c2:: with SMTP id r185mr2676756oif.19.1582061060244; 
 Tue, 18 Feb 2020 13:24:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm17411oib.42.2020.02.18.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 13:24:19 -0800 (PST)
Received: (nullmailer pid 29988 invoked by uid 1000);
 Tue, 18 Feb 2020 21:24:18 -0000
Date: Tue, 18 Feb 2020 15:24:18 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200218212418.GA29946@bogus>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217134546.14562-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: mfd: Document STM32
 low power timer bindings
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

On Mon, 17 Feb 2020 14:45:44 +0100, Benjamin Gaignard wrote:
> Add a subnode to STM low power timer bindings to support timer driver
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 4:
> - change compatible and subnode names
> - document wakeup-source property
> 
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
