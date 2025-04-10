Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFAA839B1
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 08:47:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 015EBC78F68;
	Thu, 10 Apr 2025 06:47:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D898C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 06:47:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EE8F49D01;
 Thu, 10 Apr 2025 06:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573C1C4CEE3;
 Thu, 10 Apr 2025 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744267653;
 bh=8hkLcLDH7nSI13qsqezdG+87BGroYwujWBW8KumB1MM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LYokwitx/IQTfloJqvtw9W73YftJtdBU9KKufIeVzr+DmF74EgudgIWvwL5qBMRS4
 jlp6EKU8xwPIazNpv/LIihUWSCGEhx5fFvCcm1Bg7ujD7sWjnmKQ0udLkRJCjla8wG
 2la6raLHHiilW8u2uMsju0vz314FXtc5GtUwXJeK8FYzeqPLd3pEN+45lUkKeYRF/G
 D7BXESDXQ5HkD+c1IXKwHovGosEVDPYnF6bSALkkjYvyPZRsUHwHyHgRz3SrHxQFoR
 NfDhJU1HBUy+zx3oG6MjlVlciUHm1GdOTi8+mPJ1sgInqt6RWcInhWuuEeoMEzTnnB
 WQUf2NuxzZ7Xg==
Date: Thu, 10 Apr 2025 08:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Message-ID: <20250410-demonic-woodoo-kudu-bcd994@shite>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/5] dt-bindings: arm: Add an interrupt
 property for Coresight CTCU
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

On Thu, Apr 10, 2025 at 09:33:27AM GMT, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshlod of the

typo: threshold?

> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
