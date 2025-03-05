Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F2A4FD28
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 12:05:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BC8EC7128A;
	Wed,  5 Mar 2025 11:05:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F07B5CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 11:05:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4267BFEC;
 Wed,  5 Mar 2025 03:05:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CBD73F673;
 Wed,  5 Mar 2025 03:05:43 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Date: Wed,  5 Mar 2025 11:05:31 +0000
Message-ID: <174117263579.1942819.17038167511866554035.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 00/10] [subset] Coresight: Add
	Coresight TMC Control Unit driver
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


On Mon, 03 Mar 2025 11:29:21 +0800, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>              |ETR0|             |ETR1|
>               . \                 / .
>               .  \               /  .
>               .   \             /   .
>               .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> [...]

I have applied patches 1-9, leaving the DTS update for the platform.

[01/10] Coresight: Add support for new APB clock name
        https://git.kernel.org/coresight/c/dc872c5f
[02/10] Coresight: Add trace_id function to retrieving the trace ID
        https://git.kernel.org/coresight/c/c367a89d
[03/10] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
        https://git.kernel.org/coresight/c/182e8c70
[04/10] Coresight: Introduce a new struct coresight_path
        https://git.kernel.org/coresight/c/3c03c49b
[05/10] Coresight: Allocate trace ID after building the path
        https://git.kernel.org/coresight/c/d87d76d8
[06/10] Coresight: Change to read the trace ID from coresight_path
        https://git.kernel.org/coresight/c/7b365f05
[07/10] Coresight: Change functions to accept the coresight_path
        https://git.kernel.org/coresight/c/080ee83c
[08/10] dt-bindings: arm: Add Coresight TMC Control Unit hardware
        https://git.kernel.org/coresight/c/166df2a1
[09/10] Coresight: Add Coresight TMC Control Unit driver
        https://git.kernel.org/coresight/c/f78d206f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
