Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7C913BE2
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 17:02:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15EF3C71287;
	Sun, 23 Jun 2024 15:02:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F360AC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 15:02:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA6FECE0EB9;
 Sun, 23 Jun 2024 15:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4865CC2BD10;
 Sun, 23 Jun 2024 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719154928;
 bh=ISrxbHoDsgdg8jZ5QeZIYDTqqYNzfT5aOQ66p+EPqGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AUTDTxB066M0zP5PMnojHiP1J9VHW5O8wI8HefXUNgg6ViyiR7lynsdfZGq264K6U
 IW4Ea5yErWl4FfQyuG8vIAehENxpLg5icImCG8oxz/qLBjTQb4Bk6kpJANxvEJ5wYD
 PrjphOlKGgCzYIfmAOr+12xKh6tN5iTDr5+UcorXUOpyjdZwJ3AwiULMN4GHkAJqDb
 eUWjQBZsXWE03LxzzGgbyxGgKNRMqdXdlwAfGxljoGFPOlFJDE3iYqcLDS3uBRj4JN
 efREL+yQKPQTMEGlMmIqSlWt+v2fJnjLEdxB1bweeVrR9fdjtANEtfQWZVXgb08OJ2
 Qy6wWz68wH1GA==
Date: Sun, 23 Jun 2024 16:01:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240623160157.2bed9ff9@jic23-huawei>
In-Reply-To: <20240618160836.945242-5-olivier.moysan@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-5-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] dt-bindings: iio: dfsdm: move to
	backend framework
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

On Tue, 18 Jun 2024 18:08:30 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties supersed by generic properties:
superseded

>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types, st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
