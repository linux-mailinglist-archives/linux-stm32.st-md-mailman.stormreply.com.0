Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15563D43DC
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 17:10:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9FDAC36B0C;
	Fri, 11 Oct 2019 15:10:17 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DC83C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:10:16 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 60so8250853otu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 08:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AYqY8ptTKV39xxtFZyc1+8jrTs0a76lcIovZ+BLPMag=;
 b=s0mUIwhXNLNoLMu0UTN7MG/XzKI8WB4WGyjyZ8RaJ25koGhqeXCbGokgEVugkwVpu5
 PvD/bTw2fo9CmlsgtrILo4siG4YlJUy02nfdlAtmfSpsENbrSuJdw4n9IXjfJc/dRZ5Y
 fXallTQ3CxLCGplyTjv7Ng40dbZkQxlMFUIhPDm76Mf+HlITX/Fr4Kd4AE0zgsZnyFyP
 v/egW8e8nxO5UlRiPrnKtXQb1AHrngCxAFR56bPCXfsunZOgUFkT50vJPeF3DnaKcK9m
 BU51CFGbNx07FJ6B1YzmY65LmAsj/0DeJPf+/tLXvpX1z2dLLtnPfPnpSkFur4tIbBEE
 nDiA==
X-Gm-Message-State: APjAAAWEGzXrNyM8bkD2CEhNUVnrhe/qbNjHy6/0L0obojzfkDIjpCdu
 zDWo31IpG2eh9EsCqSqXyQ==
X-Google-Smtp-Source: APXvYqwkpn2Rm6NPxteihd3r7HUcq/7kBVqTZFOHHnjYbh6GQJSC3s6NgoJrW3CK0nueqj8fb335Cg==
X-Received: by 2002:a9d:7345:: with SMTP id l5mr3406363otk.39.1570806615029;
 Fri, 11 Oct 2019 08:10:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k2sm2719648oih.38.2019.10.11.08.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:10:14 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:10:13 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191011151013.GA12791@bogus>
References: <1570193633-6600-1-git-send-email-fabrice.gasnier@st.com>
 <1570193633-6600-2-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570193633-6600-2-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 mcoquelin.stm32@gmail.com, u.kleine-koenig@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: pwm-stm32: document
 pinctrl sleep state
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

On Fri, 4 Oct 2019 14:53:51 +0200, Fabrice Gasnier wrote:
> Add documentation for pinctrl sleep state that can be used by
> STM32 timers PWM.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-stm32.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
