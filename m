Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E92009755B6
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 16:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE5EC6C841;
	Wed, 11 Sep 2024 14:39:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0097FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 14:39:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E701A450E7;
 Wed, 11 Sep 2024 14:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF5C4CEC0;
 Wed, 11 Sep 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726065556;
 bh=RIl2vqs1rYnlBT7Pma3eLUwMyWxA2WhBMmHCl3yi23w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pfRI8rZkJxendEAuv296Bmdk4n5+LS0TrKnAdyRfGNFbRry3Cc8V9v5w+OCkGJquL
 Hb546cSEeEqrKuwYHwWehHT2yTVW98jjqaDMA2oxWTAzXZj2dTJQ4VNRLRWKlGd/IR
 OWAaxEZubpLkhCWdAa+cNhOrTYIRCu9bKeg6dZHw059FTJ/DSq5YRTPASqFenV9eeM
 4S9PsqZCziq4X2OTpXMXrT/JP4OJmtNUPuIhfExVz26KcvEUBsLz7VU7QleKH9r7jZ
 RNEj2iKswTHfK4auCiezX/d9k3TPpLeStgf4y139By85RbAPGzkLlstoIn7TI6aFLL
 QQM3q9B00ajcw==
Date: Wed, 11 Sep 2024 09:39:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Message-ID: <172606555436.153197.17103030569267503329.robh@kernel.org>
References: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
 <20240909033458.3118238-4-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909033458.3118238-4-quic_jiegan@quicinc.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v5 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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


On Mon, 09 Sep 2024 11:34:56 +0800, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
