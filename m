Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F57F5E1C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 12:44:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51105C6B476;
	Thu, 23 Nov 2023 11:44:43 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2D71C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 11:44:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so10081441fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 03:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739881; x=1701344681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KVW8XA5bzUo8eqk22K5VEvjyNNkbbnblzFQyRhQLgRc=;
 b=OnQ1CmZWtubD3EqmP7z9+t5a2YuqJnfFdz62c7rGwzjgWjtJrGZCHE7v65q9ACK2d2
 7tcNnOTG+bhbfq7lClv5oYNm8C+3NoDnilRNW1QysqjPvb+f+cvIaufe55mtyPECFXt2
 diNYJgjHURANLOS+YtqRSDN94nMiGZ2lM3XMdoSbhXUrvzOZfbFykwowto2DyMfAtGbL
 Mi4wRTQ9F4AlHN0SQOoAO+A8RRJDe3yUUJG3uKAzJkh2hFtlyhCCGnMRA7XuMZbPsahJ
 KU8juwnkvqxwLJmw6gb1TcVhbqGFXElrlbMQ2X74ZfXgmHQdTI81rIunR1QXwME7/TWJ
 LoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739881; x=1701344681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVW8XA5bzUo8eqk22K5VEvjyNNkbbnblzFQyRhQLgRc=;
 b=DqnKW82LtWIhxBkV0B0TVyo5yewGtP946jP5GwCra0QRR9poM/QUr9R4k8iE444nr4
 61h3i+81by+k4pKaJFk9KGvCWa9InjIe7r3qcFdhyg0+c2zluS6ujq0VgNv7cZhhCFr/
 dWfxUe3XohbBssd2e6Y7nDc8vEr2jZk1sWDBk2Fg1jStBsUtJ7nrC3ODPuI/RvnK021B
 22nIZYhq6Ah9rnkjYsttCT447sFEw+LzdkpxfChRIdDa71WFEbSo4P0pZNbQZTIA5+q6
 rnHROAN0Ve+oDPXyGpka2tUO8POdsWQmZc65y/VtcB4JLmfSIBY5JTqspRRJa3gv0/4b
 NaaA==
X-Gm-Message-State: AOJu0YyqjHyKibwVw07kLi/vlWp95IlYKpMWws/eXXtMOZYYeRPgaMdi
 dXDn4erQ33QzMJ2mCaIIo9iJ2g==
X-Google-Smtp-Source: AGHT+IH0pakFkfqc+E3mM99GckC/gqD782WjMYSnP3CbEroBmmgrEWC9XGMB9xC1wTLYk8jGpNMxhg==
X-Received: by 2002:a05:651c:11cd:b0:2c8:33fd:ca8c with SMTP id
 z13-20020a05651c11cd00b002c833fdca8cmr3290024ljo.45.1700739881118; 
 Thu, 23 Nov 2023 03:44:41 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9d12000000b002c884919bdfsm171902lji.10.2023.11.23.03.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:44:40 -0800 (PST)
Message-ID: <8c43228b-43bc-419b-8620-b8f8401fa59a@linaro.org>
Date: Thu, 23 Nov 2023 12:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for fault IRQ for sa8775p
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 11/23/23 12:38, Suraj Jaiswal wrote:
> Add binding doc for fault IRQ. The fault IRQ will be
> trigger for ECC,DPP,FSM error.
trigerred

spaces after commas

> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
You refer to the IRQ as "fault" in the commit messages, but call
it "safety" in dt.. Any reason to that?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
