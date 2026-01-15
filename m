Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3ED27EC2
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 20:05:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3E12C8F28A;
	Thu, 15 Jan 2026 19:05:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0606C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 19:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 92CBF41969;
 Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B515C116D0;
 Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768503909;
 bh=XGxk5XqmTMXOuSSsKOdhgAHvgmaYT8PkS0TUquQx3Kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwln90jqVWwSRdAOYxtgSZO0omEPgP8ktrPfGmotvNNPVIcYxhHjdgRRMcFkpwUSB
 ZqGC6WhFUPSdqaGrsjTlxfrX1oY52fUkiw3Kyk9YEpJub9jtJW8y9kMDGgkYb6OyNl
 ZbOivC8lgXJpP1M0wjVOku/8Uv2pJrbmjmPq1b7XEikmHJAynvnxRyOSWdm7nJ2kB9
 QZqGPu9q3XGBQq/OEMzFJyJK0nZ5EQiE+HXAoYaUKsdlAboi42SfEKoEHxvwxn3z9D
 BvLiPI17UUsNxB7VP1SV6l+N64QQwB4JKHer229ntugF0sE2ezFuglptl1PmrvT30a
 1mY8YCTVMND1Q==
Date: Thu, 15 Jan 2026 13:04:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <176850387192.1025633.5139708031708243841.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
Cc: Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 Leo Yan <leo.yan@linux.dev>, linux-gpio@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
 jens.wiklander@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 01/11] dt-bindings: document
 access-controllers property for coresight peripherals
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


On Wed, 14 Jan 2026 11:29:15 +0100, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>  .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
>  6 files changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
