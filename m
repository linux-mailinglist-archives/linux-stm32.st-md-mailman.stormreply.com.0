Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4AC3613FB
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 23:13:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F222EC57B79;
	Thu, 15 Apr 2021 21:13:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA81C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 21:13:15 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id a21so12637117oib.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FAWw3bFQYesjQeXkR8MC2exPHbWdji9I901Slad01Hg=;
 b=aU+whfcGiSUIBzjaGzKSTKj9JXfmWwGcuOrCIC4jUOUb2zIHAsvWfh9pvwEh3qbWnB
 n75eJLrfidtI6waprM+F80fXtKamRA4dJaZkMPw36edneIlb2Rf/FY7uBGP95kzCa2pe
 ZCBWS0t0r0yTjizQS6spQfGwQ8+LQQXJtpvNrpnt3x9dDU3Zes/N6fXoohaIQ+LHrNz6
 sH85QLNdRiOGS6bZo/1h3/IRm8PLpb02wXnSi3rRQ06+Na26+nxW1M8T8kx4NzCAKPwS
 mucFRP6qtMA7do9DSDaUtHraoXxJ8bObi81cY78E8KG8ifAdm4VPIy0MJFHm1EJwF59n
 ItBw==
X-Gm-Message-State: AOAM531KbNFgEzDUhJEnlMMjtq2En/lpWadWetSzeABI5Y2yyVZOyyg9
 ebfgQoh7xenzZlwC9zPPRw==
X-Google-Smtp-Source: ABdhPJwzFYNQydxVA8BPBy4H6gxtdqg8s1DYtgAHX093Huw036nQO182IDJQe7+iCFZzEnNtZ654Bg==
X-Received: by 2002:a54:468b:: with SMTP id k11mr3831622oic.85.1618521194161; 
 Thu, 15 Apr 2021 14:13:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b12sm890849oti.17.2021.04.15.14.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 14:13:13 -0700 (PDT)
Received: (nullmailer pid 1892163 invoked by uid 1000);
 Thu, 15 Apr 2021 21:13:12 -0000
Date: Thu, 15 Apr 2021 16:13:12 -0500
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <20210415211312.GA1892117@robh.at.kernel.org>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
 <20210413174015.23011-4-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413174015.23011-4-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dt-bindings: serial: 8250: update
 TX FIFO trigger level
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

On Tue, 13 Apr 2021 19:40:14 +0200, Erwan Le Ray wrote:
> Remove data type from tx-threshold trigger level as defined now as a
> serial generic property.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
