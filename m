Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D97794B2B2C
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Feb 2022 18:01:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 822F6C5F1D5;
	Fri, 11 Feb 2022 17:01:38 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB911C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Feb 2022 17:01:37 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id b5so9554703qtq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Feb 2022 09:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lTU4HbSouJ9dqPWmjI3l0Ew8QHUuA5sWoJVXgwwCRvA=;
 b=sqaSvA7yC66rS8AcJvcpIAOWgv+cPXJNwsmZDBBb00toPcRZo6Lvyt2VmatOVekVn6
 SvLpakyVkmI4PSpYsGm8WDsZb7aWSrW3HtbpHDNC5Ob+912AaoaA22z62dvu+uY61ID/
 rnG4EhUwZp0Ng4tZwzdeGUztqn0AOmiZsH7NBhVTCqDeDVVth6vBwtubhFyjLKdKzZTJ
 zmEV94R9whbrikd3KMkEUSiBL/CE02lyi7Is2LCEjHfJ7BeS21H7KeBcMYLx06uv5uto
 c5FKPrFr0f07vzUos/g+CfrdeNJsxydxtgR9PL8JZQvPvW4IwKd62EwsNx/BVDLqE2Q8
 r9OA==
X-Gm-Message-State: AOAM532VI4r5qxvIcoj260HCTL7+Yl+t/nZXbFwQFqAF2ltwb0xHLQp9
 p1C5V5tIDFIuTF1VYkbZNw==
X-Google-Smtp-Source: ABdhPJxar8bPh0jFhQ/T6PgRv8vQRRu79k9YmCed0Oo2PzGqPTvP1dPyOPbElhyV0I3YJZDBuvwn0A==
X-Received: by 2002:a05:622a:411:: with SMTP id
 n17mr1774065qtx.466.1644598896394; 
 Fri, 11 Feb 2022 09:01:36 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 j11sm13087720qtj.74.2022.02.11.09.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 09:01:35 -0800 (PST)
Received: (nullmailer pid 521591 invoked by uid 1000);
 Fri, 11 Feb 2022 17:01:33 -0000
Date: Fri, 11 Feb 2022 11:01:33 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YgaWbb11EEKSVEZZ@robh.at.kernel.org>
References: <1644414747-22159-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644414747-22159-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 tglx@linutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: armv7m-systick:
	convert to dtschema
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

On Wed, 09 Feb 2022 14:52:27 +0100, Fabrice Gasnier wrote:
> Convert the ARMv7-M system timer bindings to DT schema format.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
>  .../bindings/timer/arm,armv7m-systick.txt          | 26 -----------
>  .../bindings/timer/arm,armv7m-systick.yaml         | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/arm,armv7m-systick.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,armv7m-systick.yaml
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
