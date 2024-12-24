Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B27029FB997
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 06:53:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D97C78F67;
	Tue, 24 Dec 2024 05:53:53 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89278C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 05:53:46 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e398484b60bso3824505276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 21:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735019625; x=1735624425;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U8k22NIhRUfREomzvEHYBMUyh3YhmCBtF7z7x287Diw=;
 b=u59SMj2E5dd0myliHdxDb7tfEU9Lf8/oyxPv8pFFPq0fCdp1QVVR1cbM5k6l7nhKlo
 uajlOFUBGGQsms4cxfSqOd7UysznKhK4vqHmiZS0efGeHTWiyFcJ34OqvhERXCk+DOI9
 OMosBSHrJq7T10JQ81jGTHDfoOXEYK7xTAM8A746F7/U+lL2DHJiKckF28u9f7UN8Lec
 WqW3PhWORAoso6lWLrcGAuMM5KTcm8DV1fzNpc08nnytjE5C2GiF3wE4tIWC3D3juRTA
 mzE13NZ3zRgYlnWQk40IMvUbvk+OL9Hfs3TwEAZ6lKl1/ZdH2hYornolNIVtG1DU/Xdb
 wXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735019625; x=1735624425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U8k22NIhRUfREomzvEHYBMUyh3YhmCBtF7z7x287Diw=;
 b=cdVkCWQmSQnMfY3N5hepnKEcgHjHrXuUZRAkgqQozFMPMFbeSPEHWbJGi3F4xtkHOD
 q5UnjkEF9UFTgXlbzV/v/HpNfBGmNUHk5IvimVhjXkwRFJUWVABWMIGdJK1TwOBcojKZ
 eWVTXtpBDcs9jUhxUjp7c5m1npxvxhKBx+htYfYr8gbm3Ml3NV7auAfj76TZtETcqof9
 UkMtmXV6ivroR4U1KAixHggxYzeS1sVB2JFtMInCVyB66SD39OzO+vlVqZMDWzWfsqcW
 yZcDwwRNbHNs6EGuS0DurThFcPti31UHBslw5CtVaMdjKhxOMjrL0WoNvfRBx+7BkeYy
 KKSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcDqQsDDTOThzoOr+78hbXX/GqORHrLYJ3wq5S2+Ih0tWByxnRB13mewdKr5bbOr54fuVdDET8ZThHnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnmYK+6QVrUgdVn6WJpsLL+VAaLbbxbDeMkTB5WMNYOUDw9W/v
 wsIRPZ3m7eCrbopGvFnhaXuq64py4KEjwMdol2TeQTiUfBce74xRWR8oQqZskIGdQR3o92a3LLj
 gZJA4OuOMEADOo0a/YuSh+0FXzj5NQV0gBvO/Cg==
X-Gm-Gg: ASbGncsb3JBYRAGDzInpekFHEIgtAKI5xlzhIDXDG1fT6JW7os/YJmXFHk5gNv/GqmY
 NCqhqEEvwh7AlMFgnxRdLOpX8O9OWjAKcgG12GuDcbGgYcs4s4cA0
X-Google-Smtp-Source: AGHT+IHZNTB32SM9lZHV7jMuubh0s3yOGJoM9z09zuPN2nLMSX1RRST3+VUlZjXDWOXCRHlJ3OmlP+RWk9nmIxIonSI=
X-Received: by 2002:a05:690c:680b:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f3f820bb3dmr106099737b3.33.1735019625469; Mon, 23 Dec 2024
 21:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
 <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
In-Reply-To: <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 07:53:34 +0200
Message-ID: <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Add standalone ethernet MAC
	entries for qcs615
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

On Tue, 24 Dec 2024 at 07:47, Yijie Yang <quic_yijiyang@quicinc.com> wrote:
>
>
>
> On 2024-12-24 12:16, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
> >> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> >> compared to sm8150's 2.1.2.
> >>
> >> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> >> ---
> >> Changes in v2:
> >> - Update the subject for the first patch.
> >> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
> >>
> >> ---
> >> Yijie Yang (3):
> >>        dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
> >>        dt-bindings: net: snps,dwmac: add description for qcs615
> >>        net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
> >>
> >>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
> >>   Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
> >>   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
> >>   3 files changed, 20 insertions(+), 4 deletions(-)
> >> ---
> >> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
> >
> > Which commit is it? I can't find it in linux-next
>
> It's a tag next-20241108, titled 'Add linux-next specific files for
> 20241108'.

Nearly two months old? okay...

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
