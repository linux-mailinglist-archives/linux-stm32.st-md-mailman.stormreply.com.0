Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7881E82EFE5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 14:44:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27D37C6A61A;
	Tue, 16 Jan 2024 13:44:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D73F6C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 13:44:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87462F4;
 Tue, 16 Jan 2024 05:44:48 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94CCD3F6C4;
 Tue, 16 Jan 2024 05:43:55 -0800 (PST)
Message-ID: <cef041b7-70ac-47c9-888c-696a0cec04d1@arm.com>
Date: Tue, 16 Jan 2024 13:43:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Leo Yan <leo.yan@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240115164252.26510-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240115164252.26510-1-quic_jinlmao@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] coresight: core: Add device name
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 15/01/2024 16:42, Mao Jinlong wrote:
> With current design, the name of the non-cpu bounded coresight
> component is the device type with the number. And with 'ls' command
> we can get the register address of the component. But from these
> information, we can't know what the HW or system the component belongs
> to. Add device-name in DT to support it.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2

Please could you rebase this on for-next/queue (which has all bells and 
whistles enabled to report Warnings), fixing the reported issue by 
kernel test robot ?

Suzuki


> 
> Change since V1:
> 1. Change coresight-name to device name.
> 2. Add the device-name in coresight dt bindings.
> 
> Mao Jinlong (2):
>    coresight: core: Add device name support
>    dt-bindings: arm: Add device-name in the coresight components
> 
>   .../bindings/arm/arm,coresight-catu.yaml      |  5 +++
>   .../bindings/arm/arm,coresight-cpu-debug.yaml |  5 +++
>   .../bindings/arm/arm,coresight-cti.yaml       |  5 +++
>   .../arm/arm,coresight-dummy-sink.yaml         |  5 +++
>   .../arm/arm,coresight-dummy-source.yaml       |  5 +++
>   .../arm/arm,coresight-dynamic-funnel.yaml     |  5 +++
>   .../arm/arm,coresight-dynamic-replicator.yaml |  5 +++
>   .../bindings/arm/arm,coresight-etb10.yaml     |  5 +++
>   .../bindings/arm/arm,coresight-etm.yaml       |  5 +++
>   .../arm/arm,coresight-static-funnel.yaml      |  5 +++
>   .../arm/arm,coresight-static-replicator.yaml  |  5 +++
>   .../bindings/arm/arm,coresight-stm.yaml       |  5 +++
>   .../bindings/arm/arm,coresight-tmc.yaml       |  5 +++
>   .../bindings/arm/arm,coresight-tpiu.yaml      |  5 +++
>   .../bindings/arm/qcom,coresight-tpda.yaml     |  5 +++
>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  5 +++
>   drivers/hwtracing/coresight/coresight-core.c  | 33 ++++++++++---------
>   .../hwtracing/coresight/coresight-platform.c  | 31 +++++++++++++++++
>   include/linux/coresight.h                     |  1 +
>   19 files changed, 130 insertions(+), 15 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
