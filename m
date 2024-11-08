Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0779C1CE9
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 13:27:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3541C6DD94;
	Fri,  8 Nov 2024 12:27:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 210B9C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 12:26:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65B865C541B;
 Fri,  8 Nov 2024 12:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE97C4CECD;
 Fri,  8 Nov 2024 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731068811;
 bh=LE5ViNZC097yakLUhcdt/2Wuhu+SiSGw5zfIBA0XZD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJVlOg6CB9NqZpkXXZWGGcE3xtciRj+3e9/6HOJDc/uN+fGb14cuq6eovzph8pA/y
 OkmjJNmdX3lQk56OKAeVIqGCp1iBiM95I3dV5p6DtCcH2bsB6Ll2o++rdMMvrZNo0o
 FCdAD9FaqEJNDpXPW1NoCdTswVTUbOxO5vTzaqC6r6IfrSTvibhQt9tk8SeGc/MhCe
 x+2RtXnmW0c47VR3F72rr+M6i+r58uhBu6OIc7SM24V9Z8SKmuoR7CcmeAcQ6blkX0
 furKlzwOWdP417FrJgP5ZA3BE2zAudQw/ZGFdCXziNd342imkYHmt+faIv7IBRbjVl
 FaPGOE2NK5vLA==
Date: Fri, 8 Nov 2024 13:26:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <vbdhp4q6ymyf6skjqblb3f77l2x6po7djhlu5zmh75tbqigaqg@hjyhyzpfklsf>
References: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
 <20241107144712.1305638-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107144712.1305638-2-olivier.moysan@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] ASoC: dt-bindings: add stm32mp25
	support for i2s
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

On Thu, Nov 07, 2024 at 03:47:11PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 I2S peripheral,
> through "st,stm32mp25-i2s" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-i2s.yaml          | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
