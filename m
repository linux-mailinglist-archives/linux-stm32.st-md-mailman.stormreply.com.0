Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78211778E3
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Mar 2020 15:30:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D94C36B0B;
	Tue,  3 Mar 2020 14:30:49 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98BEDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2020 14:30:46 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id q65so333925oif.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Mar 2020 06:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3giDTcmis7xuoYSVjRPJHKbcsBkDsi3FIKg6I//oj2U=;
 b=DgPlQ3f4zVnhm4fsIAg2gnTHhIXtI/TfEDxYmJVkAeol8WFnml5rvaAveKaeK6q8m5
 pd7Mj/UT8Z4jTbm9usF9O8KUryXqLeY+FK0vYzs8T5H0LSapvVWpg89xnqH7OOos5uZL
 Oyc7XplT/EEC1DZEqC0duyPIqe9hdt36dh0Z9+F6d4N7grtzY21RhOUW63BWBFf3QjqG
 cDBTTjtKSLRvxB4fEJIEKnGnAWcHh6C1rFlZcaEUWwDEAHihEKFni2voRQHqmCmoc5aI
 GruRLdTDqfElaj+N0LOFP89l0CF5UB61+dcKLhTmtu8zNtIvDCqfb3SgolOOwBhVBIb0
 T6SQ==
X-Gm-Message-State: ANhLgQ0cC+dCRyzF6Gc1UbutdMhENIbarYMAPQwtmvcSr7MxDHKl69Vu
 ELg21FLN8ucWQBUYKYMyQQ==
X-Google-Smtp-Source: ADFU+vvfMW/0Fosxapnoh/aFQ3fRu6XOd3zB5JsdxNtRlGdL+ltkBAIjvhbLwLVfbP36SKvU92NEtw==
X-Received: by 2002:aca:4c91:: with SMTP id z139mr2568648oia.150.1583245845284; 
 Tue, 03 Mar 2020 06:30:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y193sm6613292oia.38.2020.03.03.06.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:30:44 -0800 (PST)
Received: (nullmailer pid 24203 invoked by uid 1000);
 Tue, 03 Mar 2020 14:30:43 -0000
Date: Tue, 3 Mar 2020 08:30:43 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20200303143043.GA24147@bogus>
References: <20200226143826.1146-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226143826.1146-1-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: add vendor prefix for
 Linux Automation GmbH
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

On Wed, 26 Feb 2020 15:38:23 +0100, Ahmad Fatoum wrote:
> Linux Automation GmbH[0] was founded in 2019 in order to develop
> electronics for embedded Linux. Add its vendor prefix so it may be used
> in future board and device compatibles.
> 
> [0]: https://www.linux-automation.com
> 
> Signed-off-by: Robert Schwebel <rsc@linux-automation.com>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
