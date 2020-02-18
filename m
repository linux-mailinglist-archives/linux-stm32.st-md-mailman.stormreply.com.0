Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDD1633A0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 22:00:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C803DC36B0B;
	Tue, 18 Feb 2020 21:00:14 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75750C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 21:00:10 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id h9so20903649otj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 13:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EZdSZVnFTTL60ilak2TTEP7SdA1gf6hbeTUpnAC0fEY=;
 b=ccb+MgLBMeM4CNMHpRUGudM/kQxsUQ+cZDfAj2TuU7vNVGiSzyzJertQeIfuluQDWM
 vZvv0YIyVvOIvKeiQuaZvHRQddhwKzGinRMoVdMoCOZTe5krzy0DzioMyBwdtjzgT7gk
 1zAbvyreSIIxuh26o3qnMDby8FEYX8LsoiTQhFopOTzsfsumGf8m/OcK/UIs0jdc4Wtc
 ZHKUQSj8lTPDMyLaCfBCRoKDxlhJ7ynx5QfkrmSeO0P73DrkBtplYix73gXrVFs+cGNm
 DphEZAtAL2YJ8MMtfnlOplT4tjASPObPDm8TyH4Gl2rNKuZAkZKHduU/ZSPwltcNYOib
 +70Q==
X-Gm-Message-State: APjAAAVNYnbB0fKN58rMCNcJ6B4VaGm7GTW+fps76RqxRHEHO+6qpcAn
 gSEjm669rBHdJ77fSgMVMg==
X-Google-Smtp-Source: APXvYqxBQJgcoPbaU7PhwEXKClf1mLX8ROp0uTfC2VI4ZU5HWY5HM3BpMCCje1myXwydUl1kHDMoZQ==
X-Received: by 2002:a9d:6c01:: with SMTP id f1mr16594053otq.133.1582059608989; 
 Tue, 18 Feb 2020 13:00:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f3sm1731641oto.57.2020.02.18.13.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 13:00:08 -0800 (PST)
Received: (nullmailer pid 27504 invoked by uid 1000);
 Tue, 18 Feb 2020 21:00:07 -0000
Date: Tue, 18 Feb 2020 15:00:07 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200218210007.GA27448@bogus>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-4-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211174205.22247-4-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 3/3] dt-bindings: remoteproc: stm32:
 add syscon bindings preloaded fw support
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

On Tue, 11 Feb 2020 18:42:05 +0100, Arnaud Pouliquen wrote:
> Add the optional syscon property that points to the resource table
> address and the state of the Cortex-M4 firmware loaded by the bootloader.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
