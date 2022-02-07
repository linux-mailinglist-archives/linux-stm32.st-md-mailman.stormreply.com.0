Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D647F4ACB86
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 22:45:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E50DC5E2C5;
	Mon,  7 Feb 2022 21:45:22 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4C48C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 21:45:20 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so11875609otp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Feb 2022 13:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTR0nFrp3s4BqIEjNWo3YoJyTs4shL49W7ioqon6aOI=;
 b=BG9eP3XtxBG73C1T9Smu+BYv+a7e/EoOwx3XOEbiatSidXRjqObQSXOEHvKwifetQR
 16CbgSy94h94jxDERfwS6wZOGmjdIC9jtl/+49F7fW4rQFhrFvQDFqPAEvPuTD2WjKCr
 Hb+WmIOX+BLWzacmDIbLlCe8KwmwIUTBtwMOytXxRmUCCb5lDjCIZgUvZJ+e4EH2emNd
 5fyAf1DrWrg34myZgQvFQfXuUfx9/CkqoDHu4Dl6+ZzqJxKcot/GT7cZfkRTJzLU0EL1
 NaW3MxJ6w4Ex9V40jerfEBgZOZA6ebGdYNIqSBPaZ+4woI1p99KKTuSgxoY92QSlnDux
 rDMg==
X-Gm-Message-State: AOAM5319dGT7qNbOyl7+AHsIY2jVg/mh0+xIHGak6cg68P4tRRbteYSD
 /sF2xluvmXkZ14Dbg98Zfw==
X-Google-Smtp-Source: ABdhPJxLdm3APhJ37DTFNGxqX95hogQIoqUwXlXstkPJI3BHIac1nI2rUdV08uKnk1cUk3SKliVRVg==
X-Received: by 2002:a9d:6f8d:: with SMTP id h13mr712005otq.309.1644270319682; 
 Mon, 07 Feb 2022 13:45:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h9sm4542956otk.42.2022.02.07.13.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 13:45:19 -0800 (PST)
Received: (nullmailer pid 977724 invoked by uid 1000);
 Mon, 07 Feb 2022 21:45:17 -0000
Date: Mon, 7 Feb 2022 15:45:17 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YgGS7YkSl+hGKx/1@robh.at.kernel.org>
References: <20220202140005.860-1-alexandre.torgue@foss.st.com>
 <20220202140005.860-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202140005.860-2-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] dt-bindings: interrupt-controller:
 stm32-exti: document st, stm32mp13-exti
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

On Wed, 02 Feb 2022 15:00:03 +0100, Alexandre Torgue wrote:
> Support of STM32MP13 SoC implies to create a new compatible in order to
> manage EXTI/GIC mapping changes.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
