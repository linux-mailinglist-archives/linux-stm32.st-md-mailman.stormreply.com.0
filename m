Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B8F113784
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 23:21:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08CFDC36B0B;
	Wed,  4 Dec 2019 22:21:48 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89B69C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 22:21:47 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k196so833887oib.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 14:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0YMXPK0MWLWyfIyxG2mVwtUXfMBfXzC4dJTyDwiUSCI=;
 b=hplDXZ1nz5P3GFDFVeb5FkTldI8PBMT6dVmD7BxVhU2LrtPddxprCpFvX+2pHFZ35g
 4y0pQ7yCLNk0/wnqTbK6B9buFEmKuce8IieyEFf1oPM4MCDq/CaH65cEBR7xmzTRr/Cc
 Hzxviz5JeaI9zA/3ZZ4CtjAlIBz+0ZI7i7qt1pFKFJyao0mwZErt3sXpHZLtmi/xltJl
 /S0GNkeuPf3FEMMsBvPWOCkuLUpoBtUG8qWw2Ce+wiOKOfS2/VNgKDUlEBXSMdDtBInu
 9titSeYp9PNqbm6caKatzHi002EqWOhKUzCPJrN+UTfzQGoT8OqMaXwImg0o94MhsU4K
 kkRA==
X-Gm-Message-State: APjAAAW4oO2YjjUcdqURNRSggIlFtCVKWMULQva81NLrkEmnTwrfReRZ
 JMVsKY6jw1NLU1CcaKdfIw==
X-Google-Smtp-Source: APXvYqxd6OOdNmobqARjtlfaN0LLudPr5TKfnJ4uyLbrkH6cblTCYO0/yUZjNuu/J1TAHun4I2prDQ==
X-Received: by 2002:aca:d5d3:: with SMTP id m202mr4421120oig.161.1575498106026; 
 Wed, 04 Dec 2019 14:21:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y24sm2784605oix.31.2019.12.04.14.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 14:21:45 -0800 (PST)
Date: Wed, 4 Dec 2019 16:21:44 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20191204222144.GA25718@bogus>
References: <20191122125402.14730-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122125402.14730-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: stm32: add
 wakeup-source property
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

On Fri, 22 Nov 2019 13:54:02 +0100, Arnaud Pouliquen wrote:
> If the optional wdg interrupt is defined, then this property
> may be defined.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> This commit is related to the merge conflict issue reported by
> Stephen Rothwell: https://lkml.org/lkml/2019/11/21/1168
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
