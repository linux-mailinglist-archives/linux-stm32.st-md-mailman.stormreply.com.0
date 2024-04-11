Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 396418A16A4
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 16:06:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9FF5C6DD66;
	Thu, 11 Apr 2024 14:06:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8078DC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 14:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AEE28CE1B4B;
 Thu, 11 Apr 2024 14:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42F5C4AF0A;
 Thu, 11 Apr 2024 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712844371;
 bh=d6e46jWnDxZRYyl+CFbOQVmEbwHLtW1MhnFOZwpQzwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=koYu8r5Eg3RLMZlDh92Cwd4y/NSQj73VMtMyxs3qQHFW/XV47CE/QArglKAJ2qrRc
 QDjqqjNW2fbTm6YAaB2uiPU7YOOuNovhDx8aZVjjTTf2fYq0WAO9lniMn6WfUAkybi
 VwQ1iuB/gNTn1H7AcARD3lIyUz0WiZKbp/UCdtwknKf5ml3kBi/Z5T799MKccWePyV
 XPzGaHWbDNskLJ/IB9UYoXVdhBjmqENGkNRxINZIju9PmXz7cHwSXuuVXddD7uRIvk
 smhZjk6kkpG0+3c52ZRmeoWBMuVIhbocGdC9+rvbxZ3oCQ3LQKEaW9nt5VU7fUpNt4
 5y8Xt7UowDY7Q==
Date: Thu, 11 Apr 2024 09:06:09 -0500
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Message-ID: <171284436693.3504816.3115362318052404070.robh@kernel.org>
References: <20240410144222.714172-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410144222.714172-1-hugues.fruchet@foss.st.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: dt-bindings: media: add
 access-controllers to STM32MP25 video codecs
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


On Wed, 10 Apr 2024 16:42:22 +0200, Hugues Fruchet wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32mp25-video-codec.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
