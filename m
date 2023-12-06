Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 544918070D5
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 14:26:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09301C6C85F;
	Wed,  6 Dec 2023 13:26:28 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 074A4C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 13:26:26 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2c9f413d6b2so52297581fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Dec 2023 05:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701869186; x=1702473986;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R3sIhfDT+5Uo8u+SaAKl1HY/QwZqblPvSAxqf2hisKU=;
 b=QulXb7E27TQA41keoZZdn9WXDMHcAG8OudSzecJhQbciXHetVHJchOi/jXIoYQdiNs
 kSF0fNI1O738kAP8RLU49pMaTxIppZ/0sp/komdabMOI3mV/1giBp7KbQmTWV78aSTtc
 0pTTATl69cJnIe90KT/NEVjZX/nd7xKQIxcch8p6tV8ej5el9uczGZKZpPxKvqxiFVQs
 xdQfmLH4PJQZBkVkzINqcZfsQiuwho1JXvZlDpcUDAfxxaQowkfeFQbNOxzP0EAnEcyZ
 kZnHarfBfN9KJdR0WtB+hQYF3kHOdAlqceCtxok8q80yHUFxu0itPppxGjYlWWY39ad8
 SV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701869186; x=1702473986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3sIhfDT+5Uo8u+SaAKl1HY/QwZqblPvSAxqf2hisKU=;
 b=ALkQzftDtqRE7OFVFeTA4dZVKYL23g3JxJJYhaMQESxcYJ7F31JTlCPz/QD3S9D5g8
 1L0+O6gdQNTTzEg48Efk1mKeV83nthqXCMD24yzJU2oHmNJ4n/Butjxp1fp2SsNg+o7H
 9wPTpI3U9r9weoZgZTBE3gQ5/a2FYTvd21TGgyMRvnuKzx7z2FRfWsnaF3707Sjw7Rw2
 swtzf0fGSUTB5bFFps7W2sInXlEHPqRP0ffzv77Kcx8HdYjehMZS3nUqDYvRLYpKy5Zz
 zCetz/uyRg9i0hw0OD7TurY+j7RYkJxrq5qOT+pXvxIsdTgFIhIoF7VTiiBp0xijwg08
 6GLA==
X-Gm-Message-State: AOJu0YyU5szcVDQeAcEhrv9BGaWr66Mcn3YKdenP2UWIXW8IzuCSkrr8
 07EGlhf8+eoByBXTxNb6hAM=
X-Google-Smtp-Source: AGHT+IF/3/O+lRxfcjlZj5S9IZLV6IYSTw6CFIYRNs7/vndFIUU1NMf+Vz+sn9MCrJ6O7QF/vkBl0g==
X-Received: by 2002:a2e:2c11:0:b0:2c9:d773:894b with SMTP id
 s17-20020a2e2c11000000b002c9d773894bmr358870ljs.30.1701869185872; 
 Wed, 06 Dec 2023 05:26:25 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 q186-20020a2e2ac3000000b002ca03b29031sm972751ljq.72.2023.12.06.05.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 05:26:25 -0800 (PST)
Date: Wed, 6 Dec 2023 16:26:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <eudnbxyuf5yl2cuoyx6527l47amdwzlejwpwtyrpkyvbb4s6ng@lgpoqzr4rltt>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
 <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
 <zzkw5obc3z5fndowmrycy77gtjf6wscvkj7klnn34f3ycs3her@hmh5aebpbi3s>
 <0a5f769e-a474-40c6-a886-135716e90dd2@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a5f769e-a474-40c6-a886-135716e90dd2@quicinc.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, Dec 05, 2023 at 10:18:07PM +0530, Suraj Jaiswal wrote:
> Hi @serge,
> there is some more DT_CHECKER warning & need to fix that before uploading the new patch .
> Will fix the warning & then will update the version ,
> 
> Thanks
> Suraj

Ok. Thanks.

-Serge(y)

> 
> On 12/5/2023 3:35 PM, Serge Semin wrote:
> > Hi Suraj
> > 
> > On Mon, Dec 04, 2023 at 02:16:12PM -0600, Andrew Halaney wrote:
> >> On Mon, Dec 04, 2023 at 06:56:14PM +0530, Suraj Jaiswal wrote:
> >>> Add support to listen Ethernet HW safery IRQ. The safety IRQ will be
> >>
> >> s/safery/safety/
> >>
> >>> triggered for ECC, DPP, FSM error.
> >>>
> >>> Changes since v3:
> >>
> >> This is listed as v3 in the subject, but it should now be v4 since the
> >> last version was v3.
> > 
> > There are several style-type problems I would like to share. But as
> > Andrew correctly noted the series version was incorrectly left
> > unchanged. Please resubmit the series with the version incremented.
> > I'll send my comments to that new thread so the discussion history and
> > the lore archive would look cleaner. Thanks.
> > 
> > -Serge(y)
> > 
> >>
> >>> - Fix DT_CHECKER warning
> >>> - use name safety for the IRQ.
> >>>  
> >>>
> >>> Suraj Jaiswal (3):
> >>>   dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
> >>>     sa8775p
> >>>   arm64: dts: qcom: sa8775p: enable safety IRQ
> >>>   net: stmmac: Add driver support for DWMAC5 safety IRQ Support
> >>>
> >>>  .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
> >>>  .../devicetree/bindings/net/snps,dwmac.yaml    |  5 +++--
> >>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
> >>>  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
> >>>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
> >>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
> >>>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
> >>>  7 files changed, 45 insertions(+), 9 deletions(-)
> >>>
> >>> -- 
> >>> 2.25.1
> >>>
> >>
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
