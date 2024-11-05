Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EA9BC89D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 10:06:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A88EC6DD9F;
	Tue,  5 Nov 2024 09:06:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7BBC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 09:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2427C5C4FF8;
 Tue,  5 Nov 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB98DC4CECF;
 Tue,  5 Nov 2024 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730797563;
 bh=GDrGkgkKkKFWd8y1ePnPXiZoFyFPWQH0eSaV5iah2f4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WS1+4hz+FBnCbbuYhdym0r6AnbSbR5LyHs2U4gSrPNv0+8RQSt9pELil70n4xz5hO
 LlrMg6tgQEMfhR7lILbEbFTrY2aM89H7Hs52yerC/Y4MQ/tiu8YPPsOiuZD9fDg3yn
 09K727+MPRaRpQMPVWR9FS5p11VjV09BeUeIBcTWQ3HHHEcDIvcWYHpZHr5vQOwdDj
 G9OjUKg6YSsr+JbrnzbevAHIGEdY4+SydZ/Q+WKKW43tAdvPswyJbDOV/Uw0sFSjzD
 IGHBuV2GzUPFoT6KNcN0pEbuIeH4dJn6ERG5sOv/rSnFhLWSbB+hnp/5KMjjxqBEOD
 MZ3TsbL+rZvkg==
Date: Tue, 5 Nov 2024 10:06:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <5ummiahsnvp2hx434eqxzic4qtfbys2zkf7ezg6uhwxt7p5a4l@6je6xafal2mh>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 12/15] dt-bindings: media: add the
 stm32mp25 compatible of DCMIPP
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

On Tue, Nov 05, 2024 at 08:49:15AM +0100, Alain Volmat wrote:
> Add the stm32mp25 compatible for the DCMIPP.
> The stm32mp25 distinguish with the stm32mp13 by the fact that:
>  - supports also csi inputs in addition to parallel inputs
>  - requires an addition csi clock to be present
> 
> Add also access-controllers, an optional property that
> allows a peripheral to refer to one or more domain access controller(s).
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - move allOf after required
>   - reword commit message

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
