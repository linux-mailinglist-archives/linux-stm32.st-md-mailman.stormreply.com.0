Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438EA2C780
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 16:42:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC467C78002;
	Fri,  7 Feb 2025 15:42:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F31BC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 15:42:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BAC15C6D3A;
 Fri,  7 Feb 2025 15:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E38C4CED1;
 Fri,  7 Feb 2025 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738942942;
 bh=AoTcZ02x8NClnvVxBy2tDfppdz69+AhmvN+U95ePexs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=FLBvwhSfVOu15xQtkURaeiaZbarhcMQ3wrmky8Vs1OYLzPBcyOjAZNDhh37+B6hTm
 DDlkcyE63tKMGnrK31wI+oe/KHPP8vIXRxLJbFWPx1pgDwgjgfy8qLqo+PdyrzbikE
 2Pf+b/aglcIMoAMOCHlPH4zPrroAJ0eL6HdoKLsLaaWVYwtLjXZzK7pVQdlg5pIHKl
 l+5a/sio2Voj29XU9PUYVFrityIfTtcYIgAF8v+sSicwB8+hnVZSIL42lHpJFaffdF
 8H04lIC0dHFHTNPsk8hJl9mbPycfr06/nH4RnrvXbZtmvj6QArwXlCtqXq+iOx2H1d
 cTmAY2BAtZg3Q==
Date: Fri, 07 Feb 2025 09:42:21 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20250207143226.2026099-2-o.rempel@pengutronix.de>
References: <20250207143226.2026099-1-o.rempel@pengutronix.de>
 <20250207143226.2026099-2-o.rempel@pengutronix.de>
Message-Id: <173894294099.518356.6333585913978220723.robh@kernel.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1 1/3] dt-bindings: sound: convert
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


On Fri, 07 Feb 2025 15:32:24 +0100, Oleksij Rempel wrote:
> Convert the ICS-43432 MEMS microphone device tree binding from text format
> to YAML.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml: properties:compatible:oneOf: [{'const': 'invensense,ics43432'}, {'const': 'cui,cmm-4030d-261'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207143226.2026099-2-o.rempel@pengutronix.de

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
