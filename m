Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11207716241
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 15:39:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5019C6A613;
	Tue, 30 May 2023 13:39:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1911DC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 13:39:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C593085AFF;
 Tue, 30 May 2023 15:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685453993;
 bh=8A/n4Or8zcPbKOdLOdAJ1XbthrueKeyiEt0aiuAR+J0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EIcQODo6+XnwF94Go4CA2PyxHiiEbr/rSjWqPO2i8qS4xUI+todxDlgN+WzQSqNV6
 uVahSHPRa9g73heAdm0WLruBVBZYstDVuNdUn4thqrK8KiJUlzwp2OlVyXkdMjGc75
 jk1reclZaKgG07ngebFpZCYHZ6DQi1/pwU/OXLYIrByWd5zeW1VJ//FoSrw4R7Nq83
 Hh3gpGFUpNr6SpMAuPmL1Uj/6GffWpX9WFjXh2C76RvilWz4I0Nakt4lgXsuv+IIVb
 xKk0q54sV0sjHY50KFs7w7mfVKP6sxVk8dyC4GxeCAsCR/r8WCk9R95OT80FVGnZbt
 DphDniNZsXICQ==
Message-ID: <7e909409-fa18-99ec-7218-5803ba7d0013@denx.de>
Date: Tue, 30 May 2023 15:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230530124538.621760-1-olivier.moysan@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230530124538.621760-1-olivier.moysan@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/9] ARM: dts: stm32: add adc internal
 channels on stm32mp15
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

On 5/30/23 14:45, Olivier Moysan wrote:
> Add STM32 ADC2 internal channels VREFINT and VDDCORE to STM32MP15x SoCs.
> 
> Add support of vrefint channel by adding access to vrefint calibration
> data in OTP.
> 
> The internal channels are defined in STM32MP15 SoC DT according to
> generic channel bindings. The STM32 driver does not support a mixed use
> of legacy and generic channels. When generic channels are defined,
> legacy channel are ignored. This involves that the board device trees
> using legacy bindings have to be changed to generic bindings.
> 
> Adopt generic iio bindings on STM32 boards implementing the ADC.
> 
> Changes in v2:
> - Add patch from https://lore.kernel.org/linux-arm-kernel/20230518020547.487670-1-marex@denx.de/T/

Thank you
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
