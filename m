Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A941BA3C256
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 15:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B753C78F9B;
	Wed, 19 Feb 2025 14:39:32 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 492FDC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 14:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26206A4292B;
 Wed, 19 Feb 2025 14:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1ACC4CED1;
 Wed, 19 Feb 2025 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739975963;
 bh=zg41uxLeF1XqKwA/EMGTDy9ivzajg7Z1s3Ntido7yDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVeoQbZxARTuIRRNLLoesbA03JgG5KpgfNhmlEu3lR68IBae4oYRHhWI94pSSWOy/
 AbhMSX7vQwNXOZ7ZYQ8rl/B8iZn9sp3FymfII5MdeRiv7vmb7RlDPNWCNsDFjFVrKD
 4EIWgbDJr7eyNPrSHARv0mOznmETq/Hjff9Pfrv5DSaZkQ+KbT+Ai7IqiAsSDe+1M5
 U9+sVQuoZe5BD7hPeM2Qj4wGe5hLxGWj9H3z2Xp+51EJmkV87TShPXWaH/iiz7LJ/A
 DKxZqFdufJYhkiNxvCIyli6Fm/0HbbR7j5Zzih+2MAZIteczEkZj6h8kVq/IAI1sL6
 Ou3HiYRiEI1nQ==
Date: Wed, 19 Feb 2025 08:39:22 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20250219143922.GA2527138-robh@kernel.org>
References: <20250210104748.396399-1-o.rempel@pengutronix.de>
 <20250210104748.396399-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210104748.396399-2-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: sound: convert
 ICS-43432 binding to YAML
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

On Mon, Feb 10, 2025 at 11:47:46AM +0100, Oleksij Rempel wrote:
> Convert the ICS-43432 MEMS microphone device tree binding from text format
> to YAML.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v2:
> - use "enum" instead "oneOf + const"
> ---
>  .../devicetree/bindings/sound/ics43432.txt    | 19 -------
>  .../bindings/sound/invensense,ics43432.yaml   | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ics43432.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ics43432.txt b/Documentation/devicetree/bindings/sound/ics43432.txt
> deleted file mode 100644
> index e6f05f2f6c4e..000000000000
> --- a/Documentation/devicetree/bindings/sound/ics43432.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Invensense ICS-43432-compatible MEMS microphone with I2S output.
> -
> -There are no software configuration options for this device, indeed, the only
> -host connection is the I2S interface. Apart from requirements on clock
> -frequency (460 kHz to 3.379 MHz according to the data sheet) there must be
> -64 clock cycles in each stereo output frame; 24 of the 32 available bits
> -contain audio data. A hardware pin determines if the device outputs data
> -on the left or right channel of the I2S frame.
> -
> -Required properties:
> -  - compatible: should be one of the following.
> -     "invensense,ics43432": For the Invensense ICS43432
> -     "cui,cmm-4030d-261": For the CUI CMM-4030D-261-I2S-TR
> -
> -Example:
> -
> -	ics43432: ics43432 {
> -		compatible = "invensense,ics43432";
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
> new file mode 100644
> index 000000000000..79ed8c8e8790
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/invensense,ics43432.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Invensense ICS-43432-compatible MEMS Microphone with I2S Output
> +
> +maintainers:
> +  - N/A

If no one cares about this device, then we should just remove the 
binding and driver.

> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  The ICS-43432 and compatible MEMS microphones output audio over an I2S
> +  interface and require no software configuration. The only host connection
> +  is the I2S bus. The microphone requires an I2S clock frequency between
> +  460 kHz and 3.379 MHz and 64 clock cycles per stereo frame. Each frame
> +  contains 32-bit slots per channel, with 24 bits carrying audio data.
> +  A hardware pin determines whether the microphone outputs audio on the
> +  left or right channel of the I2S frame.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - invensense,ics43432
> +      - cui,cmm-4030d-261
> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ics43432: ics43432 {
> +        compatible = "invensense,ics43432";
> +
> +        port {
> +          endpoint {
> +            remote-endpoint = <&i2s1_endpoint>;
> +            dai-format = "i2s";
> +          };
> +        };
> +
> +    };
> --
> 2.39.5
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
