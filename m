Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE9803F1E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 21:16:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 081C3C6C855;
	Mon,  4 Dec 2023 20:16:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F685C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701720977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=scE6uJE/gsl0ExlvPlw1tvZXL0nwbCHoC6Ch9ngDrG8=;
 b=KQds8Gu9MN9fs665098G4bgXmbejxlRdEzdisgH4g/5hRlycImVcD7QdJRe6HH9qFxKPQh
 tT+WMUy6oLyLhdwSqMOsiZPd8pTjTgrd/cxUoVuI1qAvhYh+CuC5pnOpKHEpuC+X7YTUwJ
 +5+VB8QOJl9jI33hcWDrbOqyp+No5zs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-LQBA4nCEOWmAtJBpsgep4g-1; Mon, 04 Dec 2023 15:16:15 -0500
X-MC-Unique: LQBA4nCEOWmAtJBpsgep4g-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-67aa5d15846so19510756d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701720975; x=1702325775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=scE6uJE/gsl0ExlvPlw1tvZXL0nwbCHoC6Ch9ngDrG8=;
 b=E3G8Ua10LCKwXeAn2uyxp9xVyWgouGTbV/0FEH1lKmtCsyuALvcPfKDWMCbwWhVRNQ
 HzVQEcI4UOmGvxmPCxOKzbVtmkfjL63l/lYFHoyYjfveP5ee41YHQpAaWbYG9G8J6d+u
 4jBn7yiXeAi27bH1p9ADZWREhzcCSkG8Ln1Z5wMSSa9+RHkKWtjmwLfCjEQtz++O98C6
 7SpIkjkajJQnkm6xdajgRa1F/fwDyTtJJWde3oBRC9uWlehXI1iUD//4yVrG8AZaNwnj
 guISVDg7e3vvRyiccPRoG8895fhhsJVuGbj0HLgfuz7L9VCWWyd0LWAkSio6icm58jsZ
 ci8Q==
X-Gm-Message-State: AOJu0YwbwvYv1z7cEub0zbHJN6IyKBqxd1bhUvSebxkGB1StTJORzn1D
 3QfQPEHBFfMFOeJwy+eDiaUrYmiR/um7MJmspXhP7R4yo3YMnku+5XrLrtXIcPNHAu16dDU/SRW
 5CXLicacmHqITJjGkOJ6QZoZxakP6LXeZ7J1KsyNb
X-Received: by 2002:ad4:4481:0:b0:67a:a721:ec1a with SMTP id
 m1-20020ad44481000000b0067aa721ec1amr127130qvt.94.1701720975323; 
 Mon, 04 Dec 2023 12:16:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgoVrFG6EC//oL2uzFysj4twtnTf+9h/+HjOZVaxTJrf07QpXYwOj+ja1iSEQZGrynxBr/Ig==
X-Received: by 2002:ad4:4481:0:b0:67a:a721:ec1a with SMTP id
 m1-20020ad44481000000b0067aa721ec1amr127121qvt.94.1701720975037; 
 Mon, 04 Dec 2023 12:16:15 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a0cb283000000b00677fb735738sm4618230qve.34.2023.12.04.12.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 12:16:14 -0800 (PST)
Date: Mon, 4 Dec 2023 14:16:12 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <cover.1701695218.git.quic_jsuraj@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ
	support
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

On Mon, Dec 04, 2023 at 06:56:14PM +0530, Suraj Jaiswal wrote:
> Add support to listen Ethernet HW safery IRQ. The safety IRQ will be

s/safery/safety/

> triggered for ECC, DPP, FSM error.
> 
> Changes since v3:

This is listed as v3 in the subject, but it should now be v4 since the
last version was v3.

> - Fix DT_CHECKER warning
> - use name safety for the IRQ.
>  
> 
> Suraj Jaiswal (3):
>   dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
>     sa8775p
>   arm64: dts: qcom: sa8775p: enable safety IRQ
>   net: stmmac: Add driver support for DWMAC5 safety IRQ Support
> 
>  .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
>  .../devicetree/bindings/net/snps,dwmac.yaml    |  5 +++--
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
>  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
>  7 files changed, 45 insertions(+), 9 deletions(-)
> 
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
