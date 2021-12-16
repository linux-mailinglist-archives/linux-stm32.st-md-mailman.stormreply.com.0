Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB8477D34
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 21:15:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 200DEC5F1D9;
	Thu, 16 Dec 2021 20:15:49 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E149AC5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 20:15:47 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so256921otu.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 12:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gnZ2FBw98i/ACm5Oz2lt4Y7quKT4nxqXJ+lm8AP+1O0=;
 b=3oArRsvvnuLM4oPm5JvIYR/eGJt2WoEmUrBKOvV68WHfcSpLyLe1kHLadd2cYEgrY4
 qJTsahp5d051HEwMdDICgMJgdRsXoxwWXi1hpx+PvuI+e/adxlLNd+/HG3xZ0mwttqVL
 Dc8M8fwPl/Jv2a+iREq3vfRsL/6Rrv51finLV4ws7O38zKq0I5PDKrmb8mmoMu71SnF2
 h+6z3dIRLaqLqJ9oTsjxpuOSRduPhJs3uj2UXDhkyFIywTQ/dT5cIWg+1gcvtH9eGNDk
 aySmH7GJnaAhYSW4XXMx9DrRrcA/+Dk2GEEQ3PWsGzUKcIbqv81B4wK44YOLK9GvBD47
 Ebyw==
X-Gm-Message-State: AOAM533qsop9VPYwPcsrLRi8VuSK+aj/WYM283N62t6+0kd20FRyGKC0
 KXeOj+Far03PomDvESgVCw==
X-Google-Smtp-Source: ABdhPJySK6rf6Rcp4m3frEmeBIfJFU98tfB1Ohx58HPIMFdOnSgnDvtOpeqqOegdtB4lfWkjYj/zfg==
X-Received: by 2002:a05:6830:1281:: with SMTP id
 z1mr13987300otp.230.1639685746879; 
 Thu, 16 Dec 2021 12:15:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bh12sm1188906oib.25.2021.12.16.12.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 12:15:46 -0800 (PST)
Received: (nullmailer pid 682135 invoked by uid 1000);
 Thu, 16 Dec 2021 20:15:45 -0000
Date: Thu, 16 Dec 2021 14:15:45 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YbuecSGljX4Zzso+@robh.at.kernel.org>
References: <20211215105847.2328-1-alexandre.torgue@foss.st.com>
 <20211215105847.2328-4-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215105847.2328-4-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: interrupt-controller:
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

On Wed, 15 Dec 2021 11:58:45 +0100, Alexandre Torgue wrote:
> Support of STM32MP13 SoC implies a new EXTI-GIC mapping.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
