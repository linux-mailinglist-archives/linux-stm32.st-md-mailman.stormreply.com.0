Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D44974D8D
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 10:55:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF5BCC78015;
	Wed, 11 Sep 2024 08:55:35 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCFD5C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 08:55:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso4546802e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726044928; x=1726649728;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M7g/Bl6lBC/cRuXNn+LW0zFsoslcjYTly3MsBdR/C+U=;
 b=Sejnr6afpUm124lL//SQTHdG7tuPrduix9s6G1liH+JooBmy3bSYAV+LY4vPwUzp+Q
 KhUwdbIymbfXmQYjcjs758hJ0SgqWhQCk4Y4SdpwiYtor9VKeL0eleH/Rh5NfpphxAta
 I/IPTFTwGc0okaW4YMU63Pw3Vqj8O1tHv8w5eIw+l+7LLoh3Tv2DbpVyhcJ04n/DYN8r
 cNcj4X/rimsOPa2wxAquPijuT6Kgx1LVxiRIMT147vQ2CIM7jW1XdiA+n+i1PrUupsqA
 0wVstwWtz6r3iN2gjLLQi5uSY2V04fMws38YaZYqtEvMPkMOUcFCJKJi1LDkd/IoxlHi
 1nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726044928; x=1726649728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7g/Bl6lBC/cRuXNn+LW0zFsoslcjYTly3MsBdR/C+U=;
 b=teNmoyAsB99LaOao9tZc3LQfWEgA1CmLO5fWSVD/jZMaYdClaZJWcaOfGRnLjgz3m0
 LBjuwa7/mm7jbTw0vCxmh9PKo9WlcVRER+kD+iGXuIq3Iaj7yhztwQA9MgoWi8LKEHv0
 xJV0E7rXzwhnRsbZpEd05kQCWsExoNjy4E9l+0dkDNWOs+GikrGHfhvmKys+T+F1lSdM
 8KnTVLr/lz7fR0c4O22v5hkj2r8/1vgQLd1FB1Pb85rfWIDs4FSrc25FK/KfOfSzx1VC
 GqTAc6a8iVov/InoRemrnvmv+EqZoDS3yy7pcwDHq+zN06DIT79Nd0qcSGouZxW5UVPz
 ZVwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Bw2lZBrUUldhgBaoYNex1nWjaMzKMO4qkoPca8+3A473CdO+9lT5O/uIz+IG17xeo33/gNWN8wtu6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywdz7QfBC24qYbXqsGcSjJd5cAWu7P5MBitW0NMpEDIKQZuJa1n
 jVJAzsXsr4Jyt114Mrox4IcVFir0utqDvIky40HjYgBWKP73bis5q7Wzw3c3I98=
X-Google-Smtp-Source: AGHT+IH+Dzjozd3OlATo0a9sgQDCf790CbejQFcEZWABh2pvl4N1FguMPA5NKsNPpodVdT4PlWx09A==
X-Received: by 2002:a05:6512:6cf:b0:52c:850b:cfc6 with SMTP id
 2adb3069b0e04-536587f5c84mr11715382e87.38.1726044926949; 
 Wed, 11 Sep 2024 01:55:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f905a06sm1490865e87.241.2024.09.11.01.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:55:26 -0700 (PDT)
Date: Wed, 11 Sep 2024 11:55:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
Message-ID: <spwi3an6viosg4p3bnufpqah4uevzbncka6s6rvlqm3rhsszhz@fi2he6vsviyl>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
Cc: "Suraj Jaiswal \(QUIC\)" <quic_jsuraj@quicinc.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 kernel <kernel@quicinc.com>, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Stop using a single
 dma_map() for multiple descriptors
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

On Tue, Sep 10, 2024 at 03:43:23PM GMT, Suraj Jaiswal wrote:
> 
> 
> -----Original Message-----
> From: Andrew Halaney <ahalaney@redhat.com> 
> Sent: Wednesday, September 4, 2024 3:47 AM
> To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
> Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <agross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <konrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <robh@kernel.org>; kernel <kernel@quicinc.com>
> Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for multiple descriptors
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> 
> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> > Currently same page address is shared
> > between multiple buffer addresses and causing smmu fault for other 
> > descriptor if address hold by one descriptor got cleaned.
> > Allocate separate buffer address for each descriptor for TSO path so 
> > that if one descriptor cleared it should not clean other descriptor 
> > address.
> 
> I think maybe you mean something like:
> 
>     Currently in the TSO case a page is mapped with dma_map_single(), and then
>     the resulting dma address is referenced (and offset) by multiple
>     descriptors until the whole region is programmed into the descriptors.
> 
>     This makes it possible for stmmac_tx_clean() to dma_unmap() the first of the
>     already processed descriptors, while the rest are still being processed
>     by the DMA engine. This leads to an iommu fault due to the DMA engine using
>     unmapped memory as seen below:
> 
>     <insert splat>
> 
>     You can reproduce this easily by <reproduction steps>.
> 
>     To fix this, let's map each descriptor's memory reference individually.
>     This way there's no risk of unmapping a region that's still being
>     referenced by the DMA engine in a later descriptor.
> 
> That's a bit nitpicky wording wise, but your first sentence is hard for me to follow (buffer addresses seems to mean descriptor?). I think showing a splat and mentioning how to reproduce is always a bonus as well.

Please fix your email client. It is impossible to understand where is
your answer and where comes the quoted text by Andrew. Use text emails,
text quotation (single '>') and no Outlook splat at the top of the email
("Original Message" with all the emails, etc).

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
