Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BD63801
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 16:35:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28C01C930CF
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 14:35:32 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FBEC930CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 14:35:30 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h6so35396546iom.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2019 07:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lwKfxQYrNRix0RZpaeVKxAuscBcsaH2KK8rGZ1jsPCc=;
 b=E8vQQsUbmAJZq1WauqTSxZeOkSoS0WlcospDfP5RvCiQdtSdeQuRvNi12DQ5ORsiGb
 GJSl4Sy6Kmyt50jn01HJaKhM6VHBZEoxfcYzBPp6/6iUMNEkxNoCF6inw0bhAni5eMp8
 0+3wXXcvv9KPcJxPaGCaZRacvSRtDWjywoUBtj2AdUGx/cWItVdhEbcMCIiVLyfei5tm
 1nGalEbUE7m2kHsf98JZHS8IkWbDhtRLswDg1k4PM7VolOLosBgIUYDzVsYeExkVw+Eu
 s+oKw088xJOJtz0jKvQTBnoxSznK44DGxw/LtgpcY5rkZen7b9Vm3JokGAIxOfXnP7TH
 ejTQ==
X-Gm-Message-State: APjAAAVYmLHk0AJ/EdQqrxPAMX2ZVt73a45qFDm0S4W+gVqcFjxdgS6G
 3F5KX6KQ90R73d0BiYva5w==
X-Google-Smtp-Source: APXvYqxycFxWOrP0VFA297PFQw08U0eQrnQU3S4DTJhbrCNZVKI7ILJJDrcU1R51khX7qQdXozwvCg==
X-Received: by 2002:a5e:8e4a:: with SMTP id r10mr6692177ioo.100.1562682929485; 
 Tue, 09 Jul 2019 07:35:29 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id n2sm14065735ioa.27.2019.07.09.07.35.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:35:28 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:35:27 -0600
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@st.com>
Message-ID: <20190709143527.GA5489@bogus>
References: <1560433800-12255-1-git-send-email-erwan.leray@st.com>
 <1560433800-12255-2-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560433800-12255-2-git-send-email-erwan.leray@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/10] dt-bindings: serial: stm32: add
	wakeup option
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

On Thu, 13 Jun 2019 15:49:51 +0200, Erwan Le Ray wrote:
> Add a note for enabling wakeup capabilities of usart
> 
> Signed-off-by: Bich Hemon <bich.hemon@st.com>
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
