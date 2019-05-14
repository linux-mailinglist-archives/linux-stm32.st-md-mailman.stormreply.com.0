Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C01CEED
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA206C35E04
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 18:20:46 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5080C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 18:20:45 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 66so16181853otq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 11:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OKJTOSFDQe74oP+wcypIqwl6MFEVGiVBSsqYDDAQDPc=;
 b=kWnifoWe5kQzonFjtkY8yDalXNCGj4uVZANRoA+5q0aEAcVfCYN3PsE0QURtI1lHcC
 NTOtFZ4pOE29HAfIqSO0ZEz4tOH6l0M1Bxj6fe6/0UEeB0asoMo4GtykudWyTafOI1TX
 KQAsNM0My7s0sz/iSN0N2oKija0sZWdOTY0NmtOR/3JG1hbBYlZy6NBtzw0+3R09W9Xw
 g7RlSfDGixgDqZXZxnhAP5Ejr4UyKAI03OsVZ6Eskctu6xsupyPnD35rMwF9cxtaPiU9
 Ng/ZqdqyWBrGRAm7AXicPSbCmAgVUnLt635pLqa/pSddnwLdgi+36Rf294+ST8pC5Iqs
 B9Qg==
X-Gm-Message-State: APjAAAVTncOXIuyOFxv1kXFKj24kdadnpAuYOHoCiBg9ehKKYk+fLkpw
 XtMGihy2hPlIGXYI0KlQBA==
X-Google-Smtp-Source: APXvYqwo5lRcs0PbbSdUqX0bwV+G31tQy4bJg/f5bK9hHGr5zRLHyV6p4NyvX9B3ICaQkkJ2BwjMkQ==
X-Received: by 2002:a9d:66c3:: with SMTP id t3mr22211827otm.80.1557858044189; 
 Tue, 14 May 2019 11:20:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x64sm6771926oia.32.2019.05.14.11.20.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 11:20:43 -0700 (PDT)
Date: Tue, 14 May 2019 13:20:42 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190514182042.GA26928@bogus>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
 <1557822423-22658-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557822423-22658-2-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/8] dt-bindings: stm32: add bindings
 for ML-AHB interconnect
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

On Tue, 14 May 2019 10:26:56 +0200, Fabien Dessenne wrote:
> Document the ML-AHB interconnect for stm32 SoCs.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
