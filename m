Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E18D2A4FEAC
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 13:34:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9FECC78F68;
	Wed,  5 Mar 2025 12:34:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA281CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:34:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD3075C6844;
 Wed,  5 Mar 2025 12:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191E2C4CEE2;
 Wed,  5 Mar 2025 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741178069;
 bh=cOl0I3/cH0eRw0BhDrssA5OJL4SDNbydbLyFqtxZWgA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=mot1R8g0Bq6HJHmLbShpe0RIfR7Oq6SFDLlA1K5ZsnCqe7w7gZhwJJgjFaucGGqo6
 RI+s7zzzmGQJBSCLytJmqFBDtY6I/H0Nn+G01GcLNyuUb9m54opc2Z5XcEaGn8QfdE
 0tXaPadHffc6pTRkmtX1aVKJkoodcPU+krgK5PDT+90A8dDB51h6+iCoXp7I9DppN7
 1sDzCE2dcf43i3axrQVvq86FSHfdaH02p/vwQGzglACHaqtNnisi57HQNFL2Gi6DIF
 KGq7Qa91S3hT5/04dgmI4AG1qw/zqu+K6wh9NmA83CEw1w3c1QrqzVPA0JjzDnvIKe
 7MVwx7ZxQ3CSQ==
Date: Wed, 05 Mar 2025 06:34:27 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20250305102103.1194277-2-o.rempel@pengutronix.de>
References: <20250305102103.1194277-1-o.rempel@pengutronix.de>
 <20250305102103.1194277-2-o.rempel@pengutronix.de>
Message-Id: <174117806721.1245382.8322491579922154490.robh@kernel.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: sound: convert
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


On Wed, 05 Mar 2025 11:21:00 +0100, Oleksij Rempel wrote:
> Convert the ICS-43432 MEMS microphone device tree binding from text format
> to YAML.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> changes v4:
> - add Reviewed-by: Rob...
> changes v3:
> - add maintainer
> - remove '|' after 'description:'
> changes v2:
> - use "enum" instead "oneOf + const"
> ---
>  .../devicetree/bindings/sound/ics43432.txt    | 19 -------
>  .../bindings/sound/invensense,ics43432.yaml   | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ics43432.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml: maintainers:0: 'N/A' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250305102103.1194277-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
