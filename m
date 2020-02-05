Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB5153706
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 18:49:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55672C36B0B;
	Wed,  5 Feb 2020 17:49:36 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E638C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 17:49:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so3834092wrt.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Feb 2020 09:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Lsfbnz3H38vTOletZ4EmB6C9KpZCxglql+qL3XIYGjo=;
 b=HFF4e5mOzu4Hj97fyBJ/r27QkrRwe5UWnMF91PwJcX7U2Ywdt84eY8g4mLSvyhFeWU
 VpjlyRBT7NgGies2ryVtnQ9ebgoi694AalUO/KGBSXe15Ac4k3NIUPt3f1Ov1njs/Z1e
 KmKVr7G8IztrJl4/lEpD+ThCC1oLhDX2jZ5FjIheFwOM/6BtsTSaArEQgzPQTByrKHse
 95FkoVIQZ0XPBfa/4FtuZqw+1XydCWTpDn7yLS1MlOQtpORjbDPxdKanv8lKuF4aXBUa
 oFcEDJ2166BysAYn9h0mtCY3Zl17nRplQpzd5a5/17fZ7fIkjmeBPfsvZdWUl9ftBOiy
 uGDQ==
X-Gm-Message-State: APjAAAXChlVmFbS/J3H4fLINC7UpLn1LiNmOhoW+mUvXwk5XJhGuP1Dk
 attceZ/+wucSA00e3KgP1Q==
X-Google-Smtp-Source: APXvYqybHL6/b3Oz5I7G0CLuDoP0nfLxsBDQ3ivJbNaQ7/MXHy/EygjBmjdA1/E6DvSGs4NYiVTZrg==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr28065695wrm.278.1580924973513; 
 Wed, 05 Feb 2020 09:49:33 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id t1sm335850wma.43.2020.02.05.09.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:49:32 -0800 (PST)
Received: (nullmailer pid 29957 invoked by uid 1000);
 Wed, 05 Feb 2020 17:49:31 -0000
Date: Wed, 5 Feb 2020 17:49:31 +0000
From: Rob Herring <robh@kernel.org>
To: Ludovic Barre <ludovic.barre@st.com>
Message-ID: <20200205174931.GA29922@bogus>
References: <20200128090636.13689-1-ludovic.barre@st.com>
 <20200128090636.13689-6-ludovic.barre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128090636.13689-6-ludovic.barre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 5/9] dt-bindings: mmc: mmci: add delay
 block base register for sdmmc
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

On Tue, 28 Jan 2020 10:06:32 +0100, Ludovic Barre wrote:
> To support the sdr104 mode, the sdmmc variant has a
> hardware delay block to manage the clock phase when sampling
> data received by the card.
> 
> This patch adds a second base register (optional) for
> sdmmc delay block.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
