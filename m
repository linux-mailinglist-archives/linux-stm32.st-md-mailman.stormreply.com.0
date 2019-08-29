Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D922AA2A67
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2019 00:57:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5230C35E01;
	Thu, 29 Aug 2019 22:57:22 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90BCAC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2019 22:57:21 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a127so3923474oii.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2019 15:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tt59Vai4nKcFOlf3kuJu+36rcTwUnw+ESfP2cPA8a9w=;
 b=Ln9JhdfR4jMIrlLXOTEVJnN/Ico7Ju3JHqPBHMLQQMsRCV5f7mmJEWUsYGQm0FhcGN
 wiSIc+nV+EuYUSCAUXHT4nd07h/iBhYUaWd3v0455aXjhJmMaIgtnqhE5cwkQJLhx1V6
 wQuuiUgmX/sfVDa432FFcVMdqSen0bMj0AegiNomnhyd48Vi7GdR8mkA1NJ4cNZ3rEXG
 euZQWD/xlT7phDLvrW/0P1ZqgTgooXcvCOPreEd8A/2xkiX3cK/KodpGVA/g7SW5vfhe
 e4SKUEwEN2ia6owvahBemT5zPBz38+Ly6HBM05CktvTtt+6bZJBIdrxJaLbEj9f62F6T
 qMUw==
X-Gm-Message-State: APjAAAVZSLsG8n4E3QxMAt1O2lgboJCx04jquoQ8PBv2BFZBqzNHPx1C
 Aue/RGlsJjGMrGKVzacCWw==
X-Google-Smtp-Source: APXvYqzNLJ5SnSm+nMCobpcQcc3WHBIxdaTxiYCSwEw6M9n03lmG7rmmrOA9SRGSrxwhdyGE3uk1qQ==
X-Received: by 2002:aca:3909:: with SMTP id g9mr192281oia.158.1567119440204;
 Thu, 29 Aug 2019 15:57:20 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t21sm1026334oic.6.2019.08.29.15.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 15:57:19 -0700 (PDT)
Date: Thu, 29 Aug 2019 17:57:19 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190829225719.GA21954@bogus>
References: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
 <1566833923-16718-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566833923-16718-2-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: remoteproc: stm32: add
	wakeup-source
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

On Mon, 26 Aug 2019 17:38:42 +0200, Fabien Dessenne wrote:
> Add the "wakeup-source" property: if the optional wdg interrupt is
> defined, then this property may be defined too.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
