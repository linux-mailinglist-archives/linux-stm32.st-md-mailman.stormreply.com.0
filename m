Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF929BC897
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 10:05:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 384C8C6DD9F;
	Tue,  5 Nov 2024 09:05:11 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CECFC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 09:05:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A852A42A08;
 Tue,  5 Nov 2024 09:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E660C4CECF;
 Tue,  5 Nov 2024 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730797503;
 bh=UnwmGlzFhaYNeqG3ngovYpYoNCY9R17OMQumYyjWslw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vAAUVxUOMfTvV6MaF23c1TmprwEH5rQs2leIXYBwpH4/W5u8GI5xtMUDYhEwUwyWr
 f4r6lNMsKUlfphfeH9nFw1QdrdGpoBRLqM97pGmLI1Y3H9sr3XZJo5QJieKJzEaKcC
 m2AyRAZWXNgmn6aI3UpNE8gYEtzxh3K8/P+RgBJ/luHNxVpEEOOx2dytYY96LXndzV
 +SJX6Ev65VdWWtst5NMZHg/xrnLG+Ns2ajpQBCUZpN03GVFyZkt1KjXdSkMK0QdiJs
 AfJtEtDq+PsRQGYg/qdbBNJPqbMIAUMCeJC/HAHukGCP9Cnvrh+UobBmXQtGvFYZK3
 jTtAT8EnlxFUg==
Date: Tue, 5 Nov 2024 10:04:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <pp3t7we3niohooaiubs5l2grsobzgrcrc5gmt5ea7fmj6sbmpc@nvnviojusrxk>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/15] dt-bindings: media: add
	description of stm32 csi
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

On Tue, Nov 05, 2024 at 08:49:05AM +0100, Alain Volmat wrote:
> Add the stm32 csi controller description.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - rename into st,stm32mp25-csi.yaml to match compatible
>   - correct port / data-lanes (remove useless lines &
>     use data-lanes 1 and 2 instead of 0 and 1)
>   - correct commit log
> ---
>  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
