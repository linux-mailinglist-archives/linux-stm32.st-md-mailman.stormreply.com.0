Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B15FD48B466
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jan 2022 18:50:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77AF3C5F1F5;
	Tue, 11 Jan 2022 17:50:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4DEAC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 17:50:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso19462939otf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 09:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rE/zQ1NHhEOnOFHEQajAuZqfJDdiQ8VVuq+PXaVdSGg=;
 b=U+Dob0f5MKTSOWW8o++fmB/u5jAlLg3J13ASY7ms8sHShnkRpf7yu93/FX7zu4Xn7i
 28z952N9sQk3o34FtrrxPyQaHAhN7Cwlg7K+GSDWfzRRQTY/7P0Smr4GYaMSKJlp1sXw
 Sn/Yd6FZWGw+BNETjn0oGTx3te6BCutuvW/pAZI4sYqgo+storIqVtzgH1QVav9PioIL
 xmMO8GnxAO9uAL2DSPgwl8yWdyVV1w58HR0VaRkboirR3OFs0CN88xoNs3/4egdSMzhO
 H149bMDhR5kFtpbWL5kMQV3Yk40Wh47YiCZKg3Q45LGP4MvYiBO7NXjAcGott9VhK7Pm
 txjg==
X-Gm-Message-State: AOAM533hAKN7sfHQlBcOU7+OetImFnhxqhkXqfkGfmBl5dneIf99JknV
 LKrciOtGNo+uW0YN7xrJUw==
X-Google-Smtp-Source: ABdhPJzcKMShKBbkTfTV50XRAiHDvNhKAQt9t0uCo9VATcmdd+1oGIOfOnNPyU57ahwW+CLxUCMX+Q==
X-Received: by 2002:a05:6830:1be8:: with SMTP id
 k8mr4170255otb.226.1641923414614; 
 Tue, 11 Jan 2022 09:50:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d3sm1763832oic.23.2022.01.11.09.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:50:14 -0800 (PST)
Received: (nullmailer pid 3226040 invoked by uid 1000);
 Tue, 11 Jan 2022 17:50:13 -0000
Date: Tue, 11 Jan 2022 11:50:13 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <Yd3DVdvmWBT9L6l0@robh.at.kernel.org>
References: <20220106183037.1443931-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106183037.1443931-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
 stm32-i2c: Make each example a separate entry
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

On Thu, 06 Jan 2022 12:30:36 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
