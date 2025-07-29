Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E4B1515D
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 18:32:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0842C35E3F;
	Tue, 29 Jul 2025 16:32:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C04C5C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 16:32:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BCE55C54E0;
 Tue, 29 Jul 2025 16:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A9C4CEF4;
 Tue, 29 Jul 2025 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753806769;
 bh=4Q/A4r8d1ZQG3FbhyPguPVRCWfgSCwtAKYlECW9aL8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSDzJN4qfDySDa3inQAme1/5ohrxBxAW/m6YDS4aZWvssxOisP/Qrif3iXkCfvyVq
 gE1dlFv2TJ2qocOnrCdmyhnChms0rISSR/pkTd9pVUb+mJcQ5LJI4hsdauM4CsJc4T
 OGglGeFVQjf8GmrSN/16Bue5Jjap/Xm3SsersBB4klsxCfFjQcVBL4MWVqMyX4HxqR
 KOYNUkLjKrlIJ1y83HloS3aPL+q2T0xEbeDtfsjzrLKLC65OsF8LgsVhNwliWhFbRf
 EWD2G78Gs0vzKVg4B7mybseNtKrOtw5WdRdDTNSUaHKXVoixG0zu0p6kkiAsCdHyXX
 XBlae83qbcz+Q==
Date: Tue, 29 Jul 2025 11:32:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <175380676749.513254.17364402562772205374.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/12] dt-bindings: arm: stm32: add
 required #clock-cells property
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


On Fri, 25 Jul 2025 12:03:57 +0200, Raphael Gallais-Pou wrote:
> On STM32MP25 SoC, the syscfg peripheral provides a clock to the display
> subsystem through a multiplexer.  Since it only provides a single clock,
> the cell value is 0.
> 
> Doing so allows the clock consumers to reach the peripheral and gate the
> clock accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
