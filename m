Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F226382E002
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 19:35:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E786C6B457;
	Mon, 15 Jan 2024 18:35:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A92A6C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 18:35:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 23D81B80159;
 Mon, 15 Jan 2024 18:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7CFC433C7;
 Mon, 15 Jan 2024 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705343711;
 bh=A/NUlrmkYC1Tdahi24UVZlzPpmQ3KRyTa0ARP/oeSNw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=d7EoQMaLtJzqBcczk12hENAP5xZuFi6rZJZ5i1dH6Y+LcK8ASjn4Y45PPpIIRR9px
 EbbbH480qegzsHehZmpjBDsL1RybLAoWYEi0uIcEiDPnjebO3/6DnnyKElVzMXJjb2
 pNS1kJ3WZPy9PhYDJunN2xkEBw4cSsILBNBiixbekH5xc3L/h89XYN/7i1avFH43dv
 eq/LgxhJ2QITmcZ2Rc8bfgtNOvHNuJJAHxhMCbIUVYgcIf8xaneYENqApfKBY/Ct71
 uQEY88damXIcjdfHDkHLlhLPcEWGaK9S/3KOSYaJVuMAiwmp8D22VoGYONNQO2326c
 n1t/ULLQs+w3g==
Date: Mon, 15 Jan 2024 12:35:10 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
In-Reply-To: <20240115164252.26510-3-quic_jinlmao@quicinc.com>
References: <20240115164252.26510-1-quic_jinlmao@quicinc.com>
 <20240115164252.26510-3-quic_jinlmao@quicinc.com>
Message-Id: <170534370911.1098380.1193154530422251358.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 James Clark <james.clark@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: arm: Add device-name
 in the coresight components
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


On Mon, 15 Jan 2024 08:42:48 -0800, Mao Jinlong wrote:
> device-name is used to provide a better description of the coresight
> device. It can provide the info like the system or HW it belongs to.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-catu.yaml          | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-cpu-debug.yaml     | 5 +++++
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml    | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml  | 5 +++++
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml           | 5 +++++
>  .../bindings/arm/arm,coresight-dynamic-replicator.yaml       | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-etb10.yaml         | 5 +++++
>  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml | 5 +++++
>  .../bindings/arm/arm,coresight-static-replicator.yaml        | 5 +++++
>  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml | 5 +++++
>  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml | 5 +++++
>  .../devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 5 +++++
>  .../devicetree/bindings/arm/qcom,coresight-tpda.yaml         | 5 +++++
>  .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml         | 5 +++++
>  16 files changed, 80 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml: device-name: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240115164252.26510-3-quic_jinlmao@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
