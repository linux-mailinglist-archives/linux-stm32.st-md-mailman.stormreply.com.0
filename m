Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F281CEF3
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:21:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D79BAC35E04
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 18:21:00 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F89AC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 18:21:00 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a132so12893520oib.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 11:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pw9JQbzKS0a4HXNL7Bkj2dhXDflsHMPuLdGRZTT4jqU=;
 b=uP0s/rLtq05uLOSm/Wz0mTbH9WvI5nR+EzKuEFscylVw1ppKe5B5XJve63TZ6PMN12
 MnSPM+Qxy8hzTQMPvljvFpvQ55zwK2JN1f4TgewyOs+lWB4pJe22MEx3KaiJJgAHBFvY
 5Ys2xnQOB2y1iYLhiXtnROv99qZHwpv2gX+DoXn3yhAO3J3429XPob0ECWOTtj8jHtvP
 fsqZJcY2UsM6ruWe6FbGrpVK8AD8gpbA7HbfNxyEw8hK2WTSHV4VHLvdx0QZ5P96bED+
 DG0kO77c4boqbBZP11Iul8oDE12Ekk8xUM79nymjqHmOinoyyvm/xl9V2Qw92HDh3lq9
 H4iA==
X-Gm-Message-State: APjAAAUiBbxdSjHSJeJjSiq2OqmI1p+61GxZ4NheZ+f+VttCIAgQxCWN
 zMkzc6bQR63YmOR5I8iRoA==
X-Google-Smtp-Source: APXvYqxZeCsZUomLSIAJ/MyTJbnDCD5r2MgFiIhPMfVTTg2CPXMGsQkk5wZZ/VGWG2FzDkYqmDF21Q==
X-Received: by 2002:aca:7297:: with SMTP id p145mr4065474oic.87.1557858058769; 
 Tue, 14 May 2019 11:20:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n95sm4392204otn.73.2019.05.14.11.20.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 11:20:58 -0700 (PDT)
Date: Tue, 14 May 2019 13:20:57 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190514182057.GA27475@bogus>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
 <1557822423-22658-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557822423-22658-3-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/8] dt-bindings: remoteproc: add
 bindings for stm32 remote processor driver
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

On Tue, 14 May 2019 10:26:57 +0200, Fabien Dessenne wrote:
> Add the device tree bindings document for the stm32 remoteproc devices.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
