Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944A6E07CA
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05625C6A610;
	Thu, 13 Apr 2023 07:33:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6BEC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681313126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pl6/W8hCGdRrPSVdraI8ut0BaCLlf4yrRN6pHHW/94A=;
 b=G4p7/dcAFcXkv6IWQDOnib3ASSRzydA8qB52wx0QqaCBUs8uh23li2+6ATltTqoOCy9zO1
 DfrHcQzY6pJcmG5eHQG8G/rUh9RDZ88U1pyCfVYiZKforGYM39HzUEM/f1caIZILHQp3PS
 psftdtXe/jLUUS6KRD6Ff4dkTZj4Hck=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-nl0iJl3INo-V1khO3JlPFg-1; Wed, 12 Apr 2023 11:25:24 -0400
X-MC-Unique: nl0iJl3INo-V1khO3JlPFg-1
Received: by mail-yb1-f197.google.com with SMTP id
 o19-20020a254113000000b00b8ed021361bso12813208yba.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 08:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681313123;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pl6/W8hCGdRrPSVdraI8ut0BaCLlf4yrRN6pHHW/94A=;
 b=VsEgq3b0Fq5fptdEML4vAbUK5fzpZINwMca918ZoLiKjap4X8eqH4cOjyjQXbTICxm
 AFhiFJRlwlY2Z2M/BjjU5Fg7+6rwR3+laERCuZiu6XicriVy2S7BElx+myfKlWPhyf3M
 JO8G0wXgJ1GBAiTHpMNa/0rOmASWWqhEvIxzbhUdM5Epn6mzSUQtCXXfmLsr+AEX3qCt
 FZsBoLcFK3dZn6ndLNHDQh9fFmvwr8u/aQxqawKqRSb8teZ3Gx3smyXxloroDq8r8b/Z
 JUCiEQ8YvSzf/SWOCoVNE5VvdP3zdSOEm0+B6Z9mLiSon3c+jd/B+AVgxtbewpUbqVf5
 tAqQ==
X-Gm-Message-State: AAQBX9cz4dbK5MVyJaXrLgnXmbH4MP5HdMwW/e0nEPr7NEb7+yK23uGU
 QsmjKIYS2yDwZdXs9J07VSQymwutst2hrs4dAcNjooh8CYHqlmAjiJfhBiTMYGOpAqgTmRLxpHX
 3sLtUCmEvEygxaMt9Uljq2QOjRG5/UjOPwEH1ZdMH
X-Received: by 2002:a25:ad94:0:b0:b62:d9a1:a606 with SMTP id
 z20-20020a25ad94000000b00b62d9a1a606mr14571440ybi.62.1681313123355; 
 Wed, 12 Apr 2023 08:25:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350adNn8pbkwJ2Kq0277gghgwLXefMb+eA4EygwfbHqcH5RZ9YG9iTFp0U4fQIhM3iOy8sYtlRg==
X-Received: by 2002:a25:ad94:0:b0:b62:d9a1:a606 with SMTP id
 z20-20020a25ad94000000b00b62d9a1a606mr14571401ybi.62.1681313123021; 
 Wed, 12 Apr 2023 08:25:23 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
 by smtp.gmail.com with ESMTPSA id
 e140-20020a811e92000000b0054f8a3f6281sm686495ywe.3.2023.04.12.08.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:25:22 -0700 (PDT)
Date: Wed, 12 Apr 2023 11:25:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZDbNXvHiyGuF2A49@x1>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 00/12] Add EMAC3 support for
	sa8540p-ride
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

On Tue, Apr 11, 2023 at 03:03:57PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 based platforms
> 
> This series makes the changes above as well as other housekeeping items
> such as converting dt-bindings to yaml, etc.
> 
> As requested[1], it has been split up by compilation deps / maintainer tree.
> I will post a link to the associated devicetree changes that together
> with this series get the hardware functioning.
> 
> Patches 1-3 are clean ups of the currently supported dt-bindings and
> IMO could be picked up as is independent of the rest of the series to
> improve the current codebase. They've all been reviewed in prior
> versions of the series.
> 
> Patches 5-7 are also clean ups of the driver and are worth picking up
> independently as well. They don't all have explicit reviews but should
> be good to go (trivial changes on non-reviewed bits).
> 
> The rest of the patches have new changes, lack review, or are specificly
> being made to support the new hardware, so they should wait until the
> series as a whole is deemed ready to go by the community.

Looks good to me!

Tested-by: Brian Masney <bmasney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
