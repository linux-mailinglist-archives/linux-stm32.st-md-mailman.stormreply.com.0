Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B84662B
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 19:51:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EAD2C58D7E
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 17:51:56 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 857F0C58D7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 17:51:55 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j19so3416645qtr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 10:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PST035fihKP7qa7V2kxzXv7aujCa26RgBIP4O3/ziZQ=;
 b=N/5PAIboIfNPtJQOtksTW3XRbjpDqMuhTHAtsxs0qurmw1cCrZLzK6s+iaBY2dupJp
 3iZxxctsa6HVTfc/ZkwtBa4uRru1ra8+vGhdUt2ma7enkOaBlE7OamXPduR8fZ8301TG
 HUpI0vO31YK4ji/IXdq9nTRakYGeIvF1TgIFl/9iqVhMHyebiSPj6CGqccfsnmZIztgn
 gDgljAQNKPfKW9qvwUS4qVh4xmXn7enzhY3bPhJK8BJ7ablnAQTN/OyNEsswD4lfp9Ej
 PG42BRD4EHWDXF4YNnVbCgN5OYM3UKEUk9mfZ4R4KybLbjt3LEDMSXyfRpkZO4FcPizx
 3Q8A==
X-Gm-Message-State: APjAAAVI6/h+K0WGFPCTEC/UowjfwrquCSyD7TskREsErqhhhBujpc8H
 qsEYc6oF4DZOZFfV6NQmiw==
X-Google-Smtp-Source: APXvYqwUnd8FPADe8nH6dseR+TRRkfxHm0kmkb3uxoiwjmhMZifbdpbshCoLVh3igT7lLIlcMAitWA==
X-Received: by 2002:a0c:86e8:: with SMTP id 37mr9667182qvg.77.1560534714279;
 Fri, 14 Jun 2019 10:51:54 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id n5sm2197915qta.29.2019.06.14.10.51.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:51:53 -0700 (PDT)
Date: Fri, 14 Jun 2019 11:51:52 -0600
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@st.com>
Message-ID: <20190614175152.GA18378@bogus>
References: <1558711838-21174-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558711838-21174-1-git-send-email-erwan.leray@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Erwan Le Ray <erwan.leray@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] dt-bindings: stm32: serial: Add
	optional reset
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

On Fri, 24 May 2019 17:30:38 +0200, Erwan Le Ray wrote:
> STM32 serial can be reset via reset controller.
> Add an optional reset property to stm32 usart bindings.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
