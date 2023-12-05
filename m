Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52756804FBF
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:05:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA1D3C6C855;
	Tue,  5 Dec 2023 10:05:05 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBAE0C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:05:04 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso42690411fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701770704; x=1702375504;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ceYdxCZagZpSeCFLYFzxnNcJXtK8XBSjVUScbGg+gCE=;
 b=BqBLdGg/eegubMkxdaImrC8e0zDP30KP87Gx0sZMvvjuIpd+quIrtF0IHSlNIxKqZ4
 8zXU1OFGw7kYwXHtNVmo+QgQvRchqVItSY0jhAZUQaF+mgsTviUGfPBwYM+Jc7xbXGWX
 4fZ6o2J2P4I99z8Qo/RyKb6cPWcG0FTd806UGkq3V48UAt1u/NWmzOWF3DMhVuHssiKC
 AYXcMJbjieO/bbY4Ys0sCv3qG4S0SDh29HdiFf+v/lXxfuaxQNN5QtqxlrrSgkkqtjVy
 lWxzTshf1BmrfUlIV1qT7SVWf/1JptwtkA6zsbX+f5iR6olWgjtO6MRtkB0s2cEANmU3
 X6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701770704; x=1702375504;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ceYdxCZagZpSeCFLYFzxnNcJXtK8XBSjVUScbGg+gCE=;
 b=HWXJROdjkl3Du2PXcyk2NDmchBgd1h06Y5Ppm5XqOtdI7BBSTgMhaPRYv5EvY0Vn+7
 XxsZiGrO1dS/Wpy48E5vNkbqRNObthZnZRBrcwePm9/yxRRqNo2ojKVywlhT4TFXieOH
 0jfYyIVwRmhN0xPdq6vlXU4owoWDTAGGa8aNwlgX+tu006EnIAa8EswBiAHWIxIEJrHZ
 4rHqqsP8MM4NYCImhL+zopC/VIriqd0B79KX1+cPXBzU/oMMLXipX4V3Zw01Ha6I5lO2
 s8DjKQ158vnj0xOnmLesoNdH1l0WK8m3d7Ucga2XQDJxCX/7/ohrNpPu63mTuSqI9FZf
 ylxg==
X-Gm-Message-State: AOJu0YzLs5G5jB+cvj/f/o6w8AclMi+e5E7vNVUDCCAy2SMtRFwPmK2w
 CK+jjd+HI6m42ZqlVwBiB8w=
X-Google-Smtp-Source: AGHT+IFsxWxor1w8WHtWV1o0i+23KJ3Nkjh3BSrlVrP0/buct3ZAchb106gkjeHNqo3qrVKMznHGsQ==
X-Received: by 2002:a05:6512:3189:b0:50b:e6f4:666c with SMTP id
 i9-20020a056512318900b0050be6f4666cmr2752238lfe.123.1701770703549; 
 Tue, 05 Dec 2023 02:05:03 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 o12-20020ac2494c000000b0050bf0320718sm781130lfi.95.2023.12.05.02.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:05:03 -0800 (PST)
Date: Tue, 5 Dec 2023 13:05:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <zzkw5obc3z5fndowmrycy77gtjf6wscvkj7klnn34f3ycs3her@hmh5aebpbi3s>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
 <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

Hi Suraj

On Mon, Dec 04, 2023 at 02:16:12PM -0600, Andrew Halaney wrote:
> On Mon, Dec 04, 2023 at 06:56:14PM +0530, Suraj Jaiswal wrote:
> > Add support to listen Ethernet HW safery IRQ. The safety IRQ will be
> 
> s/safery/safety/
> 
> > triggered for ECC, DPP, FSM error.
> > 
> > Changes since v3:
> 
> This is listed as v3 in the subject, but it should now be v4 since the
> last version was v3.

There are several style-type problems I would like to share. But as
Andrew correctly noted the series version was incorrectly left
unchanged. Please resubmit the series with the version incremented.
I'll send my comments to that new thread so the discussion history and
the lore archive would look cleaner. Thanks.

-Serge(y)

> 
> > - Fix DT_CHECKER warning
> > - use name safety for the IRQ.
> >  
> > 
> > Suraj Jaiswal (3):
> >   dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
> >     sa8775p
> >   arm64: dts: qcom: sa8775p: enable safety IRQ
> >   net: stmmac: Add driver support for DWMAC5 safety IRQ Support
> > 
> >  .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
> >  .../devicetree/bindings/net/snps,dwmac.yaml    |  5 +++--
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
> >  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
> >  7 files changed, 45 insertions(+), 9 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
