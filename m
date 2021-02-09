Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC731556C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 18:53:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83C9C57B54;
	Tue,  9 Feb 2021 17:53:35 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28368C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 17:53:32 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id y11so18284957otq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 09:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5OLpg6/dLCiCZvpRxfwgoYAD7gmTBGuyeOSkVtKIFWY=;
 b=uPZFxJ1G10DEcBoKDcSwipajFKaZgIo8b7X1qsaKGmVq1Vi1idbaqKCSQ8ffH5dEBM
 4vi0Ptb7w3tIqtkAf89WDRYks9Htsf1OMJyKfCCx/55HAI9HHNX9aBj0tklZ23glXflX
 D2YJ7e706nkuI29oPfow3GoEG6lQiNFnolFj2+/vQ6l3RtXhOfpkdsICcmC2L5ItdZ+x
 xTmnsqGzLafuM9ZNZaH9rJifTDaiocHaetRTPGXT4Ck436emOWFxiRuifSIoEBqtYDj5
 7OO1VooIx8sZ4IBeB/h/KL6rXUmBB2pXCeTe6ST4ihuh9gB7xEbUTjaeSwMkOvbYv1+p
 ON0w==
X-Gm-Message-State: AOAM533KobVqFKtHumPrMR8bhUnfpSpqDD9sz58TE9W58VDhFboR3ZM3
 fMv7LJLO+AZfqgnT8TfYUg==
X-Google-Smtp-Source: ABdhPJx8rI+dua6GVjbPf/HNO17WupKmBHDm2AqHofiNnHppJhtWx9h12rQ0cabOmnrryCKVM5QQeA==
X-Received: by 2002:a9d:63c1:: with SMTP id e1mr16232129otl.354.1612893211045; 
 Tue, 09 Feb 2021 09:53:31 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g3sm4355428ooi.28.2021.02.09.09.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:53:29 -0800 (PST)
Received: (nullmailer pid 4034602 invoked by uid 1000);
 Tue, 09 Feb 2021 17:53:27 -0000
Date: Tue, 9 Feb 2021 11:53:27 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <20210209175327.GA4034545@robh.at.kernel.org>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-9-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126090120.19900-9-gabriel.fernandez@foss.st.com>
Cc: Etienne Carriere <etienne.carriere@st.com>, marex@denx.de,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/14] dt-bindings: reset: add IDs for
 SCMI reset domains on stm32mp15
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

On Tue, 26 Jan 2021 10:01:14 +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> stm32mp15 TZ secure firmware provides SCMI reset domains for
> secure resources. This change defines the SCMI reset domain
> identifiers used by SCMI agents and servers.
> 
> Stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
> PLL output and few secure aware interfaces. This change defines the
> SCMI clock identifiers used by SCMI agents and servers.
> 
> Server SCMI0 exposes reset controllers for resources under RCC[TZEN]
> configuration control.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/reset/stm32mp1-resets.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
